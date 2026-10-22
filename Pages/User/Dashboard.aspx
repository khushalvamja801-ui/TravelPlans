<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="TravelPlans.Pages.User.Dashboard" MasterPageFile="~/Site.Master" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    My Dashboard – Travel Plans
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-banner" style="padding:2rem 0;">
        <div class="container">
            <h1 class="page-banner-title" style="font-size:1.5rem;">My Travel Dashboard</h1>
        </div>
    </div>

    <section class="section section-alt">
        <div class="container">
            <div class="dashboard-layout">

                <!-- ===== SIDEBAR ===== -->
                <aside class="dash-sidebar" aria-label="User Navigation">
                    <div class="dash-user">
                        <div class="dash-avatar" aria-hidden="true">👤</div>
                        <div class="dash-username">Khushal Vamja</div>
                        <div class="dash-email">khushalpatel801@gmail.com</div>
                    </div>
                    <nav class="dash-nav">
                        <a href="<%= ResolveUrl("~/Pages/User/Dashboard.aspx") %>" class="dash-nav-item active" aria-current="page">
                            <span class="icon">📊</span> Dashboard
                        </a>
                        <a href="<%= ResolveUrl("~/Pages/User/MyBookings.aspx") %>" class="dash-nav-item">
                            <span class="icon">📅</span> My Bookings
                        </a>
                        <a href="<%= ResolveUrl("~/Pages/User/SavedTours.aspx") %>" class="dash-nav-item">
                            <span class="icon">❤️</span> Saved Tours
                        </a>
                        <hr class="divider" style="margin:0.5rem 0.5rem;" />
                        <a href="#" class="dash-nav-item">
                            <span class="icon">👤</span> My Profile
                        </a>
                        <a href="#" class="dash-nav-item">
                            <span class="icon">⚙️</span> Settings
                        </a>
                        <a href="<%= ResolveUrl("~/Pages/Authentication/SignIn.aspx") %>" class="dash-nav-item">
                            <span class="icon">🚪</span> Sign Out
                        </a>
                    </nav>
                </aside>

                <!-- ===== MAIN CONTENT ===== -->
                <div>
                    <!-- Welcome Banner -->
                    <div class="welcome-banner">
                        <div style="position:relative;z-index:1;">
                            <div class="welcome-banner-title">Welcome back, Khushal! 👋</div>
                            <div class="welcome-banner-sub">Here is an overview of your travel activity</div>
                        </div>
                    </div>

                    <!-- Stats -->
                    <div class="dashboard-stats" style="margin-bottom:1.5rem;">
                        <div class="stat-card">
                            <div class="stat-icon stat-icon-blue" aria-hidden="true">✈</div>
                            <div class="stat-info">
                                <div class="stat-label">Total Trips</div>
                                <div class="stat-value">8</div>
                            </div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-icon stat-icon-green" aria-hidden="true">💰</div>
                            <div class="stat-info">
                                <div class="stat-label">Total Spent</div>
                                <div class="stat-value">₹3.4L</div>
                            </div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-icon stat-icon-amber" aria-hidden="true">❤️</div>
                            <div class="stat-info">
                                <div class="stat-label">Saved Tours</div>
                                <div class="stat-value">3</div>
                            </div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-icon stat-icon-purple" aria-hidden="true">📅</div>
                            <div class="stat-info">
                                <div class="stat-label">Upcoming</div>
                                <div class="stat-value">2</div>
                            </div>
                        </div>
                    </div>

                    <!-- Upcoming Trips -->
                    <div class="card mb-6">
                        <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:1rem;">
                            <h2 style="font-family:var(--font-primary);font-size:1.1rem;font-weight:700;">✈ Upcoming Trips</h2>
                            <a href="<%= ResolveUrl("~/Pages/User/MyBookings.aspx") %>" class="btn btn-secondary btn-sm">View All</a>
                        </div>

                        <div class="trip-card">
                            <img src="<%= ResolveUrl("~/Assets/Images/image16.png") %>" class="trip-card-img" alt="Maldives" />
                            <div class="trip-card-info">
                                <div class="trip-card-title">Maldives Luxury Escape</div>
                                <div class="trip-card-meta">
                                    <span>📅 2025-11-05</span>
                                    <span>👥 2 Travellers</span>
                                    <span>💰 ₹1,78,500</span>
                                </div>
                            </div>
                            <span class="status-badge status-confirmed">✓ Confirmed</span>
                        </div>

                        <div class="trip-card">
                            <img src="<%= ResolveUrl("~/Assets/Images/image19.png") %>" class="trip-card-img" alt="Bali" />
                            <div class="trip-card-info">
                                <div class="trip-card-title">Bali: Spirit &amp; Adventure</div>
                                <div class="trip-card-meta">
                                    <span>📅 2025-10-15</span>
                                    <span>👥 4 Travellers</span>
                                    <span>💰 ₹1,89,000</span>
                                </div>
                            </div>
                            <span class="status-badge status-confirmed">✓ Confirmed</span>
                        </div>
                    </div>

                    <!-- Saved Tours -->
                    <div class="card">
                        <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:1rem;">
                            <h2 style="font-family:var(--font-primary);font-size:1.1rem;font-weight:700;">❤️ Saved Tours</h2>
                            <a href="<%= ResolveUrl("~/Pages/User/SavedTours.aspx") %>" class="btn btn-secondary btn-sm">View All</a>
                        </div>
                        <div style="display:grid;grid-template-columns:repeat(3,1fr);gap:1rem;">
                            <div style="border-radius:0.75rem;overflow:hidden;border:1px solid var(--color-border-light);">
                                <img src="<%= ResolveUrl("~/Assets/Images/image16.png") %>" alt="Maldives" style="width:100%;height:100px;object-fit:cover;" />
                                <div style="padding:0.75rem;">
                                    <div style="font-weight:700;font-size:0.85rem;">Maldives Luxury Escape</div>
                                    <div style="font-size:0.75rem;color:var(--color-primary);font-weight:600;">₹85,000</div>
                                </div>
                            </div>
                            <div style="border-radius:0.75rem;overflow:hidden;border:1px solid var(--color-border-light);">
                                <img src="<%= ResolveUrl("~/Assets/Images/image19.png") %>" alt="Bali" style="width:100%;height:100px;object-fit:cover;" />
                                <div style="padding:0.75rem;">
                                    <div style="font-weight:700;font-size:0.85rem;">Bali: Spirit &amp; Adventure</div>
                                    <div style="font-size:0.75rem;color:var(--color-primary);font-weight:600;">₹45,000</div>
                                </div>
                            </div>
                            <div style="border-radius:0.75rem;overflow:hidden;border:1px solid var(--color-border-light);">
                                <img src="<%= ResolveUrl("~/Assets/Images/image40.png") %>" alt="Thailand" style="width:100%;height:100px;object-fit:cover;" />
                                <div style="padding:0.75rem;">
                                    <div style="font-weight:700;font-size:0.85rem;">Thailand Beach Bliss</div>
                                    <div style="font-size:0.75rem;color:var(--color-primary);font-weight:600;">₹52,000</div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div><!-- /main -->
            </div><!-- /dashboard-layout -->
        </div>
    </section>

</asp:Content>
