<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TourDetail.aspx.cs" Inherits="TravelPlans.Pages.Tours.TourDetail" MasterPageFile="~/Site.Master" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    <asp:Literal ID="litPageTitle" runat="server" Text="Tour Detail" /> – Travel Plans
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:HiddenField ID="hdnTourId" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdnBasePrice" runat="server" Value="85000" ClientIDMode="Static" />

    <div class="page-banner" style="padding:3rem 0;">
        <div class="container">
            <nav aria-label="Breadcrumb" style="font-size:0.8rem;color:rgba(255,255,255,0.6);margin-bottom:0.5rem;">
                <a href="<%= ResolveUrl("~/") %>" style="color:inherit;">Home</a> /
                <a href="<%= ResolveUrl("~/Pages/Tours/TourPackages.aspx") %>" style="color:inherit;">Packages</a> /
                <span style="color:white;"><asp:Literal ID="litBreadcrumb" runat="server" Text="Tour Detail" /></span>
            </nav>
        </div>
    </div>

    <section class="section section-alt">
        <div class="container">
            <div class="tour-detail-layout">

                <!-- ===== MAIN CONTENT ===== -->
                <div>
                    <!-- Gallery -->
                    <div class="tour-gallery">
                        <asp:Image ID="imgTourMain" runat="server" AlternateText="Tour Image" CssClass="" Style="width:100%;height:100%;object-fit:cover;" />
                    </div>

                    <!-- Header -->
                    <div class="tour-detail-header">
                        <div class="tour-detail-category">
                            <asp:Literal ID="litCategory" runat="server" Text="🏖 Beach" />
                        </div>
                        <h1 class="tour-detail-title">
                            <asp:Literal ID="litTourTitle" runat="server" Text="Maldives Luxury Escape" />
                        </h1>
                        <div class="tour-detail-meta">
                            <div class="tour-detail-meta-item">
                                <span class="icon">📍</span>
                                <asp:Literal ID="litDestination" runat="server" Text="Maldives" />
                            </div>
                            <div class="tour-detail-meta-item">
                                <span class="icon">⏱</span>
                                <asp:Literal ID="litDuration" runat="server" Text="6 D / 5 N" />
                            </div>
                            <div class="tour-detail-meta-item">
                                <span class="icon">⭐</span>
                                <asp:Literal ID="litRating" runat="server" Text="4.9 (248 reviews)" />
                            </div>
                        </div>
                    </div>

                    <!-- Tabs -->
                    <div data-tab-group="tourTabs">
                        <div class="tabs" role="tablist">
                            <button class="tab-btn active" data-tab="tabOverview" role="tab" aria-selected="true" aria-controls="tabOverview" type="button">Overview</button>
                            <button class="tab-btn" data-tab="tabItinerary" role="tab" aria-selected="false" aria-controls="tabItinerary" type="button">Itinerary</button>
                            <button class="tab-btn" data-tab="tabIncludes" role="tab" aria-selected="false" aria-controls="tabIncludes" type="button">Includes</button>
                            <button class="tab-btn" data-tab="tabReviews" role="tab" aria-selected="false" aria-controls="tabReviews" type="button">Reviews</button>
                        </div>

                        <!-- Overview -->
                        <div id="tabOverview" class="tab-panel active" role="tabpanel">
                            <div class="card">
                                <div class="tab-content-body">
                                    <asp:Literal ID="litOverview" runat="server" />
                                </div>
                            </div>
                        </div>

                        <!-- Itinerary -->
                        <div id="tabItinerary" class="tab-panel" role="tabpanel">
                            <div class="card">
                                <asp:Repeater ID="rptItinerary" runat="server">
                                    <ItemTemplate>
                                        <div class="itinerary-day">
                                            <div class="itinerary-day-num"><%# Eval("Day") %></div>
                                            <div class="itinerary-day-content">
                                                <div class="itinerary-day-title"><%# Eval("Title") %></div>
                                                <div class="itinerary-day-desc"><%# Eval("Description") %></div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>

                        <!-- Includes -->
                        <div id="tabIncludes" class="tab-panel" role="tabpanel">
                            <div class="card">
                                <h3 style="font-family:var(--font-primary);font-size:1rem;font-weight:700;margin-bottom:1rem;">What's Included</h3>
                                <div class="includes-grid">
                                    <div class="include-item"><div class="include-icon">✓</div> Return Airfare</div>
                                    <div class="include-item"><div class="include-icon">✓</div> Overwater Villa / Hotel</div>
                                    <div class="include-item"><div class="include-icon">✓</div> Daily Breakfast</div>
                                    <div class="include-item"><div class="include-icon">✓</div> Airport Transfers</div>
                                    <div class="include-item"><div class="include-icon">✓</div> Expert Local Guide</div>
                                    <div class="include-item"><div class="include-icon">✓</div> Snorkelling Equipment</div>
                                    <div class="include-item"><div class="include-icon">✓</div> Welcome Dinner</div>
                                    <div class="include-item"><div class="include-icon">✓</div> Travel Insurance</div>
                                </div>
                                <hr class="divider" />
                                <h3 style="font-family:var(--font-primary);font-size:1rem;font-weight:700;margin-bottom:1rem;">Not Included</h3>
                                <div class="includes-grid">
                                    <div class="include-item" style="opacity:0.6;"><div class="include-icon" style="background:var(--color-error-light);color:var(--color-error);">✕</div> Personal Expenses</div>
                                    <div class="include-item" style="opacity:0.6;"><div class="include-icon" style="background:var(--color-error-light);color:var(--color-error);">✕</div> Visa Fees</div>
                                    <div class="include-item" style="opacity:0.6;"><div class="include-icon" style="background:var(--color-error-light);color:var(--color-error);">✕</div> Lunch &amp; Dinner</div>
                                    <div class="include-item" style="opacity:0.6;"><div class="include-icon" style="background:var(--color-error-light);color:var(--color-error);">✕</div> Optional Activities</div>
                                </div>
                            </div>
                        </div>

                        <!-- Reviews -->
                        <div id="tabReviews" class="tab-panel" role="tabpanel">
                            <div class="card">
                                <div class="review-card">
                                    <div class="review-header">
                                        <div class="review-avatar">SM</div>
                                        <div>
                                            <div class="review-name">Sarah Mitchell</div>
                                            <div class="stars">★★★★★</div>
                                            <div class="review-date">October 2025</div>
                                        </div>
                                    </div>
                                    <p class="review-text">Absolutely breathtaking! The overwater bungalow was even more stunning than the photos. The local guide was incredibly knowledgeable and made every moment memorable.</p>
                                </div>
                                <div class="review-card">
                                    <div class="review-header">
                                        <div class="review-avatar">JW</div>
                                        <div>
                                            <div class="review-name">James Wilson</div>
                                            <div class="stars">★★★★★</div>
                                            <div class="review-date">September 2025</div>
                                        </div>
                                    </div>
                                    <p class="review-text">Flawless experience from start to finish. The coral reefs were unlike anything I've ever seen. Highly recommend for a once-in-a-lifetime honeymoon trip!</p>
                                </div>
                                <div class="review-card">
                                    <div class="review-header">
                                        <div class="review-avatar">EC</div>
                                        <div>
                                            <div class="review-name">Emma Clarke</div>
                                            <div class="stars">★★★★☆</div>
                                            <div class="review-date">August 2025</div>
                                        </div>
                                    </div>
                                    <p class="review-text">Amazing destination with impeccable service. The welcome dinner on the beach under the stars was the highlight of the trip. Would book again!</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- ===== BOOKING WIDGET ===== -->
                <aside>
                    <div class="booking-widget">
                        <div class="booking-widget-title">Book This Tour</div>

                        <!-- Price display -->
                        <div class="widget-price">
                            <div class="widget-price-amount">
                                ₹<asp:Literal ID="litWidgetPrice" runat="server" Text="85,000" />
                            </div>
                            <div class="widget-price-label">per person</div>
                            <div class="widget-price-discount">✓ <asp:Literal ID="litDiscount" runat="server" Text="24% OFF" /></div>
                        </div>

                        <!-- Travellers qty -->
                        <div class="form-group">
                            <label class="form-label">TRAVELLERS</label>
                            <div style="display:flex;align-items:center;gap:1rem;">
                                <div class="qty-control">
                                    <button type="button" id="btnWidgetMinus" class="qty-btn" aria-label="Decrease travellers">−</button>
                                    <span id="widgetCount" class="qty-display">2</span>
                                    <button type="button" id="btnWidgetPlus" class="qty-btn" aria-label="Increase travellers">+</button>
                                </div>
                                <span class="text-sm text-muted">adults</span>
                            </div>
                        </div>

                        <!-- Summary -->
                        <div style="margin-bottom:1rem;">
                            <div class="widget-total-row">
                                <span id="widgetSubtotal">₹85,000 × 2</span>
                                <span style="font-weight:600;">₹1,70,000</span>
                            </div>
                            <div class="widget-total-row grand-total">
                                <span>Total</span>
                                <span id="widgetTotal" style="color:var(--color-primary);">₹1,70,000</span>
                            </div>
                        </div>

                        <a href="<%= ResolveUrl("~/Pages/Booking/BookingWizard.aspx?id=") %><%= Request.QueryString["id"] ?? "1" %>"
                           class="btn btn-primary btn-lg btn-block" style="text-align:center;">
                            🚀 Book Now
                        </a>
                        <p style="font-size:0.72rem;color:var(--color-text-muted);text-align:center;margin-top:0.75rem;">
                            Free cancellation within 24 hours · Demo only
                        </p>
                    </div>
                </aside>

            </div><!-- /tour-detail-layout -->
        </div>
    </section>

</asp:Content>

<asp:Content ID="ScriptsContent" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script src="<%= ResolveUrl("~/Content/js/booking.js") %>"></script>
</asp:Content>
