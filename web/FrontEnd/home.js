// home.js
function navigateTo(page) {
    console.log('Inside navigateTo');
    switch (page) {
        case 'patientsList':
            window.location.href = '../doctor/Patients_list.html';
            break;
        case 'personalDetails':
            window.location.href = 'PatientPersonalDetailsDatabase.jsp';
            break;
        case 'medicalRecords':
            window.location.href = 'PatientMedicalRecords.jsp';
            break;
        case 'dietHistory':
            window.location.href = 'PatientDietHistory.jsp';
            break;
        case 'faq':
            window.location.href = '../patient/faq.html';
            break;
        case 'logOut':
            window.location.href = 'Index.jsp';
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
            window.location.href = 'DoctorPersonalDetailsDatabase.jsp';
            break;

        case 'patientsList':
            window.location.href = 'PatientList.jsp';
            break;

        case 'submitDietForm':
            window.location.href = 'submit_diet_form.html';
            break;

        case 'suggest_diet_form':
            window.location.href = 'suggest_diet_form.html';
            break;
        case 'logOut':
            window.location.href = 'Index.jsp';
            break;
        default:
            console.log(`Unknown page: ${page}`);
            break;
    }
}
