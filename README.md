# Superstore Sales Analysis Demonstration
Identifying the patterns in our products, regions, categories and customer segments for efficiency and profit optimization with SQL
With the constant advancement of technology and innovation, having clear cut databases and possessing departments to breathe life into interpreting them will set you in the top realm of efficiency. Execution is important but we need great inputs to yield even better outputs. There is a necessity to catch up with the growing demand and fierce competition in the market. That is why we need leverage insights to provide more value to the customer as value is the key to everything.

Our analysis in question will be carried with Excel, SQL and finally Power BI. Excel will serve as first repository for our data, SQL. will give meaning to our data and Power BI will give a clear face to our data. The following sales performance analysis will follow the 6 steps of Data Analysis which are: Ask, Prepare, Process, Analyze, Share and Act.

# Step 1: Ask

In this step, we will define the business problem given to us which was interpreted as "What are the best products, regions, categories and customer segments for the Superstore to target or avoid in order to increase profitability?"

Business objectives:

• How can we optimize our profits?

• What are the emerging trends that we can we identify?

• How can we take these insights to build recommendations?

Deliverables:

• A clear summary of the business objectives.

• A full documentation of all the data cleaning, manipulation and analysis.

• A dashboard with visualizations and main outcomes.

• Recommendations based on our insights and analysis.

# Step 2: Prepare

In this phase, we will identify and assess the features of our Superstore Dataset:

• The data is publicly available through Kaggle under
https://www.kaggle.com/datasets/vivek468/superstore-dataset-final.

• It comes with 9995 rows with 9994 being pure data and the other one row being the column headers. It contains data recorded between the 3rd of January 2014 (the first order date) to the 5th of January 2018 (the last shipping date). (The last order date is the 30th of December 2017, so we will instead use the order dates range to represent our 4 years of business)

• It contains the data of 793 customers.

• The data contains the 21 columns namely; Row ID, Order ID, Order Date, Ship Date, Ship Mode, Customer ID, Customer Name, Segment, Postal Code, City, State, Country, Region, Product ID, Category, Sub-Category, Product Name, Sales, Quantity, Discount and Profit

• The only limitations of our dataset that I could mention is that the most recent data point was almost 6 years ago. So our data is not current. However, our data is quite reliable, original, comprehensive and is cited.

Moving on to the data processing, we will use Excel for cleaning

# Step 3: Process

We will process and clean our data with the help of Excel as the file is already a CSV file so a look through of our data with Excel can be ideal to:

• Observe our data

• Check for missing data with the help of conditional formating

• Remove duplicate rows

• Correctly format columns for easy SQL analysis

While exploring our dataset, we can perform and notice the following;

• Our data looks correct and consistent. Everything looks well structured for further analysis it just needs a little editing.

• With the use of conditional formating, which is a technique to highlight certain values of interest, we set our new formatting rule to be 'Format only cells that contain'. Then we added on it to be "Format only cells with': Blanks'. Our color of choice was yellow. Then we zoomed out to have a birds eye view of our dataset. We can confirm that our dataset contains no missing values. Another method would be to go to the 'Data' section of Excel and hit filters and filter rows for blanks.

• With the command 'remove duplicates', there was no instance where the data was duplicated with all the exact parameters for a customer in all columns. So all the rows had some variety to it hence returning no duplicate data for our data set.

• Finally, made sure Order Date and Ship Date were well formatted by formating it to dates (which they already were) and formatted the Sales and Profits columns from numbers to currencies since we our talking about financials. The discount column was not formated to currency as in this context, the discount is more of a percentage value. So discount will later be formatted from number to percentage by just multiplying it by 100.

Now our dataset is ideal for analysis to discover relationships, trends and patterns that will give us a competitive edge and completely solve our business objectives.

# Step 4: Analyze

For the analysis part, we will string out the most important components of our data to answer our business objectives.

Let's load our data into SQL and check the first 5 rows to make sure it imported well.
