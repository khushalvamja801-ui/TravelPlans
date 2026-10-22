using System;

namespace TravelPlans.Pages.Booking
{
    public partial class PaymentSuccess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Pull session values set by BookingWizard
            string bookingRef = Session["BookingRef"] as string ?? "TP-DEMO1234";
            string guestName  = Session["GuestName"]  as string ?? "Khushal Vamja";
            string tour       = Session["BookingTour"] as string ?? "Maldives Luxury Escape";
            string dest       = Session["BookingDest"] as string ?? "Maldives";
            string duration   = Session["BookingDuration"] as string ?? "6D / 5N";
            int    price      = Session["BookingPrice"] != null ? (int)Session["BookingPrice"] : 85000;
            int    total      = Session["BookingTotal"] != null ? (int)Session["BookingTotal"] : (int)Math.Round(price * 2 * 1.05m);

            litBookingRef.Text    = System.Web.HttpUtility.HtmlEncode(bookingRef);
            litGuestName.Text     = System.Web.HttpUtility.HtmlEncode(guestName);
            litConfirmTour.Text   = System.Web.HttpUtility.HtmlEncode(tour);
            litConfirmDest.Text   = System.Web.HttpUtility.HtmlEncode(dest);
            litConfirmDuration.Text = duration;
            litConfirmTotal.Text  = "₹" + total.ToString("N0");
        }
    }
}
