# Lending-Club

### UT Data Analytics Bootcamp ETL challenge

We will be taking [Lending Club Loan Data](https://www.kaggle.com/wendykan/lending-club-loan-data) found on Kaggle and trimming it down to the essential columns (i.e. loan amount, address state, etc.) and transforming the state column to use full state names rather than abbreviations. We will then be scrapping tables that contain median income by state from [wikipedia.com](https://en.wikipedia.org/wiki/List_of_U.S._states_and_territories_by_income) and credit score by state from [thebalance.com](https://www.thebalance.com/the-average-credit-score-by-state-4161310). Next, we will upload all of the tables into a PostgreSQL database. We will then merge all of the tables on the state values.
