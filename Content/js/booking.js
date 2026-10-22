/* =============================================
   TRAVEL PLANS - BOOKING.JS
   Booking wizard interactions
   ============================================= */

(function () {
    'use strict';

    /* ---- Booking wizard state ---- */
    var currentStep = 1;
    var totalSteps = 3;
    var BASE_PRICE_PER_PERSON = 85000; // Default, updated from page data
    var NUM_ADULTS = 2;
    var NUM_CHILDREN = 0;
    var GST_RATE = 0.05;

    function initWizard() {
        // Read base price from page
        var bp = document.getElementById('hdnBasePrice');
        if (bp && bp.value) {
            BASE_PRICE_PER_PERSON = parseInt(bp.value) || 85000;
        }

        updateStepUI();
        updatePriceSummary();
    }

    function updateStepUI() {
        // Show/hide step panels
        for (var i = 1; i <= totalSteps; i++) {
            var panel = document.getElementById('step' + i);
            if (panel) {
                panel.style.display = i === currentStep ? 'block' : 'none';
            }
        }

        // Update step indicators
        document.querySelectorAll('.wizard-step').forEach(function (step, index) {
            var stepNum = index + 1;
            step.classList.remove('active', 'completed');
            if (stepNum === currentStep) step.classList.add('active');
            if (stepNum < currentStep) step.classList.add('completed');
        });

        // Update connectors
        document.querySelectorAll('.wizard-connector').forEach(function (conn, index) {
            if (index < currentStep - 1) {
                conn.classList.add('completed');
            } else {
                conn.classList.remove('completed');
            }
        });

        // Update nav buttons
        var prevBtn = document.getElementById('btnPrev');
        var nextBtn = document.getElementById('btnNext');
        var submitBtn = document.getElementById('btnSubmit');

        if (prevBtn) prevBtn.style.display = currentStep > 1 ? 'inline-flex' : 'none';
        if (nextBtn) nextBtn.style.display = currentStep < totalSteps ? 'inline-flex' : 'none';
        if (submitBtn) submitBtn.style.display = currentStep === totalSteps ? 'inline-flex' : 'none';
    }

    function updatePriceSummary() {
        var roomSurcharge = 0;
        var roomTypeEl = document.getElementById('hdnRoomType');
        var roomType = roomTypeEl ? roomTypeEl.value : 'Standard';
        if (roomType === 'Deluxe') roomSurcharge = 10000;
        else if (roomType === 'Suite') roomSurcharge = 25000;

        var totalPax = Math.max(1, NUM_ADULTS + NUM_CHILDREN);
        var baseTotal = (BASE_PRICE_PER_PERSON * totalPax) + roomSurcharge;
        var gst = Math.round(baseTotal * GST_RATE);
        var grandTotal = baseTotal + gst;

        var fmt = function (n) {
            return '₹' + n.toLocaleString('en-IN');
        };

        setEl('summaryBase', fmt(baseTotal));
        setEl('summaryGST', fmt(gst));
        setEl('summaryTotal', fmt(grandTotal));
        setEl('summaryAdults', NUM_ADULTS);
        setEl('summaryChildren', NUM_CHILDREN);

        // Also update the booking widget on tour detail page
        var widgetTotal = document.getElementById('widgetTotal');
        if (widgetTotal) {
            var wt = document.getElementById('hdnBasePrice');
            var wPrice = wt ? (parseInt(wt.value) || 85000) : 85000;
            var pax = parseInt((document.getElementById('widgetCount') || {}).textContent) || 2;
            widgetTotal.textContent = fmt(wPrice * pax);
        }
    }

    function setEl(id, val) {
        var el = document.getElementById(id);
        if (el) el.textContent = val;
    }

    /* ---- Next / Prev navigation ---- */
    var nextBtn = document.getElementById('btnNext');
    if (nextBtn) {
        nextBtn.addEventListener('click', function () {
            if (currentStep < totalSteps) {
                currentStep++;
                updateStepUI();
                window.scrollTo({ top: 0, behavior: 'smooth' });
            }
        });
    }

    var prevBtn = document.getElementById('btnPrev');
    if (prevBtn) {
        prevBtn.addEventListener('click', function () {
            if (currentStep > 1) {
                currentStep--;
                updateStepUI();
                window.scrollTo({ top: 0, behavior: 'smooth' });
            }
        });
    }

    /* ---- Adult/child quantity controls ---- */
    function attachQtyControl(minusId, plusId, displayId, varRef, minVal, maxVal, updateFn) {
        var minusBtn = document.getElementById(minusId);
        var plusBtn = document.getElementById(plusId);
        var display = document.getElementById(displayId);

        if (minusBtn) {
            minusBtn.addEventListener('click', function () {
                if (varRef.value > minVal) {
                    varRef.value--;
                    if (display) display.textContent = varRef.value;
                    updateFn();
                }
            });
        }

        if (plusBtn) {
            plusBtn.addEventListener('click', function () {
                if (varRef.value < maxVal) {
                    varRef.value++;
                    if (display) display.textContent = varRef.value;
                    updateFn();
                }
            });
        }
    }

    // Wrapper objects so we can mutate by reference
    var adultsRef = { value: NUM_ADULTS };
    var childrenRef = { value: NUM_CHILDREN };

    attachQtyControl('btnAdultMinus', 'btnAdultPlus', 'adultCount', adultsRef, 1, 10, function () {
        NUM_ADULTS = adultsRef.value;
        updatePriceSummary();
        var inp = document.getElementById('hdnAdults');
        if (inp) inp.value = NUM_ADULTS;
    });

    attachQtyControl('btnChildMinus', 'btnChildPlus', 'childCount', childrenRef, 0, 8, function () {
        NUM_CHILDREN = childrenRef.value;
        updatePriceSummary();
        var inp = document.getElementById('hdnChildren');
        if (inp) inp.value = NUM_CHILDREN;
    });

    /* ---- Tour detail qty widget ---- */
    var widgetMinusBtn = document.getElementById('btnWidgetMinus');
    var widgetPlusBtn = document.getElementById('btnWidgetPlus');
    var widgetCount = document.getElementById('widgetCount');
    var widgetRef = { value: 2 };

    if (widgetMinusBtn) {
        widgetMinusBtn.addEventListener('click', function () {
            if (widgetRef.value > 1) {
                widgetRef.value--;
                if (widgetCount) widgetCount.textContent = widgetRef.value;
                calcWidgetTotal();
            }
        });
    }

    if (widgetPlusBtn) {
        widgetPlusBtn.addEventListener('click', function () {
            if (widgetRef.value < 10) {
                widgetRef.value++;
                if (widgetCount) widgetCount.textContent = widgetRef.value;
                calcWidgetTotal();
            }
        });
    }

    function calcWidgetTotal() {
        var bp = document.getElementById('hdnBasePrice');
        var price = bp ? (parseInt(bp.value) || 85000) : 85000;
        var total = price * widgetRef.value;
        var fmt = function (n) { return '₹' + n.toLocaleString('en-IN'); };

        var subtotalEl = document.getElementById('widgetSubtotal');
        var totalEl = document.getElementById('widgetTotal');
        if (subtotalEl) subtotalEl.textContent = fmt(price) + ' × ' + widgetRef.value;
        if (totalEl) totalEl.textContent = fmt(total);
    }

    /* ---- Room type radio ---- */
    document.addEventListener('click', function (e) {
        var roomOption = e.target.closest('.room-option');
        if (!roomOption) return;
        var container = roomOption.closest('.room-options');
        if (!container) return;
        container.querySelectorAll('.room-option').forEach(function (opt) {
            opt.classList.remove('selected');
        });
        roomOption.classList.add('selected');
        var radio = roomOption.querySelector('input[type="radio"]');
        if (radio) radio.checked = true;

        var roomType = roomOption.getAttribute('data-room');
        var inp = document.getElementById('hdnRoomType');
        if (inp) inp.value = roomType || '';
        updatePriceSummary();
    });

    /* ---- Date validation display ---- */
    var travelDate = document.getElementById('txtTravelDate');
    var returnDate = document.getElementById('txtReturnDate');

    if (travelDate && returnDate) {
        returnDate.addEventListener('change', function () {
            if (travelDate.value && returnDate.value) {
                var td = new Date(travelDate.value);
                var rd = new Date(returnDate.value);
                var errEl = document.getElementById('dateError');
                if (errEl) {
                    errEl.textContent = rd <= td ? 'Return date must be after travel date.' : '';
                }
            }
        });

        travelDate.addEventListener('change', function () {
            // Set min for return date
            returnDate.min = travelDate.value;
        });

        // Set min travel date to today
        var today = new Date().toISOString().split('T')[0];
        travelDate.min = today;
    }

    /* ---- Init ---- */
    if (document.getElementById('wizardContainer')) {
        initWizard();
    }

    /* ---- If on tour detail page ---- */
    if (document.getElementById('widgetCount')) {
        calcWidgetTotal();
    }

})();
