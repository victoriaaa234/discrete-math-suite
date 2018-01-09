$(document).ready(function(){
	// the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
	$('#modal1').modal();
  });
  
function addPremiseRow() {
	var premiseSecondaries = document.getElementById("premise_secondaries");
	if(premiseSecondaries.children.length > 0) { 
		var idOfLast = premiseSecondaries.children[premiseSecondaries.children.length - 1].firstElementChild.id; 
	}
	else {
		var idOfLast = 'premise_0';
	}
	var indexOfLast = getEndingNumber(idOfLast);
	var newIndex = indexOfLast + 1;

	// Build new input
	var rowWrapper = document.createElement("div");
	rowWrapper.className = "row";
	
	var newRow = document.createElement("div");
	newRow.id = "premise_" + String(newIndex);
	newRow.className = "input-field col s10";

	var newInput = document.createElement("input");
	newInput.id = "input_premise_" + String(newIndex);
	newInput.type = "text";
	newInput.className = "validate premise_line_input";

	var newLabel = document.createElement("label");
	newLabel.htmlFor = newInput.id;
	var labelText = document.createTextNode("Premise");
	newLabel.appendChild(labelText);

	newRow.appendChild(newInput);
	newRow.appendChild(newLabel);



	// Build new delete button
	var buttonDiv = document.createElement("div");
	buttonDiv.id = "remove_premise_" + String(newIndex);
	buttonDiv.className = "col s1";

	var deleteButton = document.createElement("a");
	deleteButton.className = "btn-floating btn-small waves-effect waves-light red";
	deleteButton.onclick = function () { deletePremiseRow(buttonDiv.id) };

	var deleteIcon = document.createElement("i");
	deleteIcon.className = "material-icons red";
	var cancelLabel = document.createTextNode("cancel");
	deleteIcon.appendChild(cancelLabel);

	deleteButton.appendChild(deleteIcon);
	buttonDiv.appendChild(deleteButton);
	rowWrapper.appendChild(newRow);
	rowWrapper.appendChild(buttonDiv);
	premiseSecondaries.appendChild(rowWrapper);
}

function getEndingNumber(id) {
	// get 123 part of remove_premise_123
	return parseInt(id.substr(id.lastIndexOf("_") + 1));
}

function getIdPrefix(id) {
	// get remove_premise_ part of remove_premise_123
	return id.substr(0, id.lastIndexOf("_") + 1);
}

function renumberNodes(nodes, deletedIndex) {
	for(let node of nodes) {
		var nodeChildren = node.children;
		for(let child of nodeChildren) {
			var childIndex = getEndingNumber(child.id);
                        if(child.tagName == 'LABEL'){
                          childIndex = getEndingNumber(child.htmlFor);
                        }
			if(childIndex > deletedIndex) {
                          if(child.tagName == 'LABEL'){
                            var curFor = getIdPrefix(child.htmlFor) + String(childIndex - 1);
                            child.setAttribute('for', curFor);
                          }
                          else{
			    child.id = getIdPrefix(child.id) + String(childIndex - 1);
                          }
			}
		}
	}
}






function deletePremiseRow(buttonDivId) {
	var buttonDiv = document.getElementById(buttonDivId);
	var deletedIndex = getEndingNumber(buttonDiv.id);

	// Since we're deleting a row, we need to renumber the rows
	var children = buttonDiv.parentElement.parentElement.children;
	renumberNodes(children, deletedIndex);
	for(let child of children) {
		var grandchildren = child.children;
		renumberNodes(grandchildren, deletedIndex);
	}

	// Actually delete the row
	var buttonParent = buttonDiv.parentElement;
	buttonParent.parentElement.removeChild(buttonParent);
}






function getProofLine(prefix, sizeStr, newIndex, labelString) {
	var newProofElem = document.createElement("div");
	newProofElem.id = prefix + String(newIndex);
	newProofElem.className = "input-field col " + sizeStr + " proof_line";

	var newProofElemInput = document.createElement("input");
	newProofElemInput.id = prefix + "input_" + String(newIndex);
	newProofElemInput.type = "text";
	newProofElemInput.className = "validate proof_line_input";

	var newProofElemLabel = document.createElement("label");
	newProofElemLabel.htmlFor = newProofElemInput.id;
	var labelText = document.createTextNode(labelString);
	newProofElemLabel.appendChild(labelText);

	newProofElem.appendChild(newProofElemInput);
	newProofElem.appendChild(newProofElemLabel);
	return newProofElem;
}






function getProofButton(newIndex) {
	var buttonDiv = document.createElement("div");
	buttonDiv.id = "proof_remove_" + String(newIndex);
	buttonDiv.className = "col s1";

	var deleteButton = document.createElement("a");
	deleteButton.className = "btn-floating btn-small waves-effect waves-light red";
	deleteButton.onclick = function () { deleteProofRow(buttonDiv.id) };

	var deleteIcon = document.createElement("i");
	deleteIcon.className = "material-icons red";
	var cancelLabel = document.createTextNode("cancel");
	deleteIcon.appendChild(cancelLabel);

	deleteButton.appendChild(deleteIcon);
	buttonDiv.appendChild(deleteButton);
	return buttonDiv;
}






function addProofRow() {
	var proofSecondaries = document.getElementById("proof_secondaries");
	if(proofSecondaries.children.length > 0) { 
		var idOfLast = proofSecondaries.children[proofSecondaries.children.length - 1].firstElementChild.id; 
	}
	else {
		var idOfLast = 'proof_step_0';
	}
	var indexOfLast = getEndingNumber(idOfLast);
	var newIndex = indexOfLast + 1;

	// Build new input
	var rowWrapper = document.createElement("div");
	rowWrapper.className = "row";
	
	var newStep = getProofLine("proof_step_", "s5", newIndex, "Step");
	var newPrevious = getProofLine("proof_previous_", "s3", newIndex, "Previous Lines");
	var newRules = getProofLine("proof_rules_", "s2", newIndex, "Rules");


	// Build new delete button
	var buttonDiv = getProofButton(newIndex);


	rowWrapper.appendChild(newStep);
	rowWrapper.appendChild(newPrevious);
	rowWrapper.appendChild(newRules);
	rowWrapper.appendChild(buttonDiv);
	proofSecondaries.appendChild(rowWrapper);
}






function deleteProofRow(buttonDivId) {

}
