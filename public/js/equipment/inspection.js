$(function() {
    getInspections($("#e_id").val());

    

});

function createInspectorClickHeandler() {
    $("#add-inspector-form").dialog( "open" );
}

function initCreateInspectorDialog() {
    // a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
    $( "#dialog:ui-dialog" ).dialog( "destroy" );

    var first_name = $( "#in_first_name" ),
        last_email = $( "#in_last_name" ),
        certificate = $( "#in_certificate" ),
        sp = $("#in_service_provider_id"),
        uploadCertificate = $("#uploadCertificate"),
        allFields = $( [] ) . add(first_name) . add(last_email) . add(certificate) . add(sp) . add(uploadCertificate);

    $( "#add-inspector-form" ).dialog({
        autoOpen: false,
        height: 300,
        width: 400,
        modal: true,
        buttons: {
            "Create an Inspector": function() {
               createInspector($(this));
            },
            Cancel: function() {
                $( this ).dialog( "close" );
            }
        },
        close: function() {
            allFields.val("");
        }
    });
}

function createInspector(dialogDescriptor) {
    $.getJSON('/inspector/index/create', 
            {
                in_first_name: $("#in_first_name").val(),
                in_last_name: $("#in_last_name").val(),
                in_certificate: $("#in_certificate").val(),
                in_service_provider_id: $("#in_service_provider_id").val()
            }, function(data) {
                if (data.result == 1) {
                    dialogDescriptor.dialog( "close" );
                    $('.inspectorSelect').append('<option value="' + 
                                                    data.row.in_id +
                                                    '">' +
                                                    data.row.in_first_name + ' ' + data.row.in_last_name +
                                                    '</option>');
                } else {
                    dialogDescriptor.dialog( "close" );
                    displayInspectionError(data, 'Error during inspector creation!');
                }
            });
}

function inspctionAddLinkClassClickHeandler() {
    $(".addInspectionTableClass").toggle("slow");
}

function getInspections(equipmentId) {
    $.ajax({
            type: "GET",
            url: "/inspection/index/get-equipment-inspections",
            data: "equipmentId=" + equipmentId,
            success: function(data) {
                if (data.result == 1) {
                    $("#currentEquipmentInspectionList").html(data.markup);
                    turnOnInspectionDatepicker();
                    initCreateInspectorDialog();
                } else {
                    var markup = '<h1>Get inspections error!</h1>';
                    markup += data.errorMessage;
                    $("#currentEquipmentInspectionList").html(markup);
                }
            },
            dataType : "json"
    });
}

function displayInspectionError(data, title) {
    var $dialog = $('<div></div>')
        .html(data.errorMessage)
        .dialog({
            autoOpen: false,
            title: title,
            minHeight: 13,
            modal: true
        });
        $dialog.dialog('open');
}

function turnOnInspectionDatepicker() {
    $(".inspectionDate").datepicker({
        changeMonth: true,
        changeYear: true,
        yearRange: '-10:+10',
        showOn: 'button',
        buttonImage: "/images/select-data.gif",
        buttonImageOnly: true
    });
}

function addInspectionClick() {
    $(this).addClass('button-updating');
    var label = $(this).html();
    $(this).html('Updating...');
    addInspection($("#e_id").val());
    $(this).removeClass('button-updating');
    $(this).html(label);
}

function addInspection(equipmentId) {
    $.getJSON("/inspection/index/create",
        {
            ins_equipment_id: equipmentId,
            ins_start_date : $("#ins_start_date").val(),
            ins_start_time : $("#ins_start_time").val(),
            ins_next_date : $("#ins_next_date").val(),
            ins_reinspection_date : $("#ins_reinspection_date").val(),
            ins_type_id : $("#ins_type_id").val(),
            ins_inspector_id : $("#ins_inspector_id").val(),
            ins_result_id : $("#ins_result_id").val(),
            ins_diesel_inspection_information : $("#ins_diesel_inspection_information").val(),
            ins_dot_regulated : $(".ins_dot_regulated:checked").val()
        }, function(data) {
                if (data.result == 1) {
                    $(".addInspectionTableClass").toggle("slow");
                    getInspections(equipmentId);
                    clearAddInspectionForm();
                    refreshLastModifiedDate($("#e_id").val());
                    return true;
                } else {
                    displayInspectionError(data);
                    return false;
                }
       });
}

function clearAddInspectionForm() {
    $("#ins_start_date").val("")
    $("#ins_start_time").val(""),
    $("#ins_next_date").val(""),
    $("#ins_reinspection_date").val(""),
    $("#ins_type_id").val(""),
    $("#ins_inspector_id").val(""),
    $("#ins_result_id").val(""),
    $("#ins_diesel_inspection_information").val(""),
    $("#ins_dot_regulated_no").attr('checked', 'checked');
}

