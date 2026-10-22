# Travel Plans – ASP.NET Web Forms Application

> **Demo Application** – No real data, payments, or authentication are implemented.

---

## Project Overview

Travel Plans is a fully responsive travel booking and tour management website built with **ASP.NET Web Forms** (.NET Framework 4.8). The application covers all 15 screens from the supplied Figma design reference, including a public-facing travel site, user dashboard, and an admin management panel.

---

## Technology Stack

| Layer | Technology |
|---|---|
| Framework | ASP.NET Web Forms (.NET Framework 4.8) |
| Language | C# |
| Frontend | HTML5, CSS3, Vanilla JavaScript |
| Layouts | ASP.NET Master Pages (`Site.Master`, `Admin.Master`) |
| Validation | Native ASP.NET Web Forms Validator Controls |
| Styling | Custom CSS (no Bootstrap, no jQuery) |
| Database | Standalone T-SQL schema (not connected) |

---

## Prerequisites

- Visual Studio 2022 (Community, Professional, or Enterprise)
- .NET Framework 4.8 (included with VS 2022)
- IIS Express (included with VS 2022)
- No SQL Server connection required to run the frontend

---

## Opening in Visual Studio

1. Open Visual Studio 2022
2. Go to **File → Open → Project/Solution**
3. Browse to `c:\Khushal figma\TravelPlans\`
4. Select `TravelPlans.sln` and click **Open**
5. Press **F5** or click **IIS Express** to run

The homepage loads at `http://localhost:{port}/` (IIS Express auto-assigns port).

---

## Project Structure

```
TravelPlans/
├── TravelPlans.sln              Solution file
├── TravelPlans.csproj           Project file
├── Web.config                   App configuration
├── Global.asax                  Application events
├── Default.aspx                 Home / Landing Page (Screen 1)
├── Site.Master                  Shared public layout
├── Admin.Master                 Admin layout
│
├── Pages/
│   ├── Authentication/
│   │   ├── SignIn.aspx           Screen 2 – Sign In
│   │   └── Register.aspx         Screen 15 – Register
│   ├── Tours/
│   │   ├── TourPackages.aspx     Screen 3 – Tour Packages
│   │   └── TourDetail.aspx       Screen 4 – Tour Detail
│   ├── Destinations/
│   │   └── Destinations.aspx     Screen 5 – Destinations
│   ├── Booking/
│   │   ├── BookingWizard.aspx    Screen 6 – Booking Wizard
│   │   └── PaymentSuccess.aspx   Screen 7 – Payment Confirmation
│   ├── User/
│   │   ├── Dashboard.aspx        Screen 8 – User Dashboard
│   │   ├── MyBookings.aspx       Screen 9 – My Bookings
│   │   └── SavedTours.aspx       Screen 10 – Saved Tours
│   └── Admin/
│       ├── Dashboard.aspx        Screen 11 – Admin Dashboard
│       ├── Packages.aspx         Screen 12 – Admin Packages
│       ├── Bookings.aspx         Screen 13 – Admin Bookings
│       └── Users.aspx            Screen 14 – Admin Users
│
├── Content/
│   ├── css/
│   │   ├── site.css              Design tokens, global styles
│   │   ├── components.css        Page-specific components
│   │   ├── responsive.css        Breakpoints & responsive rules
│   │   └── admin.css             Admin layout styles
│   └── js/
│       ├── site.js               Global JS interactions
│       └── booking.js            Booking wizard logic
│
├── Assets/
│   └── Images/                   All tour & destination images (from Figma)
│
└── Database/
    └── TravelPlansSchema.sql     Standalone SQL Server schema
```

---

## Implemented Screens

