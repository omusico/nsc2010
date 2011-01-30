
function validateAnnualReviewOfMotorVehicleReport(){
    raromv_driver_id = document.getElementsByName("raromv_driver_id")[0].value;
    raromv_review_date = document.getElementsByName("raromv_review_date")[0].value;
    raromv_name_of_person_reviewing = document.getElementsByName("raromv_name_of_person_reviewing")[0].value;

    raromv_confirm_review = document.getElementsByName("raromv_confirm_review")[0].value;
    
    raromv_driver_info = document.getElementsByName("raromv_driver_info")[0].value;

    raromv_remarks = document.getElementsByName("raromv_remarks")[0].value;
    
    $.get("/driver/Ajax-Driver/validate-driver-info/",
        {
            d_homebase_ID: d_homebase_ID,
            d_First_Name: ""+d_First_Name+"",
            d_Middle_Name: ""+d_Middle_Name+"",
            d_Last_Name: ""+d_Last_Name+"",
            d_Medical_Card_Expiration_Date: ""+d_Medical_Card_Expiration_Date+"",
            d_Doctor_Name: ""+d_Doctor_Name+"",
            d_Telephone_Number1: ""+d_Telephone_Number1+"",
            d_Telephone_Number2: ""+d_Telephone_Number2+"",
            d_Telephone_Number3: ""+d_Telephone_Number3+"",
            d_TWIC: ""+d_TWIC+"",
            d_TWIC_expiration: ""+d_TWIC_expiration+"",
            d_R_A: ""+d_R_A+"",
            d_R_A_expiration: ""+d_R_A_expiration+""
        }, function(data){
            if(data==1){
                document.getElementById('driver_DriverPersonalInformation_Form').submit();
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