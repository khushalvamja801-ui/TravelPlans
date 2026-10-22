-- =============================================
-- TRAVEL PLANS - DATABASE SCHEMA
-- SQL Server T-SQL Script
-- Standalone schema only – NOT connected to the application
-- =============================================

USE master;
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'TravelPlansDB')
    CREATE DATABASE TravelPlansDB;
GO

USE TravelPlansDB;
GO

-- =============================================
-- 1. USER ROLES
-- =============================================
CREATE TABLE UserRoles (
    RoleId      INT           NOT NULL IDENTITY(1,1),
    RoleName    NVARCHAR(50)  NOT NULL,
    Description NVARCHAR(255) NULL,
    CONSTRAINT PK_UserRoles PRIMARY KEY (RoleId),
    CONSTRAINT UQ_UserRoles_RoleName UNIQUE (RoleName)
);
GO

INSERT INTO UserRoles (RoleName, Description) VALUES
    ('User',  'Standard registered traveller'),
    ('Admin', 'Platform administrator');
GO

-- =============================================
-- 2. USERS
-- =============================================
CREATE TABLE Users (
    UserId        INT            NOT NULL IDENTITY(1,1),
    RoleId        INT            NOT NULL DEFAULT 1,
    FirstName     NVARCHAR(100)  NOT NULL,
    LastName      NVARCHAR(100)  NOT NULL,
    Email         NVARCHAR(255)  NOT NULL,
    PhoneNumber   NVARCHAR(20)   NULL,
    PasswordHash  NVARCHAR(512)  NOT NULL,
    Country       NVARCHAR(100)  NULL,
    IsActive      BIT            NOT NULL DEFAULT 1,
    JoinedAt      DATETIME2      NOT NULL DEFAULT GETUTCDATE(),
    LastLoginAt   DATETIME2      NULL,
    CONSTRAINT PK_Users      PRIMARY KEY (UserId),
    CONSTRAINT UQ_Users_Email UNIQUE (Email),
    CONSTRAINT FK_Users_Roles FOREIGN KEY (RoleId) REFERENCES UserRoles(RoleId)
);
GO

CREATE INDEX IX_Users_Email    ON Users(Email);
CREATE INDEX IX_Users_RoleId   ON Users(RoleId);
CREATE INDEX IX_Users_IsActive ON Users(IsActive);
GO

-- =============================================
-- 3. DESTINATIONS
-- =============================================
CREATE TABLE Destinations (
    DestinationId   INT            NOT NULL IDENTITY(1,1),
    Name            NVARCHAR(150)  NOT NULL,
    Country         NVARCHAR(100)  NOT NULL,
    Region          NVARCHAR(100)  NULL,
    ShortDesc       NVARCHAR(500)  NULL,
    LongDesc        NVARCHAR(MAX)  NULL,
    HeroImagePath   NVARCHAR(500)  NULL,
    IsActive        BIT            NOT NULL DEFAULT 1,
    CONSTRAINT PK_Destinations PRIMARY KEY (DestinationId)
);
GO

INSERT INTO Destinations (Name, Country, Region, ShortDesc) VALUES
    ('Maldives',     'Maldives',    'Indian Ocean', 'Tropical paradise of 1,200 islands'),
    ('Paris',        'France',      'Western Europe','City of Light and romance'),
    ('Santorini',    'Greece',      'Aegean Sea',   'Iconic blue domes on volcanic caldera'),
    ('Bali',         'Indonesia',   'Southeast Asia','Island of the Gods'),
    ('Tokyo',        'Japan',       'East Asia',    'Fusion of tradition and ultra-modernity'),
    ('Dubai',        'UAE',         'Middle East',  'City of superlatives in the desert'),
    ('Switzerland',  'Switzerland', 'Central Europe','Majestic Alps and pristine lakes'),
    ('New York',     'USA',         'North America','The city that never sleeps');
GO

-- =============================================
-- 4. TOUR CATEGORIES
-- =============================================
CREATE TABLE TourCategories (
    CategoryId   INT           NOT NULL IDENTITY(1,1),
    Name         NVARCHAR(100) NOT NULL,
    Icon         NVARCHAR(20)  NULL,
    CONSTRAINT PK_TourCategories PRIMARY KEY (CategoryId),
    CONSTRAINT UQ_TourCategories_Name UNIQUE (Name)
);
GO

INSERT INTO TourCategories (Name, Icon) VALUES
    ('Beach',     '🏖'),
    ('City',      '🏙'),
    ('Adventure', '🏔'),
    ('Culture',   '🏯'),
    ('Honeymoon', '💑'),
    ('Luxury',    '💎');
GO

