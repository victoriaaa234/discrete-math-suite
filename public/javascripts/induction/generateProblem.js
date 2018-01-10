const generateProblem = function(type) {
    switch (type) {
        case "math":
            return createSummation();
        case "strong":
            return  createPostageStamp();
        case "structural":
            return createHeightOfTree();
        default:
            break;
    }
};

const createSummation = function(){
    let problem = {

    };

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