<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentSuccess.aspx.cs" Inherits="TravelPlans.Pages.Booking.PaymentSuccess" MasterPageFile="~/Site.Master" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Booking Confirmed – Travel Plans
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="confirm-page">
        <div class="confirm-card">

            <!-- Success Icon -->
            <div class="confirm-icon" role="img" aria-label="Success">🎉</div>

            <h1 style="font-family:var(--font-primary);font-size:1.75rem;font-weight:800;margin-bottom:0.5rem;">
                Booking Confirmed!
            </h1>
            <p style="color:var(--color-text-secondary);margin-bottom:1.5rem;">
                Your adventure is officially booked. Sit back and let us take care of everything.
            </p>

            <!-- Demo Notice -->
            <div class="alert alert-warning" style="margin-bottom:1.5rem;">
                <span>ℹ</span>
                <span><strong>Demo Mode:</strong> This is a demonstration booking only. No real payment was processed and no reservation was created.</span>
            </div>

            <!-- Booking Reference -->
            <div class="booking-ref-display">
                <div class="booking-ref-label">BOOKING REFERENCE</div>
                <div class="booking-ref-code">
                    <asp:Literal ID="litBookingRef" runat="server" Text="TP-DEMO1234" />
                </div>
            </div>

            <!-- Booking Details -->
            <div class="booking-confirm-details">
                <div class="booking-confirm-row">
                    <span class="booking-confirm-label">Guest Name</span>
                    <span class="booking-confirm-value"><asp:Literal ID="litGuestName" runat="server" Text="Khushal Vamja" /></span>
                </div>
                <div class="booking-confirm-row">
                    <span class="booking-confirm-label">Tour</span>
                    <span class="booking-confirm-value"><asp:Literal ID="litConfirmTour" runat="server" Text="Maldives Luxury Escape" /></span>
                </div>
                <div class="booking-confirm-row">
                    <span class="booking-confirm-label">Destination</span>
                    <span class="booking-confirm-value">📍 <asp:Literal ID="litConfirmDest" runat="server" Text="Maldives" /></span>
                </div>
                <div class="booking-confirm-row">
                    <span class="booking-confirm-label">Duration</span>
                    <span class="booking-confirm-value">⏱ <asp:Literal ID="litConfirmDuration" runat="server" Text="6D / 5N" /></span>
                </div>
                <div class="booking-confirm-row">
                    <span class="booking-confirm-label">Total Paid</span>
                    <span class="booking-confirm-value" style="color:var(--color-primary);">
                        <asp:Literal ID="litConfirmTotal" runat="server" Text="₹1,78,500" />
                        <span style="font-size:0.7rem;color:var(--color-text-muted);font-weight:400;"> (demo)</span>
                    </span>
                </div>
            </div>

            <!-- Actions -->
            <div style="display:flex;gap:1rem;justify-content:center;margin-top:1.5rem;flex-wrap:wrap;">
                <a href="<%= ResolveUrl("~/Pages/User/MyBookings.aspx") %>" class="btn btn-primary btn-lg">
                    📋 View My Bookings
                </a>
                <a href="<%= ResolveUrl("~/") %>" class="btn btn-secondary btn-lg">
                    🏠 Back to Home
                </a>
            </div>

        </div>
    </div>

</asp:Content>