-- =============================================
-- 5. TOUR PACKAGES
-- =============================================
CREATE TABLE TourPackages (
    PackageId       INT             NOT NULL IDENTITY(1,1),
    DestinationId   INT             NOT NULL,
    CategoryId      INT             NOT NULL,
    Title           NVARCHAR(200)   NOT NULL,
    ShortDesc       NVARCHAR(500)   NULL,
    LongDesc        NVARCHAR(MAX)   NULL,
    DurationDays    INT             NOT NULL,
    DurationNights  INT             NOT NULL,
    BasePrice       DECIMAL(12,2)   NOT NULL,
    DiscountPercent DECIMAL(5,2)    NOT NULL DEFAULT 0,
    MaxTravellers   INT             NOT NULL DEFAULT 20,
    BadgeLabel      NVARCHAR(50)    NULL,   -- e.g. BESTSELLER, LUXURY
    HeroImagePath   NVARCHAR(500)   NULL,
    IsActive        BIT             NOT NULL DEFAULT 1,
    CreatedAt       DATETIME2       NOT NULL DEFAULT GETUTCDATE(),
    UpdatedAt       DATETIME2       NOT NULL DEFAULT GETUTCDATE(),
    CONSTRAINT PK_TourPackages           PRIMARY KEY (PackageId),
    CONSTRAINT FK_TourPackages_Dest      FOREIGN KEY (DestinationId) REFERENCES Destinations(DestinationId),
    CONSTRAINT FK_TourPackages_Category  FOREIGN KEY (CategoryId)    REFERENCES TourCategories(CategoryId),
    CONSTRAINT CK_TourPackages_Price     CHECK (BasePrice > 0),
    CONSTRAINT CK_TourPackages_Discount  CHECK (DiscountPercent BETWEEN 0 AND 100)
);
GO

CREATE INDEX IX_TourPackages_DestinationId ON TourPackages(DestinationId);
CREATE INDEX IX_TourPackages_CategoryId    ON TourPackages(CategoryId);
CREATE INDEX IX_TourPackages_IsActive      ON TourPackages(IsActive);
GO

-- =============================================
-- 6. TOUR IMAGES
-- =============================================
CREATE TABLE TourImages (
    ImageId     INT           NOT NULL IDENTITY(1,1),
    PackageId   INT           NOT NULL,
    ImagePath   NVARCHAR(500) NOT NULL,
    AltText     NVARCHAR(300) NULL,
    SortOrder   INT           NOT NULL DEFAULT 0,
    IsHero      BIT           NOT NULL DEFAULT 0,
    CONSTRAINT PK_TourImages           PRIMARY KEY (ImageId),
    CONSTRAINT FK_TourImages_Package   FOREIGN KEY (PackageId) REFERENCES TourPackages(PackageId) ON DELETE CASCADE
);
GO

-- =============================================
-- 7. TOUR ITINERARIES
-- =============================================
CREATE TABLE TourItineraries (
    ItineraryId INT            NOT NULL IDENTITY(1,1),
    PackageId   INT            NOT NULL,
    DayNumber   INT            NOT NULL,
    Title       NVARCHAR(200)  NOT NULL,
    Description NVARCHAR(MAX)  NULL,
    CONSTRAINT PK_TourItineraries         PRIMARY KEY (ItineraryId),
    CONSTRAINT FK_TourItineraries_Package FOREIGN KEY (PackageId) REFERENCES TourPackages(PackageId) ON DELETE CASCADE,
    CONSTRAINT UQ_TourItinerary_Day       UNIQUE (PackageId, DayNumber)
);
GO

-- =============================================
-- 8. TOUR INCLUDES
-- =============================================
CREATE TABLE TourIncludes (
    IncludeId   INT           NOT NULL IDENTITY(1,1),
    PackageId   INT           NOT NULL,
    ItemName    NVARCHAR(200) NOT NULL,
    IsIncluded  BIT           NOT NULL DEFAULT 1,  -- 0 = excluded
    Icon        NVARCHAR(20)  NULL,
    CONSTRAINT PK_TourIncludes         PRIMARY KEY (IncludeId),
    CONSTRAINT FK_TourIncludes_Package FOREIGN KEY (PackageId) REFERENCES TourPackages(PackageId) ON DELETE CASCADE
);
GO

-- =============================================
-- 9. ROOM TYPES
-- =============================================
CREATE TABLE RoomTypes (
    RoomTypeId      INT             NOT NULL IDENTITY(1,1),
    Name            NVARCHAR(100)   NOT NULL,
    Description     NVARCHAR(300)   NULL,
    PriceAddon      DECIMAL(12,2)   NOT NULL DEFAULT 0,
    CONSTRAINT PK_RoomTypes PRIMARY KEY (RoomTypeId)
);
GO

