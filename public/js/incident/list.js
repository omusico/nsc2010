function empty (param) {
    if (param === "" || param === 0 ||  param === "0" ||  param === null ||  param === false 
        || typeof mixed_var === 'undefined') {
        return true;
    }

    return false;
}

function submitSearchParameters() {
    document.getElementById("searchParameters").submit();
}

function setHiddenFieldFromUrlQuery(id, url) {
    $("#" + id).val(jQuery.url.setUrl(url).param(id));
}


$(document).ready(function() {
    $("#prevIncidents").click(function() {
        url = $("#prevIncidents").attr("href");
        $("#prevIncidents").attr("href", "");
        setHiddenFieldFromUrlQuery("from", url);
        setHiddenFieldFromUrlQuery("step", url);
        submitSearchParameters();
    });

    $("#nextIncidents").click(function() {
        url = $("#nextIncidents").attr("href");
        $("#nextIncidents").attr("href", "");
        setHiddenFieldFromUrlQuery("from", url);
        setHiddenFieldFromUrlQuery("step", url);
        submitSearchParameters();
    });

    if (!empty($("#from").val())) {
        jQuery.url.param("from", $("#from").val());
    }

    if (!empty($("#step").val())) {
        jQuery.url.param("step", $("#step").val());
    }

    $("#Status").change(function() {
        submitSearchParameters();
    });

    /**
     * Set for each column's header click heandler to implemnt order list by column.
     */
    $("tr.table-title td").each(function(column){
        $(this).click(function() {
            var columnName = this.id;
            if (columnName != "action") {
                if ($("#orderBy").val() == columnName) {
                    if ($("#orderWay").val() == "ASC") {
                        $("#orderWay").val("DESC");
                    } else if ($("#orderWay").val() == "DESC") {
                        $("#orderWay").val("ASC");
                    }
                } else {
                    $("#orderWay").val("ASC");
                }

                $("#orderBy").val(columnName);
                
                submitSearchParameters();
            }
        });
        
    });

});


