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
    let problem = {
        stamp1: Math.floor(Math.random()*(maxstamp-minstamp))+minstamp,
        stamp2: Math.floor(Math.random()*(maxstamp-minstamp))+minstamp,
    };
    problem.basis = (problem.stamp1 - 1)* (problem.stamp2 - 1);
    problem.text = `Use strong induction to prove that any amount of postage that is at least ${problem.basis} cents\
    can be made with ${problem.stamp1} and ${problem.stamp2} cent stamps`;
    return problem;
};

const heightOfTree = function(){
    let problem = {

    }

    return problem;
};