function saveInspection(inspectionId, equipmentId) {
    $.getJSON("/inspection/index/save-inspection-equipment",
            {
                ins_id : inspectionId,
                ins_equipment_id: equipmentId,
                ins_start_date : $("#ins_start_date_" + inspectionId).val(),
                ins_start_time : $("#ins_start_time_" + inspectionId).val(),
                ins_next_date : $("#ins_next_date_" + inspectionId).val(),
                ins_reinspection_date : $("#ins_reinspection_date_" + inspectionId).val(),
                ins_type_id : $("#ins_type_id_" + inspectionId).val(),
                ins_inspector_id : $("#ins_inspector_id_" + inspectionId).val(),
                ins_result_id : $("#ins_result_id_" + inspectionId).val(),
                ins_diesel_inspection_information : $("#ins_diesel_inspection_information_" + inspectionId).val(),
                ins_dot_regulated : $(".ins_dot_regulated_" + inspectionId + ":checked").val()
            }, function(data) {
                if (data.result == 1) {
                    refreshInspection(data.row);
                    $(".classInspectionRecordID_" + inspectionId).toggle('slow');
                    refreshLastModifiedDate($("#e_id").val());
                    return true;
                } else {
                    displayInspectionError(data);
                    return false;
                }
            }
    );
}

function refreshInspection(data) {
    var inspectionId = data.ins_id;

    $("#view_ins_start_date_" + inspectionId).html(data.ins_start_date);
    $("#view_ins_start_time_" + inspectionId).html(data.ins_start_time);
    $("#view_ins_next_date_" + inspectionId).html(data.ins_next_date);
    $("#view_ins_reinspection_date_" + inspectionId).html(data.ins_reinspection_date);
    $("#view_ins_type_id_" + inspectionId).html(data.it_type);
    $("#view_ins_inspector_id_" + inspectionId).html(data.in_first_name + data.in_last_name);
    $("#view_ins_result_id_" + inspectionId).html(data.ins_result_id);
    $("#view_ins_dot_regulated_" + inspectionId).html(data.ins_dot_regulated);
    $("#view_ins_diesel_inspection_information_" + inspectionId).html(data.ins_diesel_inspection_information);


    $("#ins_start_date_" + inspectionId).val(data.ins_start_date);
    $("#ins_start_time_" + inspectionId).val(data.ins_start_time);
    $("#ins_next_date_" + inspectionId).val(data.ins_next_date);
    $("#ins_reinspection_date_" + inspectionId).val(data.ins_reinspection_date);
    $("#ins_type_id_" + inspectionId).val(data.ins_type_id);
    $("#ins_inspector_id_" + inspectionId).val(data.ins_inspector_id);
    $("#ins_result_id_" + inspectionId).val(data.ins_result_id);
    $("#ins_diesel_inspection_information_" + inspectionId).val(data.ins_diesel_inspection_information);
    $(".ins_dot_regulated_" + inspectionId).each(function(){
        if ($(this).val() == data.ins_dot_regulated) {
            $(this).attr('checked', 'checked');
        }
    });
}

function deleteInspectionClickHandler(inspectionId, equipmentId) {
    var $dialogDeleteInvolvedInspection = $('<div></div>')
		.html('Do you really want to remove this inspection?')
		.dialog({
			autoOpen: false,
            modal: true,
            buttons: {
                "Yes": function() {
                    __deleteInspection(inspectionId, equipmentId);
                    $(this).dialog("close");
                },
                "No": function() {
                    $(this).dialog("close");
                }
            },
            resizable: false,
			title: 'Confirm Inspection Delete'
		}
    );

    $dialogDeleteInvolvedInspection.dialog('open');
}

function __deleteInspection(inspectionId, equipmentId) {
    $.getJSON('/inspection/index/delete-inspection',
        {
            ins_id : inspectionId
        }, function(data) {
            if (data.result == 1) {
                getInspections(equipmentId);
                return true;
            } else {
                alert(data.errorMessage);
                return false;
            }
        }
    );
}

function ajaxCertificateUpload()
{
    $.ajaxFileUpload
    (
        {
            url:'/inspector/index/upload-certificate/',
            secureuri:false,
            fileElementId: "uploadCertificate",
            dataType: 'json',
            async:false,
            success: function (data, status)
            {
                if(typeof(data.error) != 'undefined')
                {
                    if (data.error != '') {
                        //alert(data.error);
                    } else {
                        result = data.fileName;
                        $("#in_certificate").val(result);
                    }
                }
            },
            error: function (data, status, e)
            {
                //alert(e);
            }
        }
    )
    return false;

}