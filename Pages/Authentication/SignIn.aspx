<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="TravelPlans.Pages.Authentication.SignIn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sign In – Travel Plans</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="<%= ResolveUrl("~/Content/css/site.css") %>" />
    <link rel="stylesheet" href="<%= ResolveUrl("~/Content/css/components.css") %>" />
    <link rel="stylesheet" href="<%= ResolveUrl("~/Content/css/responsive.css") %>" />
</head>
<body style="overflow:hidden;">
<form id="signInForm" runat="server">

    <div class="auth-layout">

        <!-- ===== LEFT PANEL ===== -->
        <div class="auth-panel-left" role="complementary">
            <div class="auth-left-content">
                <div class="auth-left-logo">
                    <div class="auth-left-logo-icon" aria-hidden="true">✈</div>
                    <span class="auth-left-logo-text">TravelPlans</span>
                </div>
                <h1 class="auth-left-title">
                    Welcome back,<br />
                    <span>explorer.</span>
                </h1>
                <p class="auth-left-desc">
                    Sign in to view your bookings, saved tours, and travel history. Your next adventure awaits.
                </p>
                <div class="auth-features">
                    <div class="auth-feature">
                        <div class="auth-feature-icon" aria-hidden="true">🗺</div>
                        <span>Browse &amp; book 12+ curated tour packages</span>
                    </div>
                    <div class="auth-feature">
                        <div class="auth-feature-icon" aria-hidden="true">❤️</div>
                        <span>Save your favourite destinations &amp; tours</span>
                    </div>
                    <div class="auth-feature">
                        <div class="auth-feature-icon" aria-hidden="true">📊</div>
                        <span>Track all your bookings from one dashboard</span>
                    </div>
                    <div class="auth-feature">
                        <div class="auth-feature-icon" aria-hidden="true">🛡</div>
                        <span>Secure &amp; seamless travel experience</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- ===== RIGHT PANEL ===== -->
        <div class="auth-panel-right">
            <div class="auth-form-box">
                <h2 class="auth-form-title">Sign In</h2>
                <p class="auth-form-sub">
                    New to Travel Plans?
                    <a href="<%= ResolveUrl("~/Pages/Authentication/Register.aspx") %>">Register free</a>
                </p>

                <!-- Login mode tabs -->
                <div class="auth-tabs" role="tablist" aria-label="Login mode">
                    <button type="button" class="auth-tab-btn active" data-auth-tab="user" role="tab" aria-selected="true" aria-controls="panelUser">
                        👤 User Login
                    </button>
                    <button type="button" class="auth-tab-btn" data-auth-tab="admin" role="tab" aria-selected="false" aria-controls="panelAdmin">
                        🔐 Admin Login
                    </button>
                </div>

                <!-- Hidden login type -->
                <asp:HiddenField ID="hdnLoginType" runat="server" Value="user" />

                <!-- Demo notice -->
                <div class="alert alert-info mb-4" style="background:rgba(26,86,219,0.08);border:1px solid rgba(26,86,219,0.25);border-radius:var(--radius-lg);padding:0.75rem 1rem;">
                    <div style="font-size:0.85rem;line-height:1.5;">
                        <strong style="color:var(--color-primary);display:block;margin-bottom:0.25rem;">Saved Default Credentials:</strong>
                        <div>👤 <strong>User:</strong> <code>vamja801@gmail.com</code> &bull; Password: <code>vamja@801</code></div>
                        <div>🔐 <strong>Admin:</strong> <code>khushal801@gmail.com</code> &bull; Password: <code>khushal@801</code></div>
                    </div>
                </div>

                <!-- Validation Summary -->
                <asp:ValidationSummary ID="vsSignIn" runat="server" ValidationGroup="SignIn"
                    CssClass="validation-summary-errors" HeaderText="Please fix the following errors:" />

                <!-- USER LOGIN PANEL -->
                <div id="panelUser" data-auth-panel="user" role="tabpanel" aria-labelledby="tabUser">

                    <!-- Email -->
                    <div class="form-group">
                        <label class="form-label" for="<%= txtUserEmail.ClientID %>">EMAIL ADDRESS</label>
                        <div class="input-icon-wrap">
                            <span class="input-icon" aria-hidden="true">✉</span>
                            <asp:TextBox ID="txtUserEmail" runat="server" TextMode="Email"
                                CssClass="form-control" placeholder="your@email.com"
                                Text="vamja801@gmail.com"
                                autocomplete="email" />
                        </div>
                        <asp:RequiredFieldValidator ID="rfvUserEmail" runat="server"
                            ControlToValidate="txtUserEmail" ValidationGroup="SignIn"
                            CssClass="field-validator" ErrorMessage="Email address is required."
                            Text="✕ Email is required." Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revUserEmail" runat="server"
                            ControlToValidate="txtUserEmail" ValidationGroup="SignIn"
                            ValidationExpression="^[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}$"
                            CssClass="field-validator" ErrorMessage="Please enter a valid email address."
                            Text="✕ Invalid email format." Display="Dynamic" />
                    </div>

                    <!-- Password -->
                    <div class="form-group">
                        <label class="form-label" for="<%= txtUserPassword.ClientID %>">PASSWORD</label>
                        <div class="input-icon-wrap">
                            <span class="input-icon" aria-hidden="true">🔒</span>
                            <asp:TextBox ID="txtUserPassword" runat="server" TextMode="Password"
                                CssClass="form-control" placeholder="••••••••••"
                                value="vamja@801"
                                autocomplete="current-password" />
                            <button type="button" class="input-toggle" data-toggle-pass="<%= txtUserPassword.ClientID %>" aria-label="Show/hide password">👁</button>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvUserPassword" runat="server"
                            ControlToValidate="txtUserPassword" ValidationGroup="SignIn"
                            CssClass="field-validator" ErrorMessage="Password is required."
                            Text="✕ Password is required." Display="Dynamic" />
                    </div>

                    <asp:Button ID="btnUserSignIn" runat="server" Text="Sign In →"
                        CssClass="btn btn-primary btn-lg btn-block"
                        ValidationGroup="SignIn" OnClick="btnUserSignIn_Click" />

                </div>

                <!-- ADMIN LOGIN PANEL -->
                <div id="panelAdmin" data-auth-panel="admin" role="tabpanel" aria-labelledby="tabAdmin" style="display:none;">

                    <!-- Admin Email -->
                    <div class="form-group">
                        <label class="form-label" for="<%= txtAdminEmail.ClientID %>">ADMIN EMAIL</label>
                        <div class="input-icon-wrap">
                            <span class="input-icon" aria-hidden="true">✉</span>
                            <asp:TextBox ID="txtAdminEmail" runat="server" TextMode="Email"
                                CssClass="form-control" placeholder="admin@travelplans.in"
                                Text="khushal801@gmail.com"
                                autocomplete="email" />
                        </div>
                        <asp:RequiredFieldValidator ID="rfvAdminEmail" runat="server"
                            ControlToValidate="txtAdminEmail" ValidationGroup="AdminSignIn"
                            CssClass="field-validator" ErrorMessage="Admin email is required."
                            Text="✕ Admin email is required." Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revAdminEmail" runat="server"
                            ControlToValidate="txtAdminEmail" ValidationGroup="AdminSignIn"
                            ValidationExpression="^[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}$"
                            CssClass="field-validator" ErrorMessage="Please enter a valid email address."
                            Text="✕ Invalid email format." Display="Dynamic" />
                    </div>

                    <!-- Admin Password -->
                    <div class="form-group">
                        <label class="form-label" for="<%= txtAdminPassword.ClientID %>">ADMIN PASSWORD</label>
                        <div class="input-icon-wrap">
                            <span class="input-icon" aria-hidden="true">🔒</span>
                            <asp:TextBox ID="txtAdminPassword" runat="server" TextMode="Password"
                                CssClass="form-control" placeholder="••••••••••"
                                value="khushal@801"
                                autocomplete="current-password" />
                            <button type="button" class="input-toggle" data-toggle-pass="<%= txtAdminPassword.ClientID %>" aria-label="Show/hide password">👁</button>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvAdminPassword" runat="server"
                            ControlToValidate="txtAdminPassword" ValidationGroup="AdminSignIn"
                            CssClass="field-validator" ErrorMessage="Admin password is required."
                            Text="✕ Admin password is required." Display="Dynamic" />
                    </div>

                    <asp:ValidationSummary ID="vsAdminSignIn" runat="server" ValidationGroup="AdminSignIn"
                        CssClass="validation-summary-errors" HeaderText="Please fix the following errors:" />

                    <asp:Button ID="btnAdminSignIn" runat="server" Text="Admin Sign In →"
                        CssClass="btn btn-primary btn-lg btn-block"
                        ValidationGroup="AdminSignIn" OnClick="btnAdminSignIn_Click" />

                </div>

                <p class="auth-footer-text">
                    Don't have an account?
                    <a href="<%= ResolveUrl("~/Pages/Authentication/Register.aspx") %>">Create one free</a>
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
