var createBasisRow = function (x, y, t, i) {
    
    let input1 = document.createElement('input');
    input1.setAttribute('type', 'text');
    input1.id = `stamp1-input-${i}`;
    let col1 = document.createElement('div');
    col1.className = 'col s1 form-uname';
    col1.appendChild(input1);
    
    let col2 = document.createElement('div');
    col2.className = 'col s1 stamp';
    let stamp1 = document.createElement('div');
    col2.appendChild(stamp1);
    
    let input2 = document.createElement('input');
    input2.setAttribute('type', 'text');
    input2.id = `stamp2-input-${i}`;
    let col3 = document.createElement('div');
    col3.className = 'col s1 form-uname';
    col3.appendChild(input2);
    
    let col4 = document.createElement('div');
    col4.className = 'col s1 stamp';
    let stamp2 = document.createElement('div');
    col4.appendChild(stamp2);
    
    let col5 = document.createElement('div');
    col5.className = 'col s1 stamp';
    let total = document.createElement('div');
    col5.appendChild(total);

    let row = document.createElement('div');
    row.classList.add('row');
    row.appendChild(col1);
    row.appendChild(col2);
    row.appendChild(col3);
    row.appendChild(col4);
    row.appendChild(col5);
    
    let basisForm = document.getElementById('basis-step-form');
    basisForm.appendChild(row);


    katex.render('\\displaystyle\\times' + x + '\\; +', stamp1);
    katex.render('\\displaystyle\\times' + y + '\\; =', stamp2);
    katex.render(t +'', total);

}

var currentProblem = {
    problem: {},
    loadProblem: function (type) {
        this.problem = generateProblem(type);
        let problemtext = document.getElementById("problem-text");
        problemtext.innerHTML = this.problem.text;

        let basistext = document.getElementById("basis-text");
        basistext.innerHTML = this.problem.basis.text;
        for(var i = 0; i < this.problem.stamp1; i++) {
            createBasisRow(this.problem.stamp1,this.problem.stamp2,this.problem.basis.total + i,i);
        }
        let hypothesistext = document.getElementById("hypothesis-text");
        hypothesistext.innerHTML = `i can be represented as a*${this.problem.stamp1}+b*${this.problem.stamp2}.`;

        let inductivesteptext = document.getElementById("inductive-step-text");
        inductivesteptext.innerHTML = this.loadInductiveStep();
        
    },
    loadInductiveStep: function(){ 
        return `Show P(k+1): k+1 can be represented as a*${this.problem.stamp1}+b*${this.problem.stamp2}<br><br>
        Since k >= ${this.problem.basis.total + this.problem.stamp1 - 1}, 
        P(k-${this.problem.stamp1 - 1}) holds (by inductive hypothesis).<br>
        <input type="text" id="induction-input-1"/>
        Form k+1 as follows: <br>
        Form k-${this.problem.stamp1-1}=a*${this.problem.stamp1}+b*${this.problem.stamp2} (by inductive hypothesis).
        add 1 x ${this.problem.stamp1}<br>
        k+1 = k-${this.problem.stamp1-1} + ${this.problem.stamp1}<br>
        thus k+1 = a'*${this.problem.stamp1}+b'*${this.problem.stamp2}, where a'=a+1, b'=b<br>
        thus, (P(${this.problem.basis.total}),...,P(k))--> P(k+1) for k >= ${this.problem.basis.total + this.problem.stamp1 - 1}<br>
        therefore, P(n) holds for all n>=${this.problem.basis.total} by the principle of mathematical induction`
    }
};