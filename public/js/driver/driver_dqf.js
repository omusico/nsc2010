
function validateAnnualReviewOfMotorVehicleReport(){
    var msg = "";
    raromv_driver_id = document.getElementsByName("raromv_driver_id")[0].value;
    raromv_review_person_id = document.getElementsByName("raromv_review_person_id")[0].value;
    raromv_review_date = document.getElementsByName("raromv_review_date")[0].value;
    raromv_name_of_person_reviewing = document.getElementsByName("raromv_name_of_person_reviewing")[0].value;
    if(document.getElementsByName("raromv_confirm_review")[0].checked==true){
        raromv_confirm_review = 1;
    }else{
        msg = msg + "<div><span style='color: red;'>ERROR:</span> You must confirm review!</div>";
    }
    raromv_driver_info = document.getElementsByName("raromv_driver_info")[0].value;
    if(document.getElementsByName("raromv_driver_info")[0].checked!=true && document.getElementsByName("raromv_driver_info")[1].checked!=true){
        msg = msg + "<div><span style='color: red;'>ERROR:</span> Specify Driver's requirements!</div>";
    }else{
        for (i = 0; i < document.getElementsByName("raromv_driver_info").length; i++){
            if(document.getElementsByName("raromv_driver_info")[i].checked==true){
                raromv_driver_info = document.getElementsByName("raromv_driver_info")[i].value;
            }
        }
    }
    raromv_remarks = document.getElementsByName("raromv_remarks")[0].value;

    var reg_int = /^[0-9]+$/;
    var reg_date = /^\d{1,2}\/\d{1,2}\/\d{1,4}$/;
    if(reg_int.test(raromv_driver_id)!=true){
        msg = msg + "<div><span style='color: red;'>FATAL ERROR:</span> Drivers ID is lost!</div>";
    }
    if(reg_int.test(raromv_review_person_id)!=true){
        msg = msg + "<div><span style='color: red;'>FATAL ERROR:</span> Reviewing Person ID is lost!</div>";
    }
    if(reg_date.test(raromv_review_date!=true)){
        msg = msg + "<div><span style='color: red;'>ERROR:</span> <strong>Review Date<strong> can't be empty and should be correct (mm/dd/yyyy).</div>";
    }
    if(raromv_name_of_person_reviewing == ""){
        msg = msg + "<div><span style='color: red;'>FATAL ERROR:</span> <strong>Name of person reviewing</strong> Can't be blank!</div>";
    }


    if(msg!=""){
        var $dialog = $('<div></div>')
                .html(msg)
                .dialog({
                    autoOpen: false,
                    title: 'Form validation error!',
                    minHeight: 13
                });
                $dialog.dialog('open');
                return false;
    }else{
        $.get("/report/report/ajax-add-annual-review-of-motor-vehicle-report/",
        {
            raromv_driver_id: raromv_driver_id,
            raromv_review_person_id: raromv_review_person_id,
            raromv_review_date: raromv_review_date,
            raromv_name_of_person_reviewing: ""+raromv_name_of_person_reviewing+"",
            raromv_confirm_review: raromv_confirm_review,
            raromv_driver_info: raromv_driver_info,
            raromv_remarks: ""+raromv_remarks+""
        }, function(data){
            if(reg_int.test(data)==true){
                alert("Done!");
                exit("/driver/driver/dqf/driver_id/"+raromv_driver_id);
                return true;
            }else{
                var $dialog = $('<div></div>')
                .html(data)
                .dialog({
                    autoOpen: false,
                    title: 'Form validation error!',
                    minHeight: 13
                });
                $dialog.dialog('open');
                return false;
            }
           });
    }
}