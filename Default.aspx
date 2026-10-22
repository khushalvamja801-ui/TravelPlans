<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TravelPlans.Default" MasterPageFile="~/Site.Master" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Travel Plans – Explore the World
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- ===== HERO SECTION ===== -->
    <section class="hero" aria-label="Hero Banner">
        <div class="container hero-grid">
            <div class="hero-content">
                <div class="hero-badge">
                    <span class="hero-badge-icon">&#9992;</span>
                    <span>YOUR NEXT ADVENTURE AWAITS</span>
                </div>
                <h1 class="hero-title">
                    Explore the World with<br />
                    <span>Travel Plans</span>
                </h1>
                <p class="hero-desc">
                    Handcrafted itineraries, expert local guides, and seamless booking for extraordinary journeys worldwide.
                </p>
                <div class="hero-actions">
                    <a href="<%= ResolveUrl("~/Pages/Tours/TourPackages.aspx") %>" class="btn btn-primary btn-lg">
                        Explore Tours
                    </a>
                    <a href="<%= ResolveUrl("~/Pages/Destinations/Destinations.aspx") %>" class="btn btn-outline-white btn-lg">
                        View Destinations
                    </a>
                </div>
            </div>
            <!-- Hero image collage -->
            <div class="hero-image-grid" aria-hidden="true">
                <div class="hero-img"><img src="<%= ResolveUrl("~/Assets/Images/image16.png") %>" alt="Maldives" loading="lazy" /></div>
                <div class="hero-img"><img src="<%= ResolveUrl("~/Assets/Images/image18.png") %>" alt="Paris" loading="lazy" /></div>
                <div class="hero-img"><img src="<%= ResolveUrl("~/Assets/Images/image19.png") %>" alt="Bali" loading="lazy" /></div>
                <div class="hero-img"><img src="<%= ResolveUrl("~/Assets/Images/image21.png") %>" alt="Santorini" loading="lazy" /></div>
            </div>
        </div>
    </section>

    <!-- ===== STATS BAR ===== -->
    <div style="background:white;border-bottom:1px solid var(--color-border);">
        <div class="container">
            <div style="display:grid;grid-template-columns:repeat(4,1fr);padding:1.5rem 0;text-align:center;gap:1rem;">
                <div>
                    <div style="font-family:var(--font-primary);font-size:1.75rem;font-weight:800;color:var(--color-primary);">12+</div>
                    <div style="font-size:0.8rem;font-weight:600;color:var(--color-text-secondary);text-transform:uppercase;letter-spacing:0.06em;">Tour Packages</div>
                </div>
                <div>
                    <div style="font-family:var(--font-primary);font-size:1.75rem;font-weight:800;color:var(--color-primary);">8</div>
                    <div style="font-size:0.8rem;font-weight:600;color:var(--color-text-secondary);text-transform:uppercase;letter-spacing:0.06em;">Destinations</div>
                </div>
                <div>
                    <div style="font-family:var(--font-primary);font-size:1.75rem;font-weight:800;color:var(--color-primary);">10+</div>
                    <div style="font-size:0.8rem;font-weight:600;color:var(--color-text-secondary);text-transform:uppercase;letter-spacing:0.06em;">Happy Travellers</div>
                </div>
                <div>
                    <div style="font-family:var(--font-primary);font-size:1.75rem;font-weight:800;color:var(--color-primary);">4.8★</div>
                    <div style="font-size:0.8rem;font-weight:600;color:var(--color-text-secondary);text-transform:uppercase;letter-spacing:0.06em;">Average Rating</div>
                </div>
            </div>
        </div>
    </div>

    <!-- ===== FEATURED TOURS ===== -->
    <section class="section" aria-labelledby="featuredToursTitle">
        <div class="container">
            <div class="section-header">
                <div class="section-label">🌟 CURATED FOR YOU</div>
                <h2 class="section-title" id="featuredToursTitle">Featured Tours</h2>
                <p class="section-subtitle">Explore our handpicked selection of extraordinary travel experiences around the globe.</p>
            </div>

            <div class="tours-grid" id="toursContainer">

                <!-- Card 1: Maldives -->
                <div class="tour-card-wrapper" data-price="85000">
                    <article class="tour-card" data-category="beach" data-price="85000" data-duration="6" aria-label="Maldives Luxury Escape">
                        <div class="tour-card-img">
                            <img src="<%= ResolveUrl("~/Assets/Images/image16.png") %>" alt="Maldives aerial view of overwater bungalows" loading="lazy" />
                            <span class="tour-badge badge-bestseller" aria-label="Badge: Bestseller">⭐ BESTSELLER</span>
                            <button class="tour-card-wishlist" aria-label="Save to wishlist" type="button"><span class="wish-icon">🤍</span></button>
                        </div>
                        <div class="tour-card-body">
                            <div class="tour-card-dest">📍 Maldives</div>
                            <h3 class="tour-card-title">Maldives Luxury Escape</h3>
                            <div class="tour-card-meta">
                                <span class="tour-meta-item">⏱ 6 D / 5 N</span>
                                <span class="tour-meta-item">🏖 Beach</span>
                                <span class="tour-meta-item">⭐ 4.9 (248)</span>
                            </div>
                            <div class="tour-card-footer">
                                <div class="tour-price-block">
                                    <span class="tour-price-label">per person</span>
                                    <span class="tour-price-main">₹85,000</span>
                                    <span class="tour-price-discount">✓ 24% off</span>
                                </div>
                                <a href="<%= ResolveUrl("~/Pages/Tours/TourDetail.aspx?id=1") %>" class="btn btn-primary btn-sm">View Details</a>
                            </div>
                        </div>
                    </article>
                </div>

                <!-- Card 2: Paris -->
                <div class="tour-card-wrapper" data-price="120000">
                    <article class="tour-card" data-category="city" data-price="120000" data-duration="8" aria-label="Paris Romance and Art">
                        <div class="tour-card-img">
                            <img src="<%= ResolveUrl("~/Assets/Images/image18.png") %>" alt="Paris Eiffel Tower at dusk" loading="lazy" />
                            <span class="tour-badge badge-top-rated" aria-label="Badge: Top Rated">🏆 TOP RATED</span>
                            <button class="tour-card-wishlist" aria-label="Save to wishlist" type="button"><span class="wish-icon">🤍</span></button>
                        </div>
                        <div class="tour-card-body">
                            <div class="tour-card-dest">📍 Paris</div>
                            <h3 class="tour-card-title">Paris: Romance &amp; Art</h3>
                            <div class="tour-card-meta">
                                <span class="tour-meta-item">⏱ 8 D / 7 N</span>
                                <span class="tour-meta-item">🏙 City</span>
                                <span class="tour-meta-item">⭐ 4.8 (312)</span>
                            </div>
                            <div class="tour-card-footer">
                                <div class="tour-price-block">
                                    <span class="tour-price-label">per person</span>
                                    <span class="tour-price-main">₹1,20,000</span>
                                    <span class="tour-price-discount">✓ 24% off</span>
                                </div>
                                <a href="<%= ResolveUrl("~/Pages/Tours/TourDetail.aspx?id=2") %>" class="btn btn-primary btn-sm">View Details</a>
                            </div>
                        </div>
                    </article>
                </div>

                <!-- Card 3: Bali -->
                <div class="tour-card-wrapper" data-price="45000">
                    <article class="tour-card" data-category="adventure" data-price="45000" data-duration="7" aria-label="Bali Spirit and Adventure">
                        <div class="tour-card-img">
                            <img src="<%= ResolveUrl("~/Assets/Images/image19.png") %>" alt="Bali temple with water reflection" loading="lazy" />
                            <span class="tour-badge badge-trending" aria-label="Badge: Trending">🔥 TRENDING</span>
                            <button class="tour-card-wishlist" aria-label="Save to wishlist" type="button"><span class="wish-icon">🤍</span></button>
                        </div>
                        <div class="tour-card-body">
                            <div class="tour-card-dest">📍 Bali</div>
                            <h3 class="tour-card-title">Bali: Spirit &amp; Adventure</h3>
                            <div class="tour-card-meta">
                                <span class="tour-meta-item">⏱ 7 D / 6 N</span>
                                <span class="tour-meta-item">🏔 Adventure</span>
                                <span class="tour-meta-item">⭐ 4.7 (186)</span>
                            </div>
                            <div class="tour-card-footer">
                                <div class="tour-price-block">
                                    <span class="tour-price-label">per person</span>
                                    <span class="tour-price-main">₹45,000</span>
                                    <span class="tour-price-discount">✓ 27% off</span>
                                </div>
                                <a href="<%= ResolveUrl("~/Pages/Tours/TourDetail.aspx?id=3") %>" class="btn btn-primary btn-sm">View Details</a>
                            </div>
                        </div>
                    </article>
                </div>

                <!-- Card 4: Santorini -->
                <div class="tour-card-wrapper" data-price="140000">
                    <article class="tour-card" data-category="honeymoon" data-price="140000" data-duration="6" aria-label="Santorini Caldera Dreams">
                        <div class="tour-card-img">
                            <img src="<%= ResolveUrl("~/Assets/Images/image21.png") %>" alt="Santorini white buildings at sunset" loading="lazy" />
                            <span class="tour-badge badge-luxury" aria-label="Badge: Luxury">💎 LUXURY</span>
                            <button class="tour-card-wishlist" aria-label="Save to wishlist" type="button"><span class="wish-icon">🤍</span></button>
                        </div>
                        <div class="tour-card-body">
                            <div class="tour-card-dest">📍 Santorini</div>
                            <h3 class="tour-card-title">Santorini: Caldera Dreams</h3>
                            <div class="tour-card-meta">
                                <span class="tour-meta-item">⏱ 6 D / 5 N</span>
                                <span class="tour-meta-item">💑 Honeymoon</span>
                                <span class="tour-meta-item">⭐ 4.9 (203)</span>
                            </div>
                            <div class="tour-card-footer">
                                <div class="tour-price-block">
                                    <span class="tour-price-label">per person</span>
                                    <span class="tour-price-main">₹1,40,000</span>
                                    <span class="tour-price-discount">✓ 21% off</span>
                                </div>
                                <a href="<%= ResolveUrl("~/Pages/Tours/TourDetail.aspx?id=4") %>" class="btn btn-primary btn-sm">View Details</a>
                            </div>
                        </div>
                    </article>
                </div>

                <!-- Card 5: Tokyo -->
                <div class="tour-card-wrapper" data-price="95000">
                    <article class="tour-card" data-category="culture" data-price="95000" data-duration="9" aria-label="Japan Tokyo to Kyoto">
                        <div class="tour-card-img">
                            <img src="<%= ResolveUrl("~/Assets/Images/image8.png") %>" alt="Tokyo neon street scene" loading="lazy" />
                            <span class="tour-badge badge-featured" aria-label="Badge: Featured">✨ FEATURED</span>
                            <button class="tour-card-wishlist" aria-label="Save to wishlist" type="button"><span class="wish-icon">🤍</span></button>
                        </div>
                        <div class="tour-card-body">
                            <div class="tour-card-dest">📍 Tokyo &amp; Kyoto</div>
                            <h3 class="tour-card-title">Japan: Tokyo to Kyoto</h3>
                            <div class="tour-card-meta">
                                <span class="tour-meta-item">⏱ 9 D / 8 N</span>
                                <span class="tour-meta-item">🏯 Culture</span>
                                <span class="tour-meta-item">⭐ 4.8 (175)</span>
                            </div>
                            <div class="tour-card-footer">
                                <div class="tour-price-block">
                                    <span class="tour-price-label">per person</span>
                                    <span class="tour-price-main">₹95,000</span>
                                    <span class="tour-price-discount">✓ 26% off</span>
                                </div>
                                <a href="<%= ResolveUrl("~/Pages/Tours/TourDetail.aspx?id=5") %>" class="btn btn-primary btn-sm">View Details</a>
                            </div>
                        </div>
                    </article>
                </div>

                <!-- Card 6: Dubai -->
                <div class="tour-card-wrapper" data-price="68000">
                    <article class="tour-card" data-category="luxury" data-price="68000" data-duration="5" aria-label="Dubai Gold and Dunes">
                        <div class="tour-card-img">
                            <img src="<%= ResolveUrl("~/Assets/Images/image24.png") %>" alt="Dubai skyline with Burj Khalifa" loading="lazy" />
                            <span class="tour-badge badge-hot" aria-label="Badge: Hot Deal">🔥 HOT DEAL</span>
                            <button class="tour-card-wishlist" aria-label="Save to wishlist" type="button"><span class="wish-icon">🤍</span></button>
                        </div>
                        <div class="tour-card-body">
                            <div class="tour-card-dest">📍 Dubai</div>
                            <h3 class="tour-card-title">Dubai: Gold &amp; Dunes</h3>
                            <div class="tour-card-meta">
                                <span class="tour-meta-item">⏱ 5 D / 4 N</span>
                                <span class="tour-meta-item">💎 Luxury</span>
                                <span class="tour-meta-item">⭐ 4.7 (221)</span>
                            </div>
                            <div class="tour-card-footer">
                                <div class="tour-price-block">
                                    <span class="tour-price-label">per person</span>
                                    <span class="tour-price-main">₹68,000</span>
                                    <span class="tour-price-discount">✓ 24% off</span>
                                </div>
                                <a href="<%= ResolveUrl("~/Pages/Tours/TourDetail.aspx?id=6") %>" class="btn btn-primary btn-sm">View Details</a>
                            </div>
                        </div>
                    </article>
                </div>

            </div>

            <div class="text-center mt-8">
                <a href="<%= ResolveUrl("~/Pages/Tours/TourPackages.aspx") %>" class="btn btn-secondary btn-lg">
                    View All Packages →
                </a>
            </div>
        </div>
    </section>

    <!-- ===== DESTINATIONS PREVIEW ===== -->
    <section class="section section-alt" aria-labelledby="destinationsTitle">
        <div class="container">
            <div class="section-header">
                <div class="section-label">🌍 EXPLORE DESTINATIONS</div>
                <h2 class="section-title" id="destinationsTitle">Popular Destinations</h2>
                <p class="section-subtitle">From tropical paradises to cosmopolitan cities – find your perfect getaway.</p>
            </div>
            <div class="destinations-grid">
                <a href="<%= ResolveUrl("~/Pages/Destinations/Destinations.aspx") %>" class="dest-card" aria-label="Maldives destination">
                    <img src="<%= ResolveUrl("~/Assets/Images/image26.png") %>" alt="Maldives overwater bungalows" loading="lazy" />
                    <div class="dest-card-overlay">
                        <div class="dest-card-name">Maldives</div>
                        <div class="dest-card-country">Indian Ocean</div>
                        <div class="dest-card-price">From ₹85,000</div>
                    </div>
                </a>
                <a href="<%= ResolveUrl("~/Pages/Destinations/Destinations.aspx") %>" class="dest-card" aria-label="Paris destination">
                    <img src="<%= ResolveUrl("~/Assets/Images/image18.png") %>" alt="Paris Eiffel Tower" loading="lazy" />
                    <div class="dest-card-overlay">
                        <div class="dest-card-name">Paris</div>
                        <div class="dest-card-country">France</div>
                        <div class="dest-card-price">From ₹1,20,000</div>
                    </div>
                </a>
                <a href="<%= ResolveUrl("~/Pages/Destinations/Destinations.aspx") %>" class="dest-card" aria-label="Santorini destination">
                    <img src="<%= ResolveUrl("~/Assets/Images/image21.png") %>" alt="Santorini" loading="lazy" />
                    <div class="dest-card-overlay">
                        <div class="dest-card-name">Santorini</div>
                        <div class="dest-card-country">Greece</div>
                        <div class="dest-card-price">From ₹1,10,000</div>
                    </div>
                </a>
                <a href="<%= ResolveUrl("~/Pages/Destinations/Destinations.aspx") %>" class="dest-card" aria-label="Bali destination">
                    <img src="<%= ResolveUrl("~/Assets/Images/image19.png") %>" alt="Bali temple" loading="lazy" />
                    <div class="dest-card-overlay">
                        <div class="dest-card-name">Bali</div>
                        <div class="dest-card-country">Indonesia</div>
                        <div class="dest-card-price">From ₹42,000</div>
                    </div>
                </a>
            </div>
            <div class="text-center mt-8">
                <a href="<%= ResolveUrl("~/Pages/Destinations/Destinations.aspx") %>" class="btn btn-primary btn-lg">
                    Explore All Destinations
                </a>
            </div>
        </div>
    </section>

    <!-- ===== WHY CHOOSE US ===== -->
    <section class="section" aria-labelledby="whyTitle">
        <div class="container">
            <div class="section-header">
                <div class="section-label">💡 WHY TRAVEL PLANS</div>
                <h2 class="section-title" id="whyTitle">Your Journey, Our Promise</h2>
            </div>
            <div style="display:grid;grid-template-columns:repeat(3,1fr);gap:2rem;">
                <div class="card text-center" style="padding:2.5rem 2rem;">
                    <div style="font-size:3rem;margin-bottom:1rem;">🛡</div>
                    <h3 style="font-family:var(--font-primary);font-size:1.15rem;font-weight:700;margin-bottom:0.75rem;">Safe &amp; Trusted</h3>
                    <p class="text-muted text-sm">Verified tour operators, 24/7 support, and comprehensive travel protection for every journey.</p>
                </div>
                <div class="card text-center" style="padding:2.5rem 2rem;">
                    <div style="font-size:3rem;margin-bottom:1rem;">💰</div>
                    <h3 style="font-family:var(--font-primary);font-size:1.15rem;font-weight:700;margin-bottom:0.75rem;">Best Price Guarantee</h3>
                    <p class="text-muted text-sm">Exclusive deals and transparent pricing with no hidden fees. We match any lower price found.</p>
                </div>
                <div class="card text-center" style="padding:2.5rem 2rem;">
                    <div style="font-size:3rem;margin-bottom:1rem;">🗺</div>
                    <h3 style="font-family:var(--font-primary);font-size:1.15rem;font-weight:700;margin-bottom:0.75rem;">Expert Itineraries</h3>
                    <p class="text-muted text-sm">Crafted by local experts with years of experience, ensuring authentic and memorable experiences.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- ===== CTA BANNER ===== -->
    <section style="background:linear-gradient(135deg,#0f172a 0%,#1e3a5f 50%,#1a56db 100%);padding:5rem 0;color:white;text-align:center;" aria-label="Call to action">
        <div class="container">
            <div class="section-label" style="color:var(--color-accent-light);">✈ READY TO EXPLORE?</div>
            <h2 style="font-family:var(--font-primary);font-size:clamp(2rem,4vw,3rem);font-weight:800;margin:1rem 0 1.5rem;letter-spacing:-0.02em;">Start Planning Your Dream Trip</h2>
            <p style="color:rgba(255,255,255,0.75);font-size:1.1rem;max-width:500px;margin:0 auto 2.5rem;">Join thousands of happy travellers who discovered the world with Travel Plans.</p>
            <div style="display:flex;gap:1rem;justify-content:center;flex-wrap:wrap;">
                <a href="<%= ResolveUrl("~/Pages/Authentication/Register.aspx") %>" class="btn btn-white btn-lg">🚀 Get Started Free</a>
                <a href="<%= ResolveUrl("~/Pages/Tours/TourPackages.aspx") %>" class="btn btn-outline-white btn-lg">Browse Tours</a>
            </div>
        </div>
    </section>

</asp:Content>
