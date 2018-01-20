function step(elementId, checkBtn) {
    this.element = document.getElementById(elementId);
    this.checkBtn = document.getElementById(checkBtn);
    this.hidden = true;
}

step.prototype.check = function(answer) {
    return true;
};

step.prototype.toggle = function() {
    if(this.hidden) {
        this.show();
    } else {
        this.hide();
    }
};

step.prototype.show = function() {
    this.element.classList.remove("scale-out");
   // this.element.style.display = "block";
};

step.prototype.hide = function() {
    this.element.classList.add("scale-out");
    //this.element.style.display = "none";      
};

step.prototype.hideButton = function() {
    this.checkBtn.classList.remove("scale-out");
    this.checkBtn.style.display = "none";      
};