const currentProblem = {
    problem: {},
    loadProblem: function(type){
        this.problem = generateProblem(type);
        let problemtext = document.getElementById("problem-text");
        problemtext.innerHTML = this.problem.text;

        let basistext = document.getElementById("basis-text");
        basistext.innerHTML = this.problem.basis.text;
        let stamp1 = document.getElementById("stamp1-amount");
        katex.render('\\displaystyle\\times'+this.problem.stamp1 + '\\; +',stamp1);
        let stamp2 = document.getElementById("stamp2-amount");
        katex.render('\\displaystyle\\times '+this.problem.stamp2,stamp2);
        let totalAmount = document.getElementById("total-amount");
        katex.render('\\displaystyle='+this.problem.basis.total,totalAmount);
    }
};