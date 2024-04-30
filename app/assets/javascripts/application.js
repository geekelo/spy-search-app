//= require_tree .

// app/assets/javascripts/application.js
document.addEventListener('DOMContentLoaded', function() {
    let userInput = '';
    let typingTimer;
    const typingInterval = 5000;

    function handleInputChange(event) {
        userInput = event.target.value.trim();
        clearTimeout(typingTimer);
        typingTimer = setTimeout(submitInput, typingInterval);
    }

    function submitInput() {
        if (userInput !== '') {
            console.log('Submitting input:', userInput);
    
            // Prepare data to send to Rails controller
            const requestData = {
                query: userInput
            };
            console.log(requestData);
    
            // Send AJAX request to Rails controller
            fetch('/search/record_search', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
                },
                body: JSON.stringify(requestData)
            })
            .then(response => {
                if (response.ok) {
                    console.log('Search query recorded successfully');
                } else {
                    console.error('Failed to record search query:', response.statusText);
                }
            })
            .catch(error => {
                console.error('Error recording search query:', error);
            });
        }
    }

    document.getElementById('search-input').addEventListener('input', handleInputChange);
});
