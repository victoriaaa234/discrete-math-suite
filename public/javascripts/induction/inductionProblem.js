const inductionProblem = {
    problem: {},
    loadProblem: function(type){
        this.problem = generateProblem(type);
        let problemtext = document.getElementById("problem-text");
        problemtext.innerHTML = this.problem.text;
    }
};