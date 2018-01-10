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

const createPostageStamp = function(minstamp = 1,maxstamp = 10) {
    let problem = {};
    problem.stamp1 =  Math.floor(Math.random()*(maxstamp-minstamp))+minstamp;
    do {
        problem.stamp2 = Math.floor(Math.random()*(maxstamp-minstamp))+minstamp;
    } while(problem.stamp1 == problem.stamp2);
    
    problem.basis = (problem.stamp1 - 1)* (problem.stamp2 - 1);
    problem.text = `Use strong induction to prove that any amount of postage that is at least ${problem.basis} cents\
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

const generateSolution = function(solutionParameters) {
    switch (solutonParameters.type) {
        case "polynomial":
            return polynomialSoluton(solutionParameters);
        case "diversive":
            return diversiveSoluton(solutionParameters);
        case "geometric":
            return geometricSoluton(solutionParameters);
        case "strong":
            return  strongSolution(solutionParameters);
        case "structural":
            return structuralSolution(solutionParameters);
        default:
            break;
    }
};

const polynomialSolution = function(solutionParameters){
    let solution = {
        
    };
    return solution;
};

const diversiveSolution = function(solutionParameters){
    let solution = {

    };

    return solution;
};

const geometricSolution = function(solutionParameters){
    let solution = {

    };

    return solution;
};

const strongSolution = function(solutionParameters){
    let solution = {

    };

    return solution;
};

const structuralSolution = function(solutionParameters){
    let solution = {

    };

    return solution;
};