# Enterprise User Management System

A premium user management system built using Java Servlets, JSP, and MySQL.

## Features
- **Authentication**: Secure login and registration with validation.
- **Session Protection**: All pages (except login/register) are protected by a session filter.
- **Role-Based Access**: Separate dashboards for Admins and Users. Admin-only pages are protected by a role filter.
- **CRUD Operations**: Admins can view, edit, and delete users.
- **Search & Filter**: Search users by name/email and filter by role.
- **Pagination**: Large datasets are paginated for better performance.
- **Profile Image Upload**: Users can upload and update their profile pictures.
- **Analytics**: Dashboard with user statistics and growth charts.
- **Export**: Export user data to CSV.
- **Error Handling**: Custom 404, 500, and 403 error pages.

## Tech Stack
- **Backend**: Java Servlets, JDBC
- **Frontend**: JSP, Vanilla CSS (Premium Dark Theme)
- **Database**: MySQL
- **Library**: Jakarta EE (Servlet 5.0+), MySQL Connector/J

## Database Setup
1. Execute the SQL script in `sql/schema.sql` on your MySQL server.
2. Update `src/com/app/util/DBConnection.java` with your database credentials.

## Default Admin Credentials
- **Username**: admin
- **Password**: admin123

## How to Run
1. Configure your Tomcat server.
2. Add the project to Tomcat.
3. Start the server and navigate to `http://localhost:8080/SmartUserManagementSystem/`.
