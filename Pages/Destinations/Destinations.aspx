<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Destinations.aspx.cs" Inherits="TravelPlans.Pages.Destinations.Destinations" MasterPageFile="~/Site.Master" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Destinations – Travel Plans
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Page Banner -->
    <div class="page-banner">
        <div class="container">
            <div class="section-label" style="color:var(--color-accent-light);justify-content:center;">🌍 EXPLORE THE WORLD</div>
            <h1 class="page-banner-title">Popular Destinations</h1>
            <p class="page-banner-sub">Discover breathtaking destinations handpicked by our travel experts.</p>
        </div>
    </div>

    <section class="section section-alt">
        <div class="container">

            <div class="dest-page-grid">

                <!-- Maldives -->
                <article class="dest-page-card" aria-label="Maldives destination">
                    <div class="dest-page-img">
                        <img src="<%= ResolveUrl("~/Assets/Images/image16.png") %>" alt="Maldives overwater bungalows aerial view" loading="lazy" />
                    </div>
                    <div class="dest-page-body">
                        <h2 class="dest-page-name">Maldives</h2>
                        <div class="dest-page-country">🌏 Indian Ocean</div>
                        <p class="dest-page-desc">A tropical paradise of 1,200 islands scattered across the Indian Ocean, famous for its crystal-clear waters and luxury overwater bungalows.</p>
                        <div class="dest-page-footer">
                            <div>
                                <div class="dest-page-price-label">Starting from</div>
                                <div class="dest-page-price">₹85,000</div>
                            </div>
                            <a href="<%= ResolveUrl("~/Pages/Tours/TourDetail.aspx?id=1") %>" class="btn btn-primary btn-sm">Explore →</a>
                        </div>
                    </div>
                </article>

                <!-- Paris -->
                <article class="dest-page-card" aria-label="Paris destination">
                    <div class="dest-page-img">
                        <img src="<%= ResolveUrl("~/Assets/Images/image18.png") %>" alt="Paris Eiffel Tower at sunset" loading="lazy" />
                    </div>
                    <div class="dest-page-body">
                        <h2 class="dest-page-name">Paris</h2>
                        <div class="dest-page-country">🇫🇷 France</div>
                        <p class="dest-page-desc">The City of Light enchants with its iconic iron tower, world-class art museums, and charming sidewalk cafés along cobblestone streets.</p>
                        <div class="dest-page-footer">
                            <div>
                                <div class="dest-page-price-label">Starting from</div>
                                <div class="dest-page-price">₹1,20,000</div>
                            </div>
                            <a href="<%= ResolveUrl("~/Pages/Tours/TourDetail.aspx?id=2") %>" class="btn btn-primary btn-sm">Explore →</a>
                        </div>
                    </div>
                </article>

                <!-- Santorini -->
                <article class="dest-page-card" aria-label="Santorini destination">
                    <div class="dest-page-img">
                        <img src="<%= ResolveUrl("~/Assets/Images/image21.png") %>" alt="Santorini blue domes and white buildings" loading="lazy" />
                    </div>
                    <div class="dest-page-body">
                        <h2 class="dest-page-name">Santorini</h2>
                        <div class="dest-page-country">🇬🇷 Greece</div>
                        <p class="dest-page-desc">Perched dramatically on a volcanic caldera, Santorini's iconic blue-domed churches and whitewashed buildings create an unforgettable backdrop.</p>
                        <div class="dest-page-footer">
                            <div>
                                <div class="dest-page-price-label">Starting from</div>
                                <div class="dest-page-price">₹1,10,000</div>
                            </div>
                            <a href="<%= ResolveUrl("~/Pages/Tours/TourDetail.aspx?id=4") %>" class="btn btn-primary btn-sm">Explore →</a>
                        </div>
                    </div>
                </article>

                <!-- Bali -->
                <article class="dest-page-card" aria-label="Bali destination">
                    <div class="dest-page-img">
                        <img src="<%= ResolveUrl("~/Assets/Images/image19.png") %>" alt="Bali Hindu temple" loading="lazy" />
                    </div>
                    <div class="dest-page-body">
                        <h2 class="dest-page-name">Bali</h2>
                        <div class="dest-page-country">🇮🇩 Indonesia</div>
                        <p class="dest-page-desc">The Island of the Gods enchants with emerald rice terraces, ancient Hindu temples, and breathtaking volcanic landscapes and surf beaches.</p>
                        <div class="dest-page-footer">
                            <div>
                                <div class="dest-page-price-label">Starting from</div>
                                <div class="dest-page-price">₹42,000</div>
                            </div>
                            <a href="<%= ResolveUrl("~/Pages/Tours/TourDetail.aspx?id=3") %>" class="btn btn-primary btn-sm">Explore →</a>
                        </div>
                    </div>
                </article>

                <!-- Tokyo -->
                <article class="dest-page-card" aria-label="Tokyo destination">
                    <div class="dest-page-img">
                        <img src="<%= ResolveUrl("~/Assets/Images/image8.png") %>" alt="Tokyo neon city streets" loading="lazy" />
                    </div>
                    <div class="dest-page-body">
                        <h2 class="dest-page-name">Tokyo</h2>
                        <div class="dest-page-country">🇯🇵 Japan</div>
                        <p class="dest-page-desc">A mesmerising fusion of ultra-modern skyscrapers and serene ancient temples, Tokyo offers an electrifying sensory experience like no other city on Earth.</p>
                        <div class="dest-page-footer">
                            <div>
                                <div class="dest-page-price-label">Starting from</div>
                                <div class="dest-page-price">₹95,000</div>
                            </div>
                            <a href="<%= ResolveUrl("~/Pages/Tours/TourDetail.aspx?id=5") %>" class="btn btn-primary btn-sm">Explore →</a>
                        </div>
                    </div>
                </article>

                <!-- Dubai -->
                <article class="dest-page-card" aria-label="Dubai destination">
                    <div class="dest-page-img">
                        <img src="<%= ResolveUrl("~/Assets/Images/image24.png") %>" alt="Dubai skyline with Burj Khalifa" loading="lazy" />
                    </div>
                    <div class="dest-page-body">
                        <h2 class="dest-page-name">Dubai</h2>
                        <div class="dest-page-country">🇦🇪 UAE</div>
                        <p class="dest-page-desc">A city of superlatives – the tallest towers, the grandest malls, and the most luxurious experiences in the heart of the Arabian desert.</p>
                        <div class="dest-page-footer">
                            <div>
                                <div class="dest-page-price-label">Starting from</div>
                                <div class="dest-page-price">₹68,000</div>
                            </div>
                            <a href="<%= ResolveUrl("~/Pages/Tours/TourDetail.aspx?id=6") %>" class="btn btn-primary btn-sm">Explore →</a>
                        </div>
                    </div>
                </article>

                <!-- Switzerland -->
                <article class="dest-page-card" aria-label="Switzerland destination">
                    <div class="dest-page-img">
                        <img src="<%= ResolveUrl("~/Assets/Images/image30.png") %>" alt="Swiss Alps mountain landscape" loading="lazy" />
                    </div>
                    <div class="dest-page-body">
                        <h2 class="dest-page-name">Switzerland</h2>
                        <div class="dest-page-country">🇨🇭 Europe</div>
                        <p class="dest-page-desc">Home to majestic Alpine peaks, pristine lakes, and charming medieval towns. Switzerland is nature's masterpiece wrapped in luxury and precision.</p>
                        <div class="dest-page-footer">
                            <div>
                                <div class="dest-page-price-label">Starting from</div>
                                <div class="dest-page-price">₹1,65,000</div>
                            </div>
                            <a href="<%= ResolveUrl("~/Pages/Tours/TourDetail.aspx?id=7") %>" class="btn btn-primary btn-sm">Explore →</a>
                        </div>
                    </div>
                </article>

                <!-- New York -->
                <article class="dest-page-card" aria-label="New York destination">
                    <div class="dest-page-img">
                        <img src="<%= ResolveUrl("~/Assets/Images/image47.png") %>" alt="New York City skyline" loading="lazy" />
                    </div>
                    <div class="dest-page-body">
                        <h2 class="dest-page-name">New York</h2>
                        <div class="dest-page-country">🇺🇸 United States</div>
                        <p class="dest-page-desc">The city that never sleeps – iconic skylines, world-class museums, Broadway shows, and the vibrant energy of the cultural capital of the world.</p>
                        <div class="dest-page-footer">
                            <div>
                                <div class="dest-page-price-label">Starting from</div>
                                <div class="dest-page-price">₹1,25,000</div>
                            </div>
                            <a href="<%= ResolveUrl("~/Pages/Tours/TourPackages.aspx") %>" class="btn btn-primary btn-sm">Explore →</a>
                        </div>
                    </div>
                </article>

            </div><!-- /dest-page-grid -->
        </div>
    </section>

    <!-- CTA -->
    <section style="background:linear-gradient(135deg,#0f172a,#1a56db);padding:4rem 0;text-align:center;color:white;">
        <div class="container">
            <h2 style="font-family:var(--font-primary);font-size:2rem;font-weight:800;margin-bottom:1rem;">Can't find your dream destination?</h2>
            <p style="color:rgba(255,255,255,0.75);margin-bottom:2rem;">Contact our travel experts and we'll craft a custom itinerary just for you.</p>
            <a href="<%= ResolveUrl("~/Pages/Authentication/Register.aspx") %>" class="btn btn-white btn-lg">Get Custom Quote</a>
        </div>
    </section>

</asp:Content>
