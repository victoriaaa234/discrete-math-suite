var stepManager = {
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
        var incorrectText = {};
        switch (this.currentStep) {
            case 'basis-step':
                incorrectText = document.getElementById('basis-step-incorrect');        
                if (this.checkBasis()) {
                    this.basis.hideButton();
                    this.currentStep = 'inductive-hypothesis';
                    this.inductiveHypothesis.show();
                    incorrectText.classList.add('scale-out');
                    return;
                }
                break;
            case 'inductive-hypothesis':
                incorrectText = document.getElementById('inductive-hypothesis-incorrect');        
                if (this.checkHypothesis()) {
                    this.inductiveHypothesis.hideButton();
                    this.currentStep = 'inductive-step';
                    this.inductiveStep.show();
                    incorrectText.classList.add('scale-out');                                     
                    return;
                }
                break;
            case 'inductive-step':
                incorrectText = document.getElementById('inductive-step-incorrect');
                if (this.checkInductiveStep()) {
                    this.inductiveStep.hideButton();
                    incorrectText.classList.add('scale-out');                                      
                    return;
                }
                break;
            }
        incorrectText.classList.add('incorrect');
        incorrectText.classList.remove('scale-out');
    },
    checkBasis: function() {
        let x = currentProblem.problem.stamp1;
        let y = currentProblem.problem.stamp2;
        let t = currentProblem.problem.basis.total;
        for(var i = 0; i < x; i++) {
            let stamp1Answer = parseInt(document.getElementById(`stamp1-input-${i}`).value);
            let stamp2Answer = parseInt(document.getElementById(`stamp2-input-${i}`).value);

            if(((stamp1Answer * x + stamp2Answer * y)  != t + i) || (stamp1Answer < 0) || (stamp2Answer < 0)) {
                return false;
            } 
            
        }
        return true;
    },
    checkHypothesis: function() {
        let hypothesisAnswer1 = document.getElementById('hypothesis-input-1');
        let hypothesisAnswer2 = document.getElementById('hypothesis-input-2');

        return ((hypothesisAnswer1.value == currentProblem.problem.basis.total) && 
            (hypothesisAnswer2.value == currentProblem.problem.basis.total + currentProblem.problem.stamp1 - 1));
        
    },
    checkInductiveStep: function(){
        let inductiveStepAnswer1 = parseInt(document.getElementById('induction-input-1').value);
        if(inductiveStepAnswer1 != currentProblem.problem.stamp1 - 1) {
            return false;
        }
        let inductiveStepAnswer2 = parseInt(document.getElementById('induction-input-2').value);
        if(inductiveStepAnswer2 != parseInt(currentProblem.problem.stamp1-1)) {
            return false;
        }
        let inductiveStepAnswer3 = parseInt(document.getElementById('induction-input-3').value);
        if(inductiveStepAnswer3 != parseInt(currentProblem.problem.stamp1)) {
            return false;
        }
        let inductiveStepAnswer4 = parseInt(document.getElementById('induction-input-4').value);
        if(inductiveStepAnswer4 != parseInt(currentProblem.problem.stamp1-1)) {
            return false;
        }
        let inductiveStepAnswer5 = parseInt(document.getElementById('induction-input-5').value);
        if(inductiveStepAnswer5 != parseInt(currentProblem.problem.stamp1)) {
            return false;
        }
        window.location = "/induction?check=true"
    }
};
