// home.js
function navigateTo(page) {
    console.log('Inside navigateTo');
    switch (page) {
        case 'patientsList':
            window.location.href = '../doctor/Patients_list.html';
            break;
        case 'personalDetails':
            window.location.href = '../patient/personal_details.html?role=patient';
            break;
        case 'medicalRecords':
            window.location.href = '../doctor/medical_records.html';
            break;
        case 'dietHistory':
            window.location.href = '../patient/diet_history.html';
            break;
        case 'faq':
            window.location.href = '../patient/faq.html';
            break;
        default:
            // Handle default case or do nothing
            break;
    }
}

function navigateDoctorTo(page) {
    console.log(`Navigating to ${page}`);
    switch (page) {

        case 'doctorPersonalDetails':
            window.location.href = 'doctor_personal_details.html';
            break;

        case 'patientsList':
            window.location.href = 'Patients_list.html';
            break;

        case 'submitDietForm':
            window.location.href = 'submit_diet_form.html';
            break;

        case 'suggest_diet_form':
            window.location.href = 'suggest_diet_form.html';
            break;

        default:
            console.log(`Unknown page: ${page}`);
            break;
    }
}
