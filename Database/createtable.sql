CREATE TABLE Users (
    UserId INT IDENTITY(1,1) PRIMARY KEY, -- Auto-incrementing primary key
    Username NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(255) NOT NULL,
    UserType NVARCHAR(50) NOT NULL CHECK (UserType IN ('admin', 'owner', 'manager')),
    CreatedAt DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt DATETIME2 DEFAULT CURRENT_TIMESTAMP
);