const generateProblem = function(type) {
    switch (type) {
        case "math": // choose between createSummation, createGeometric and createDivision
            x = Math.random();
            //console.log(x);
            if (x <= 0.33) {
                return createSummation();
            }
            else if (x > 0.33 && x <= 0.66) {
                return createGeometric();
            }
            else return createDivision();
        case "strong":
            return  createPostageStamp();
        case "structural":
            return createHeightOfTree();
        default:
            break;
    }
};


const createSummation = function(minNum=0,maxNum=25){   // a, b and c are integers (decimals not covered in class??)
    let problem = {};
    problem.a = Math.floor(Math.random() * (maxNum - minNum)) + minNum;
    problem.b = Math.floor(Math.random() * (maxNum - minNum)) + minNum;
    problem.c = Math.floor(Math.random() * (maxNum - minNum)) + minNum;
    while (problem.a == 0 && problem.b == 0 && problem.c == 0) {
        problem.a = Math.floor(Math.random() * (maxNum - minNum)) + minNum;
        problem.b = Math.floor(Math.random() * (maxNum - minNum)) + minNum;
        problem.c = Math.floor(Math.random() * (maxNum - minNum)) + minNum;
    }
    problem.text = `Prove by induction that for n>0, summation_1toN(${problem.a}i^2 + ${problem.b}i + ${problem.c}) = ${problem.a}n(n+1)(2n+1)/6 + ${problem.b}n(n+1)/2 + ${problem.c}.`;
    problem.formula = `${problem.a}n(n+1)(2n+1)/6 + ${problem.b}n(n+1)/2 + ${problem.c}`;
    return problem;
};

//Finds combination of a and b that equals total, for postage stamp
const subsetSum = function(a, b, total){
    for(let i = 0; i <= total/a; i++){
        for(let j=0; j<=total/b; j++) {
            let sum = a*i + b*j;
            if(sum == total){
                return [i,j];
            }
            else if(sum > total){
                break;
            }
        }
    }
    return [0,0];
};
//greatest common factor of two numbers
var gcd = function(a, b) {
    if ( ! b) {
        return a;
    }
    return gcd(b, a % b);
};


const createPostageStamp = function(minstamp = 2,maxstamp = 7) {
    let problem = {type: 'postage'};
    do {
        problem.stamp1 =  Math.floor(Math.random()*(maxstamp-minstamp))+minstamp;
        do {
            problem.stamp2 = Math.floor(Math.random()*(maxstamp-minstamp))+minstamp;
        } while(problem.stamp1 == problem.stamp2);
    } while(gcd(problem.stamp1,problem.stamp2) != 1);

    if(problem.stamp1 > problem.stamp2) {
        var temp_stamp = problem.stamp1;
        problem.stamp1 = problem.stamp2;
        problem.stamp2 = temp_stamp;
    }
    
    problem.basis = {}; 
    problem.basis.total = (problem.stamp1 - 1)* (problem.stamp2 - 1);
    var basisCount = subsetSum(problem.stamp1,problem.stamp2,problem.basis.total); //find the combination needed for basis
    problem.basis.count1 = basisCount[0];
    problem.basis.count2 = basisCount[1];
    problem.basis.text = `Prove that there is a combination of ${problem.stamp1} and ${problem.stamp2} cent stamps that totals\
    ${problem.basis.total}`
    
    problem.text = `Use strong induction to prove that any amount of postage that is at least ${problem.basis.total} cents\
        can be made with ${problem.stamp1} and ${problem.stamp2} cent stamps.`;
    return problem;
};

