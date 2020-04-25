CREATE TABLE state_data(
	id INTEGER PRIMARY KEY,
	state VARCHAR(20),
	abbreviation VARCHAR(2),
	population INTEGER,
	income_2018 INTEGER,
	income_2017 INTEGER,
	income_2016 INTEGER,
	avg_vantage_score INTEGER,
	avg_credit_card_balance INTEGER
);

CREATE TABLE lending_data(
	id INTEGER PRIMARY KEY,
	loan_amount INTEGER,
	term INTEGER,
	int_rate DECIMAL,
	issue_date DATE,
	purpose TEXT,
	zip_code VARCHAR(5),
	address_state VARCHAR(2),
	annual_income INTEGER,
	home_ownership TEXT
);