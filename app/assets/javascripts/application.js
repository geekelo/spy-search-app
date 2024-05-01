//= require_tree .

// app/assets/javascripts/application.js

// This event listener waits for the DOM content to be fully loaded before executing the code inside.
document.addEventListener('DOMContentLoaded', function() {
  // Initialize variables to store user input and typing timer.
  let userInput = '';
  let typingTimer;

  // Define the time interval (in milliseconds) after which user input is considered complete.
  const typingInterval = 1000;

  // Function to handle user input change events.
  function handleInputChange(event) {
      // Prevent the default behavior of the event.
      event.preventDefault();

      // Get the trimmed lowercase value of the input field.
      userInput = event.target.value.toLowerCase().trim();

      // Clear the previous typing timer.
      clearTimeout(typingTimer);

      // Set a new typing timer after the specified interval.
      typingTimer = setTimeout(submitInput, typingInterval);
  }

  // Function to submit user input after a typing delay.
  function submitInput() {
      // Check if user input is not empty.
      if (userInput !== '') {
          // Log the user input to the console.
          console.log('Submitting input:', userInput);

          // Prepare the data to send to the Rails controller.
          const requestData = {
              query: userInput
          };

          // Log the request data to the console.
          console.log(requestData);

          // Send an AJAX request to the Rails controller to record the search query.
          fetch('/search/record_search', {
              method: 'POST',
              headers: {
                  'Content-Type': 'application/json',
                  'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
              },
              body: JSON.stringify(requestData)
          })
          .then(response => {
              // Check if the response is OK.
              if (response.ok) {
                  console.log('Search query recorded successfully');
                  // Clear the user input after successful recording.
                  userInput = '';
              } else {
                  // Log an error message if recording fails.
                  console.error('Failed to record search query:', response.statusText);
              }
          })
          .catch(error => {
              // Log an error message if there's an error during the request.
              console.error('Error recording search query:', error);
          });
      }
  }

  // Add an event listener to the search input field to handle input changes.
  document.getElementById('search-input').addEventListener('input', handleInputChange);
});
