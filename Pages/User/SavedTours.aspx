<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SavedTours.aspx.cs" Inherits="TravelPlans.Pages.User.SavedTours" MasterPageFile="~/Site.Master" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Saved Tours – Travel Plans
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-banner" style="padding:2rem 0;">
        <div class="container">
            <h1 class="page-banner-title" style="font-size:1.5rem;">Saved Tours / Wishlist</h1>
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
                        <a href="<%= ResolveUrl("~/Pages/User/MyBookings.aspx") %>" class="dash-nav-item"><span class="icon">📅</span> My Bookings</a>
                        <a href="<%= ResolveUrl("~/Pages/User/SavedTours.aspx") %>" class="dash-nav-item active" aria-current="page"><span class="icon">❤️</span> Saved Tours</a>
                        <hr class="divider" style="margin:0.5rem;" />
                        <a href="#" class="dash-nav-item"><span class="icon">👤</span> My Profile</a>
                        <a href="#" class="dash-nav-item"><span class="icon">⚙️</span> Settings</a>
                        <a href="<%= ResolveUrl("~/Pages/Authentication/SignIn.aspx") %>" class="dash-nav-item"><span class="icon">🚪</span> Sign Out</a>
                    </nav>
                </aside>

                <!-- Main -->
                <div>
                    <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:1.5rem;">
                        <h2 style="font-family:var(--font-primary);font-size:1.4rem;font-weight:700;">❤️ Saved Tours</h2>
                        <span class="text-sm text-muted">3 saved tours</span>
                    </div>

                    <div class="saved-tours-grid">

                        <!-- Saved 1: Maldives -->
                        <div class="saved-tour-card">
                            <div class="saved-tour-img">
                                <img src="<%= ResolveUrl("~/Assets/Images/image16.png") %>" alt="Maldives" loading="lazy" />
                                <button class="saved-heart active" type="button" aria-label="Remove from wishlist">❤️</button>
                            </div>
                            <div class="saved-tour-body">
                                <div class="tour-card-dest">📍 Maldives, Maldives</div>
                                <h3 class="tour-card-title">Maldives Luxury Escape</h3>
                                <div class="tour-card-meta">
                                    <span class="tour-meta-item">⏱ 6 D / 5 N</span>
                                    <span class="tour-meta-item">⭐ 4.9</span>
                                </div>
                                <div class="tour-card-footer">
                                    <div class="tour-price-block">
                                        <span class="tour-price-main">₹85,000</span>
                                        <span class="tour-price-discount">✓ 24% off</span>
                                    </div>
                                    <a href="<%= ResolveUrl("~/Pages/Booking/BookingWizard.aspx?id=1") %>" class="btn btn-primary btn-sm">Book</a>
                                </div>
                            </div>
                        </div>

                        <!-- Saved 2: Bali -->
                        <div class="saved-tour-card">
                            <div class="saved-tour-img">
                                <img src="<%= ResolveUrl("~/Assets/Images/image19.png") %>" alt="Bali" loading="lazy" />
                                <button class="saved-heart active" type="button" aria-label="Remove from wishlist">❤️</button>
                            </div>
                            <div class="saved-tour-body">
                                <div class="tour-card-dest">📍 Bali, Indonesia</div>
                                <h3 class="tour-card-title">Bali: Spirit &amp; Adventure</h3>
                                <div class="tour-card-meta">
                                    <span class="tour-meta-item">⏱ 7 D / 6 N</span>
                                    <span class="tour-meta-item">⭐ 4.7</span>
                                </div>
                                <div class="tour-card-footer">
                                    <div class="tour-price-block">
                                        <span class="tour-price-main">₹45,000</span>
                                        <span class="tour-price-discount">✓ 27% off</span>
                                    </div>
                                    <a href="<%= ResolveUrl("~/Pages/Booking/BookingWizard.aspx?id=3") %>" class="btn btn-primary btn-sm">Book</a>
                                </div>
                            </div>
                        </div>

                        <!-- Saved 3: Thailand -->
                        <div class="saved-tour-card">
                            <div class="saved-tour-img">
                                <img src="<%= ResolveUrl("~/Assets/Images/image40.png") %>" alt="Thailand" loading="lazy" />
                                <button class="saved-heart active" type="button" aria-label="Remove from wishlist">❤️</button>
                            </div>
                            <div class="saved-tour-body">
                                <div class="tour-card-dest">📍 Phuket &amp; Krabi, Thailand</div>
                                <h3 class="tour-card-title">Thailand Beach Bliss</h3>
                                <div class="tour-card-meta">
                                    <span class="tour-meta-item">⏱ 7 D / 6 N</span>
                                    <span class="tour-meta-item">⭐ 4.6</span>
                                </div>
                                <div class="tour-card-footer">
                                    <div class="tour-price-block">
                                        <span class="tour-price-main">₹52,000</span>
                                        <span class="tour-price-discount">✓ 26% off</span>
                                    </div>
                                    <a href="<%= ResolveUrl("~/Pages/Tours/TourPackages.aspx") %>" class="btn btn-primary btn-sm">Book</a>
                                </div>
                            </div>
                        </div>

                    </div><!-- /saved-tours-grid -->

                    <div class="alert alert-info mt-6">
                        <span>💡</span>
                        <span>Click the ❤️ heart icon on any saved tour to remove it from your wishlist (demo interaction only).</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
