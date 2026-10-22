/* =============================================
   TRAVEL PLANS - SITE.JS
   Global JS interactions (vanilla only, no jQuery)
   ============================================= */

(function () {
    'use strict';

    /* ---- Nav: sticky scroll class ---- */
    var nav = document.querySelector('.site-nav');
    if (nav) {
        window.addEventListener('scroll', function () {
            if (window.scrollY > 10) {
                nav.classList.add('scrolled');
            } else {
                nav.classList.remove('scrolled');
            }
        }, { passive: true });
    }

    /* ---- Mobile hamburger toggle ---- */
    var hamburger = document.getElementById('navHamburger');
    var mobileMenu = document.getElementById('navMobile');
    if (hamburger && mobileMenu) {
        hamburger.addEventListener('click', function () {
            var isOpen = mobileMenu.classList.contains('open');
            if (isOpen) {
                mobileMenu.classList.remove('open');
                hamburger.setAttribute('aria-expanded', 'false');
            } else {
                mobileMenu.classList.add('open');
                hamburger.setAttribute('aria-expanded', 'true');
            }
        });
        // Close when clicking overlay
        mobileMenu.addEventListener('click', function (e) {
            if (e.target === mobileMenu) {
                mobileMenu.classList.remove('open');
                hamburger.setAttribute('aria-expanded', 'false');
            }
        });
    }

    /* ---- Tabs ---- */
    document.addEventListener('click', function (e) {
        var tabBtn = e.target.closest('[data-tab]');
        if (!tabBtn) return;

        var tabGroup = tabBtn.closest('[data-tab-group]');
        if (!tabGroup) return;

        var targetId = tabBtn.getAttribute('data-tab');

        // Deactivate all buttons in group
        tabGroup.querySelectorAll('[data-tab]').forEach(function (btn) {
            btn.classList.remove('active');
            btn.setAttribute('aria-selected', 'false');
        });

        // Hide all panels
        tabGroup.querySelectorAll('[data-tab-panel]').forEach(function (panel) {
            panel.classList.remove('active');
        });

        // Activate clicked
        tabBtn.classList.add('active');
        tabBtn.setAttribute('aria-selected', 'true');

        var panel = document.getElementById(targetId);
        if (panel) {
            panel.classList.add('active');
        }
    });

    /* ---- Auth tabs ---- */
    document.addEventListener('click', function (e) {
        var authTab = e.target.closest('[data-auth-tab]');
        if (!authTab) return;

        var mode = authTab.getAttribute('data-auth-tab');
        document.querySelectorAll('[data-auth-tab]').forEach(function (btn) {
            btn.classList.remove('active');
        });
        authTab.classList.add('active');

        document.querySelectorAll('[data-auth-panel]').forEach(function (panel) {
            panel.style.display = 'none';
        });

        var target = document.querySelector('[data-auth-panel="' + mode + '"]');
        if (target) target.style.display = 'block';

        var loginTypeInput = document.getElementById('hdnLoginType');
        if (loginTypeInput) loginTypeInput.value = mode;
    });

    /* ---- Toggle password visibility ---- */
    document.addEventListener('click', function (e) {
        var toggleBtn = e.target.closest('[data-toggle-pass]');
        if (!toggleBtn) return;
        var targetId = toggleBtn.getAttribute('data-toggle-pass');
        var input = document.getElementById(targetId);
        if (!input) return;
        if (input.type === 'password') {
            input.type = 'text';
            toggleBtn.textContent = '🙈';
        } else {
            input.type = 'password';
            toggleBtn.textContent = '👁';
        }
    });

    /* ---- Filter chips ---- */
    document.addEventListener('click', function (e) {
        var chip = e.target.closest('.filter-chip[data-filter-group]');
        if (!chip) return;
        var group = chip.getAttribute('data-filter-group');
        document.querySelectorAll('.filter-chip[data-filter-group="' + group + '"]').forEach(function (c) {
            c.classList.remove('active');
        });
        chip.classList.add('active');
        filterTours();
    });

    /* ---- Wishlist toggle ---- */
    document.addEventListener('click', function (e) {
        var btn = e.target.closest('.tour-card-wishlist, .saved-heart');
        if (!btn) return;
        btn.classList.toggle('active');
        var icon = btn.querySelector('.wish-icon');
        if (icon) {
            icon.textContent = btn.classList.contains('active') ? '❤️' : '🤍';
        } else {
            btn.textContent = btn.classList.contains('active') ? '❤️' : '🤍';
        }
    });

    /* ---- Modal open/close ---- */
    document.addEventListener('click', function (e) {
        // Open
        var opener = e.target.closest('[data-open-modal]');
        if (opener) {
            var modalId = opener.getAttribute('data-open-modal');
            var modal = document.getElementById(modalId);
            if (modal) {
                modal.classList.add('open');
                document.body.style.overflow = 'hidden';
            }
        }

        // Close via close button
        var closer = e.target.closest('[data-close-modal]');
        if (closer) {
            var overlay = closer.closest('.modal-overlay');
            if (overlay) {
                overlay.classList.remove('open');
                document.body.style.overflow = '';
            }
        }

        // Close via overlay click
        if (e.target.classList.contains('modal-overlay')) {
            e.target.classList.remove('open');
            document.body.style.overflow = '';
        }
    });

    /* ---- Admin sidebar mobile toggle ---- */
    var adminToggle = document.getElementById('adminSidebarToggle');
    var adminSidebar = document.getElementById('adminSidebar');
    var adminOverlay = document.getElementById('adminOverlay');

    if (adminToggle && adminSidebar) {
        adminToggle.addEventListener('click', function () {
            adminSidebar.classList.toggle('open');
            if (adminOverlay) adminOverlay.classList.toggle('open');
        });
    }

    if (adminOverlay) {
        adminOverlay.addEventListener('click', function () {
            if (adminSidebar) adminSidebar.classList.remove('open');
            adminOverlay.classList.remove('open');
        });
    }

    /* ---- Price range slider display ---- */
    var priceSlider = document.getElementById('priceRange');
    var priceDisplay = document.getElementById('priceDisplay');
    if (priceSlider && priceDisplay) {
        priceSlider.addEventListener('input', function () {
            priceDisplay.textContent = '₹' + Number(priceSlider.value).toLocaleString('en-IN');
            filterTours();
        });
    }

    /* ---- Tour filter function ---- */
    function filterTours() {
        var cards = document.querySelectorAll('.tour-card[data-category][data-price][data-duration]');
        if (cards.length === 0) return;

        var activeCategory = document.querySelector('.filter-chip[data-filter-group="category"].active');
        var activeDuration = document.querySelector('.filter-chip[data-filter-group="duration"].active');

        var categoryVal = activeCategory ? activeCategory.getAttribute('data-value') : 'all';
        var durationVal = activeDuration ? activeDuration.getAttribute('data-value') : 'all';
        var maxPrice = priceSlider ? parseInt(priceSlider.value) : 999999;

        cards.forEach(function (card) {
            var cat = card.getAttribute('data-category');
            var price = parseInt(card.getAttribute('data-price'));
            var dur = parseInt(card.getAttribute('data-duration'));

            var showCat = categoryVal === 'all' || cat === categoryVal;
            var showPrice = price <= maxPrice;
            var showDur = durationVal === 'all' ||
                (durationVal === '1-3' && dur <= 3) ||
                (durationVal === '4-7' && dur >= 4 && dur <= 7) ||
                (durationVal === '8-14' && dur >= 8 && dur <= 14);

            card.closest('.tour-card-wrapper') ?
                card.closest('.tour-card-wrapper').style.display = (showCat && showPrice && showDur) ? '' : 'none' :
                card.style.display = (showCat && showPrice && showDur) ? '' : 'none';
        });
    }

    /* ---- Sort select ---- */
    var sortSelect = document.getElementById('sortSelect');
    if (sortSelect) {
        sortSelect.addEventListener('change', function () {
            var container = document.getElementById('toursContainer');
            if (!container) return;
            var cards = Array.from(container.querySelectorAll('.tour-card-wrapper, .tour-card[data-price]'));
            var sortVal = sortSelect.value;
            cards.sort(function (a, b) {
                var priceA = parseInt((a.querySelector('[data-price]') || a).getAttribute('data-price'));
                var priceB = parseInt((b.querySelector('[data-price]') || b).getAttribute('data-price'));
                if (sortVal === 'price-asc') return priceA - priceB;
                if (sortVal === 'price-desc') return priceB - priceA;
                return 0;
            });
            cards.forEach(function (c) { container.appendChild(c); });
        });
    }

    /* ---- Search input filter ---- */
    var searchInput = document.getElementById('tourSearch');
    if (searchInput) {
        searchInput.addEventListener('input', function () {
            var query = searchInput.value.toLowerCase().trim();
            var cards = document.querySelectorAll('.tour-card-wrapper');
            cards.forEach(function (wrapper) {
                var title = wrapper.querySelector('.tour-card-title');
                var dest = wrapper.querySelector('.tour-card-dest');
                var text = ((title ? title.textContent : '') + ' ' + (dest ? dest.textContent : '')).toLowerCase();
                wrapper.style.display = text.includes(query) ? '' : 'none';
            });
        });
    }

    /* ---- Smooth anchor scrolling ---- */
    document.querySelectorAll('a[href^="#"]').forEach(function (a) {
        a.addEventListener('click', function (e) {
            var id = a.getAttribute('href').slice(1);
            var el = document.getElementById(id);
            if (el) {
                e.preventDefault();
                el.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        });
    });

    /* ---- Admin search/filter tables ---- */
    var adminSearch = document.getElementById('adminSearch');
    if (adminSearch) {
        adminSearch.addEventListener('input', function () {
            var query = adminSearch.value.toLowerCase();
            var rows = document.querySelectorAll('.admin-table-row');
            rows.forEach(function (row) {
                row.style.display = row.textContent.toLowerCase().includes(query) ? '' : 'none';
            });
        });
    }

    /* ---- Mark active nav link ---- */
    var currentPath = window.location.pathname.toLowerCase();
    document.querySelectorAll('.nav-link[href]').forEach(function (link) {
        var href = link.getAttribute('href').toLowerCase().replace('~', '');
        if (currentPath.includes(href) && href !== '/') {
            link.classList.add('active');
        }
    });

    /* ---- Cancel booking confirm dialog ---- */
    document.addEventListener('click', function (e) {
        var cancelBtn = e.target.closest('.btn-cancel-booking');
        if (!cancelBtn) return;
        e.preventDefault();
        var bookingId = cancelBtn.getAttribute('data-booking-id') || 'this booking';
        if (confirm('Are you sure you want to cancel ' + bookingId + '? This action is for demonstration purposes only.')) {
            var row = cancelBtn.closest('.booking-list-item');
            if (row) {
                var badge = row.querySelector('.status-badge');
                if (badge) {
                    badge.className = 'status-badge status-cancelled';
                    badge.textContent = '✕ Cancelled';
                }
                cancelBtn.disabled = true;
                cancelBtn.textContent = 'Cancelled';
            }
        }
    });

    /* ---- Admin delete confirm ---- */
    document.addEventListener('click', function (e) {
        var delBtn = e.target.closest('.btn-admin-delete');
        if (!delBtn) return;
        e.preventDefault();
        var name = delBtn.getAttribute('data-name') || 'this item';
        if (confirm('Delete ' + name + '? This is a demonstration action only.')) {
            var row = delBtn.closest('tr, .admin-row');
            if (row) {
                row.style.opacity = '0';
                row.style.transition = 'opacity 0.3s ease';
                setTimeout(function () {
                    row.remove();
                }, 300);
            }
        }
    });

    /* ---- Hero scroll animation ---- */
    if ('IntersectionObserver' in window) {
        var observer = new IntersectionObserver(function (entries) {
            entries.forEach(function (entry) {
                if (entry.isIntersecting) {
                    entry.target.classList.add('fade-in');
                    observer.unobserve(entry.target);
                }
            });
        }, { threshold: 0.1 });

        document.querySelectorAll('.tour-card, .dest-page-card, .stat-card').forEach(function (el) {
            el.classList.add('fade-ready');
            observer.observe(el);
        });
    }

    /* ---- Fade animation styles injection ---- */
    var style = document.createElement('style');
    style.textContent = '.fade-ready { opacity: 0; transform: translateY(20px); transition: opacity 0.5s ease, transform 0.5s ease; } .fade-in { opacity: 1; transform: none; }';
    document.head.appendChild(style);

})();
