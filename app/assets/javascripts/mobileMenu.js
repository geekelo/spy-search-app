//= require_tree .

// app/assets/javascripts/mobileMenu.js
document.addEventListener('DOMContentLoaded', function() {
	
  // Get references to the menu icon, close icon, and menu section
  const menuIcon = document.getElementById('menu-icon');
  const closeIcon = document.getElementById('close-icon');
  const menuSection = document.getElementById('menu-section');
  const navLinks = document.querySelectorAll('.nav-links');

  // Function to add the active class
  function addActive() {
			menuIcon.classList.add('active');
			closeIcon.classList.add('active');
			menuSection.classList.add('active');
  }

	  // Function to remove the active class
		function removeActive() {
			menuIcon.classList.remove('active');
			closeIcon.classList.remove('active');
			menuSection.classList.remove('active');
  }

  // Add click event listener to the menu icon
  menuIcon.addEventListener('click', function() {
    addActive();
  });

  // Add click event listener to the close icon
  closeIcon.addEventListener('click', function() {
    removeActive();
  });
});
