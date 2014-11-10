// Run the script on DOM ready:
$(function(){
 $('table').visualize({type: 'pie', height: '450px', width: '600px'});
	$('table').visualize({type: 'bar', height: '450px', width: '600px'});
	$('table').visualize({type: 'area',height: '450px', width: '600px'});
	$('table').visualize({type: 'line',height: '450px', width: '600px'});
});