<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="TravelPlans.Pages.Admin.Users" MasterPageFile="~/Admin.Master" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">Admin Users – Travel Plans</asp:Content>
<asp:Content ID="PageTitle" ContentPlaceHolderID="PageTitle" runat="server">Manage Users</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="admin-page-header">
        <div>
            <div class="admin-page-title">Users</div>
            <div class="admin-page-sub">Manage all registered users on the platform.</div>
        </div>
    </div>

    <!-- User Stats -->
    <div class="user-stats-grid" style="margin-bottom:1.5rem;">
        <div class="stat-card">
            <div class="stat-icon stat-icon-blue">👥</div>
            <div class="stat-info">
                <div class="stat-label">Total Users</div>
                <div class="stat-value">10</div>
            </div>
        </div>
        <div class="stat-card">
            <div class="stat-icon stat-icon-green">✅</div>
            <div class="stat-info">
                <div class="stat-label">Active</div>
                <div class="stat-value">9</div>
            </div>
        </div>
        <div class="stat-card">
            <div class="stat-icon stat-icon-amber">💰</div>
            <div class="stat-info">
                <div class="stat-label">Total Spent</div>
                <div class="stat-value">₹33.5L</div>
            </div>
        </div>
        <div class="stat-card">
            <div class="stat-icon stat-icon-purple">📊</div>
            <div class="stat-info">
                <div class="stat-label">Avg Bookings</div>
                <div class="stat-value">3.6</div>
            </div>
        </div>
    </div>

    <!-- Search -->
    <div style="margin-bottom:1.25rem;">
        <div class="search-input-wrap">
            <span class="search-icon">🔍</span>
            <input type="text" id="adminSearch" class="search-input" placeholder="Search users by name or email…" aria-label="Search users" />
        </div>
    </div>

    <div class="admin-card">
        <div class="admin-card-header">
            <div class="admin-card-title">👤 All Users (10)</div>
        </div>
        <div class="table-wrapper" style="border:none;box-shadow:none;border-radius:0;">
            <table class="data-table mobile-card-table" role="grid" aria-label="Users Table">
                <thead>
                    <tr>
                        <th scope="col">USER</th>
                        <th scope="col">COUNTRY</th>
                        <th scope="col">BOOKINGS</th>
                        <th scope="col">SPENT</th>
                        <th scope="col">JOINED</th>
                        <th scope="col">STATUS</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="admin-table-row">
                        <td data-label="User"><div style="font-weight:700;">James Wilson</div><div style="font-size:0.72rem;color:var(--color-text-muted);">james.wilson@gmail.com</div></td>
                        <td data-label="Country">🇬🇧 United Kingdom</td>
                        <td data-label="Bookings" style="font-weight:600;">4</td>
                        <td data-label="Spent" style="font-weight:700;color:var(--color-primary);">₹3,80,000</td>
                        <td data-label="Joined">2024-03-15</td>
                        <td data-label="Status"><span class="status-badge status-active">● Active</span></td>
                    </tr>
                    <tr class="admin-table-row">
                        <td data-label="User"><div style="font-weight:700;">Sarah Mitchell</div><div style="font-size:0.72rem;color:var(--color-text-muted);">sarah.mitchell@outlook.com</div></td>
                        <td data-label="Country">🇺🇸 United States</td>
                        <td data-label="Bookings" style="font-weight:600;">7</td>
                        <td data-label="Spent" style="font-weight:700;color:var(--color-primary);">₹6,20,000</td>
                        <td data-label="Joined">2024-01-08</td>
                        <td data-label="Status"><span class="status-badge status-active">● Active</span></td>
                    </tr>
                    <tr class="admin-table-row">
                        <td data-label="User"><div style="font-weight:700;">Emma Clarke</div><div style="font-size:0.72rem;color:var(--color-text-muted);">emma.clarke@gmail.com</div></td>
                        <td data-label="Country">🇦🇺 Australia</td>
                        <td data-label="Bookings" style="font-weight:600;">3</td>
                        <td data-label="Spent" style="font-weight:700;color:var(--color-primary);">₹2,95,000</td>
                        <td data-label="Joined">2023-11-22</td>
                        <td data-label="Status"><span class="status-badge status-active">● Active</span></td>
                    </tr>
                    <tr class="admin-table-row">
                        <td data-label="User"><div style="font-weight:700;">Michael Brown</div><div style="font-size:0.72rem;color:var(--color-text-muted);">michael.brown@yahoo.com</div></td>
                        <td data-label="Country">🇩🇪 Germany</td>
                        <td data-label="Bookings" style="font-weight:600;">2</td>
                        <td data-label="Spent" style="font-weight:700;color:var(--color-primary);">₹2,30,000</td>
                        <td data-label="Joined">2024-05-10</td>
                        <td data-label="Status"><span class="status-badge status-inactive">● Inactive</span></td>
                    </tr>
                    <tr class="admin-table-row">
                        <td data-label="User"><div style="font-weight:700;">Jessica Taylor</div><div style="font-size:0.72rem;color:var(--color-text-muted);">jessica.taylor@gmail.com</div></td>
                        <td data-label="Country">🇨🇦 Canada</td>
                        <td data-label="Bookings" style="font-weight:600;">5</td>
                        <td data-label="Spent" style="font-weight:700;color:var(--color-primary);">₹4,45,000</td>
                        <td data-label="Joined">2024-02-28</td>
                        <td data-label="Status"><span class="status-badge status-active">● Active</span></td>
                    </tr>
                    <tr class="admin-table-row">
                        <td data-label="User"><div style="font-weight:700;">David Chen</div><div style="font-size:0.72rem;color:var(--color-text-muted);">david.chen@gmail.com</div></td>
                        <td data-label="Country">🇸🇬 Singapore</td>
                        <td data-label="Bookings" style="font-weight:600;">8</td>
                        <td data-label="Spent" style="font-weight:700;color:var(--color-primary);">₹7,20,000</td>
                        <td data-label="Joined">2023-09-14</td>
                        <td data-label="Status"><span class="status-badge status-active">● Active</span></td>
                    </tr>
                    <tr class="admin-table-row">
                        <td data-label="User"><div style="font-weight:700;">Sophie Anderson</div><div style="font-size:0.72rem;color:var(--color-text-muted);">sophie.anderson@outlook.com</div></td>
                        <td data-label="Country">🇸🇪 Sweden</td>
                        <td data-label="Bookings" style="font-weight:600;">1</td>
                        <td data-label="Spent" style="font-weight:700;color:var(--color-primary);">₹85,000</td>
                        <td data-label="Joined">2024-06-01</td>
                        <td data-label="Status"><span class="status-badge status-active">● Active</span></td>
                    </tr>
                    <tr class="admin-table-row">
                        <td data-label="User"><div style="font-weight:700;">Robert Martinez</div><div style="font-size:0.72rem;color:var(--color-text-muted);">robert.martinez@gmail.com</div></td>
                        <td data-label="Country">🇪🇸 Spain</td>
                        <td data-label="Bookings" style="font-weight:600;">3</td>
                        <td data-label="Spent" style="font-weight:700;color:var(--color-primary);">₹2,75,000</td>
                        <td data-label="Joined">2024-04-17</td>
                        <td data-label="Status"><span class="status-badge status-active">● Active</span></td>
                    </tr>
                    <tr class="admin-table-row">
                        <td data-label="User"><div style="font-weight:700;">Olivia Thompson</div><div style="font-size:0.72rem;color:var(--color-text-muted);">olivia.thompson@email.com</div></td>
                        <td data-label="Country">🇺🇸 United States</td>
                        <td data-label="Bookings" style="font-weight:600;">2</td>
                        <td data-label="Spent" style="font-weight:700;color:var(--color-primary);">₹1,95,000</td>
                        <td data-label="Joined">2024-07-20</td>
                        <td data-label="Status"><span class="status-badge status-active">● Active</span></td>
                    </tr>
                    <tr class="admin-table-row">
                        <td data-label="User"><div style="font-weight:700;">Lucas Dubois</div><div style="font-size:0.72rem;color:var(--color-text-muted);">lucas.dubois@email.fr</div></td>
                        <td data-label="Country">🇫🇷 France</td>
                        <td data-label="Bookings" style="font-weight:600;">1</td>
                        <td data-label="Spent" style="font-weight:700;color:var(--color-primary);">₹1,10,000</td>
                        <td data-label="Joined">2024-08-01</td>
                        <td data-label="Status"><span class="status-badge status-active">● Active</span></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

</asp:Content>
