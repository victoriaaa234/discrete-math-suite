const stepManager = {
    currentStep: 'basis-step',
    basis: new step('basis-step', 'basis-btn'),
    inductiveHypothesis: new step('inductive-hypothesis', 'hypothesis-btn'),
    inductiveStep: new step('inductive-step', 'inductive-btn'),
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
                if (this.basis.check()) {
                    this.basis.hideButton();
                    this.currentStep = 'inductive-hypothesis';
                    this.inductiveHypothesis.show();
                    return;
                }
                break;
            case 'inductive-hypothesis':
                if (this.inductiveHypothesis.check()) {
                    this.inductiveHypothesis.hideButton();
                    this.currentStep = 'inductive-step';
                    this.inductiveStep.show();
                    return;
                }
                break;
            case 'inductive-step':
                if (this.inductiveStep.check()) {
                    this.inductiveStep.hideButton();
                    return;
                }
                break;
        }
        alert('Incorrect Answer');
    },
};