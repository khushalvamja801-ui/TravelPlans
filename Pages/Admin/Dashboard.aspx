<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="TravelPlans.Pages.Admin.Dashboard" MasterPageFile="~/Admin.Master" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">Admin Dashboard – Travel Plans</asp:Content>
<asp:Content ID="PageTitle" ContentPlaceHolderID="PageTitle" runat="server">Dashboard</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Page Header -->
    <div class="admin-page-header">
        <div>
            <div class="admin-page-title">Dashboard</div>
            <div class="admin-page-sub">Welcome back, Admin! Here's what's happening today.</div>
        </div>
        <div style="font-size:0.8rem;color:var(--color-text-muted);">📅 October 21, 2025</div>
    </div>

    <!-- Stats Grid -->
    <div class="admin-stats-grid" role="list">
        <div class="stat-card" role="listitem">
            <div class="stat-icon stat-icon-green" aria-hidden="true">💰</div>
            <div class="stat-info">
                <div class="stat-label">Total Revenue</div>
                <div class="stat-value">₹20.7L</div>
            </div>
        </div>
        <div class="stat-card" role="listitem">
            <div class="stat-icon stat-icon-blue" aria-hidden="true">✅</div>
            <div class="stat-info">
                <div class="stat-label">Confirmed</div>
                <div class="stat-value">4</div>
            </div>
        </div>
        <div class="stat-card" role="listitem">
            <div class="stat-icon stat-icon-purple" aria-hidden="true">🗺</div>
            <div class="stat-info">
                <div class="stat-label">Packages</div>
                <div class="stat-value">12</div>
            </div>
        </div>
        <div class="stat-card" role="listitem">
            <div class="stat-icon stat-icon-amber" aria-hidden="true">👥</div>
            <div class="stat-info">
                <div class="stat-label">Users</div>
                <div class="stat-value">10</div>
            </div>
        </div>
    </div>

    <!-- Recent Bookings -->
    <div class="admin-card">
        <div class="admin-card-header">
            <div class="admin-card-title">📋 Recent Bookings</div>
            <a href="<%= ResolveUrl("~/Pages/Admin/Bookings.aspx") %>" class="btn btn-secondary btn-sm">View All</a>
        </div>
        <div class="table-wrapper" style="border:none;box-shadow:none;border-radius:0;">
            <table class="data-table" role="grid" aria-label="Recent Bookings">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Guest</th>
                        <th scope="col">Tour</th>
                        <th scope="col">Date</th>
                        <th scope="col">Amount</th>
                        <th scope="col">Status</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="admin-table-row">
                        <td data-label="ID"><span class="booking-id">#BK001</span></td>
                        <td data-label="Guest">Sarah Mitchell</td>
                        <td data-label="Tour">Maldives Luxury Escape</td>
                        <td data-label="Date">2025-11-05</td>
                        <td data-label="Amount" style="font-weight:700;">₹1,78,500</td>
                        <td data-label="Status"><span class="status-badge status-confirmed">✓ Confirmed</span></td>
                    </tr>
                    <tr class="admin-table-row">
                        <td data-label="ID"><span class="booking-id">#BK002</span></td>
                        <td data-label="Guest">James Wilson</td>
                        <td data-label="Tour">Bali: Spirit &amp; Adventure</td>
                        <td data-label="Date">2025-10-15</td>
                        <td data-label="Amount" style="font-weight:700;">₹1,89,000</td>
                        <td data-label="Status"><span class="status-badge status-confirmed">✓ Confirmed</span></td>
                    </tr>
                    <tr class="admin-table-row">
                        <td data-label="ID"><span class="booking-id">#BK003</span></td>
                        <td data-label="Guest">David Chen</td>
                        <td data-label="Tour">Paris: Romance &amp; Art</td>
                        <td data-label="Date">2025-09-20</td>
                        <td data-label="Amount" style="font-weight:700;">₹2,52,000</td>
                        <td data-label="Status"><span class="status-badge status-completed">✓ Completed</span></td>
                    </tr>
                    <tr class="admin-table-row">
                        <td data-label="ID"><span class="booking-id">#BK004</span></td>
                        <td data-label="Guest">Jessica Taylor</td>
                        <td data-label="Tour">Dubai: Gold &amp; Dunes</td>
                        <td data-label="Date">2025-12-10</td>
                        <td data-label="Amount" style="font-weight:700;">₹2,14,200</td>
                        <td data-label="Status"><span class="status-badge status-pending">⏳ Pending</span></td>
                    </tr>
                    <tr class="admin-table-row">
                        <td data-label="ID"><span class="booking-id">#BK005</span></td>
                        <td data-label="Guest">Emma Clarke</td>
                        <td data-label="Tour">Japan: Tokyo to Kyoto</td>
                        <td data-label="Date">2025-11-20</td>
                        <td data-label="Amount" style="font-weight:700;">₹1,99,500</td>
                        <td data-label="Status"><span class="status-badge status-confirmed">✓ Confirmed</span></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

</asp:Content>
