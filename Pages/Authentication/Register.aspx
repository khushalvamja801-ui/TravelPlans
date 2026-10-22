<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TravelPlans.Pages.Authentication.Register" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Register – Travel Plans</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="<%= ResolveUrl("~/Content/css/site.css") %>" />
    <link rel="stylesheet" href="<%= ResolveUrl("~/Content/css/components.css") %>" />
    <link rel="stylesheet" href="<%= ResolveUrl("~/Content/css/responsive.css") %>" />
</head>
<body>
<form id="registerForm" runat="server">
    <div class="auth-layout">
        <!-- LEFT PANEL -->
        <div class="auth-panel-left" role="complementary">
            <div class="auth-left-content">
                <div class="auth-left-logo">
                    <div class="auth-left-logo-icon" aria-hidden="true">✈</div>
                    <span class="auth-left-logo-text">TravelPlans</span>
                </div>
                <h1 class="auth-left-title">
                    Join the world of<br />
                    <span>travel &amp; adventure.</span>
                </h1>
                <p class="auth-left-desc">
                    Create your free account and unlock access to 12+ curated tour packages across 8 stunning destinations.
                </p>
                <div class="auth-features">
                    <div class="auth-feature">
                        <div class="auth-feature-icon" aria-hidden="true">🎁</div>
                        <span>Free registration – no credit card required</span>
                    </div>
                    <div class="auth-feature">
                        <div class="auth-feature-icon" aria-hidden="true">📅</div>
                        <span>Manage all your bookings in one place</span>
                    </div>
                    <div class="auth-feature">
                        <div class="auth-feature-icon" aria-hidden="true">💰</div>
                        <span>Exclusive member-only deals &amp; discounts</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- RIGHT PANEL -->
        <div class="auth-panel-right" style="overflow-y:auto;max-height:100vh;">
            <div class="auth-form-box">
                <h2 class="auth-form-title">Create Account</h2>
                <p class="auth-form-sub">
                    Already have an account?
                    <a href="<%= ResolveUrl("~/Pages/Authentication/SignIn.aspx") %>">Sign in</a>
                </p>

                <div class="alert alert-info mb-4">
                    <span>ℹ</span>
                    <div><strong>Demo mode:</strong> Registration is for demonstration only. No data is saved.</div>
                </div>

                <asp:ValidationSummary ID="vsRegister" runat="server" ValidationGroup="Register"
                    CssClass="validation-summary-errors" HeaderText="Please fix the following:" />

                <!-- Name row -->
                <div class="register-grid">
                    <div class="form-group">
                        <label class="form-label" for="<%= txtFirstName.ClientID %>">FIRST NAME</label>
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="Khushal" autocomplete="given-name" />
                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server"
                            ControlToValidate="txtFirstName" ValidationGroup="Register"
                            CssClass="field-validator" ErrorMessage="First name is required."
                            Text="✕ Required." Display="Dynamic" />
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="<%= txtLastName.ClientID %>">LAST NAME</label>
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Vamja" autocomplete="family-name" />
                        <asp:RequiredFieldValidator ID="rfvLastName" runat="server"
                            ControlToValidate="txtLastName" ValidationGroup="Register"
                            CssClass="field-validator" ErrorMessage="Last name is required."
                            Text="✕ Required." Display="Dynamic" />
                    </div>
                </div>

                <!-- Email -->
                <div class="form-group">
                    <label class="form-label" for="<%= txtRegEmail.ClientID %>">EMAIL ADDRESS</label>
                    <div class="input-icon-wrap">
                        <span class="input-icon" aria-hidden="true">✉</span>
                        <asp:TextBox ID="txtRegEmail" runat="server" TextMode="Email"
                            CssClass="form-control" placeholder="your@email.com" autocomplete="email" />
                    </div>
                    <asp:RequiredFieldValidator ID="rfvRegEmail" runat="server"
                        ControlToValidate="txtRegEmail" ValidationGroup="Register"
                        CssClass="field-validator" ErrorMessage="Email address is required."
                        Text="✕ Email is required." Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revRegEmail" runat="server"
                        ControlToValidate="txtRegEmail" ValidationGroup="Register"
                        ValidationExpression="^[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}$"
                        CssClass="field-validator" ErrorMessage="Please enter a valid email."
                        Text="✕ Invalid email." Display="Dynamic" />
                </div>

                <!-- Phone -->
                <div class="form-group">
                    <label class="form-label" for="<%= txtPhone.ClientID %>">PHONE NUMBER</label>
                    <div class="input-icon-wrap">
                        <span class="input-icon" aria-hidden="true">📞</span>
                        <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone"
                            CssClass="form-control" placeholder="+91 98765 43210" autocomplete="tel" />
                    </div>
                    <asp:RequiredFieldValidator ID="rfvPhone" runat="server"
                        ControlToValidate="txtPhone" ValidationGroup="Register"
                        CssClass="field-validator" ErrorMessage="Phone number is required."
                        Text="✕ Phone is required." Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revPhone" runat="server"
                        ControlToValidate="txtPhone" ValidationGroup="Register"
                        ValidationExpression="^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$"
                        CssClass="field-validator" ErrorMessage="Please enter a valid phone number."
                        Text="✕ Invalid phone." Display="Dynamic" />
                </div>

                <!-- Password -->
                <div class="form-group">
                    <label class="form-label" for="<%= txtRegPassword.ClientID %>">PASSWORD</label>
                    <div class="input-icon-wrap">
                        <span class="input-icon" aria-hidden="true">🔒</span>
                        <asp:TextBox ID="txtRegPassword" runat="server" TextMode="Password"
                            CssClass="form-control" placeholder="Min 8 characters" autocomplete="new-password" />
                        <button type="button" class="input-toggle" data-toggle-pass="<%= txtRegPassword.ClientID %>" aria-label="Toggle password">👁</button>
                    </div>
                    <asp:RequiredFieldValidator ID="rfvRegPassword" runat="server"
                        ControlToValidate="txtRegPassword" ValidationGroup="Register"
                        CssClass="field-validator" ErrorMessage="Password is required."
                        Text="✕ Password required." Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revRegPassword" runat="server"
                        ControlToValidate="txtRegPassword" ValidationGroup="Register"
                        ValidationExpression=".{8,}"
                        CssClass="field-validator" ErrorMessage="Password must be at least 8 characters."
                        Text="✕ Min 8 characters." Display="Dynamic" />
                </div>

                <!-- Confirm Password -->
                <div class="form-group">
                    <label class="form-label" for="<%= txtConfirmPassword.ClientID %>">CONFIRM PASSWORD</label>
                    <div class="input-icon-wrap">
                        <span class="input-icon" aria-hidden="true">🔒</span>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"
                            CssClass="form-control" placeholder="Repeat password" autocomplete="new-password" />
                    </div>
                    <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server"
                        ControlToValidate="txtConfirmPassword" ValidationGroup="Register"
                        CssClass="field-validator" ErrorMessage="Please confirm your password."
                        Text="✕ Confirmation required." Display="Dynamic" />
                    <asp:CompareValidator ID="cvPassword" runat="server"
                        ControlToValidate="txtConfirmPassword"
                        ControlToCompare="txtRegPassword"
                        Type="String" Operator="Equal"
                        ValidationGroup="Register"
                        CssClass="field-validator"
                        ErrorMessage="Passwords do not match."
                        Text="✕ Passwords must match." Display="Dynamic" />
                </div>

                <!-- Country -->
                <div class="form-group">
                    <label class="form-label" for="<%= ddlCountry.ClientID %>">COUNTRY</label>
                    <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">Select your country…</asp:ListItem>
                        <asp:ListItem Value="IN">India</asp:ListItem>
                        <asp:ListItem Value="US">United States</asp:ListItem>
                        <asp:ListItem Value="UK">United Kingdom</asp:ListItem>
                        <asp:ListItem Value="AU">Australia</asp:ListItem>
                        <asp:ListItem Value="CA">Canada</asp:ListItem>
                        <asp:ListItem Value="DE">Germany</asp:ListItem>
                        <asp:ListItem Value="SG">Singapore</asp:ListItem>
                        <asp:ListItem Value="FR">France</asp:ListItem>
                        <asp:ListItem Value="JP">Japan</asp:ListItem>
                        <asp:ListItem Value="AE">UAE</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvCountry" runat="server"
                        ControlToValidate="ddlCountry" InitialValue=""
                        ValidationGroup="Register"
                        CssClass="field-validator" ErrorMessage="Please select your country."
                        Text="✕ Country required." Display="Dynamic" />
                </div>

                <asp:Button ID="btnRegister" runat="server" Text="Create My Account →"
                    CssClass="btn btn-primary btn-lg btn-block"
                    ValidationGroup="Register" OnClick="btnRegister_Click" />

                <p class="auth-footer-text" style="margin-top:1rem;">
                    By registering, you agree to our <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a>.
                </p>
                <p style="text-align:center;margin-top:0.75rem;">
                    <a href="<%= ResolveUrl("~/") %>" style="font-size:0.8rem;color:var(--color-text-muted);">← Back to Home</a>
                </p>
            </div>
        </div>
    </div>
</form>
<script src="<%= ResolveUrl("~/Content/js/site.js") %>"></script>
</body>
</html>
