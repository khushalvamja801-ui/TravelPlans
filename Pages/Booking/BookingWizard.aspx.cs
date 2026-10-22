using System;

namespace TravelPlans.Pages.Booking
{
    public partial class BookingWizard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Pre-fill tour summary from querystring
                string id = Request.QueryString["id"] ?? "1";
                var tours = new[] {
                    new { Title="Maldives Luxury Escape", Dest="Maldives",   Duration="6D / 5N", Price=85000 },
                    new { Title="Paris: Romance & Art",   Dest="Paris",     Duration="8D / 7N", Price=120000 },
                    new { Title="Bali: Spirit & Adventure",Dest="Bali",     Duration="7D / 6N", Price=45000 },
                    new { Title="Santorini: Caldera Dreams",Dest="Santorini",Duration="6D / 5N", Price=140000 },
                    new { Title="Japan: Tokyo to Kyoto",  Dest="Tokyo",     Duration="9D / 8N", Price=95000 },
                    new { Title="Dubai: Gold & Dunes",    Dest="Dubai",     Duration="5D / 4N", Price=68000 },
                    new { Title="Swiss Alps Grand Tour",  Dest="Switzerland",Duration="8D / 7N", Price=165000 },
                };
                int idx = 0;
                int.TryParse(id, out idx);
                idx = Math.Max(1, Math.Min(idx, tours.Length)) - 1;
                var t = tours[idx];

                litSummaryTitle.Text = System.Web.HttpUtility.HtmlEncode(t.Title);
                litSummaryDest.Text = System.Web.HttpUtility.HtmlEncode(t.Dest);
                litSummaryDuration.Text = t.Duration;
                hdnBasePrice.Value = t.Price.ToString();

                // Store tour info in session for confirmation page
                Session["BookingTour"] = t.Title;
                Session["BookingDest"] = t.Dest;
                Session["BookingDuration"] = t.Duration;
                Session["BookingPrice"] = t.Price;
            }
        }

        protected void cvReturnDate_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            DateTime travel, ret;
            if (DateTime.TryParse(txtTravelDate.Text, out travel) &&
                DateTime.TryParse(txtReturnDate.Text, out ret))
            {
                args.IsValid = ret > travel;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            int basePrice = 85000;
            int.TryParse(hdnBasePrice.Value, out basePrice);
            int adults = 2;
            int.TryParse(hdnAdults.Value, out adults);
            int children = 0;
            int.TryParse(hdnChildren.Value, out children);
            int pax = Math.Max(1, adults + children);

            int roomSurcharge = 0;
            string room = hdnRoomType.Value ?? "Standard";
            if (room.Equals("Deluxe", StringComparison.OrdinalIgnoreCase)) roomSurcharge = 10000;
            else if (room.Equals("Suite", StringComparison.OrdinalIgnoreCase)) roomSurcharge = 25000;

            int subtotal = (basePrice * pax) + roomSurcharge;
            int gst = (int)Math.Round(subtotal * 0.05m);
            int total = subtotal + gst;

            // Generate demo booking reference
            string refCode = "TP-" + Guid.NewGuid().ToString("N").Substring(0, 8).ToUpper();
            Session["BookingRef"] = refCode;
            Session["GuestName"] = (txtGuestFirst.Text + " " + txtGuestLast.Text).Trim();
            Session["BookingAdults"] = adults;
            Session["BookingChildren"] = children;
            Session["BookingRoom"] = room;
            Session["BookingTotal"] = total;

            Response.Redirect("~/Pages/Booking/PaymentSuccess.aspx");
        }
    }
}
