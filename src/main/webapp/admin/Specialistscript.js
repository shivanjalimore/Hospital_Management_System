// JavaScript to show the popup when the "Specialist" section is clicked
document.getElementById('specialistCard').addEventListener('click', function () {
    document.getElementById('specialistPopup').style.display = 'flex';
});

// Close the popup when the close button is clicked
document.getElementById('closeBtn').addEventListener('click', function () {
    document.getElementById('specialistPopup').style.display = 'none';
});

document.getElementById('saveChangesBtn').addEventListener('click', function () {
    document.getElementById('specialistPopup').style.display = 'none';
});


    