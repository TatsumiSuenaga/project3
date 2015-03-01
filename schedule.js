/* Author: Tatsumi Suenaga */
var today = new Date();
function change(){
	var button = document.getElementById("fold_button");
	if (button.value=="Fold") {
		button.value = "Unfold?";
		var row = document.getElementsByClassName("show");
		for (var i = 0; i < row.length; ++i) {
			if (parseInt(row[i].getElementsByTagName("td")[2].className) < (today.getMonth()+1)){
				row[i].style.visibility = "collapse";
			} else if (parseInt(row[i].getElementsByTagName("td")[2].className) == today.getMonth()){
				if(parseInt(row[i].getElementsByTagName("td")[2].id) < today.getDate()){
					row[i].style.visibility = "collapse";
				}
			}
		}
	} else {
		button.value = "Fold";
		var row = document.getElementsByTagName("tr");
		for (var i = 0; i < row.length; i++) {
			row[i].style.visibility = "visible";
		}
	}
}
function jumpScroll() {
	window.scrollBy(0,125);
	if (today.getDate == 1){
		window.scrollBy(0,880);
	} else if (today.getDate > 1) {
		var s = 880;
		for (var i = 0; i < (today.getDate - 1); i++) {
 			s += 30;
		}
		window.scrollBy(0,s);
	}
}
