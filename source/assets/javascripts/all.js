//= require_tree .

$(function() {
	var $yearOnPage = $('#current-year');
	var currentYear = (new Date()).getFullYear();
	if($yearOnPage.text() !== currentYear) {
		$yearOnPage.text(currentYear);
	}
});
