// doctorHome.js

function submitMedicalDetails() {
    // Get values from the form
    const name = document.getElementById('name').value;
    const height = document.getElementById('height').value;
    const weight = document.getElementById('weight').value;
    const age = document.getElementById('age').value;
    const HBAICDate = document.getElementById('HBAIC').value;
    const HBAICLevel = document.getElementById('HBAIClevel').value;
    const exerciseFrequency = document.getElementById('exercise').value;
    const exerciseType = document.getElementById('exerciseType').value;
    const sugarIntakeFrequency = document.getElementById('sugarIntake').value;

    // Check which medication option is selected
    const isOnMedication = document.getElementById('medicationYes').checked ? 'Yes' : 'No';

    const healthIssue = document.getElementById('healthIssue').value;
    const preferredMeal = document.getElementById('preferedMeal').value;

    // Create an object with the medical details
    const medicalDetails = {
        name,
        height,
        weight,
        age,
        HBAICDate,
        HBAICLevel,
        exerciseFrequency,
        exerciseType,
        sugarIntakeFrequency,
        isOnMedication,
        healthIssue,
        preferredMeal
    };

    console.log(medicalDetails)

    // Perform the POST request
    fetch('YOUR_BACKEND_API_ENDPOINT', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(medicalDetails),
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json();
    })
    .then(data => {
        console.log('Response from server:', data);
    })
    .catch(error => {
        console.error('There was a problem with the POST operation:', error);
    });
}

async function submitDiet(event) {
    event.preventDefault();

    const doctorName = document.getElementById('doctorName').value;
    const date = document.getElementById('date').value;
    const patientId = document.getElementById('patientId').value;
    const dietSuggestion = document.getElementById('dietSuggestion').value;

    console.log(JSON.stringify({
                                doctorName,
                                date,
                                patientId,
                                dietSuggestion,
                            }));

    try {
        const response = await fetch('YOUR_BACKEND_API_ENDPOINT', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                doctorName,
                date,
                patientId,
                dietSuggestion,
            }),
        });

        if (!response.ok) {
            throw new Error('Error storing diet suggestion');
        }

        console.log('Diet suggestion submitted successfully');

    } catch (error) {
        console.error('Error:', error);
    }
}
