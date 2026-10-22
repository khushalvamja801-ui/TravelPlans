<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookingWizard.aspx.cs" Inherits="TravelPlans.Pages.Booking.BookingWizard" MasterPageFile="~/Site.Master" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Book Your Tour – Travel Plans
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:HiddenField ID="hdnBasePrice" runat="server" Value="85000" ClientIDMode="Static" />
    <asp:HiddenField ID="hdnAdults" runat="server" Value="2" ClientIDMode="Static" />
    <asp:HiddenField ID="hdnChildren" runat="server" Value="0" ClientIDMode="Static" />
    <asp:HiddenField ID="hdnRoomType" runat="server" Value="Standard" ClientIDMode="Static" />

    <!-- Page Banner -->
    <div class="page-banner" style="padding:2.5rem 0;">
        <div class="container text-center">
            <h1 class="page-banner-title" style="font-size:2rem;">Complete Your Booking</h1>
            <p class="page-banner-sub">Secure your adventure in just 3 simple steps</p>
        </div>
    </div>

    <section class="section section-alt">
        <div class="container">

            <!-- Step Indicators -->
            <div class="wizard-steps" role="list" aria-label="Booking steps">
                <div class="wizard-step active" id="wizStep1" role="listitem">
                    <div class="wizard-step-num">1</div>
                    <div class="wizard-step-label">Trip Details</div>
                </div>
                <div class="wizard-connector" id="conn1"></div>
                <div class="wizard-step" id="wizStep2" role="listitem">
                    <div class="wizard-step-num">2</div>
                    <div class="wizard-step-label">Guest Info</div>
                </div>
                <div class="wizard-connector" id="conn2"></div>
                <div class="wizard-step" id="wizStep3" role="listitem">
                    <div class="wizard-step-num">3</div>
                    <div class="wizard-step-label">Payment</div>
                </div>
            </div>

            <div id="wizardContainer" class="booking-layout">

                <!-- ===== STEP PANELS ===== -->
                <div>

                    <!-- STEP 1: Trip Details -->
                    <div id="step1">
                        <div class="wizard-form-section">
                            <h2 class="wizard-form-title">📅 Trip Details</h2>

                            <asp:ValidationSummary ID="vsStep1" runat="server" ValidationGroup="Step1"
                                CssClass="validation-summary-errors" HeaderText="Please fix:" />

                            <div class="form-row-2">
                                <div class="form-group">
                                    <label class="form-label" for="<%= txtTravelDate.ClientID %>">TRAVEL DATE</label>
                                    <asp:TextBox ID="txtTravelDate" runat="server" TextMode="Date"
                                        CssClass="form-control" ClientIDMode="Static" />
                                    <asp:RequiredFieldValidator ID="rfvTravelDate" runat="server"
                                        ControlToValidate="txtTravelDate" ValidationGroup="Step1"
                                        CssClass="field-validator" ErrorMessage="Travel date is required."
                                        Text="✕ Travel date required." Display="Dynamic" />
                                </div>
                                <div class="form-group">
                                    <label class="form-label" for="<%= txtReturnDate.ClientID %>">RETURN DATE</label>
                                    <asp:TextBox ID="txtReturnDate" runat="server" TextMode="Date"
                                        CssClass="form-control" ClientIDMode="Static" />
                                    <asp:RequiredFieldValidator ID="rfvReturnDate" runat="server"
                                        ControlToValidate="txtReturnDate" ValidationGroup="Step1"
                                        CssClass="field-validator" ErrorMessage="Return date is required."
                                        Text="✕ Return date required." Display="Dynamic" />
                                    <asp:CustomValidator ID="cvReturnDate" runat="server"
                                        ControlToValidate="txtReturnDate" ValidationGroup="Step1"
                                        CssClass="field-validator"
                                        ErrorMessage="Return date must be after travel date."
                                        Text="✕ Must be after travel date."
                                        Display="Dynamic"
                                        OnServerValidate="cvReturnDate_ServerValidate" />
                                    <span id="dateError" style="font-size:0.75rem;color:var(--color-error);display:block;"></span>
                                </div>
                            </div>

                            <!-- Adults -->
                            <div class="form-group">
                                <label class="form-label">NO. OF ADULTS</label>
                                <div style="display:flex;align-items:center;gap:1rem;">
                                    <div class="qty-control">
                                        <button type="button" id="btnAdultMinus" class="qty-btn" aria-label="Decrease adults">−</button>
                                        <span id="adultCount" class="qty-display">2</span>
                                        <button type="button" id="btnAdultPlus" class="qty-btn" aria-label="Increase adults">+</button>
                                    </div>
                                    <span class="text-sm text-muted">Min 1 · Max 10</span>
                                </div>
                            </div>

                            <!-- Children -->
                            <div class="form-group">
                                <label class="form-label">NO. OF CHILDREN</label>
                                <div style="display:flex;align-items:center;gap:1rem;">
                                    <div class="qty-control">
                                        <button type="button" id="btnChildMinus" class="qty-btn" aria-label="Decrease children">−</button>
                                        <span id="childCount" class="qty-display">0</span>
                                        <button type="button" id="btnChildPlus" class="qty-btn" aria-label="Increase children">+</button>
                                    </div>
                                    <span class="text-sm text-muted">Ages 2–12 · Max 8</span>
                                </div>
                            </div>

                            <!-- Room Type -->
                            <div class="form-group">
                                <label class="form-label">ROOM TYPE</label>
                                <div class="room-options" role="radiogroup" aria-label="Select room type">
                                    <label class="room-option selected" data-room="Standard">
                                        <input type="radio" name="roomType" value="Standard" checked="checked" />
                                        <div>
                                            <div style="font-weight:700;">Standard</div>
                                            <div class="text-xs text-muted">Comfortable garden/pool view room</div>
                                        </div>
                                    </label>
                                    <label class="room-option" data-room="Deluxe">
                                        <input type="radio" name="roomType" value="Deluxe" />
                                        <div>
                                            <div style="font-weight:700;">Deluxe <span style="color:var(--color-primary);font-size:0.75rem;">+₹10,000</span></div>
                                            <div class="text-xs text-muted">Spacious sea-facing deluxe room</div>
                                        </div>
                                    </label>
                                    <label class="room-option" data-room="Suite">
                                        <input type="radio" name="roomType" value="Suite" />
                                        <div>
                                            <div style="font-weight:700;">Suite <span style="color:var(--color-primary);font-size:0.75rem;">+₹25,000</span></div>
                                            <div class="text-xs text-muted">Private overwater villa with plunge pool</div>
                                        </div>
                                    </label>
                                </div>
                            </div>

                            <div class="wizard-nav-placeholder"></div>
                        </div>
                    </div>

                    <!-- STEP 2: Guest Info -->
                    <div id="step2" style="display:none;">
                        <div class="wizard-form-section">
                            <h2 class="wizard-form-title">👤 Guest Information</h2>

                            <asp:ValidationSummary ID="vsStep2" runat="server" ValidationGroup="Step2"
                                CssClass="validation-summary-errors" HeaderText="Please fix:" />

                            <div class="form-row-2">
                                <div class="form-group">
                                    <label class="form-label" for="<%= txtGuestFirst.ClientID %>">FIRST NAME</label>
                                    <asp:TextBox ID="txtGuestFirst" runat="server" CssClass="form-control" placeholder="Khushal" autocomplete="given-name" />
                                    <asp:RequiredFieldValidator ID="rfvGuestFirst" runat="server"
                                        ControlToValidate="txtGuestFirst" ValidationGroup="Step2"
                                        CssClass="field-validator" ErrorMessage="First name is required."
                                        Text="✕ Required." Display="Dynamic" />
                                </div>
                                <div class="form-group">
                                    <label class="form-label" for="<%= txtGuestLast.ClientID %>">LAST NAME</label>
                                    <asp:TextBox ID="txtGuestLast" runat="server" CssClass="form-control" placeholder="Vamja" autocomplete="family-name" />
                                    <asp:RequiredFieldValidator ID="rfvGuestLast" runat="server"
                                        ControlToValidate="txtGuestLast" ValidationGroup="Step2"
                                        CssClass="field-validator" ErrorMessage="Last name is required."
                                        Text="✕ Required." Display="Dynamic" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="form-label" for="<%= txtGuestEmail.ClientID %>">EMAIL ADDRESS</label>
                                <div class="input-icon-wrap">
                                    <span class="input-icon">✉</span>
                                    <asp:TextBox ID="txtGuestEmail" runat="server" TextMode="Email"
                                        CssClass="form-control" placeholder="your@email.com" autocomplete="email" />
                                </div>
                                <asp:RequiredFieldValidator ID="rfvGuestEmail" runat="server"
                                    ControlToValidate="txtGuestEmail" ValidationGroup="Step2"
                                    CssClass="field-validator" ErrorMessage="Email is required."
                                    Text="✕ Email required." Display="Dynamic" />
                                <asp:RegularExpressionValidator ID="revGuestEmail" runat="server"
                                    ControlToValidate="txtGuestEmail" ValidationGroup="Step2"
                                    ValidationExpression="^[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}$"
                                    CssClass="field-validator" ErrorMessage="Invalid email format."
                                    Text="✕ Invalid email." Display="Dynamic" />
                            </div>

                            <div class="form-group">
                                <label class="form-label" for="<%= txtGuestPhone.ClientID %>">PHONE NUMBER</label>
                                <div class="input-icon-wrap">
                                    <span class="input-icon">📞</span>
                                    <asp:TextBox ID="txtGuestPhone" runat="server" TextMode="Phone"
                                        CssClass="form-control" placeholder="+91 98765 43210" autocomplete="tel" />
                                </div>
                                <asp:RequiredFieldValidator ID="rfvGuestPhone" runat="server"
                                    ControlToValidate="txtGuestPhone" ValidationGroup="Step2"
                                    CssClass="field-validator" ErrorMessage="Phone number is required."
                                    Text="✕ Phone required." Display="Dynamic" />
                                <asp:RegularExpressionValidator ID="revGuestPhone" runat="server"
                                    ControlToValidate="txtGuestPhone" ValidationGroup="Step2"
                                    ValidationExpression="^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$"
                                    CssClass="field-validator" ErrorMessage="Invalid phone number."
                                    Text="✕ Invalid phone." Display="Dynamic" />
                            </div>

                            <div class="form-group">
                                <label class="form-label" for="<%= txtSpecialReq.ClientID %>">SPECIAL REQUESTS (Optional)</label>
                                <asp:TextBox ID="txtSpecialReq" runat="server" TextMode="MultiLine"
                                    CssClass="form-control" Rows="3"
                                    placeholder="Dietary requirements, accessibility needs, special occasions…" />
                            </div>

                            <div class="wizard-nav-placeholder"></div>
                        </div>
                    </div>

                    <!-- STEP 3: Payment -->
                    <div id="step3" style="display:none;">
                        <div class="wizard-form-section">
                            <h2 class="wizard-form-title">💳 Payment Details</h2>

                            <div class="payment-demo-notice">
                                <span>⚠</span>
                                <div><strong>Demo Mode:</strong> This is a non-transactional demonstration. No real payment is processed and no card details are stored.</div>
                            </div>

                            <!-- Mock Card Visual -->
                            <div class="payment-card-mockup" aria-hidden="true">
                                <div class="payment-card-chip"></div>
                                <div class="payment-card-number">•••• •••• •••• ####</div>
                                <div style="display:flex;justify-content:space-between;font-size:0.8rem;color:rgba(255,255,255,0.75);">
                                    <span>CARD HOLDER</span>
                                    <span>EXPIRES</span>
                                </div>
                                <div style="display:flex;justify-content:space-between;font-weight:700;">
                                    <span>YOUR NAME HERE</span>
                                    <span>MM/YY</span>
                                </div>
                            </div>

                            <asp:ValidationSummary ID="vsStep3" runat="server" ValidationGroup="Step3"
                                CssClass="validation-summary-errors" HeaderText="Please fix:" />

                            <div class="form-group">
                                <label class="form-label" for="<%= txtCardName.ClientID %>">CARDHOLDER NAME</label>
                                <asp:TextBox ID="txtCardName" runat="server" CssClass="form-control" placeholder="Name on card" autocomplete="cc-name" />
                                <asp:RequiredFieldValidator ID="rfvCardName" runat="server"
                                    ControlToValidate="txtCardName" ValidationGroup="Step3"
                                    CssClass="field-validator" ErrorMessage="Cardholder name is required."
                                    Text="✕ Name required." Display="Dynamic" />
                            </div>

                            <div class="form-group">
                                <label class="form-label" for="<%= txtCardNumber.ClientID %>">CARD NUMBER (Demo)</label>
                                <asp:TextBox ID="txtCardNumber" runat="server" CssClass="form-control"
                                    placeholder="#### #### #### ####" MaxLength="19" autocomplete="cc-number" />
                                <asp:RequiredFieldValidator ID="rfvCardNumber" runat="server"
                                    ControlToValidate="txtCardNumber" ValidationGroup="Step3"
                                    CssClass="field-validator" ErrorMessage="Card number is required."
                                    Text="✕ Card number required." Display="Dynamic" />
                                <asp:RegularExpressionValidator ID="revCardNumber" runat="server"
                                    ControlToValidate="txtCardNumber" ValidationGroup="Step3"
                                    ValidationExpression="[\d\s]{16,19}"
                                    CssClass="field-validator" ErrorMessage="Enter a valid 16-digit card number."
                                    Text="✕ Invalid card number." Display="Dynamic" />
                            </div>

                            <div class="form-row-2">
                                <div class="form-group">
                                    <label class="form-label" for="<%= txtExpiry.ClientID %>">EXPIRY DATE</label>
                                    <asp:TextBox ID="txtExpiry" runat="server" CssClass="form-control" placeholder="MM/YY" MaxLength="5" autocomplete="cc-exp" />
                                    <asp:RequiredFieldValidator ID="rfvExpiry" runat="server"
                                        ControlToValidate="txtExpiry" ValidationGroup="Step3"
                                        CssClass="field-validator" ErrorMessage="Expiry date is required."
                                        Text="✕ Expiry required." Display="Dynamic" />
                                    <asp:RegularExpressionValidator ID="revExpiry" runat="server"
                                        ControlToValidate="txtExpiry" ValidationGroup="Step3"
                                        ValidationExpression="^(0[1-9]|1[0-2])\/([0-9]{2})$"
                                        CssClass="field-validator" ErrorMessage="Use MM/YY format."
                                        Text="✕ Use MM/YY." Display="Dynamic" />
                                </div>
                                <div class="form-group">
                                    <label class="form-label" for="<%= txtCVV.ClientID %>">CVV (Demo)</label>
                                    <asp:TextBox ID="txtCVV" runat="server" TextMode="Password" CssClass="form-control" placeholder="•••" MaxLength="4" autocomplete="cc-csc" />
                                    <asp:RequiredFieldValidator ID="rfvCVV" runat="server"
                                        ControlToValidate="txtCVV" ValidationGroup="Step3"
                                        CssClass="field-validator" ErrorMessage="CVV is required."
                                        Text="✕ CVV required." Display="Dynamic" />
                                    <asp:RangeValidator ID="rvCVV" runat="server"
                                        ControlToValidate="txtCVV" ValidationGroup="Step3"
                                        MinimumValue="100" MaximumValue="9999" Type="Integer"
                                        CssClass="field-validator" ErrorMessage="CVV must be 3-4 digits."
                                        Text="✕ Invalid CVV." Display="Dynamic" />
                                </div>
                            </div>

                            <div class="wizard-nav-placeholder"></div>
                        </div>
                    </div>

                </div><!-- /steps -->

                <!-- GLOBAL WIZARD NAV — single set of buttons controlled by JS -->
                <div id="wizardNavGlobal" class="wizard-nav" style="margin-top:1.5rem;">
                    <button type="button" id="btnPrev" class="btn btn-secondary" style="display:none;">← Back</button>
                    <button type="button" id="btnNext" class="btn btn-primary">Next: Guest Info →</button>
                    <asp:Button ID="btnSubmit" runat="server" Text="✓ Confirm Demo Booking"
                        CssClass="btn btn-primary btn-lg"
                        ValidationGroup="Step3"
                        OnClick="btnSubmit_Click"
                        style="display:none;" />
                </div>

                <!-- ===== ORDER SUMMARY ===== -->
                <aside>
                    <div class="card" style="position:sticky;top:calc(var(--nav-height) + 1.5rem);">
                        <h3 style="font-family:var(--font-primary);font-weight:700;margin-bottom:1rem;font-size:1rem;">📋 Order Summary</h3>
                        <div style="display:flex;gap:0.75rem;align-items:flex-start;margin-bottom:1rem;padding-bottom:1rem;border-bottom:1px solid var(--color-border);">
                            <img src="<%= ResolveUrl("~/Assets/Images/image16.png") %>" alt="Tour" style="width:64px;height:48px;object-fit:cover;border-radius:0.5rem;flex-shrink:0;" />
                            <div>
                                <div style="font-weight:700;font-size:0.875rem;"><asp:Literal ID="litSummaryTitle" runat="server" Text="Maldives Luxury Escape" /></div>
                                <div style="font-size:0.75rem;color:var(--color-text-secondary);">📍 <asp:Literal ID="litSummaryDest" runat="server" Text="Maldives" /></div>
                                <div style="font-size:0.75rem;color:var(--color-text-secondary);">⏱ <asp:Literal ID="litSummaryDuration" runat="server" Text="6D / 5N" /></div>
                            </div>
                        </div>
                        <div class="order-summary">
                            <div class="order-summary-row">
                                <span>Adults</span>
                                <span id="summaryAdults">2</span>
                            </div>
                            <div class="order-summary-row">
                                <span>Children</span>
                                <span id="summaryChildren">0</span>
                            </div>
                            <div class="order-summary-row">
                                <span>Base Price</span>
                                <span id="summaryBase">₹1,70,000</span>
                            </div>
                            <div class="order-summary-row">
                                <span>GST (5%)</span>
                                <span id="summaryGST">₹8,500</span>
                            </div>
                            <div class="order-summary-row total">
                                <span>Total</span>
                                <span id="summaryTotal" style="color:var(--color-primary);">₹1,78,500</span>
                            </div>
                        </div>
                        <p style="font-size:0.7rem;color:var(--color-text-muted);margin-top:0.75rem;text-align:center;">
                            🔒 Demo booking only – no payment processed
                        </p>
                    </div>
                </aside>

            </div><!-- /booking-layout -->
        </div>
    </section>

</asp:Content>

<asp:Content ID="ScriptsContent" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script src="<%= ResolveUrl("~/Content/js/booking.js") %>"></script>
</asp:Content>
