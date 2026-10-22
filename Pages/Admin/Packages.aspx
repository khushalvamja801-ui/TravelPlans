<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Packages.aspx.cs" Inherits="TravelPlans.Pages.Admin.Packages" MasterPageFile="~/Admin.Master" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">Admin Packages – Travel Plans</asp:Content>
<asp:Content ID="PageTitle" ContentPlaceHolderID="PageTitle" runat="server">Manage Packages</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="admin-page-header">
        <div>
            <div class="admin-page-title">Tour Packages</div>
            <div class="admin-page-sub">Manage all tour packages available on the platform.</div>
        </div>
        <button type="button" class="btn btn-primary" data-open-modal="addPackageModal">+ Add Package</button>
    </div>

    <!-- Search -->
    <div style="margin-bottom:1.5rem;display:flex;gap:1rem;flex-wrap:wrap;">
        <div class="search-input-wrap" style="flex:1;min-width:220px;">
            <span class="search-icon">🔍</span>
            <input type="text" id="adminSearch" class="search-input" placeholder="Search packages…" aria-label="Search packages" />
        </div>
    </div>

    <div class="admin-card">
        <div class="admin-card-header">
            <div class="admin-card-title">🗺 All Packages (7)</div>
        </div>
        <div class="table-wrapper" style="border:none;box-shadow:none;border-radius:0;">
            <table class="data-table mobile-card-table" role="grid" aria-label="Tour Packages">
                <thead>
                    <tr>
                        <th scope="col">PACKAGE</th>
                        <th scope="col">DESTINATION</th>
                        <th scope="col">CATEGORY</th>
                        <th scope="col">PRICE</th>
                        <th scope="col">ACTIONS</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="admin-table-row">
                        <td data-label="Package">
                            <div class="pkg-table-name">Maldives Luxury Escape</div>
                            <div class="pkg-table-sub">6 D / 5 N</div>
                        </td>
                        <td data-label="Destination">📍 Maldives</td>
                        <td data-label="Category"><span class="tour-badge badge-bestseller" style="position:static;font-size:0.7rem;">Beach</span></td>
                        <td data-label="Price"><span class="pkg-table-price">₹85,000</span></td>
                        <td data-label="Actions">
                            <div class="tbl-actions">
                                <button type="button" class="btn-icon btn-icon-edit" data-open-modal="editPackageModal" title="Edit">✏️</button>
                                <button type="button" class="btn-icon btn-icon-delete btn-admin-delete" data-name="Maldives Luxury Escape" title="Delete">🗑</button>
                            </div>
                        </td>
                    </tr>
                    <tr class="admin-table-row">
                        <td data-label="Package">
                            <div class="pkg-table-name">Paris: Romance &amp; Art</div>
                            <div class="pkg-table-sub">8 D / 7 N</div>
                        </td>
                        <td data-label="Destination">📍 Paris</td>
                        <td data-label="Category"><span class="tour-badge badge-featured" style="position:static;font-size:0.7rem;">City</span></td>
                        <td data-label="Price"><span class="pkg-table-price">₹1,20,000</span></td>
                        <td data-label="Actions">
                            <div class="tbl-actions">
                                <button type="button" class="btn-icon btn-icon-edit" data-open-modal="editPackageModal" title="Edit">✏️</button>
                                <button type="button" class="btn-icon btn-icon-delete btn-admin-delete" data-name="Paris: Romance &amp; Art" title="Delete">🗑</button>
                            </div>
                        </td>
                    </tr>
                    <tr class="admin-table-row">
                        <td data-label="Package">
                            <div class="pkg-table-name">Bali: Spirit &amp; Adventure</div>
                            <div class="pkg-table-sub">7 D / 6 N</div>
                        </td>
                        <td data-label="Destination">📍 Bali</td>
                        <td data-label="Category"><span class="tour-badge badge-trending" style="position:static;font-size:0.7rem;">Adventure</span></td>
                        <td data-label="Price"><span class="pkg-table-price">₹45,000</span></td>
                        <td data-label="Actions">
                            <div class="tbl-actions">
                                <button type="button" class="btn-icon btn-icon-edit" data-open-modal="editPackageModal" title="Edit">✏️</button>
                                <button type="button" class="btn-icon btn-icon-delete btn-admin-delete" data-name="Bali: Spirit &amp; Adventure" title="Delete">🗑</button>
                            </div>
                        </td>
                    </tr>
                    <tr class="admin-table-row">
                        <td data-label="Package">
                            <div class="pkg-table-name">Santorini: Caldera Dreams</div>
                            <div class="pkg-table-sub">6 D / 5 N</div>
                        </td>
                        <td data-label="Destination">📍 Santorini</td>
                        <td data-label="Category"><span class="tour-badge badge-luxury" style="position:static;font-size:0.7rem;">Honeymoon</span></td>
                        <td data-label="Price"><span class="pkg-table-price">₹1,40,000</span></td>
                        <td data-label="Actions">
                            <div class="tbl-actions">
                                <button type="button" class="btn-icon btn-icon-edit" data-open-modal="editPackageModal" title="Edit">✏️</button>
                                <button type="button" class="btn-icon btn-icon-delete btn-admin-delete" data-name="Santorini: Caldera Dreams" title="Delete">🗑</button>
                            </div>
                        </td>
                    </tr>
                    <tr class="admin-table-row">
                        <td data-label="Package">
                            <div class="pkg-table-name">Japan: Tokyo to Kyoto</div>
                            <div class="pkg-table-sub">9 D / 8 N</div>
                        </td>
                        <td data-label="Destination">📍 Tokyo &amp; Kyoto</td>
                        <td data-label="Category"><span class="tour-badge badge-featured" style="position:static;font-size:0.7rem;">Culture</span></td>
                        <td data-label="Price"><span class="pkg-table-price">₹95,000</span></td>
                        <td data-label="Actions">
                            <div class="tbl-actions">
                                <button type="button" class="btn-icon btn-icon-edit" data-open-modal="editPackageModal" title="Edit">✏️</button>
                                <button type="button" class="btn-icon btn-icon-delete btn-admin-delete" data-name="Japan: Tokyo to Kyoto" title="Delete">🗑</button>
                            </div>
                        </td>
                    </tr>
                    <tr class="admin-table-row">
                        <td data-label="Package">
                            <div class="pkg-table-name">Dubai: Gold &amp; Dunes</div>
                            <div class="pkg-table-sub">5 D / 4 N</div>
                        </td>
                        <td data-label="Destination">📍 Dubai</td>
                        <td data-label="Category"><span class="tour-badge badge-hot" style="position:static;font-size:0.7rem;">Luxury</span></td>
                        <td data-label="Price"><span class="pkg-table-price">₹68,000</span></td>
                        <td data-label="Actions">
                            <div class="tbl-actions">
                                <button type="button" class="btn-icon btn-icon-edit" data-open-modal="editPackageModal" title="Edit">✏️</button>
                                <button type="button" class="btn-icon btn-icon-delete btn-admin-delete" data-name="Dubai: Gold &amp; Dunes" title="Delete">🗑</button>
                            </div>
                        </td>
                    </tr>
                    <tr class="admin-table-row">
                        <td data-label="Package">
                            <div class="pkg-table-name">Swiss Alps Grand Tour</div>
                            <div class="pkg-table-sub">8 D / 7 N</div>
                        </td>
                        <td data-label="Destination">📍 Switzerland</td>
                        <td data-label="Category"><span class="tour-badge badge-luxury" style="position:static;font-size:0.7rem;">Adventure</span></td>
                        <td data-label="Price"><span class="pkg-table-price">₹1,65,000</span></td>
                        <td data-label="Actions">
                            <div class="tbl-actions">
                                <button type="button" class="btn-icon btn-icon-edit" data-open-modal="editPackageModal" title="Edit">✏️</button>
                                <button type="button" class="btn-icon btn-icon-delete btn-admin-delete" data-name="Swiss Alps Grand Tour" title="Delete">🗑</button>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Add Package Modal -->
    <div id="addPackageModal" class="modal-overlay" role="dialog" aria-modal="true" aria-labelledby="addPkgTitle">
        <div class="modal pkg-modal" style="max-width:560px;">
            <div class="modal-header">
                <h2 class="modal-title" id="addPkgTitle">➕ Add New Package</h2>
                <button type="button" class="modal-close" data-close-modal aria-label="Close">✕</button>
            </div>
            <div class="alert alert-info" style="margin-bottom:1rem;">
                <span>ℹ</span><span>Demo mode – form submission does not save data.</span>
            </div>
            <div class="form-row-2">
                <div class="form-group">
                    <label class="form-label">PACKAGE NAME</label>
                    <input type="text" class="form-control" placeholder="e.g. Thailand Beach Bliss" />
                </div>
                <div class="form-group">
                    <label class="form-label">DESTINATION</label>
                    <input type="text" class="form-control" placeholder="e.g. Phuket, Thailand" />
                </div>
            </div>
            <div class="form-row-2">
                <div class="form-group">
                    <label class="form-label">CATEGORY</label>
                    <select class="form-control">
                        <option>Beach</option><option>City</option><option>Adventure</option>
                        <option>Culture</option><option>Honeymoon</option><option>Luxury</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">DURATION</label>
                    <input type="text" class="form-control" placeholder="e.g. 7 D / 6 N" />
                </div>
            </div>
            <div class="form-row-2">
                <div class="form-group">
                    <label class="form-label">PRICE (₹)</label>
                    <input type="number" class="form-control" placeholder="85000" />
                </div>
                <div class="form-group">
                    <label class="form-label">DISCOUNT %</label>
                    <input type="number" class="form-control" placeholder="24" />
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-close-modal>Cancel</button>
                <button type="button" class="btn btn-primary" data-close-modal onclick="alert('Demo: Package would be saved in a live system.')">Save Package</button>
            </div>
        </div>
    </div>

    <!-- Edit Package Modal -->
    <div id="editPackageModal" class="modal-overlay" role="dialog" aria-modal="true" aria-labelledby="editPkgTitle">
        <div class="modal pkg-modal" style="max-width:560px;">
            <div class="modal-header">
                <h2 class="modal-title" id="editPkgTitle">✏️ Edit Package</h2>
                <button type="button" class="modal-close" data-close-modal aria-label="Close">✕</button>
            </div>
            <div class="alert alert-info" style="margin-bottom:1rem;">
                <span>ℹ</span><span>Demo mode – changes are not persisted.</span>
            </div>
            <div class="form-group">
                <label class="form-label">PACKAGE NAME</label>
                <input type="text" class="form-control" value="Maldives Luxury Escape" />
            </div>
            <div class="form-row-2">
                <div class="form-group">
                    <label class="form-label">PRICE (₹)</label>
                    <input type="number" class="form-control" value="85000" />
                </div>
                <div class="form-group">
                    <label class="form-label">DISCOUNT %</label>
                    <input type="number" class="form-control" value="24" />
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-close-modal>Cancel</button>
                <button type="button" class="btn btn-primary" data-close-modal onclick="alert('Demo: Changes would be saved in a live system.')">Update Package</button>
            </div>
        </div>
    </div>

</asp:Content>
