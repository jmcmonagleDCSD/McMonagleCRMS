// Parallax effect
window.addEventListener('scroll', function() {
    let scrollPosition = window.pageYOffset;
    document.body.style.backgroundPositionY = -scrollPosition * 0.5 + 'px';
});

// Form submission (you'll need to implement server-side handling)
const contactForm = document.getElementById('contact-form');
if (contactForm) {
    contactForm.addEventListener('submit', function(e) {
        e.preventDefault();
        alert('Thank you for your message! We will get back to you soon.');
        contactForm.reset();
    });
}

// Add more interactivity as needed