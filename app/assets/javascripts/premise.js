function addPremise() {
	var table = document.getElementById("premise_table");
	var row = table.insertRow(-1);
	var cell1 = row.insertCell();
	var cell2 = row.insertCell();
	var cell3 = row.insertCell();
	cell1.innerHTML = 'Premise ';
	cell2.innerHTML = '<td><input type="text" name="fname"></td>';
	cell3.innerHTML = '<button type="button" onclick="deletePremiseRow(this)">Remove Line</button>';
}
function deletePremiseRow(toDelete) {
	var tableRow = toDelete.parentElement.parentElement;
	tableRow.parentElement.removeChild(tableRow);
}