<<<<<<< HEAD
const inductionProblem = {
    problem: {},
    loadProblem: function(type){
        this.problem = generateProblem(type);
        let problemtext = document.getElementById("problem-text");
        problemtext.innerHTML = this.problem.text;
    }
=======
const currentProblem = {
    problem: {},
    loadProblem: function(type){
        this.problem = generateProblem(type);
        let problemtext = document.getElementById("problem-text");
        problemtext.innerHTML = this.problem.text;
    }
>>>>>>> 3f7bc62432c0e9b9149f21758e93a89e5d72cc98
};