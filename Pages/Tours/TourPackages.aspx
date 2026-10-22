<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TourPackages.aspx.cs" Inherits="TravelPlans.Pages.Tours.TourPackages" MasterPageFile="~/Site.Master" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Tour Packages – Travel Plans
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Page Banner -->
    <div class="page-banner">
        <div class="container">
            <div class="section-label" style="color:var(--color-accent-light);justify-content:center;">🗺 DISCOVER &amp; BOOK</div>
            <h1 class="page-banner-title">Tour Packages</h1>
            <p class="page-banner-sub">Browse our handcrafted collection of extraordinary travel experiences.</p>
        </div>
    </div>

    <section class="section section-alt">
        <div class="container">

            <!-- Search bar -->
            <div class="search-bar">
                <div class="search-input-wrap">
                    <span class="search-icon" aria-hidden="true">🔍</span>
                    <input type="text" id="tourSearch" class="search-input" placeholder="Search tours, destinations…" aria-label="Search tours" />
                </div>
                <div class="sort-select">
                    <label for="sortSelect" class="text-sm">Sort:</label>
                    <select id="sortSelect" aria-label="Sort tours">
                        <option value="default">Featured</option>
                        <option value="price-asc">Price: Low to High</option>
                        <option value="price-desc">Price: High to Low</option>
                    </select>
                </div>
            </div>

            <div class="packages-layout">

                <!-- ===== FILTERS SIDEBAR ===== -->
                <aside class="sidebar" aria-label="Tour Filters">
                    <div class="sidebar-title">🎛 Filters</div>

                    <!-- Category Filter -->
                    <div class="filter-group">
                        <div class="filter-group-title">CATEGORY</div>
                        <div class="filter-chip-group" role="group" aria-label="Category filter">
                            <button type="button" class="filter-chip active" data-filter-group="category" data-value="all">All</button>
                            <button type="button" class="filter-chip" data-filter-group="category" data-value="beach">🏖 Beach</button>
                            <button type="button" class="filter-chip" data-filter-group="category" data-value="city">🏙 City</button>
                            <button type="button" class="filter-chip" data-filter-group="category" data-value="adventure">🏔 Adventure</button>
                            <button type="button" class="filter-chip" data-filter-group="category" data-value="culture">🏯 Culture</button>
                            <button type="button" class="filter-chip" data-filter-group="category" data-value="honeymoon">💑 Honeymoon</button>
                            <button type="button" class="filter-chip" data-filter-group="category" data-value="luxury">💎 Luxury</button>
                        </div>
                    </div>

                    <!-- Max Price Filter -->
                    <div class="filter-group">
                        <div class="filter-group-title" style="display:flex;justify-content:space-between;">
                            <span>MAX PRICE</span>
                            <span id="priceDisplay" style="color:var(--color-primary);font-weight:700;">₹1,65,000</span>
                        </div>
                        <input type="range" id="priceRange" class="range-slider"
                            min="30000" max="165000" value="165000" step="5000"
                            aria-label="Maximum price filter" />
                        <div style="display:flex;justify-content:space-between;font-size:0.7rem;color:var(--color-text-muted);margin-top:0.5rem;">
                            <span>₹30,000</span>
                            <span>₹1,65,000</span>
                        </div>
                    </div>

                    <!-- Duration Filter -->
                    <div class="filter-group">
                        <div class="filter-group-title">DURATION</div>
                        <div class="filter-chip-group" role="group" aria-label="Duration filter">
                            <button type="button" class="filter-chip active" data-filter-group="duration" data-value="all">Any Duration</button>
                            <button type="button" class="filter-chip" data-filter-group="duration" data-value="1-3">1–3 Days</button>
                            <button type="button" class="filter-chip" data-filter-group="duration" data-value="4-7">4–7 Days</button>
                            <button type="button" class="filter-chip" data-filter-group="duration" data-value="8-14">8–14 Days</button>
                        </div>
                    </div>

                    <button type="button" class="btn btn-secondary btn-sm w-full" onclick="location.reload();">Reset Filters</button>
                </aside>

                <!-- ===== TOURS GRID ===== -->
                <div>
                    <div class="packages-topbar">
                        <div class="text-sm text-muted">Showing <strong>7</strong> tours</div>
                    </div>

                    <div class="tours-grid" id="toursContainer">

                        <!-- Card 1: Maldives -->
                        <div class="tour-card-wrapper" data-price="85000">
                            <article class="tour-card" data-category="beach" data-price="85000" data-duration="6">
                                <div class="tour-card-img">
                                    <img src="<%= ResolveUrl("~/Assets/Images/image16.png") %>" alt="Maldives overwater bungalows" loading="lazy" />
                                    <span class="tour-badge badge-bestseller">⭐ BESTSELLER</span>
                                    <button class="tour-card-wishlist" type="button" aria-label="Save to wishlist"><span class="wish-icon">🤍</span></button>
                                </div>
                                <div class="tour-card-body">
                                    <div class="tour-card-dest">📍 Maldives</div>
                                    <h2 class="tour-card-title">Maldives Luxury Escape</h2>
                                    <div class="tour-card-meta">
                                        <span class="tour-meta-item">⏱ 6 D / 5 N</span>
                                        <span class="tour-meta-item">🏖 Beach</span>
                                        <span class="tour-meta-item">⭐ 4.9</span>
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
                            <article class="tour-card" data-category="city" data-price="120000" data-duration="8">
                                <div class="tour-card-img">
                                    <img src="<%= ResolveUrl("~/Assets/Images/image18.png") %>" alt="Paris Eiffel Tower" loading="lazy" />
                                    <span class="tour-badge badge-top-rated">🏆 TOP RATED</span>
                                    <button class="tour-card-wishlist" type="button" aria-label="Save to wishlist"><span class="wish-icon">🤍</span></button>
                                </div>
                                <div class="tour-card-body">
                                    <div class="tour-card-dest">📍 Paris</div>
                                    <h2 class="tour-card-title">Paris: Romance &amp; Art</h2>
                                    <div class="tour-card-meta">
                                        <span class="tour-meta-item">⏱ 8 D / 7 N</span>
                                        <span class="tour-meta-item">🏙 City</span>
                                        <span class="tour-meta-item">⭐ 4.8</span>
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
                            <article class="tour-card" data-category="adventure" data-price="45000" data-duration="7">
                                <div class="tour-card-img">
                                    <img src="<%= ResolveUrl("~/Assets/Images/image19.png") %>" alt="Bali temple" loading="lazy" />
                                    <span class="tour-badge badge-trending">🔥 TRENDING</span>
                                    <button class="tour-card-wishlist" type="button" aria-label="Save to wishlist"><span class="wish-icon">🤍</span></button>
                                </div>
                                <div class="tour-card-body">
                                    <div class="tour-card-dest">📍 Bali</div>
                                    <h2 class="tour-card-title">Bali: Spirit &amp; Adventure</h2>
                                    <div class="tour-card-meta">
                                        <span class="tour-meta-item">⏱ 7 D / 6 N</span>
                                        <span class="tour-meta-item">🏔 Adventure</span>
                                        <span class="tour-meta-item">⭐ 4.7</span>
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
                            <article class="tour-card" data-category="honeymoon" data-price="140000" data-duration="6">
                                <div class="tour-card-img">
                                    <img src="<%= ResolveUrl("~/Assets/Images/image21.png") %>" alt="Santorini" loading="lazy" />
                                    <span class="tour-badge badge-luxury">💎 LUXURY</span>
                                    <button class="tour-card-wishlist" type="button" aria-label="Save to wishlist"><span class="wish-icon">🤍</span></button>
                                </div>
                                <div class="tour-card-body">
                                    <div class="tour-card-dest">📍 Santorini</div>
                                    <h2 class="tour-card-title">Santorini: Caldera Dreams</h2>
                                    <div class="tour-card-meta">
                                        <span class="tour-meta-item">⏱ 6 D / 5 N</span>
                                        <span class="tour-meta-item">💑 Honeymoon</span>
                                        <span class="tour-meta-item">⭐ 4.9</span>
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
                            <article class="tour-card" data-category="culture" data-price="95000" data-duration="9">
                                <div class="tour-card-img">
                                    <img src="<%= ResolveUrl("~/Assets/Images/image8.png") %>" alt="Tokyo streets" loading="lazy" />
                                    <span class="tour-badge badge-featured">✨ FEATURED</span>
                                    <button class="tour-card-wishlist" type="button" aria-label="Save to wishlist"><span class="wish-icon">🤍</span></button>
                                </div>
                                <div class="tour-card-body">
                                    <div class="tour-card-dest">📍 Tokyo &amp; Kyoto</div>
                                    <h2 class="tour-card-title">Japan: Tokyo to Kyoto</h2>
                                    <div class="tour-card-meta">
                                        <span class="tour-meta-item">⏱ 9 D / 8 N</span>
                                        <span class="tour-meta-item">🏯 Culture</span>
                                        <span class="tour-meta-item">⭐ 4.8</span>
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
                            <article class="tour-card" data-category="luxury" data-price="68000" data-duration="5">
                                <div class="tour-card-img">
                                    <img src="<%= ResolveUrl("~/Assets/Images/image24.png") %>" alt="Dubai skyline" loading="lazy" />
                                    <span class="tour-badge badge-hot">🔥 HOT DEAL</span>
                                    <button class="tour-card-wishlist" type="button" aria-label="Save to wishlist"><span class="wish-icon">🤍</span></button>
                                </div>
                                <div class="tour-card-body">
                                    <div class="tour-card-dest">📍 Dubai</div>
                                    <h2 class="tour-card-title">Dubai: Gold &amp; Dunes</h2>
                                    <div class="tour-card-meta">
                                        <span class="tour-meta-item">⏱ 5 D / 4 N</span>
                                        <span class="tour-meta-item">💎 Luxury</span>
                                        <span class="tour-meta-item">⭐ 4.7</span>
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

                        <!-- Card 7: Switzerland -->
                        <div class="tour-card-wrapper" data-price="165000">
                            <article class="tour-card" data-category="adventure" data-price="165000" data-duration="8">
                                <div class="tour-card-img">
                                    <img src="<%= ResolveUrl("~/Assets/Images/image30.png") %>" alt="Switzerland Alps" loading="lazy" />
                                    <span class="tour-badge badge-luxury">💎 LUXURY</span>
                                    <button class="tour-card-wishlist" type="button" aria-label="Save to wishlist"><span class="wish-icon">🤍</span></button>
                                </div>
                                <div class="tour-card-body">
                                    <div class="tour-card-dest">📍 Switzerland</div>
                                    <h2 class="tour-card-title">Swiss Alps Grand Tour</h2>
                                    <div class="tour-card-meta">
                                        <span class="tour-meta-item">⏱ 8 D / 7 N</span>
                                        <span class="tour-meta-item">🏔 Adventure</span>
                                        <span class="tour-meta-item">⭐ 4.9</span>
                                    </div>
                                    <div class="tour-card-footer">
                                        <div class="tour-price-block">
                                            <span class="tour-price-label">per person</span>
                                            <span class="tour-price-main">₹1,65,000</span>
                                            <span class="tour-price-discount">✓ 18% off</span>
                                        </div>
                                        <a href="<%= ResolveUrl("~/Pages/Tours/TourDetail.aspx?id=7") %>" class="btn btn-primary btn-sm">View Details</a>
                                    </div>
                                </div>
                            </article>
                        </div>

                    </div><!-- /tours-grid -->
                </div>
            </div><!-- /packages-layout -->
        </div>
    </section>

</asp:Content>
