(function () {
  'use strict';

  // Mobile nav toggle
  const toggle = document.querySelector('.nav-mobile-toggle');
  const navLinks = document.querySelector('.nav-links');
  if (toggle && navLinks) {
    toggle.addEventListener('click', function () {
      const isOpen = navLinks.classList.toggle('is-open');
      toggle.setAttribute('aria-expanded', String(isOpen));
    });
    // Close on outside click
    document.addEventListener('click', function (e) {
      if (!toggle.contains(e.target) && !navLinks.contains(e.target)) {
        navLinks.classList.remove('is-open');
        toggle.setAttribute('aria-expanded', 'false');
      }
    });
  }

  // Smooth scroll for anchor links
  document.querySelectorAll('a[href^="#"]').forEach(function (anchor) {
    anchor.addEventListener('click', function (e) {
      const id = anchor.getAttribute('href');
      if (id === '#') return;
      const target = document.querySelector(id);
      if (target) {
        e.preventDefault();
        // Close mobile nav if open
        if (navLinks) navLinks.classList.remove('is-open');
        if (toggle) toggle.setAttribute('aria-expanded', 'false');
        target.scrollIntoView({ behavior: 'smooth', block: 'start' });
        // Update focus for accessibility
        target.setAttribute('tabindex', '-1');
        target.focus({ preventScroll: true });
      }
    });
  });

  // Active nav item on scroll (homepage only)
  if (document.body.classList.contains('home')) {
    const sections = document.querySelectorAll('section[id]');
    const navAnchors = document.querySelectorAll('.nav-links a[href^="#"]');

    if (sections.length && navAnchors.length && 'IntersectionObserver' in window) {
      const observer = new IntersectionObserver(function (entries) {
        entries.forEach(function (entry) {
          if (entry.isIntersecting) {
            navAnchors.forEach(function (a) {
              const matches = a.getAttribute('href') === '#' + entry.target.id;
              a.setAttribute('aria-current', matches ? 'true' : 'false');
            });
          }
        });
      }, { rootMargin: '-30% 0px -60% 0px' });

      sections.forEach(function (s) { observer.observe(s); });
    }
  }
})();
