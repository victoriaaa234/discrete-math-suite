$(document).ready(function(){
    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
    $('#modal1').modal();
    $('#modal2').modal();
});

function addPremiseRow() {
    var premiseSecondaries = document.getElementById("premise_secondaries");
    if(premiseSecondaries.children.length > 0) {
        var idOfLast = premiseSecondaries.children[premiseSecondaries.children.length - 1].firstElementChild.id;
    }
    else {
        var idOfLast = 'premise_1';
    }
    var indexOfLast = getEndingNumber(idOfLast);
    var newIndex = indexOfLast + 1;

    // Build new input
    var rowWrapper = document.createElement("div");
    rowWrapper.className = "row";

    var newRow = document.createElement("div");
    newRow.id = "premise_" + String(newIndex);
    newRow.style = "margin-bottom: -6%";
    newRow.className = "input-field col s10";

    var newInput = document.createElement("input");
    newInput.id = "input_premise_" + String(newIndex);
    newInput.name = newInput.id;
    newInput.placeholder = "Enter a premise...";
    newInput.type = "text";
    newInput.className = "validate premise_line_input";

    var lastPassAttrib = document.createAttribute("data-lpignore");
    lastPassAttrib.value = "true";
    newInput.setAttributeNode(lastPassAttrib);

    var newLabel = document.createElement("label");
    newLabel.className = "active";
    newLabel.htmlFor = newInput.id;
    var labelText = document.createTextNode("Premise");
    var lineLabelText = document.createTextNode(" " + String(newIndex));
    newLabel.appendChild(labelText);
    newLabel.appendChild(lineLabelText);

    newRow.appendChild(newInput);
    newRow.appendChild(newLabel);



    // Build new delete button
    var buttonDiv = document.createElement("div");
    buttonDiv.id = "remove_premise_" + String(newIndex);
    buttonDiv.className = "col s1";

    var deleteButton = document.createElement("a");
    deleteButton.className = "btn-floating btn-small waves-effect waves-light red";
    deleteButton.onclick = function () { deleteRow(buttonDiv.id) };

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

function labelShouldRenumber(parentId) {
    var prefix = getIdPrefix(parentId);
    return (prefix == 'proof_step_' || prefix == 'premise_');
}

function renumberNodes(nodes, deletedIndex) {
    for(let node of nodes) {
        var nodeChildren = node.children;
        for(let child of nodeChildren) {
            var childIndex = getEndingNumber(child.id);
            if(child.tagName == 'LABEL') {
                childIndex = getEndingNumber(child.htmlFor);
            }
            if(childIndex > deletedIndex) {
                if(child.tagName == 'LABEL') {
                    if (labelShouldRenumber(child.parentNode.id)) {
                        // TODO: should get the label text in a better way -- see below
                        // labelText = getIdPrefix(child.text??);
                        // var newLabelText = document.createTextNode(labelText + String(childIndex - 1));
                        // child.text?? = newLabelText;
                        var labelText = child.lastChild;
                        child.removeChild(labelText);
                        var newLabelText = document.createTextNode(" " + String(childIndex - 1));
                        child.append(newLabelText);
                    }
                    child.htmlFor = getIdPrefix(child.htmlFor) + String(childIndex - 1);
                }
                else{
                    child.id = getIdPrefix(child.id) + String(childIndex - 1);
                    // input elements have name attributes
                    // these should be identical to their id attributes
                    if(child.name != null) {
                        child.name = child.id
                    }
                }
            }
        }
    }
}

function deleteRow(buttonDivId) {
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
    newProofElemInput.name = newProofElemInput.id;
    switch(labelString) {
        case "Step":
            newProofElemInput.placeholder = "Enter a step...";
            break;
        case "Previous Lines":
            newProofElemInput.placeholder = "Enter previous lines...";
            break;
        case "Rules":
            newProofElemInput.placeholder = "Enter rules...";
            break;
        default:
    }
    newProofElemInput.type = "text";
    newProofElemInput.className = "validate proof_line_input";


    var lastPassAttrib = document.createAttribute("data-lpignore");
    lastPassAttrib.value = "true";
    newProofElemInput.setAttributeNode(lastPassAttrib);

    var newProofElemLabel = document.createElement("label");
    newProofElemLabel.htmlFor = newProofElemInput.id;
    newProofElemLabel.className = "active";
    var labelText = document.createTextNode(labelString);
    newProofElemLabel.appendChild(labelText);
    if(labelString == "Step") {
        labelText = document.createTextNode(" " + newIndex);
        newProofElemLabel.appendChild(labelText)
    }

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
    deleteButton.onclick = function () { deleteRow(buttonDiv.id) };

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
        var idOfLast = 'proof_step_1';
    }
    var indexOfLast = getEndingNumber(idOfLast);
    var newIndex = indexOfLast + 1;

    // Build new input
    var rowWrapper = document.createElement("div");
    rowWrapper.className = "row";
    rowWrapper.id = "proof_row";
    rowWrapper.style = "margin-bottom: -6%";

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

/*
function deleteProofRow(buttonDivId) {
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
*/

    function generatePracticeProblems(generatedProblem) {
        //TODO(vwei): create database of practice problems and randomly select one.
        // submitText(premise, conclusion, proof);
        var problemObject = $('.problems').data('problem');
        var premiseList = problemObject.premise.split(',');
        var conclusion = problemObject.conclusion;
        console.log(premiseList);
        //adding premises
        for(i = 1; i <=premiseList.length; i++){
            var premiseId = 'input_premise_'+i;
            if(document.getElementById(premiseId)!==null){
                document.getElementById(premiseId).value = premiseList[i-1].trim();
                console.log(premiseList[i-1]);
            }
            else{
                addPremiseRow();
                document.getElementById(premiseId).value = premiseList[i-1].trim();
                console.log(premiseList[i-1]);
            }
        }

        document.getElementById('input_conclusion_1').value = conclusion;

        console.log('Generated practice problem');
}

function submitLatexText(premise, conclusion, proof) {
    var premise_latex = premise.substr(1, premise.length-2);
    var premiseList = premise_latex.split(',');
    var proofList = proof_latex.split('\n');

    //adding the premises
    for (i = 1; i <= premiseList.length; i++){
        premiseList[i] = premiseList[i].substr(1, premiseList[i].length-2);
        var premiseId = 'input_premise_'+i;
        if(document.getElementById(premiseId)!==null){
            document.getElementById(premiseId).value = premiseList[i-1].trim();
            console.log(premiseList[i-1]);
        }
        else{
            addPremiseRow();
            document.getElementById(premiseId).value = premiseList[i-1].trim();
            console.log(premiseList[i-1]);
        }

    }

    //removing extra premises
    var allPremiseBoxesLength = document.querySelectorAll("[id*='input_premise_']").length;
    if (allPremiseBoxesLength >= i)
    {
        for (j = allPremiseBoxesLength; j >= i; j--){
            var premiseId = 'remove_premise_'+j;
            deleteRow(premiseId);
        }
    }

    //adding the conclusion

    //remove spaces first
    conclusion = removeSpaces(conclusion);
    conclusion = conclusion.substr(1, conclusion.length-2);
    document.getElementById('input_conclusion_1').value = conclusion;

    //adding the proofs
    for (i = 1; i <=proofList.length; i++){
        proofList[i-1] = proofList[i-1].substr(1, proofList[i-1].length-2);
    
        var proofs = proofList[i-1].split(' ');
        //TODO(vwei): finish this up and trim on \,
        var stepId = 'proof_step_input_'+i;
        var previousId = 'proof_previous_input_'+i;
        var rulesId = 'proof_rules_input_'+i;

        if(document.getElementById(stepId)!==null){
            document.getElementById(stepId).value = proofs[0] || "";
            document.getElementById(previousId).value = proofs[1] || "";
            var string = " ";
            for(j = 2;j<proofs.length;j++){
                string += proofs[j] + " ";
            }
            string = string.substr(0, string.length-1);
            string = removeSpaces(string);
            document.getElementById(rulesId).value = string;
        }
        else{
            addProofRow();
            document.getElementById(stepId).value = proofs[0] || "";
            document.getElementById(previousId).value = proofs[1] || "";
            document.getElementById(rulesId).value = proofs[2] || "";
            var string = " ";
            for(i = 2;i<proofs.length;i++){
                string += proofs[i] + " ";
            }
            document.getElementById(rulesId).value = string;
        }
    }

    //removing proofs
    var allProofRowsLength = document.querySelectorAll("[id*='proof_step_input_']").length;
    if (i > 1)
    {
        if (allProofRowsLength >= i)
        {
            for (j = allProofRowsLength; j >= i; j--){
                var proofRowId = 'proof_remove_'+j;
                deleteRow(proofRowId);
            }
        }
    }
}

function submitText(premise, conclusion, proof) {
    var premiseList = premise.split(',');
    var proofList = proof.split('\n');

    //adding the premises
    for (i = 1; i <= premiseList.length; i++){
        var premiseId = 'input_premise_'+i;
        if(document.getElementById(premiseId)!==null){
            document.getElementById(premiseId).value = premiseList[i-1].trim();
            console.log(premiseList[i-1]);
        }
        else{
            addPremiseRow();
            document.getElementById(premiseId).value = premiseList[i-1].trim();
            console.log(premiseList[i-1]);
        }

    }

    //removing extra premises
    var allPremiseBoxesLength = document.querySelectorAll("[id*='input_premise_']").length;
    if (allPremiseBoxesLength >= i)
    {
        for (j = allPremiseBoxesLength; j >= i; j--){
            var premiseId = 'remove_premise_'+j;
            deleteRow(premiseId);
        }
    }

    //adding the conclusion

    //remove spaces first
    conclusion = removeSpaces(conclusion);
    document.getElementById('input_conclusion_1').value = conclusion;

    //adding the proofs
    for (i = 1; i <=proofList.length; i++){
        var proofs = proofList[i-1].split(' ');
        var stepId = 'proof_step_input_'+i;
        var previousId = 'proof_previous_input_'+i;
        var rulesId = 'proof_rules_input_'+i;

        if(document.getElementById(stepId)!==null){
            document.getElementById(stepId).value = proofs[0] || "";
            document.getElementById(previousId).value = proofs[1] || "";
            var string = " ";
            for(j = 2;j<proofs.length;j++){
                string += proofs[j] + " ";
            }
            string = string.substr(0, string.length-1);
            string = removeSpaces(string);
            document.getElementById(rulesId).value = string;
        }
        else{
            addProofRow();
            document.getElementById(stepId).value = proofs[0] || "";
            document.getElementById(previousId).value = proofs[1] || "";
            document.getElementById(rulesId).value = proofs[2] || "";
            var string = " ";
            for(i = 2;i<proofs.length;i++){
                string += proofs[i] + " ";
            }
            document.getElementById(rulesId).value = string;
        }
    }

    //removing proofs
    var allProofRowsLength = document.querySelectorAll("[id*='proof_step_input_']").length;
    if (i > 1)
    {
        if (allProofRowsLength >= i)
        {
            for (j = allProofRowsLength; j >= i; j--){
                var proofRowId = 'proof_remove_'+j;
                deleteRow(proofRowId);
            }
        }
    }
}

function submitExpertMode(){
    console.log('Submitted');
    var premise = document.getElementById('premise-expert').value;
    var conclusion = document.getElementById('conclusion-expert').value;
    var proof = document.getElementById('proof-expert').value;

    submitText(premise, conclusion, proof);
}

function submitLatexMode() {
    console.log('Submitted Latex');
    var premise = document.getElementById('premise-latex').value;
    var conclusion = document.getElementById('conclusion-latex').value;
    var proof = document.getElementById('proof-latex').value;

    submitLatexText(premise, conclusion, proof);
}

function removeSpaces(text) {  
    var i = 0;
    while (i < text.length) {  
        if (text[i] == " ") {
            text = text.substring(0, i) + text.substring(i + 1, text.length);
        }
        else {
            i++;
        }
    }
    return text;
}

function submit(){
    console.log('Submitted Form');
    var premises = "";
    var conclusion = "";
    var stepList = [];
    var formList = document.getElementById('all_proof_input').elements;
    var conclusionLocation = 0;
    for (i = 0; i < formList.length; i++) {
        if(formList[i].id.includes("premise")) {
            premises = premises + formList[i].value + ",";
        }
        else {
            conclusionLocation = i;
            break;
        }
    }
    premises = premises.substr(0,premises.length -1);
    conclusion = formList[conclusionLocation].value;
    var index = conclusionLocation + 1;
    while(index < formList.length) {
        var step = [];
        var counter = 3;
        while(counter > 0) {
            step.push(formList[index].value);
            index++;
            counter--;
        }
        stepList.push(step);
    }
    
    $('#loader').show()
    $.ajax({
        url: "/logic",
        data: {
            submit: 'Proof',
            premises: premises,
            conclusion: conclusion,
            proof_lines: stepList
        },
        // TODO: Make better alert
        // TODO: Show loading solution alert for users when performing proof check
        success: function(data){
            var text = "";
            if(data.type === 'success'){
               text = data.reason; 
            }
            else{
                text = "Line " + data.line_number + ": "  + data.reason;
            }
            $('#loader').hide()
            swal({
                title: data.title,
                text: text,
                type: data.type,
                confirmButtonText: 'Continue',
                confirmButtonColor: '#2acbb3',
                showCancelButton: true,
                cancelButtonText: 'Return to Options',
                allowOutsideClick: false
            }).then((result) => {
                if (result.dismiss === 'cancel') {
                    window.location.href = "/logic_options";
                }
            });
            },
                dataType: 'json'
            });
            // var result = "<%= LogicController.parse_input(premises, conclusion, stepList) %>";
        }

        var globalExpertModalData = [];
        function expertModalOpen(){
            globalExpertModalData.length = 0; // Reset array
            globalExpertModalData.push(document.getElementById('premise-expert').value);
            globalExpertModalData.push(document.getElementById('conclusion-expert').value);
            globalExpertModalData.push(document.getElementById('proof-expert').value);

            $('.modal').modal({
                dismissible: false
            });
        }

        function expertModalCancel(){
            document.getElementById('premise-expert').value = globalExpertModalData[0] || "";
            document.getElementById('conclusion-expert').value = globalExpertModalData[1] || "";
            document.getElementById('proof-expert').value = globalExpertModalData[2] || "";
            globalExpertModalData.length = 0;
        }

        var globalLatexModalData = [];
        function latexModalOpen() {
            globalLatexModalData.length = 0; // Reset array
            globalLatexModalData.push(document.getElementById('premise-latex').value);
            globalLatexModalData.push(document.getElementById('conclusion-latex').value);
            globalLatexModalData.push(document.getElementById('proof-latex').value);

            $('.modal').modal({
                dismissible: false
            });
        }

        function latexModalCancel() {
            document.getElementById('premise-latex').value = globalLatexModalData[0] || "";
            document.getElementById('conclusion-latex').value = globalLatexModalData[1] || "";
            document.getElementById('proof-latex').value = globalLatexModalData[2] || "";
        }
