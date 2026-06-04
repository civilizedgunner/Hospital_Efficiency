/* Calculating the revenue per minute for each financial class from the total revenue and total 
visit duration */
SELECT
	financial_class,
	sum(total_revenue) AS revenue,
	count(patient_id) AS patients,
	round(avg(total_revenue), 2) AS avg_revenue,
	sum(total_visit_duration) AS duration,
	round(avg(total_visit_duration), 2) AS avg_duration,
	round((sum(total_revenue) * 1.0 / sum(total_visit_duration)), 2) AS revenue_per_min
FROM hospital_efficiency
GROUP BY financial_class
ORDER BY revenue_per_min DESC;

/* Calculating the revenue per minute for each doctor type */
SELECT
	doctor_type,
	sum(total_revenue) AS revenue,
	count(patient_id) AS patients,
	round(avg(total_revenue), 2) AS avg_revenue,
	sum(total_visit_duration) AS total_duration,
	round(avg(total_visit_duration), 2) AS 	avg_duration,
	round(avg(pre_consultation_delay), 2) AS avg_pre_consultation_delay,
	round(avg(consultation_and_processing_time), 2) AS avg_consultation_processing_time,
	round((sum(total_revenue) * 1.0 / sum(total_visit_duration)), 2) AS revenue_per_min
FROM hospital_efficiency 
GROUP BY doctor_type
ORDER BY revenue_per_min DESC;