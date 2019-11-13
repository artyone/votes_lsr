let form  = document.getElementById('form-votes');

form.addEventListener("submit", function (e) {
    if (invalidForm()) {
        alert('Необходимо заполнить все поля');
        e.preventDefault();
    }
});

function invalidForm() {

    let formGroups  = document.getElementsByClassName('form-group');

    let flagInvalid = false;

    for (let i = 0; i < formGroups.length; i++) {
        
        let group = formGroups[i];
        let inputs = group.getElementsByClassName('form-check-input');

        if (inputs.length) {
            let flagChecked = false;

            for (let j = 0; j < inputs.length; j++) {
                let inp = inputs[j];
                if (inp.checked) {
                    flagChecked = true;
                }
            }

            if (flagChecked == false) {
                group.classList.add('has-error');
                flagInvalid = true;
            }
        }

    }

    return flagInvalid;
}


let inputs  = document.getElementsByClassName('form-check-label');

for (let i = 0; i < inputs.length; i++) {
    let inp = inputs[i];
    inp.addEventListener("click", function () {
        let form = inp.parentNode.parentNode;
        form.classList.remove('has-error');
    });

}