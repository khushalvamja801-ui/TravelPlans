<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyBookings.aspx.cs" Inherits="TravelPlans.Pages.User.MyBookings" MasterPageFile="~/Site.Master" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    My Bookings – Travel Plans
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-banner" style="padding:2rem 0;">
        <div class="container">
            <h1 class="page-banner-title" style="font-size:1.5rem;">My Bookings</h1>
        </div>
    </div>

    <section class="section section-alt">
        <div class="container">
            <div class="dashboard-layout">

                <!-- Sidebar -->
                <aside class="dash-sidebar">
                    <div class="dash-user">
                        <div class="dash-avatar">👤</div>
                        <div class="dash-username">Khushal Vamja</div>
                        <div class="dash-email">khushalpatel801@gmail.com</div>
                    </div>
                    <nav class="dash-nav">
                        <a href="<%= ResolveUrl("~/Pages/User/Dashboard.aspx") %>" class="dash-nav-item"><span class="icon">📊</span> Dashboard</a>
                        <a href="<%= ResolveUrl("~/Pages/User/MyBookings.aspx") %>" class="dash-nav-item active" aria-current="page"><span class="icon">📅</span> My Bookings</a>
                        <a href="<%= ResolveUrl("~/Pages/User/SavedTours.aspx") %>" class="dash-nav-item"><span class="icon">❤️</span> Saved Tours</a>
                        <hr class="divider" style="margin:0.5rem;" />
                        <a href="#" class="dash-nav-item"><span class="icon">👤</span> My Profile</a>
                        <a href="#" class="dash-nav-item"><span class="icon">⚙️</span> Settings</a>
                        <a href="<%= ResolveUrl("~/Pages/Authentication/SignIn.aspx") %>" class="dash-nav-item"><span class="icon">🚪</span> Sign Out</a>
                    </nav>
                </aside>

                <!-- Main -->
                <div>
                    <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:1.5rem;">
                        <h2 style="font-family:var(--font-primary);font-size:1.4rem;font-weight:700;">All Bookings</h2>
                        <span class="text-sm text-muted">4 total bookings</span>
                    </div>

                    <!-- BK001 -->
                    <div class="booking-list-item" id="bk001">
                        <div class="booking-item-header">
                            <span class="booking-id"># BK001</span>
                            <span class="status-badge status-confirmed">✓ Confirmed</span>
                        </div>
                        <div class="booking-item-body">
                            <img src="<%= ResolveUrl("~/Assets/Images/image16.png") %>" class="booking-tour-img" alt="Maldives" />
                            <div class="booking-tour-info">
                                <div class="booking-tour-name">Maldives Luxury Escape</div>
                                <div class="booking-tour-meta">
                                    <span>📅 2025-11-05</span>
                                    <span>👥 2 travellers</span>
                                    <span>📍 Maldives</span>
                                </div>
                            </div>
                            <div class="booking-actions">
                                <div class="booking-amount">₹1,78,500</div>
                                <a href="<%= ResolveUrl("~/Pages/Tours/TourDetail.aspx?id=1") %>" class="btn btn-secondary btn-sm">View Tour</a>
                                <button type="button" class="btn btn-danger btn-sm btn-cancel-booking" data-booking-id="BK001">Cancel</button>
                            </div>
                        </div>
                    </div>

                    <!-- BK002 -->
                    <div class="booking-list-item" id="bk002">
                        <div class="booking-item-header">
                            <span class="booking-id"># BK002</span>
                            <span class="status-badge status-confirmed">✓ Confirmed</span>
                        </div>
                        <div class="booking-item-body">
                            <img src="<%= ResolveUrl("~/Assets/Images/image19.png") %>" class="booking-tour-img" alt="Bali" />
                            <div class="booking-tour-info">
                                <div class="booking-tour-name">Bali: Spirit &amp; Adventure</div>
                                <div class="booking-tour-meta">
                                    <span>📅 2025-10-15</span>
                                    <span>👥 4 travellers</span>
                                    <span>📍 Bali</span>
                                </div>
                            </div>
                            <div class="booking-actions">
                                <div class="booking-amount">₹1,89,000</div>
                                <a href="<%= ResolveUrl("~/Pages/Tours/TourDetail.aspx?id=3") %>" class="btn btn-secondary btn-sm">View Tour</a>
                                <button type="button" class="btn btn-danger btn-sm btn-cancel-booking" data-booking-id="BK002">Cancel</button>
                            </div>
                        </div>
                    </div>

                    <!-- BK003 -->
                    <div class="booking-list-item" id="bk003">
                        <div class="booking-item-header">
                            <span class="booking-id"># BK003</span>
                            <span class="status-badge status-completed">✓ Completed</span>
                        </div>
                        <div class="booking-item-body">
                            <img src="<%= ResolveUrl("~/Assets/Images/image18.png") %>" class="booking-tour-img" alt="Paris" />
                            <div class="booking-tour-info">
                                <div class="booking-tour-name">Paris: Romance &amp; Art</div>
                                <div class="booking-tour-meta">
                                    <span>📅 2025-09-20</span>
                                    <span>👥 2 travellers</span>
                                    <span>📍 Paris</span>
                                </div>
                            </div>
                            <div class="booking-actions">
                                <div class="booking-amount">₹2,52,000</div>
                                <a href="<%= ResolveUrl("~/Pages/Tours/TourDetail.aspx?id=2") %>" class="btn btn-secondary btn-sm">View Tour</a>
                            </div>
                        </div>
                    </div>

                    <!-- BK004 -->
                    <div class="booking-list-item" id="bk004">
                        <div class="booking-item-header">
                            <span class="booking-id"># BK004</span>
                            <span class="status-badge status-pending">⏳ Pending</span>
                        </div>
                        <div class="booking-item-body">
                            <img src="<%= ResolveUrl("~/Assets/Images/image24.png") %>" class="booking-tour-img" alt="Dubai" />
                            <div class="booking-tour-info">
                                <div class="booking-tour-name">Dubai: Gold &amp; Dunes</div>
                                <div class="booking-tour-meta">
                                    <span>📅 2025-12-10</span>
                                    <span>👥 3 travellers</span>
                                    <span>📍 Dubai</span>
                                </div>
                            </div>
                            <div class="booking-actions">
                                <div class="booking-amount">₹2,14,200</div>
                                <a href="<%= ResolveUrl("~/Pages/Tours/TourDetail.aspx?id=6") %>" class="btn btn-secondary btn-sm">View Tour</a>
                                <button type="button" class="btn btn-danger btn-sm btn-cancel-booking" data-booking-id="BK004">Cancel</button>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>

</asp:Content>
