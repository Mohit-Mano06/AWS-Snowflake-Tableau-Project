select * from tableau_dataset

select region,count(*) from tableau_dataset group by region;

// creating copy of original table
create table energy_consumption as
select * from tableau_dataset;


select * from energy_consumption;

select income_level,count(*) from energy_consumption group by income_level;


// increasing energy consumption by 10% for low income_level
update energy_consumption
set monthly_usage_kwh = monthly_usage_kwh*1.1
where income_level = 'Low'

// increasing energy consumption by 20% for middle income_level
update energy_consumption
set monthly_usage_kwh = monthly_usage_kwh*1.2
where income_level = 'Middle'


// increasing energy consumption by 30% for high income_level
update energy_consumption
set monthly_usage_kwh = monthly_usage_kwh*1.3
where income_level = 'High'

select * from energy_consumption;


// decreasing cost saving by 10% for low income_level
update energy_consumption
set cost_savings_usd = cost_savings_usd*0.9
where income_level = 'Low'

// decreasing cost saving by 20% for middle income_level
update energy_consumption
set cost_savings_usd = cost_savings_usd*0.8
where income_level = 'Middle'


// decreasing cost saving by 30% for high income_level
update energy_consumption
set cost_savings_usd = cost_savings_usd*0.7
where income_level = 'High'


select * from energy_consumption;