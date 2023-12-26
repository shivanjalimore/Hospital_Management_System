// JavaScript to show the popup when the "Specialist" section is clicked
document.getElementById('specialistCard').addEventListener('click', function () {
    document.getElementById('specialistPopup').style.display = 'flex';
});

// Close the popup when the close button is clicked
document.getElementById('closeBtn').addEventListener('click', function () {
    document.getElementById('specialistPopup').style.display = 'none';
});

// Functionality for adding a specialist (Add button)
//document.getElementById('addSpecialistBtn').addEventListener('click', function () {
    // Here, you can add your logic to handle adding a specialist
   // let specialistName = document.getElementById('specialistInput').value;
    // Perform actions with the specialist name (e.g., send to the server)
    //console.log('Added specialist:', specialistName);
    // Clear input field or perform other actions if needed
    //document.getElementById('specialistInput').value = '';
//});

// Functionality for saving changes (Save Changes button)
document.getElementById('saveChangesBtn').addEventListener('click', function () {
    // Here, you can add your logic to save any changes made in the popup
    //console.log('Changes saved.');
    
    document.getElementById('specialistPopup').style.display = 'none';
});
