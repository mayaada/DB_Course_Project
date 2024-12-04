# Custom Cosmetics E-Commerce Database Project

## Overview
This project focuses on the design and implementation of a relational database system for **Giella**, a custom cosmetics company. The database supports the company's core business process: online purchase and personalization of cosmetic products. It ensures efficient data management, streamlines operations, and enhances customer experience.

## About Giella
**Giella** is a New York-based cosmetics company offering personalized makeup products tailored to individual customer preferences and skin types. With its innovative approach, Giella serves a diverse audience through both online and physical stores, focusing on creating a unique customer experience.

## Objectives
The main goal of this project was to design and implement a database that:
- Manages customer data, product inventories, and sales.
- Supports personalization of products, including customizable attributes.
- Tracks orders and optimizes the online purchasing process.
- Facilitates reporting and data analysis for business insights.

## Key Features
### Database Design
- **Entity-Relationship Model (ERD)**:
  - Customers: Stores details like name, email, and purchase history.
  - Products: Manages product catalog with attributes like name, price, stock, and customization options.
  - Orders: Tracks order details, including product IDs, quantities, and total costs.
  - Shipping: Records delivery details, including address and shipping status.
- **Normalization**: The database was normalized to ensure data integrity and avoid redundancy.

### Core Business Process
- **Personalized Product Selection**:
  - Customers can select products and customize attributes (e.g., colors, ingredients).
- **Order Management**:
  - Supports cart creation, order placement, and payment processing.
- **Shipping Integration**:
  - Manages delivery details and supports various shipping options.
  
### Reports and Insights
- Generate sales reports to analyze revenue trends.
- Track inventory levels to manage stock and avoid shortages.
- Provide customer insights to identify preferences and improve marketing.

## Technologies Used
- **Database**: SQL for database design and implementation.
- **Tools**:
  - MySQL Workbench for schema design and testing.
  - Custom queries for data analysis and reporting.
  - Microsoft Power BI for Dashboards.

## Challenges Addressed
1. **Customization Complexity**: Built flexible schemas to support dynamic product attributes.
2. **Data Security**: Designed user authentication and role-based access to protect customer information.
3. **Scalability**: Ensured the database can handle growth in customer base and product catalog.

## How to Use
1. Clone the repository:
   ```bash
   git clone <repository-url>
   ```
2. Set up the database:
   - Import the SQL schema file into your SQL server.
   - Populate the database with sample data using the provided scripts.
3. Run sample queries:
   - Use the provided SQL scripts to test functionalities like order tracking and sales reporting.

## Authors
- **Maya Adar**
- **Adi Akriv**
- **Tamar Yosef Hai**