| # | Screen | File |
|---|---|---|
| 1 | Home / Landing Page | `Default.aspx` |
| 2 | Sign In | `Pages/Authentication/SignIn.aspx` |
| 3 | Tour Packages | `Pages/Tours/TourPackages.aspx` |
| 4 | Tour Detail | `Pages/Tours/TourDetail.aspx` |
| 5 | Destinations | `Pages/Destinations/Destinations.aspx` |
| 6 | Booking Wizard | `Pages/Booking/BookingWizard.aspx` |
| 7 | Payment Confirmation | `Pages/Booking/PaymentSuccess.aspx` |
| 8 | User Dashboard | `Pages/User/Dashboard.aspx` |
| 9 | My Bookings | `Pages/User/MyBookings.aspx` |
| 10 | Saved Tours / Wishlist | `Pages/User/SavedTours.aspx` |
| 11 | Admin Dashboard | `Pages/Admin/Dashboard.aspx` |
| 12 | Admin Packages | `Pages/Admin/Packages.aspx` |
| 13 | Admin Bookings | `Pages/Admin/Bookings.aspx` |
| 14 | Admin Users | `Pages/Admin/Users.aspx` |
| 15 | Register | `Pages/Authentication/Register.aspx` |

> **Note on Screen 15:** The Figma PDF lists 15 screens in its summary, with numbered pages 1–14. The 15th screen is the **Register** page, listed in the screens summary ("Register free") but not given a separate numbered page. It has been implemented as a complete registration form with full validation.

---

## ASP.NET Validation Controls Used

| Validator | Where Used |
|---|---|
| `RequiredFieldValidator` | Sign In (email, password), Register (all fields), Booking Wizard (dates, guest info, payment) |
| `RegularExpressionValidator` | Email format (Sign In, Register, Booking), Phone number, Card number, Expiry date |
| `CompareValidator` | Confirm Password vs Password (Register), Return Date after Travel Date |
| `RangeValidator` | Adults count (1–10), CVV (100–9999) |
| `CustomValidator` | Return date must be after travel date (server-side validation) |
| `ValidationSummary` | All forms — grouped error display at form top |

---

## Demonstration-Only Interactions

The following actions are **frontend demonstrations only**:

- **Sign In / Register** — Redirect to dashboard; no real auth check
- **Booking Wizard** — Generates a random demo booking reference
- **Payment** — No card data is stored or processed
- **Cancel Booking** — Updates UI badge only (no database change)
- **Admin Edit/Delete** — Confirms via browser dialog; row animation only
- **Wishlist Heart** — Toggles icon state in browser memory only

---

## No API or Database Connection

- No live database is connected
- No REST APIs are called
- No ADO.NET, Entity Framework, or AJAX data calls exist
- No connection string for application use is configured
- All displayed data is sample/demo data hardcoded in ASPX and code-behind files

---

## SQL Database Schema

Located at: `Database/TravelPlansSchema.sql`

This is a **standalone design artifact only**. It defines 14 tables:
`UserRoles`, `Users`, `Destinations`, `TourCategories`, `TourPackages`, `TourImages`, `TourItineraries`, `TourIncludes`, `RoomTypes`, `Bookings`, `BookingGuests`, `Payments`, `SavedTours`, `Reviews`

To inspect or test the schema:
1. Open SQL Server Management Studio
2. Connect to a local SQL Server instance
3. Open `Database/TravelPlansSchema.sql`
4. Execute (F5) — creates `TravelPlansDB` with all tables

**Do not connect this database to the application.** The frontend runs without it.

---

## Responsive Breakpoints

| Screen Size | Width | Layout |
|---|---|---|
| Mobile | ≤ 575px | Single column, stacked nav |
| Tablet | 576–991px | 2-column grids, collapsed nav |
| Desktop | ≥ 992px | Full multi-column layouts |

---

## Known Limitations

1. **Google Fonts** – Loaded via CDN; requires internet connection. Fallback: `Inter, sans-serif`
2. **No persistent state** – All interactions reset on page refresh
3. **Images** – Extracted from the Figma DOCX reference; some placeholder images used where exact images were unavailable
4. **Build environment** – Requires Visual Studio 2022 with .NET Framework 4.8 workload installed
5. **Screen 15** – Register page is implemented but not numbered in the Figma PDF (discrepancy documented above)

---

## Running the Application

```
1. Open TravelPlans.sln in Visual Studio 2022
2. Press Ctrl+F5 (Run without debugging)
3. Browser opens at http://localhost:{port}/
4. Navigate using the top navigation bar
5. Admin panel: http://localhost:{port}/Pages/Admin/Dashboard.aspx
```

---

*© 2025 Travel Plans – Demo Application*
