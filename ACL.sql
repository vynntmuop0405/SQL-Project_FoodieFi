--- RECURSION: ACL - Phân quyền truy cập hệ thống

-- Create table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100)
);

CREATE TABLE Groups (
    GroupID INT PRIMARY KEY,
    GroupName VARCHAR(100)
);

CREATE TABLE Roles (
    RoleID INT PRIMARY KEY,
    RoleName VARCHAR(100),
    ParentRoleID INT  -- cho phép role kế thừa từ role khác
);

CREATE TABLE UserGroup (
    UserID INT,
    GroupID INT
);

CREATE TABLE GroupRole (
    GroupID INT,
    RoleID INT
);
-- Insert dummies
-- USERS
INSERT INTO Employees(EmployeeID, EmployeeName) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

-- GROUPS
INSERT INTO Groups (GroupID, GroupName) VALUES
(1, 'Editors'),
(2, 'Viewers'),
(3, 'Admins');

-- ROLES
INSERT INTO Roles (RoleID, RoleName, ParentRoleID) VALUES
(1, 'Viewer', NULL),
(2, 'Editor', 1),
(3, 'Admin', 2),
(4, 'SuperAdmin', 3);

-- USER - GROUP mapping
INSERT INTO UserGroup (UserID, GroupID) VALUES
(1, 1),  -- Alice là Editor
(2, 2),  -- Bob là Viewer
(3, 3);  -- Charlie là Admin

-- GROUP - ROLE mapping
INSERT INTO GroupRole (GroupID, RoleID) VALUES
(1, 2),  -- Editors → Editor
(2, 1),  -- Viewers → Viewer
(3, 3);  -- Admins → Admin

