# Lending-Club

## UT Data Analytics Bootcamp ETL challenge

### Proposal
We will be taking [Lending Club Loan Data](https://www.kaggle.com/wendykan/lending-club-loan-data) found on Kaggle and trimming it down to the essential columns (i.e. loan amount, address state, etc.) and transforming the state column to use full state names rather than abbreviations. We will then be scrapping tables that contain median income by state from [wikipedia.com](https://en.wikipedia.org/wiki/List_of_U.S._states_and_territories_by_income) and credit score by state from [thebalance.com](https://www.thebalance.com/the-average-credit-score-by-state-4161310). Next, we will upload all of the tables into a PostgreSQL database. We will then merge all of the tables on the state values.

## Final Report

### Extract

**Kaggle:**
We downloaded a large csv file from kaggle.com that contained data from Lending Club and used pandas to read it into a dataframe using the pd.read_csv function.

**Web Scraping:**

*  State Demographic Data - Using wikipedia, we sourced two state demographic data tables 1.) state population, abbreviations, and 2.) average annual income per state. The two data tables were originally html formatted and read into python using the pd.read_html function. 

* Credit Score Data - It was determined that data relevant to the original data set should include credit and average credit card debit info by region.  Doing a web search found this data on the balance.com.  It was in a tabular format by state.  Using beautiful soup and the requests library we retrieved the HTML, then used Beautiful Soup methods to get the table rows.  We then tested extracting the text data from a single row, then applied that method in a loop over the whole table which created a list of lists containing the data we needed.  This was easily converted to a data frame and exported to a csv for use in the transform step.
	
### Transform

**Kaggle:**

After reading in the original csv to pandas, 9 columns of interest were selected. Data transformation mostly of formatting changes. The word ‘months’ was stripped from each row in the ‘term’ column, the date in the issue_date column was changed from %b-%Y to %m-%Y, and the annual income column was changed from float to int. In order to be uploaded to github, the file needed to be compressed, so compression=gzip was used in pandas to zip the cleaned data file and upload to github.

**Web Scraping:** 
* State Demographic Data - Once the html table data was read into pandas, we then had to create a “tables” variable so we could index through the numerous tables and find the one we wanted. Next we set the data frame columns and created a copy using the “.copy” function. The copy function was necessary so that we could manipulate column headers and reset our index. Following this we then renamed the column headers to have uniform naming conventions (i.e. removed spaces, changed wording, and made all lower case). After the columns were renamed we then merged all the web scraped tables. Lastly, we checked the data types for our columns and noticed that currency was an object so we removed the dollar sign, commas, and then cast it as an integer. Once all this was completed we then exported it to a csv for loading. 

### Load

We created a PostgreSQL database called lending_db. We chose Postgres because it is a relational database and all of our data sources were tabular. Within this database we created a lending_data table with columns that matched our Kaggle csv file (clean_data_final.csv.gz) and a state_data table with columns that matched our webscrapped csv file (combined_state_finance_data.csv) and an additional id column to use as the primary key (we didn’t need to make one for the lending_data table as it already had an id column). We then read the transformed CSVs into Dataframes, making sure to uncompress our gz file. Finally we used pandas to load the data into the tables. We confirmed that the data had been added to the database by querying both tables.
