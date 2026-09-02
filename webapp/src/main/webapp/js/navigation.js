// Navigation functionality
function showPage(pageName) {
    // Hide all pages
    const pages = document.querySelectorAll('.page');
    pages.forEach(page => page.classList.remove('active'));
    
    // Show selected page
    const selectedPage = document.getElementById(pageName);
    if (selectedPage) {
        selectedPage.classList.add('active');
        window.scrollTo(0, 0); // Scroll to top
    }
}

// Navigation link handlers
function setupNavigation() {
    const navLinks = document.querySelectorAll('.nav-links a');
    navLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            const page = this.getAttribute('data-page');
            if (page) {
                showPage(page);
            }
        });
    });
    
    // Brand logo to home
    const brandLogo = document.querySelector('.brand-logo');
    if (brandLogo) {
        brandLogo.addEventListener('click', function(e) {
            e.preventDefault();
            showPage('home');
        });
    }
}

// Initialize on page load
document.addEventListener('DOMContentLoaded', function() {
    setupNavigation();
    showPage('home'); // Show home page by default
});

// Form submission handling
function handleFormSubmit(formId, e) {
    if (e) {
        e.preventDefault();
    }
    
    if (formId === 'registrationForm') {
        const form = document.getElementById(formId);
        if (form) {
            console.log('Registration submitted');
            // You can submit to backend here
            // form.submit();
        }
    } else if (formId === 'signinForm') {
        const form = document.getElementById(formId);
        if (form) {
            console.log('Sign in submitted');
            // You can submit to backend here
            // form.submit();
        }
    }
}
