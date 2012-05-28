$(document).ready(function(){

    var currentDinnerIndex = -1;

    var dinners;

    var lastLunchName = "xxxxxxx";

    var getJSONData = function(data, xhr, status) {
    	dinners = JSON.parse(xhr.responseText);
    	if (dinners.length > 0) {
    		currentDinnerIndex = 0;
    		showNextDinner();
    	} else {
    		currentDinnerIndex = -1;
    		$("#dinner_list")
                .html(
                    "<h2>No dinners found for '"
                        +lastLunchName+
                    "'...</h2>"
            );
    	}

    }

    var queryOrNot = function(settings, xhr) {
    	var currentText = $("input[id=lunch]").val().toLowerCase();
    	if (currentText == lastLunchName) {
    		if (dinners != null && dinners.length > 0) {
    			showNextDinner();
    		}
    		return false;
    	} else {
    		lastLunchName = currentText;
    	}
    	return true;
    }



    $(function($) {
    	 $("#ajaxian")
    	 	.bind("ajax:beforeSend",  queryOrNot)
    	 	.bind("ajax:complete",  getJSONData);
    });

    function showNextDinner() {
    	if (currentDinnerIndex == -1) {
    		return;
    	}

    	currentDinnerIndex++;

    	if (currentDinnerIndex >= dinners.length) {
    		currentDinnerIndex = 0;
    	}

    	showDinner();
    }

    function showDinner() {


        $("#dinner_list")
            .html(
                "<h2>Then you should have " +
                    "<span class='dinner_name'>"
                        + dinners[currentDinnerIndex].name +
                    "</span> " +
                    "for dinner becuase " +
                    "<span class='dinner_reason_body'>"
                        + dinners[currentDinnerIndex].reason +
                    "</span>" +
                "</h2>");
    }

});

