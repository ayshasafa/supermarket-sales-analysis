import pandas as pd
import matplotlib.pyplot as plt

# ==========================================
# 1. LOAD DATA
# ==========================================

# Read the CSV file
df = pd.read_csv("supermarket_sales.csv")

# Display the first 5 rows
print(df.head())

# ==========================================
# 2. DATA QUALITY CHECK
# ==========================================

print("Total rows:", len(df))
print("Total columns:", len(df.columns))

# Check for missing values
print(df.isnull().sum())

# ==========================================
# 3. REVENUE ANALYSIS
# ==========================================

# Calculate total sales revenue
total_revenue = df["Total_Sales_NOK"].sum()

print("Total Revenue:", total_revenue, "NOK")

# ==========================================
# 4. PRODUCT ANALYSIS
# ==========================================

# Calculate sales revenue for each product
product_sales = df.groupby("Product")["Total_Sales_NOK"].sum()

# Sort products from highest to lowest sales
product_sales = product_sales.sort_values(ascending=False)

print(product_sales)

# ==========================================
# 5. PRODUCT INSIGHTS
# ==========================================

# Find the highest-selling product
top_product = product_sales.idxmax()
top_product_sales = product_sales.max()

print("Top Selling Product:", top_product)
print("Top Product Sales:", top_product_sales, "NOK")

# Create a bar chart for product sales
plt.figure(figsize=(8, 5))

product_sales.plot(kind="bar")

plt.title("Sales by Product")
plt.xlabel("Product")
plt.ylabel("Sales (NOK)")
plt.xticks(rotation=45)

plt.tight_layout()

plt.savefig("product_sales.png", dpi=300)

plt.show()

# ==========================================
# 6. PRODUCT QUANTITY ANALYSIS
# ==========================================

# Calculate total quantity sold for each product
product_quantity = df.groupby("Product")["Quantity"].sum()

# Sort products from highest to lowest quantity
product_quantity = product_quantity.sort_values(ascending=False)

print("Quantity Sold by Product:")
print(product_quantity)

# ==========================================
# 7. PRODUCT QUANTITY INSIGHTS
# ==========================================

# Find the most sold product by quantity
most_sold_product = product_quantity.idxmax()
most_sold_quantity = product_quantity.max()

print("Most Sold Product:", most_sold_product)
print("Quantity Sold:", most_sold_quantity)

# ==========================================
# 8. CATEGORY ANALYSIS
# ==========================================

# Calculate total sales for each category
category_sales = df.groupby("Category")["Total_Sales_NOK"].sum()

# Sort categories from highest to lowest sales
category_sales = category_sales.sort_values(ascending=False)

print("Sales by Category:")
print(category_sales)

# ==========================================
# 9. CATEGORY INSIGHTS
# ==========================================

# Find the highest-selling category
top_category = category_sales.idxmax()
top_category_sales = category_sales.max()

print("Top Selling Category:", top_category)
print("Top Category Sales:", top_category_sales, "NOK")

# Create a bar chart for category sales
plt.figure(figsize=(8, 5))

category_sales.plot(kind="bar")

plt.title("Sales by Category")
plt.xlabel("Category")
plt.ylabel("Sales (NOK)")
plt.xticks(rotation=45)

plt.tight_layout()

plt.savefig("category_sales.png", dpi=300)

plt.show()


# ==========================================
# 10. PAYMENT ANALYSIS
# ==========================================

# Count sales by payment method
payment_counts = df["Payment"].value_counts()

# ==========================================
# 11. PAYMENT PERCENTAGES
# ==========================================

# Calculate payment method percentages
payment_percentages = (payment_counts / len(df)) * 100

print("Payment Method Percentages:")
print(payment_percentages.round(1))

print("Sales by Payment Method:")
print(payment_counts)

# Create a bar chart for payment methods
plt.figure(figsize=(8, 5))

payment_counts.plot(kind="bar")

plt.title("Sales by Payment Method")
plt.xlabel("Payment Method")
plt.ylabel("Number of Transactions")
plt.xticks(rotation=0)

plt.tight_layout()

plt.savefig("payment_methods.png", dpi=300)

plt.show()

# ==========================================
# 12. AVERAGE SALE ANALYSIS
# ==========================================

# Calculate average sale value
average_sale = df["Total_Sales_NOK"].mean()

print("Average Sale Value:", round(average_sale, 2), "NOK")

# ==========================================
# 13. FINAL DATA QUALITY CHECKS
# ==========================================

# Check for duplicate rows
duplicate_rows = df.duplicated().sum()

print("Duplicate Rows:", duplicate_rows)

# Check data types of each column

# Convert Date column to datetime format
df["Date"] = pd.to_datetime(df["Date"])

# Data types check
print("Data Types:")
print(df.dtypes)

# ==========================================
# 14. MONTHLY SALES ANALYSIS
# ==========================================

# Create a month column
df["Month"] = df["Date"].dt.to_period("M")

# Calculate sales for each month
monthly_sales = df.groupby("Month")["Total_Sales_NOK"].sum()

print("Monthly Sales:")
print(monthly_sales)

# ==========================================
# 15. MONTHLY SALES INSIGHTS
# ==========================================

# Find the month with the highest sales
best_month = monthly_sales.idxmax()
best_month_sales = monthly_sales.max()

print("Highest Sales Month:", best_month)
print("Highest Monthly Sales:", best_month_sales, "NOK")


# Create a bar chart for monthly sales
monthly_sales.plot(kind="bar")

plt.title("Monthly Sales")
plt.xlabel("Month")
plt.ylabel("Sales (NOK)")
plt.xticks(rotation=0)

plt.tight_layout()

plt.savefig("monthly_sales.png", dpi=300)


plt.show()