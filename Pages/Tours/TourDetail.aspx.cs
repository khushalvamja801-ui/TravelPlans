using System;
using System.Collections.Generic;

namespace TravelPlans.Pages.Tours
{
    public partial class TourDetail : System.Web.UI.Page
    {
        // Sample tour data
        private class TourData
        {
            public int Id { get; set; }
            public string Title { get; set; }
            public string Destination { get; set; }
            public string Category { get; set; }
            public string Duration { get; set; }
            public string Rating { get; set; }
            public int Price { get; set; }
            public string Discount { get; set; }
            public string Image { get; set; }
            public string Overview { get; set; }
        }

        private static readonly List<TourData> Tours = new List<TourData>
        {
            new TourData { Id=1, Title="Maldives Luxury Escape", Destination="Maldives", Category="🏖 Beach", Duration="6 D / 5 N", Rating="4.9 (248 reviews)", Price=85000, Discount="24% OFF", Image="~/Assets/Images/image16.png", Overview="Indulge in the ultimate island luxury – private overwater bungalows, pristine coral reefs, and the kind of tranquillity that resets the soul. Experience world-class snorkelling, sunset cruises, and a candlelit dinner on the beach." },
            new TourData { Id=2, Title="Paris: Romance & Art", Destination="Paris, France", Category="🏙 City", Duration="8 D / 7 N", Rating="4.8 (312 reviews)", Price=120000, Discount="24% OFF", Image="~/Assets/Images/image18.png", Overview="The City of Light enchants with its iconic iron tower, world-class art museums, and charming sidewalk cafés. Explore Montmartre, cruise the Seine, and savour exquisite French cuisine in every neighbourhood." },
            new TourData { Id=3, Title="Bali: Spirit & Adventure", Destination="Bali, Indonesia", Category="🏔 Adventure", Duration="7 D / 6 N", Rating="4.7 (186 reviews)", Price=45000, Discount="27% OFF", Image="~/Assets/Images/image19.png", Overview="The Island of the Gods enchants with emerald rice terraces, ancient Hindu temples, and breathtaking volcanic landscapes. Surf world-class waves, meditate at sunrise, and discover the warm spirit of Balinese culture." },
            new TourData { Id=4, Title="Santorini: Caldera Dreams", Destination="Santorini, Greece", Category="💑 Honeymoon", Duration="6 D / 5 N", Rating="4.9 (203 reviews)", Price=140000, Discount="21% OFF", Image="~/Assets/Images/image21.png", Overview="Perched dramatically on a volcanic caldera, Santorini's iconic blue-domed churches and whitewashed buildings create an unforgettable backdrop. Watch the world's most spectacular sunsets from Oia." },
            new TourData { Id=5, Title="Japan: Tokyo to Kyoto", Destination="Tokyo & Kyoto, Japan", Category="🏯 Culture", Duration="9 D / 8 N", Rating="4.8 (175 reviews)", Price=95000, Discount="26% OFF", Image="~/Assets/Images/image8.png", Overview="Journey from Tokyo's neon-lit streets to Kyoto's ancient temples and bamboo forests. Experience the perfect blend of ultra-modern culture and timeless tradition through this extraordinary nine-day itinerary." },
            new TourData { Id=6, Title="Dubai: Gold & Dunes", Destination="Dubai, UAE", Category="💎 Luxury", Duration="5 D / 4 N", Rating="4.7 (221 reviews)", Price=68000, Discount="24% OFF", Image="~/Assets/Images/image24.png", Overview="Experience the extraordinary opulence of Dubai – from the world's tallest building to golden desert dunes. Enjoy luxury shopping, world-class dining, and thrilling desert safaris in this city of superlatives." },
            new TourData { Id=7, Title="Swiss Alps Grand Tour", Destination="Switzerland", Category="🏔 Adventure", Duration="8 D / 7 N", Rating="4.9 (142 reviews)", Price=165000, Discount="18% OFF", Image="~/Assets/Images/image30.png", Overview="Traverse the majestic Swiss Alps across iconic rail journeys, charming mountain villages, and pristine Alpine lakes. From Zurich to Zermatt, every moment is a postcard-perfect memory in the making." },
        };

        private static readonly List<object> ItineraryMaldives = new List<object>
        {
            new { Day="1", Title="Arrival & Welcome", Description="Arrive at Malé International Airport. Seaplane transfer to your private island resort. Welcome dinner on the beach under the stars." },
            new { Day="2", Title="Island Exploration", Description="Morning snorkelling at the house reef. Afternoon kayaking around the lagoon. Sunset cocktails on the deck." },
            new { Day="3", Title="Coral Reef Dive", Description="Guided scuba/snorkelling trip to a protected coral reef. Dolphin watching cruise in the afternoon." },
            new { Day="4", Title="Spa & Leisure Day", Description="Relaxation day with complimentary spa treatment. Optional fishing excursion. Candlelit overwater dinner." },
            new { Day="5", Title="Island Hopping", Description="Visit a local Maldivian island. Cultural experiences and authentic local cuisine. Final sunset cruise." },
            new { Day="6", Title="Departure", Description="Leisurely breakfast. Seaplane transfer back to Malé. Depart with memories to last a lifetime." },
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int tourId = 1;
                int.TryParse(Request.QueryString["id"], out tourId);
                if (tourId < 1 || tourId > Tours.Count) tourId = 1;

                var tour = Tours[tourId - 1];
                hdnTourId.Value = tourId.ToString();
                hdnBasePrice.Value = tour.Price.ToString();

                litPageTitle.Text = System.Web.HttpUtility.HtmlEncode(tour.Title);
                litBreadcrumb.Text = System.Web.HttpUtility.HtmlEncode(tour.Title);
                litTourTitle.Text = System.Web.HttpUtility.HtmlEncode(tour.Title);
                litDestination.Text = System.Web.HttpUtility.HtmlEncode(tour.Destination);
                litCategory.Text = tour.Category;
                litDuration.Text = tour.Duration;
                litRating.Text = tour.Rating;
                litWidgetPrice.Text = tour.Price.ToString("N0");
                litDiscount.Text = tour.Discount;
                litOverview.Text = "<p>" + System.Web.HttpUtility.HtmlEncode(tour.Overview) + "</p>";

                imgTourMain.ImageUrl = ResolveUrl(tour.Image);
                imgTourMain.AlternateText = tour.Title;

                // Bind itinerary (use Maldives for all for demo)
                rptItinerary.DataSource = ItineraryMaldives;
                rptItinerary.DataBind();
            }
        }
    }
}