const createGeometric = function(minR=1, maxR=100){
    let problem = {};
    problem.r = Math.floor(Math.random() * (maxR - minR)) + minR;
    problem.oneMinusR = 1-problem.r;
    while (problem.oneMinusR == 0) {
        problem.r = Math.floor(Math.random() * (maxR - minR)) + minR;
        problem.oneMinusR = 1 - problem.r;
    }
    if (problem.oneMinusR == -1) {
        problem.text = `Prove by induction that for n>0, the geometric sequence 1 + ${problem.r} + ${problem.r}^2 + ... + ${problem.r}^n) = -[1-${problem.r}^(n-1)]`;
        problem.formula = `-[1-${problem.r}^(n-1)]`;
    }
    else {
        problem.text = `Prove by induction that for n>0, the geometric sequence 1 + ${problem.r} + ${problem.r}^2 + ... + ${problem.r}^n) = [1-${problem.r}^(n-1)]/${problem.oneMinusR}`;
        problem.formula = `[1-${problem.r}^(n-1)]/${problem.oneMinusR}`;
    }
    return problem;
};

const createDivision = function(minB=0, maxB=30){
    let problem = {};
    problem.b = Math.floor(Math.random() * (maxB - minB)) + minB;
    problem.a = Math.floor(Math.random() * (maxB+1 - problem.b+1)) + problem.b+1;
    problem.c = problem.a - problem.b;
    problem.text = `Prove by induction that for n>0, ${problem.a}^n - ${problem.b}^n is divisible by ${problem.c}.`;
    problem.formula1 = `${problem.a}^n - ${problem.b}^n`;
    problem.formula2 = `${problem.c}`;
    return problem;
};

const heightOfTree = function(){
    let problem = {

    }

    return problem;
};

const generateSolution = function(problemParameters) {
    switch (problemParameters.type) {
        case "summation":
            return polynomialSoluton(problemParameters);
        case "division":
            return divisionSoluton(problemParameters);
        case "geometric":
            return geometricSoluton(problemParameters);
        case "strong":
            return  strongSolution(problemParameters);
        case "structural":
            return structuralSolution(problemParameters);
        default:
            break;
    }
};

const summationSolution = function(problemParameters){
    let solution = {};
    solution.basecase_text = `Base Case: Prove that the statements holds true when n = 1`;
    solution.hypothesis_text = `Assume that the statement holds when n = k`;
    solution.step_text_initial = `Prove that the statement holds true when n = k+1`;
    solution.step_text_connection = `Which leads the equation to:`;
    solution.step_text_lhs = `The LHS of the equation equals to: ${problemParameters.lhs}`;
    solution.step_text_rhs = `The RHS of the equation equals to: ${problemParameters.rhs}`;
    solution.step_text_conclude = `LHS=RHS for n=k+1. Thus prooven that the statement holds true when n = k+1. Therefore, it holds for true for all n`;

    return solution;
};

const divisionSolution = function(problemParameters){
    let solution = {};
    solution.basecase_text = `Base Case: Prove that the statements holds true when n = 1`;
    solution.hypothesis_text = `Assume that the statement holds when n = k`;
    solution.step_text_initial = `Prove that the statement holds true when n = k+1`;
    solution.step_text_connection = `Which leads the equation to:`;
    solution.step_text_lhs = `Check if LHS of the equation is divisible: ${problemParameters.lhs}`;
    solution.step_text_rhs = `Check if RHS of the equation is divisible: ${problemParameters.rhs}`;
    solution.step_text_conclude = `Both sides of euquation are shown to be diversible. Thus prooven that the statement holds true when n = k+1. Therefore, it holds for true for all n`;
    return solution;
};

const geometricSolution = function(problemParameters){
    let solution = {};
    solution.basecase_text = `Base Case: Prove that the statements holds true when n = 1`;
    solution.hypothesis_text = `Assume that the statement holds when n = k`;
    solution.step_text_initial = `Prove that the statement holds true when n = k+1`;
    solution.step_text_connection = `Which leads the equation to:`;
    solution.step_text_lhs = `The LHS of the equation equals to: ${problemParameters.lhs}`;
    solution.step_text_rhs = `The RHS of the equation equals to: ${problemParameters.rhs}`;
    solution.step_text_conclude = `LHS=RHS for n=k+1. Thus prooven that the statement holds true when n = k+1. Therefore, it holds for true for all n`;

    return solution;
};

const strongSolution = function(problemParameters){
    let solution = {};
    solution.text = ``;

    return solution;
};

const structuralSolution = function(problemParameters){
    let solution = {};

    return solution;
};