var consumer = "";

function disableButtonsAndInputs(role) {

    console.log('calling disable buttons and inputs');

    const buttons = document.querySelectorAll('button');
    const inputs = document.querySelectorAll('input');
    const textareas = document.querySelectorAll('textarea');

    // Loop through buttons and disable them
    buttons.forEach(button => {
        button.disabled = role === 'doctor';
    });

    // Loop through inputs and disable them
    inputs.forEach(input => {
        input.disabled = role === 'doctor';
    });

    textareas.forEach(textarea => {
            textarea.disabled = role === 'doctor';
    });
}

document.addEventListener('DOMContentLoaded', function() {
    checkUserRole();
});

// Function to check the user's role and disable buttons and input fields accordingly
function checkUserRole() {
    console.log('Checking user role');
    const urlParams = new URLSearchParams(window.location.search);
    const role = urlParams.get('role');

    console.log('role - ' + role);

    disableButtonsAndInputs(role);
}

function showLogin(userType) {
    hideAllContainers();
    document.getElementById(userType + 'Login').style.display = 'block';
}

function showSignup(userType) {
    hideAllContainers();
    document.getElementById(userType + 'Signup').style.display = 'block';
}

function hideAllContainers() {
    const containers = ['patientLogin', 'doctorLogin', 'adminLogin', 'patientSignup', 'doctorSignup', 'forgotPassword'];
    containers.forEach(container => {
        document.getElementById(container).style.display = 'none';
    });
    consumer = "";
    var inputFields = document.querySelectorAll('form input');
    // Loop through each input field and set its value to an empty string
    inputFields.forEach(function(input) {
        input.value = "";
    });

}

function login(userType) {
    const usernameInput = document.getElementById(userType + 'LoginForm').elements[0];
    const passwordInput = document.getElementById(userType + 'LoginForm').elements[1];

    const username = usernameInput.value;
    const password = passwordInput.value;

    // You can replace the following with actual login logic
    if (username === 'dummy' && password === 'dummy') {
       // alert(userType + " login successful!");

        // Check user type and navigate to the corresponding home page
        if (userType === 'patient') {
            window.location.href = '../html/patient/home.html'; // Redirect to Patient Home Page
        } else if (userType === 'doctor') {
            window.location.href = '../html/doctor/doctorHome.html'; // Redirect to Doctor Home Page
        } else if (userType === 'admin') {
            window.location.href = '../html/admin/adminHome.html'; // Redirect to Admin Home Page
        }
    } else {
        alert("Invalid username or password. Please try again with 'dummy' for both.");
    }
}


function signup(userType) {
    var username = document.getElementById(userType + 'SignupForm').elements[0].value;
    var password = document.getElementById(userType + 'SignupForm').elements[1].value;
    var email = document.getElementById(userType + 'SignupForm').elements[2].value;

    // Perform signup logic here, such as sending data to a server or storing it locally.
    // You can use AJAX for server communication or any other suitable method.

    // After successful signup, you may want to show a success message or redirect the user.

    // Clear the form fields if needed.
    document.getElementById(userType + 'SignupForm').reset();
    alert(userType + " signup successful! Please use 'dummy' data for testing.");
}


function forgotPass(userType) {
    consumer = userType;
    hideAllContainers();
    document.getElementById('forgotPassword').style.display = 'block';
}

function handleForgetPassword(userType) {
    const username = document.getElementById('forgetPasswordForm').getElementsByTagName('input')[0].value;
    const password = document.getElementById('forgetPasswordForm').getElementsByTagName('input')[1].value;
    const c_password = document.getElementById('forgetPasswordForm').getElementsByTagName('input')[2].value;
    console.log("Forget Password for:", consumer);
    console.log(username, password, c_password);
}

// The following function is added assuming you want to use it for dummy registration.
function register(userType) {
    const email = document.getElementById(userType + 'SignupForm').elements[0].value;
    const firstName = document.getElementById(userType + 'SignupForm').elements[1].value;
    const username = document.getElementById(userType + 'SignupForm').elements[2].value;
    const password = document.getElementById(userType + 'SignupForm').elements[3].value;

    const newUser = { email, firstName, username, password };
    localStorage.setItem(userType + 'User', JSON.stringify(newUser));

    alert(userType + " registration successful!");
    showLogin(userType);
}

// Function to make a POST request to store personal details
    async function storePersonalDetails(data) {
        try {
            const response = await fetch('YOUR_BACKEND_API_ENDPOINT', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data),
            });

            if (!response.ok) {
                throw new Error('Error storing personal details');
            }

            return await response.json();
        } catch (error) {
            console.error('Error:', error);
        }
    }

    // Function to make a GET request to retrieve stored personal details
    async function getPersonalDetails() {
        try {
            const response = await fetch('YOUR_BACKEND_API_ENDPOINT');
            if (!response.ok) {
                throw new Error('Error fetching personal details');
            }

            const data = await response.json();

            // Set the retrieved values as placeholders in the form
            document.getElementById('fname').value = data.fname || '';
            document.getElementById('lname').value = data.lname || '';
            document.getElementById('phone').value = data.phone || '';
            document.getElementById('email').value = data.email || '';
            document.getElementById('gender').value = data.gender || '';
        } catch (error) {
            console.error('Error:', error);
        }
    }

    // Function to submit personal details
    function submitPersonalDetails() {
        const firstName = document.getElementById('fname').value;
        const lastName = document.getElementById('lname').value;
        const phone = document.getElementById('phone').value;
        const email = document.getElementById('email').value;
        const gender = document.getElementById('gender').value;

        const personalDetails = { fname: firstName, lname: lastName, phone, email, gender };

        // Call the backend to store personal details
        storePersonalDetails(personalDetails);

        // For demonstration purposes, display an alert with the entered details
        const detailsString = `First Name: ${firstName}\nLast Name: ${lastName}\nPhone: ${phone}\nEmail: ${email}\nGender: ${gender}`;
        alert('Personal Details Submitted:\n\n' + detailsString);
        console.log('Personal Details Submitted:\n\n' + detailsString);
    }

    // Load the stored values when the page is loaded
    window.onload = getPersonalDetails;


// script.js

