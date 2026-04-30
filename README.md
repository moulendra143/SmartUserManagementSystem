# 🚀 SmartUser Management System

[![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=java&logoColor=white)](https://www.oracle.com/java/)
[![Servlet](https://img.shields.io/badge/Servlet-4.0-blue?style=for-the-badge)](https://jakarta.ee/specifications/servlet/4.0/)
[![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Maven](https://img.shields.io/badge/Maven-C71A36?style=for-the-badge&logo=apache-maven&logoColor=white)](https://maven.apache.org/)

A premium, enterprise-grade User Management System built with **Java Servlets**, **JSP**, and **MySQL**. This system features a stunning dark-themed UI, secure authentication, and real-time analytics.

---

## ✨ Key Features

*   **🔒 Secure Authentication**: Robust login and registration system with session-based security.
*   **👤 Profile Management**: Users can update their personal details and upload profile images.
*   **🛡️ Role-Based Access Control (RBAC)**: Distinct permissions for `ADMIN` and `USER` roles.
*   **📊 Dynamic Admin Dashboard**: Real-time statistics, user distribution charts (using Chart.js), and system health metrics.
*   **👥 User Management**: Full CRUD operations for administrators, including search, filter, and CSV export.
*   **🎨 Premium UI/UX**: Modern, responsive design using Inter and Outfit fonts, Font Awesome icons, and smooth transitions.
*   **📁 Secure File Handling**: Integrated profile image upload with UUID-based unique naming.

---

## 🛠️ Technology Stack

| Layer | Technology |
| :--- | :--- |
| **Frontend** | JSP, Vanilla CSS, JavaScript, Font Awesome |
| **Backend** | Java Servlets (4.0), JDBC |
| **Database** | MySQL 8.0+ |
| **Build Tool** | Maven |
| **Charts** | Chart.js |

---

## 📸 Screenshots

> [!TIP]
> This system is designed for high performance and visual excellence.

### Admin Dashboard
*Dynamic charts and system overview*

### User Management
*Advanced filtering and pagination*

---

## 🚀 Getting Started

### Prerequisites
*   Java JDK 21
*   Apache Tomcat 9.0+
*   MySQL Server 8.0+
*   Maven 3.8+

### Database Setup
1.  Execute the [schema.sql](sql/schema.sql) file in your MySQL environment.
2.  Update the database credentials in [DBConnection.java](src/com/app/util/DBConnection.java).

```sql
CREATE DATABASE userdb;
-- Default Admin: admin / admin123
```

### Installation & Deployment
1.  Clone the repository:
    ```bash
    git clone https://github.com/moulendra143/SmartUserManagementSystem.git
    ```
2.  Build the project:
    ```bash
    mvn clean package
    ```
3.  Deploy the generated `.war` file to your Tomcat `webapps` folder.

---

## 📂 Project Structure

```
SmartUserManagementSystem/
├── src/main/java/com/app/        # Java Source Code
│   ├── controller/               # Servlets
│   ├── dao/                      # Data Access Objects
│   ├── model/                    # Data Models
│   ├── filter/                   # Security Filters
│   └── util/                     # Utilities (DB, Files)
├── WebContent/                   # Web Assets
│   ├── jsp/                      # JSP Pages
│   ├── css/                      # Stylesheets
│   └── WEB-INF/                  # Configuration & Libs
├── sql/                          # Database Scripts
└── pom.xml                       # Maven Configuration
```

---

## 🛡️ License
Distributed under the MIT License. See `LICENSE` for more information.

---

## 👨‍💻 Author
**Moulendra** - [GitHub Profile](https://github.com/moulendra143)

---
*Built with ❤️ for a smarter user management experience.*
