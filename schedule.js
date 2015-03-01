/* Author: Tatsumi Suenaga */
var today = new Date();
function change(){
	var button = document.getElementById("fold_button");
	var button2 = document.getElementById("jump_button");
	if (button.value=="Fold") {
		button2.style.visibility = "collapse";
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
		button2.style.visibility = "visible";
		var row = document.getElementsByTagName("tr");
		for (var i = 0; i < row.length; i++) {
			row[i].style.visibility = "visible";
		}
	}
}
today.setMonth(3);
today.setDate(4);
function jumpScroll() {
	//only need 45 * 30px to reach May 1st
	var button = document.getElementById("fold_button");
	if (button.value = "Fold"){
		var scroll = 155;
		var row = document.getElementsByClassName("show");
		for(var i = 0; i < 45; i++) {
			if (parseInt(row[i].getElementsByTagName("td")[2].className) < (today.getMonth()+1)){
					scroll += 36;
			} else if (parseInt(row[i].getElementsByTagName("td")[2].className) == today.getMonth()){
				if(parseInt(row[i].getElementsByTagName("td")[2].id) < today.getDate()){
					scroll += 36;
				} else{
					i = 45;
				}
		}
			
		}
		window.scrollTo(0,scroll);
	} else {
		window.alert("No need to jump since table was folded!");
	}
}
