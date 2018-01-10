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

const createSummation = function(minNum=0,maxNum=100){   // a, b and c are integers (decimals not covered in class??)
    let problem = {};
    problem.a = Math.floor(Math.random() * (maxNum - minNum)) + minNum;
    problem.b = Math.floor(Math.random() * (maxNum - minNum)) + minNum;
    problem.c = Math.floor(Math.random() * (maxNum - minNum)) + minNum;
    while (problem.a == 0 && problem.b == 0 && problem.c == 0) {
        problem.a = Math.floor(Math.random() * (maxNum - minNum)) + minNum;
        problem.b = Math.floor(Math.random() * (maxNum - minNum)) + minNum;
        problem.c = Math.floor(Math.random() * (maxNum - minNum)) + minNum;
    }
    problem.text = `Prove that summation_1toN(${problem.a}i^2 + ${problem.b}i + ${problem.c})
                    = ${problem.a}n(n+1)(2n+1)/6 + ${problem.b}n(n+1)/2 + ${problem.c}.`;
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