INSERT INTO RoomTypes (Name, Description, PriceAddon) VALUES
    ('Standard', 'Comfortable garden or pool view room', 0),
    ('Deluxe',   'Spacious sea-facing deluxe room',       10000),
    ('Suite',    'Private overwater villa with plunge pool', 25000);
GO

-- =============================================
-- 10. BOOKINGS
-- =============================================
CREATE TABLE Bookings (
    BookingId       INT             NOT NULL IDENTITY(1,1),
    BookingRef      NVARCHAR(20)    NOT NULL,
    UserId          INT             NOT NULL,
    PackageId       INT             NOT NULL,
    RoomTypeId      INT             NOT NULL DEFAULT 1,
    TravelDate      DATE            NOT NULL,
    ReturnDate      DATE            NOT NULL,
    NumAdults       INT             NOT NULL DEFAULT 1,
    NumChildren     INT             NOT NULL DEFAULT 0,
    BaseAmount      DECIMAL(12,2)   NOT NULL,
    GSTAmount       DECIMAL(12,2)   NOT NULL,
    TotalAmount     DECIMAL(12,2)   NOT NULL,
    Status          NVARCHAR(20)    NOT NULL DEFAULT 'Pending',  -- Pending/Confirmed/Completed/Cancelled
    SpecialRequests NVARCHAR(MAX)   NULL,
    CreatedAt       DATETIME2       NOT NULL DEFAULT GETUTCDATE(),
    UpdatedAt       DATETIME2       NOT NULL DEFAULT GETUTCDATE(),
    CONSTRAINT PK_Bookings              PRIMARY KEY (BookingId),
    CONSTRAINT UQ_Bookings_Ref          UNIQUE (BookingRef),
    CONSTRAINT FK_Bookings_User         FOREIGN KEY (UserId)     REFERENCES Users(UserId),
    CONSTRAINT FK_Bookings_Package      FOREIGN KEY (PackageId)  REFERENCES TourPackages(PackageId),
    CONSTRAINT FK_Bookings_RoomType     FOREIGN KEY (RoomTypeId) REFERENCES RoomTypes(RoomTypeId),
    CONSTRAINT CK_Bookings_Dates        CHECK (ReturnDate > TravelDate),
    CONSTRAINT CK_Bookings_Adults       CHECK (NumAdults BETWEEN 1 AND 10),
    CONSTRAINT CK_Bookings_Children     CHECK (NumChildren BETWEEN 0 AND 8),
    CONSTRAINT CK_Bookings_Status       CHECK (Status IN ('Pending','Confirmed','Completed','Cancelled'))
);
GO

CREATE INDEX IX_Bookings_UserId    ON Bookings(UserId);
CREATE INDEX IX_Bookings_PackageId ON Bookings(PackageId);
CREATE INDEX IX_Bookings_Status    ON Bookings(Status);
CREATE INDEX IX_Bookings_TravelDate ON Bookings(TravelDate);
GO

-- =============================================
-- 11. BOOKING GUESTS
-- =============================================
CREATE TABLE BookingGuests (
    GuestId     INT            NOT NULL IDENTITY(1,1),
    BookingId   INT            NOT NULL,
    FirstName   NVARCHAR(100)  NOT NULL,
    LastName    NVARCHAR(100)  NOT NULL,
    Email       NVARCHAR(255)  NOT NULL,
    Phone       NVARCHAR(20)   NULL,
    IsPrimary   BIT            NOT NULL DEFAULT 0,
    CONSTRAINT PK_BookingGuests         PRIMARY KEY (GuestId),
    CONSTRAINT FK_BookingGuests_Booking FOREIGN KEY (BookingId) REFERENCES Bookings(BookingId) ON DELETE CASCADE
);
GO

-- =============================================
-- 12. PAYMENTS
-- =============================================
CREATE TABLE Payments (
    PaymentId       INT             NOT NULL IDENTITY(1,1),
    BookingId       INT             NOT NULL,
    PaymentMethod   NVARCHAR(50)    NOT NULL DEFAULT 'Card',
    TransactionRef  NVARCHAR(100)   NULL,
    Amount          DECIMAL(12,2)   NOT NULL,
    Currency        NVARCHAR(5)     NOT NULL DEFAULT 'INR',
    Status          NVARCHAR(20)    NOT NULL DEFAULT 'Pending',
    PaidAt          DATETIME2       NULL,
    CreatedAt       DATETIME2       NOT NULL DEFAULT GETUTCDATE(),
    CONSTRAINT PK_Payments          PRIMARY KEY (PaymentId),
    CONSTRAINT FK_Payments_Booking  FOREIGN KEY (BookingId) REFERENCES Bookings(BookingId),
    CONSTRAINT CK_Payments_Status   CHECK (Status IN ('Pending','Completed','Failed','Refunded'))
);
GO

