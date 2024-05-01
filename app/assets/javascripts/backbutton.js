//= require_tree .

// app/assets/javascripts/backbutton.js
// JavaScript code to hide the back button on the home page
document.addEventListener('DOMContentLoaded', function() {
    const backButton = document.getElementById('backButton');

    // Check if the current URL is the home page
    if (window.location.pathname === '/') {
        // If on the home page, hide the back button
        backButton.style.display = 'none';
    } else {
        // If not on the home page, show the back button
        backButton.style.display = 'block';
    }

    backButton.addEventListener('click', function() {
        // Navigate back in the browser history
        // Check if the current URL contains "/analytics"
        if (window.location.pathname.includes('/analytics/queries')) {
            // If on the "/analytics" page, navigate to the home page
            window.location.href = '/analytics';
        } else {
            // Otherwise, navigate to the "/analytics" page
            window.location.href = '/';
        }
    });
});
