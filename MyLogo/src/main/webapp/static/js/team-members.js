/*
 * used to search team members
 */

var $input = document.getElementsByTagName('input')[0];
$input.addEventListener('keyup', 
function() {
	$list = document.getElementsByClassName('cell')[0].children;
	for(var i = 0; i < $list.length; i++) {
		elemText = $list[i].innerText.toLowerCase();
		searchText = $input.value.toLowerCase();
		
		if(elemText.search(searchText) == -1){
			$list[i].style.display = "none";
		} else {
			$list[i].style.display = "block";
		}
	}

});