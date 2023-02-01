--Alumno: Alberto  Junquera  Ramírez
--Bootcamp: Mobile

-- Query that returns the atribute name value of the active cars in KeepCoding.
	--model, brand and enterprise group names.
	--pursache date, license plate number, colour 
	--total kms, insurance company name and insurance policy number.


select  c.license_plate_number as License ,
		c.total_km as Km,
		c.purchased_dt as buy_date, 
		ip.insurance_policy_number as policy_number, 
		ic."name" as insurance_company ,
		cc.name as colour,
		cm."name"  as model,
		cb."name" as brand,
		eg."name" as group
		
from alberto_jr_ddl.cars c
join alberto_jr_ddl.car_insurance_policy ip 
on c.car_id = ip.car_id  

join alberto_jr_ddl.car_colors cc 
on c.color_id  = cc.color_id 

join alberto_jr_ddl.car_models cm 
on c.model_id  = cm.model_id 

join alberto_jr_ddl.car_brands cb 
on cm.brand_id  = cb.brand_id 

join alberto_jr_ddl.enterprise_groups eg 
on cb.enterprise_group_id  = eg.enterprise_group_id 

join alberto_jr_ddl.insurance_companies ic 
on ip.insurance_company_id = ic.insurance_company_id 

where c.dispose_dt = '4000-01-01'

order by ic.insurance_company_id asc;