-- =============================================
-- 13. SAVED TOURS (WISHLIST)
-- =============================================
CREATE TABLE SavedTours (
    SavedId     INT       NOT NULL IDENTITY(1,1),
    UserId      INT       NOT NULL,
    PackageId   INT       NOT NULL,
    SavedAt     DATETIME2 NOT NULL DEFAULT GETUTCDATE(),
    CONSTRAINT PK_SavedTours         PRIMARY KEY (SavedId),
    CONSTRAINT UQ_SavedTours         UNIQUE (UserId, PackageId),
    CONSTRAINT FK_SavedTours_User    FOREIGN KEY (UserId)    REFERENCES Users(UserId) ON DELETE CASCADE,
    CONSTRAINT FK_SavedTours_Package FOREIGN KEY (PackageId) REFERENCES TourPackages(PackageId) ON DELETE CASCADE
);
GO

CREATE INDEX IX_SavedTours_UserId ON SavedTours(UserId);
GO

-- =============================================
-- 14. REVIEWS
-- =============================================
CREATE TABLE Reviews (
    ReviewId    INT            NOT NULL IDENTITY(1,1),
    PackageId   INT            NOT NULL,
    UserId      INT            NOT NULL,
    BookingId   INT            NULL,
    Rating      TINYINT        NOT NULL,
    ReviewText  NVARCHAR(MAX)  NULL,
    CreatedAt   DATETIME2      NOT NULL DEFAULT GETUTCDATE(),
    IsApproved  BIT            NOT NULL DEFAULT 0,
    CONSTRAINT PK_Reviews           PRIMARY KEY (ReviewId),
    CONSTRAINT FK_Reviews_Package   FOREIGN KEY (PackageId) REFERENCES TourPackages(PackageId),
    CONSTRAINT FK_Reviews_User      FOREIGN KEY (UserId)    REFERENCES Users(UserId),
    CONSTRAINT FK_Reviews_Booking   FOREIGN KEY (BookingId) REFERENCES Bookings(BookingId),
    CONSTRAINT CK_Reviews_Rating    CHECK (Rating BETWEEN 1 AND 5)
);
GO

CREATE INDEX IX_Reviews_PackageId ON Reviews(PackageId);
GO

-- =============================================
-- SAMPLE SEED DATA
-- =============================================
INSERT INTO Users (RoleId, FirstName, LastName, Email, PhoneNumber, PasswordHash, Country) VALUES
    (1, 'Khushal', 'Vamja', 'vamja801@gmail.com', '+91 98765 43210', 'vamja@801', 'India'),
    (2, 'Admin', 'Khushal', 'khushal801@gmail.com', '+91 98765 00000', 'khushal@801', 'India');
GO

INSERT INTO TourPackages (DestinationId, CategoryId, Title, ShortDesc, DurationDays, DurationNights, BasePrice, DiscountPercent, BadgeLabel, HeroImagePath) VALUES
    (1, 1, 'Maldives Luxury Escape', 'Indulge in private overwater bungalows and turquoise lagoons', 6, 5, 85000.00, 24.0, 'BESTSELLER', '~/Assets/Images/image16.png'),
    (2, 2, 'Paris: Romance & Art', 'The City of Light with iconic Eiffel Tower and Louvre', 8, 7, 120000.00, 24.0, 'TOP RATED', '~/Assets/Images/image18.png'),
    (3, 3, 'Bali: Spirit & Adventure', 'Emerald rice terraces, ancient temples and surfing', 7, 6, 45000.00, 27.0, 'POPULAR', '~/Assets/Images/image19.png'),
    (4, 5, 'Santorini: Caldera Dreams', 'Whitewashed villages and world-famous caldera sunsets', 6, 5, 140000.00, 21.0, 'LUXURY', '~/Assets/Images/image21.png'),
    (5, 4, 'Japan: Tokyo to Kyoto', 'High-speed bullet train, neon streets and ancient shrines', 9, 8, 95000.00, 26.0, 'CULTURE', '~/Assets/Images/image8.png'),
    (6, 6, 'Dubai: Gold & Dunes', 'Futuristic skyscrapers, desert safari and luxury shopping', 5, 4, 68000.00, 24.0, 'DEAL', '~/Assets/Images/image24.png'),
    (7, 3, 'Swiss Alps Grand Tour', 'Scenic mountain railways, Glacier 3000 and Alpine lakes', 8, 7, 165000.00, 18.0, 'ADVENTURE', '~/Assets/Images/image30.png');
GO

-- =============================================
-- END OF SCHEMA
-- =============================================
PRINT 'TravelPlansDB schema created successfully with sample seed data.';
GO
    