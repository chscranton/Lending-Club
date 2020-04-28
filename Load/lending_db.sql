CREATE TABLE state_data(
	id SERIAL PRIMARY KEY,
	state VARCHAR(20),
	abbreviation VARCHAR(2),
	population INTEGER,
	average_income_2018 INTEGER,
	average_income_2017 INTEGER,
	average_income_2016 INTEGER,
	average_vantagescore INTEGER,
	average_credit_card_balance INTEGER
);

CREATE TABLE lending_data(
	id INTEGER PRIMARY KEY,
	loan_amnt INTEGER,
	term INTEGER,
	int_rate DECIMAL,
	issue_date TEXT,
	purpose TEXT,
	zip_code VARCHAR(5),
	state VARCHAR(2),
	annual_inc INTEGER,
	home_ownership TEXT
);