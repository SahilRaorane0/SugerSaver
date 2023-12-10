// doctorHome.js

function navigateTo(page) {
    console.log(`Navigating to ${page}`);
    switch (page) {
        case 'adminPersonalDetails':
            window.location.href = 'AdminPersonalDetailsDatabase.jsp';
            break;
        case 'patients':
            window.location.href = 'PatientListForAdmin.jsp';
            break;
        case 'doctors':
            window.location.href = 'DoctorListForAdmin.jsp';
            break;
        case 'logOut':
            window.location.href = 'Index.jsp';
            break;
        default:
            break;
    }
}


// Function to submit admin's personal details
async function submitAdminPersonalDetails() {
    // Get values from the form
    const firstName = document.getElementById('fname').value;
    const lastName = document.getElementById('lname').value;
    const email = document.getElementById('email').value;

    // Create an object with the admin's personal details
    const adminDetails = {
        firstName,
        lastName,
        email,
    };

    try {
        // Perform the POST request to submit admin's personal details
        const response = await fetch('YOUR_BACKEND_API_ENDPOINT_FOR_ADMIN', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(adminDetails),
        });

        if (!response.ok) {
            throw new Error('Error submitting admin personal details');
        }

        console.log('Admin personal details submitted successfully');

        // Optionally, you can perform a GET request to fetch updated data and update the form
        await loadAdminPersonalDetails();

    } catch (error) {
        console.error('Error:', error);
    }
}

// Function to load initial data for admin's personal details
async function loadAdminPersonalDetails() {
    try {
        // Perform a GET request to fetch admin's personal details
        const response = await fetch('YOUR_BACKEND_API_ENDPOINT_FOR_ADMIN');

        if (!response.ok) {
            throw new Error('Error fetching admin personal details');
        }

        const adminData = await response.json();

        // Populate the form with admin's personal details
        populateAdminForm(adminData);

    } catch (error) {
        console.error('Error:', error);
    }
}

// Function to populate the admin form with data
function populateAdminForm(adminData) {
    document.getElementById('fname').value = adminData.firstName;
    document.getElementById('lname').value = adminData.lastName;
    document.getElementById('email').value = adminData.email;
}

// Call loadAdminPersonalDetails() on page load to initially populate the form
document.addEventListener('DOMContentLoaded', function () {
    loadAdminPersonalDetails();
    fetchInitialData();
    loadInitialPatientData();
});


// Function to fetch initial data for populating the form
async function fetchInitialData() {
    try {
        const response = await fetch('YOUR_SERVER_ENDPOINT');

        if (!response.ok) {
            throw new Error('Error fetching initial data');
        }

        const initialData = await response.json();

        // Call a function to populate the form with the fetched data
        populateForm(initialData);

    } catch (error) {
        console.error('Error:', error);
    }
}

// Function to populate the form with data
function populateForm(data) {
    // Assuming data is an object with fields corresponding to form elements
    document.getElementById('id').value = data.id || '';
    document.getElementById('fname').value = data.fname || '';
    document.getElementById('lname').value = data.lname || '';
    document.getElementById('date').value = data.date || '';
    document.getElementById('password').value = data.password || '';
}

// Function to submit updated personal details
function submitUpdatePersonalDetails() {
    // Get values from the form
    const id = document.getElementById('id').value;
    const fname = document.getElementById('fname').value;
    const lname = document.getElementById('lname').value;
    const date = document.getElementById('date').value;
    const password = document.getElementById('password').value;

    // Create an object with the updated personal details
    const updatedDetails = {
        id,
        fname,
        lname,
        date,
        password,
    };

    // Perform the POST request to submit the updated details
    fetch('YOUR_UPDATE_ENDPOINT', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(updatedDetails),
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


async function submitUpdatePersonalDetails() {
    // Get values from the form
    const id = document.getElementById('id').value;
    const firstName = document.getElementById('fname').value;
    const lastName = document.getElementById('lname').value;
    const date = document.getElementById('date').value;
    const password = document.getElementById('password').value;

    // Create an object with the updated personal details
    const updatedDetails = {
        id,
        firstName,
        lastName,
        date,
        password,
    };

    try {
        // Perform the POST request
        const response = await fetch('YOUR_BACKEND_API_ENDPOINT', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(updatedDetails),
        });

        if (!response.ok) {
            throw new Error('Error updating personal details');
        }

        const responseData = await response.json();

        console.log('Personal details updated successfully:', responseData);

    } catch (error) {
        console.error('Error:', error);
    }
}

// Add this function to your JavaScript file
async function loadInitialPatientData() {
    try {
        // Perform a GET request to fetch initial data
        const response = await fetch('YOUR_BACKEND_API_ENDPOINT');

        if (!response.ok) {
            throw new Error('Error fetching initial data');
        }

        // Parse the response data
        const initialData = await response.json();

        // Populate the form with the initial data
        populatePatientForm(initialData);

    } catch (error) {
        console.error('Error:', error);
    }
}

// Create a function to populate the form with data
function populatePatientForm(data) {
    // Assuming data is an object with the relevant properties
    document.getElementById('id').value = data.id;
    document.getElementById('fname').value = data.firstName;
    document.getElementById('lname').value = data.lastName;
    document.getElementById('date').value = data.date;
    document.getElementById('password').value = data.password;
    // Add more fields as needed
}



