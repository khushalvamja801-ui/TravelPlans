<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bookings.aspx.cs" Inherits="TravelPlans.Pages.Admin.Bookings" MasterPageFile="~/Admin.Master" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">Admin Bookings – Travel Plans</asp:Content>
<asp:Content ID="PageTitle" ContentPlaceHolderID="PageTitle" runat="server">Manage Bookings</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="admin-page-header">
        <div>
            <div class="admin-page-title">Bookings</div>
            <div class="admin-page-sub">Manage and track all customer bookings.</div>
        </div>
    </div>

    <!-- Booking Summary Cards -->
    <div class="admin-booking-summary" style="margin-bottom:1.5rem;">
        <div class="booking-summary-item">
            <div class="booking-summary-num" style="color:var(--color-success);">4</div>
            <div class="booking-summary-label">✓ Confirmed</div>
        </div>
        <div class="booking-summary-item">
            <div class="booking-summary-num" style="color:var(--color-warning);">2</div>
            <div class="booking-summary-label">⏳ Pending</div>
        </div>
        <div class="booking-summary-item">
            <div class="booking-summary-num" style="color:var(--color-primary);">1</div>
            <div class="booking-summary-label">✓ Completed</div>
        </div>
        <div class="booking-summary-item">
            <div class="booking-summary-num" style="color:var(--color-error);">1</div>
            <div class="booking-summary-label">✕ Cancelled</div>
        </div>
    </div>

    <!-- Search & Filter -->
    <div style="margin-bottom:1.25rem;display:flex;gap:1rem;flex-wrap:wrap;">
        <div class="search-input-wrap" style="flex:1;min-width:220px;">
            <span class="search-icon">🔍</span>
            <input type="text" id="adminSearch" class="search-input" placeholder="Search bookings…" aria-label="Search bookings" />
        </div>
        <select class="form-control" style="width:auto;" onchange="filterByStatus(this.value)" aria-label="Filter by status">
            <option value="">All Statuses</option>
            <option value="confirmed">Confirmed</option>
            <option value="pending">Pending</option>
            <option value="completed">Completed</option>
            <option value="cancelled">Cancelled</option>
        </select>
    </div>

    <div class="admin-card">
        <div class="admin-card-header">
            <div class="admin-card-title">📋 All Bookings (8)</div>
        </div>
        <div class="table-wrapper" style="border:none;box-shadow:none;border-radius:0;">
            <table class="data-table mobile-card-table" role="grid" aria-label="All Bookings">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">GUEST</th>
                        <th scope="col">TOUR</th>
                        <th scope="col">DATE</th>
                        <th scope="col">PAX</th>
                        <th scope="col">TOTAL</th>
                        <th scope="col">STATUS</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="admin-table-row" data-status="confirmed">
                        <td data-label="ID"><span class="booking-id">#BK001</span></td>
                        <td data-label="Guest"><div style="font-weight:600;">Sarah Mitchell</div><div style="font-size:0.72rem;color:var(--color-text-muted);">sarah.mitchell@outlook.com</div></td>
                        <td data-label="Tour">Maldives Luxury Escape</td>
                        <td data-label="Date">2025-11-05</td>
                        <td data-label="PAX">2</td>
                        <td data-label="Total" style="font-weight:700;">₹1,78,500</td>
                        <td data-label="Status"><span class="status-badge status-confirmed">✓ Confirmed</span></td>
                    </tr>
                    <tr class="admin-table-row" data-status="confirmed">
                        <td data-label="ID"><span class="booking-id">#BK002</span></td>
                        <td data-label="Guest"><div style="font-weight:600;">James Wilson</div><div style="font-size:0.72rem;color:var(--color-text-muted);">james.wilson@gmail.com</div></td>
                        <td data-label="Tour">Bali: Spirit &amp; Adventure</td>
                        <td data-label="Date">2025-10-15</td>
                        <td data-label="PAX">4</td>
                        <td data-label="Total" style="font-weight:700;">₹1,89,000</td>
                        <td data-label="Status"><span class="status-badge status-confirmed">✓ Confirmed</span></td>
                    </tr>
                    <tr class="admin-table-row" data-status="completed">
                        <td data-label="ID"><span class="booking-id">#BK003</span></td>
                        <td data-label="Guest"><div style="font-weight:600;">David Chen</div><div style="font-size:0.72rem;color:var(--color-text-muted);">david.chen@gmail.com</div></td>
                        <td data-label="Tour">Paris: Romance &amp; Art</td>
                        <td data-label="Date">2025-09-20</td>
                        <td data-label="PAX">2</td>
                        <td data-label="Total" style="font-weight:700;">₹2,52,000</td>
                        <td data-label="Status"><span class="status-badge status-completed">✓ Completed</span></td>
                    </tr>
                    <tr class="admin-table-row" data-status="pending">
                        <td data-label="ID"><span class="booking-id">#BK004</span></td>
                        <td data-label="Guest"><div style="font-weight:600;">Jessica Taylor</div><div style="font-size:0.72rem;color:var(--color-text-muted);">jessica.taylor@gmail.com</div></td>
                        <td data-label="Tour">Dubai: Gold &amp; Dunes</td>
                        <td data-label="Date">2025-12-10</td>
                        <td data-label="PAX">3</td>
                        <td data-label="Total" style="font-weight:700;">₹2,14,200</td>
                        <td data-label="Status"><span class="status-badge status-pending">⏳ Pending</span></td>
                    </tr>
                    <tr class="admin-table-row" data-status="confirmed">
                        <td data-label="ID"><span class="booking-id">#BK005</span></td>
                        <td data-label="Guest"><div style="font-weight:600;">Emma Clarke</div><div style="font-size:0.72rem;color:var(--color-text-muted);">emma.clarke@gmail.com</div></td>
                        <td data-label="Tour">Japan: Tokyo to Kyoto</td>
                        <td data-label="Date">2025-11-20</td>
                        <td data-label="PAX">2</td>
                        <td data-label="Total" style="font-weight:700;">₹1,99,500</td>
                        <td data-label="Status"><span class="status-badge status-confirmed">✓ Confirmed</span></td>
                    </tr>
                    <tr class="admin-table-row" data-status="confirmed">
                        <td data-label="ID"><span class="booking-id">#BK006</span></td>
                        <td data-label="Guest"><div style="font-weight:600;">Michael Brown</div><div style="font-size:0.72rem;color:var(--color-text-muted);">michael.brown@yahoo.com</div></td>
                        <td data-label="Tour">Santorini: Caldera Dreams</td>
                        <td data-label="Date">2025-09-05</td>
                        <td data-label="PAX">2</td>
                        <td data-label="Total" style="font-weight:700;">₹2,94,000</td>
                        <td data-label="Status"><span class="status-badge status-confirmed">✓ Confirmed</span></td>
                    </tr>
                    <tr class="admin-table-row" data-status="pending">
                        <td data-label="ID"><span class="booking-id">#BK007</span></td>
                        <td data-label="Guest"><div style="font-weight:600;">Robert Martinez</div><div style="font-size:0.72rem;color:var(--color-text-muted);">robert.martinez@gmail.com</div></td>
                        <td data-label="Tour">Thailand Beach Bliss</td>
                        <td data-label="Date">2025-10-01</td>
                        <td data-label="PAX">4</td>
                        <td data-label="Total" style="font-weight:700;">₹2,18,400</td>
                        <td data-label="Status"><span class="status-badge status-pending">⏳ Pending</span></td>
                    </tr>
                    <tr class="admin-table-row" data-status="cancelled">
                        <td data-label="ID"><span class="booking-id">#BK008</span></td>
                        <td data-label="Guest"><div style="font-weight:600;">Sarah Mitchell</div><div style="font-size:0.72rem;color:var(--color-text-muted);">sarah.mitchell@outlook.com</div></td>
                        <td data-label="Tour">Iceland: Fire &amp; Ice</td>
                        <td data-label="Date">2026-01-15</td>
                        <td data-label="PAX">2</td>
                        <td data-label="Total" style="font-weight:700;">₹5,25,000</td>
                        <td data-label="Status"><span class="status-badge status-cancelled">✕ Cancelled</span></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <script>
    function filterByStatus(val) {
        var rows = document.querySelectorAll('.admin-table-row[data-status]');
        rows.forEach(function(r) {
            r.style.display = (!val || r.getAttribute('data-status') === val) ? '' : 'none';
        });
    }
    </script>

</asp:Content>
