/**
 * Created by JetBrains PhpStorm.
 * User: elorenishii386
 * Date: 5/5/12
 * Time: 7:59 PM
 * To change this template use File | Settings | File Templates.
 */

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
		$("#dinner_list").html("<h3>No dinners found for '"+lastLunchName+"'...</h3>");
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

jQuery(function($) {
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
	$("#dinner_list").html("<h3>Dinner Found!</h3><div class='dinner_name'>"+dinners[currentDinnerIndex].name+"</div><div class='dinner_tags'>"+dinners[currentDinnerIndex].tags+"</div><div class='dinner_description'>"+dinners[currentDinnerIndex].description+"</div><div class='dinner_reason_head'>Why It's Good</div><div class='dinner_reason_body'>"+dinners[currentDinnerIndex].reason+"</div>")
}

