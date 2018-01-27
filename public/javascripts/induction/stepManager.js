const stepManager = {
    currentStep: 'basis-step',
    basis: new step('basis','basis-step', 'basis-btn'),
    inductiveHypothesis: new step('inductive-hypothesis','inductive-hypothesis', 'hypothesis-btn'),
    inductiveStep: new step('inductive-step','inductive-step', 'inductive-btn'),
    init: function () {
        let manager = this;
        currentStep = 'basis-step';
        this.basis.show();
        this.basis.checkBtn.addEventListener('click', function () {
            manager.nextStep();
        });
        this.inductiveHypothesis.hide();
        this.inductiveHypothesis.checkBtn.addEventListener('click', function () {
            manager.nextStep();
        });
        this.inductiveStep.hide();
        this.inductiveStep.checkBtn.addEventListener('click', function () {
            manager.nextStep();
        });
    },
    nextStep: function () {
        switch (this.currentStep) {
            case 'basis-step':
                if (this.checkBasis()) {
                    this.basis.hideButton();
                    this.currentStep = 'inductive-hypothesis';
                    this.inductiveHypothesis.show();
                    alert('Correct!');
                    return;
                }
                break;
            case 'inductive-hypothesis':
                if (this.checkHypothesis()) {
                    this.inductiveHypothesis.hideButton();
                    this.currentStep = 'inductive-step';
                    this.inductiveStep.show();
                    alert('Correct!');                    
                    return;
                }
                break;
            case 'inductive-step':
                if (this.inductiveStep.check()) {
                    this.inductiveStep.hideButton();
                    alert('Correct!');                    
                    return;
                }
                break;
        }
        alert('Incorrect Answer');
    },
    checkBasis: function() {
        let stamp1Count = currentProblem.problem.basis.count1;
        let stamp2Count = currentProblem.problem.basis.count2;
        let stamp1Answer = document.getElementById('stamp1-input');
        let stamp2Answer = document.getElementById('stamp2-input');
    
        return ((stamp1Count == stamp1Answer.value) && (stamp2Count == stamp2Answer.value))
    },
    checkHypothesis: function() {
        let hypothesisAnswer1 = document.getElementById('hypothesis-input-1');
        let hypothesisAnswer2 = document.getElementById('hypothesis-input-2');

        return ((hypothesisAnswer1.value == currentProblem.problem.basis.total) && 
            (hypothesisAnswer2.value == 'k'));
        
    }
};
