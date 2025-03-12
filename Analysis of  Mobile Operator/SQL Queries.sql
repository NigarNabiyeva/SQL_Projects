-- 1. Abonentlərin yaş qrupuna görə və cinsiyyətə görə bölgüsünü göstər:
--    Yaş qrupları aşağıdakı şəkildədi
--    18 və aşağı
--    19-30
--    31-50
--    51 və yuxarı
--    Ekrana yaş aralığı,cins və say haqqında informasiyalar çıxsın.
select gender,
       count(*)as count,
       case
            when months_between(sysdate,birth_date)/12 <= 18 then '18 və aşağı'
            when months_between(sysdate,birth_date)/12 between 19 and 30 then '19-30'
            when months_between(sysdate,birth_date)/12 between 31 and 50 then '31-50'
            else '51 və yuxarı'
        end as age_group
from subscribers
group by gender, 
         case
            when months_between(sysdate,birth_date)/12 <= 18 then '18 və aşağı'
            when months_between(sysdate,birth_date)/12 between 19 and 30 then '19-30'
            when months_between(sysdate,birth_date)/12 between 31 and 50 then '31-50'
            else '51 və yuxarı'
         end;
         
         
--2.Hər abonent üçün son ödəniş tarixini və məbləğini göstər: 
--   Ekrana Ad, soyad, son ödəniş tarixi, məbləği və ödənişin üsulu haqqında informasiyalar çıxsın.
select x.name,
       x.surname,
       x.payment_date as last_payment_date,
       x.amount as last_amount,
       x.payment_method
from ( select s.name,
       s.surname,
       p.payment_date,
       p.amount,
       pt.name as payment_method,
       row_number() over(partition by s.subscribers_id order by p.payment_date desc, p.amount desc)as rn
      from subscribers s
      left join payments p on p.subscribers_id = s.subscribers_id
      left join payment_method_type pt on pt.payment_type_id = p.payment_type_id ) x
where rn = 1;


-- 3.Aktiv xidmətlər üzrə abonentlərin sayını və ümumi ödəniş məbləğini göstər:
--    Ekrana xidmətin adı,abonentlərin sayını və ümumi ödəniş məbləği haqqında informasiyalar çıxsın. 
select s.service_name,
       count(distinct p.subscribers_id) as count_subscribers,
       sum(p.amount) as sum_amount
from services s
join calls c on s.service_id = c.service_id
join payments p on c.caller_id = p.subscribers_id
where s.service_id in (select service_id from services where tariff_id in 
                      (select tariff_id from tariff_informations where status = 'ACTIVE'))
group by s.service_name
order by 2,3;


-- 4.Hər abonent üçün edilən zənglərin sayını və ümumi zəng müddətini göstər:
--    Ekrana ad, soyad, abonent üçün edilən zənglərin sayını, ümumi zəng müddətini, zəngin tipi haqqında informasiyalar çıxsın.
select s.name,
       s.surname,
       count(c.call_id) count_call,
       sum(c.call_duration) sum_call_duration,
       c.call_type
from subscribers s
left join calls c on c.caller_id = s.subscribers_id
group by s.name, s.surname, c.call_type
order by 3,4;


--5.Hər abonent üçün tarifə görə aylıq ödədikləri məbləği və zənglərin sayını göstər:
--    Ekrana ad, soyad,tarifə görə aylıq ödədikləri məbləğ və zənglərin sayı haqqında informasiyalar çıxsın. 
select s.name,
       s.surname,
       count(c.call_id) count_call,
       sum(t.monthly_subscription) sum_monthly_subscription
from subscribers s
left join calls c on c.caller_id = s.subscribers_id
left join services sv on c.service_id = sv.service_id
left join tariff_informations t on t.tariff_id = sv.tariff_id
group by s.name, s.surname
order by 3,4;


--6.Zənglərin növünə görə abonentlərin sayını və ümumi zəng müddətini göstər:
select ct.name,
       count(distinct c.caller_id) count_subscribers,
       sum(c.call_duration) sum_call_duration
from calls c
join call_type ct on ct.call_type_id = c.call_type_id
group by  ct.name
order by 2,3;


--7.Hər tarif üzrə abonentlərin orta yaşını göstər:
select t.tariff_id,
       round(avg(months_between(sysdate,s.birth_date)/12),2)avg_age
from subscribers s
join calls c on s.subscribers_id = c.caller_id
join services sv on c.service_id = sv.service_id
join tariff_informations t on sv.tariff_id = t.tariff_id
group  by t.tariff_id
order by 1;


--8.Son 6 ayda edilən ödənişlərin məbləğini və xidmətlərin sayını abonentlər üzrə göstər.
--    Ekrana abonentin adı, abonentin soyadı, xidmətlərin sayı və 6 ayda edilən ödənişlərin məbləği haqqında informasiyalar çıxsın.
select s.name,
       s.surname,
       count(distinct sv.service_id) count_services,
       sum(p.amount) last_6_months_amount
from subscribers s
left join payments p on s.subscribers_id = p.subscribers_id 
left join calls c on s.subscribers_id = c.caller_id
left join services sv on c.service_id = sv.service_id
where p.payment_date >= add_months(sysdate, -6)
group by s.name, s.surname
order by 3,4;


--9.Hər şikayət növü üzrə həll olunma müddətinin orta dəyərini və şikayət sayını göstər:
select ct.complaint_type_name,
       count(csr.complaint_id) count_complaint,
       round(avg(csr.resolution_date - csr.submission_date), 2) avg_resolution_time_day
from complaints_and_support_requests csr
left join complaint_type ct on csr.complaint_type_id = ct.complaint_type_id
group by ct.complaint_type_name
order by 2;


--10. Hər abonent üçün son 12 ayda göndərilən SMS-lərin sayını və SMS məzmununu göstər:
select s.name,
       s.surname,
       count(si.sms_id) count_sms_last_12_months,
       listagg(si.sms_content, '/') sms_contents
from subscribers s
left join sms_informations si on s.subscribers_id = si.sender_id
where si.sms_date >= add_months(sysdate, -12) 
group by s.name, s.surname
order by 3;


--11.Hər abonent üçün edilən zənglərin ümumi müddətini və ödəniş məlumatlarını göstər:    
--   Ekrana abonentin adı, abonentin soyadı, zənglərin ümumi müddətini ödəniş məlumatları haqqında informasiyalar çıxsın. 
select s.name,
       s.surname,
       sum(p.amount) sum_amount,
       sum(c.call_duration) sum_call_duration
from subscribers s
left join calls c on s.subscribers_id = c.caller_id
left join payments p on s.subscribers_id = p.subscribers_id
group by s.name, s.surname
order by 4 nulls last;

 
--12. Hər tarif üzrə abonentlərin aylıq ödədikləri məbləğin orta dəyərini və zənglərin sayını göstər:
--   Ekrana tarif adı, abonentlərin aylıq ödədikləri məbləğin orta dəyəri və zənglərin sayı haqqında informasiyalar çıxsın. 
select t.tariff_name,
       round(avg(t.monthly_subscription), 2) avg_monthly_subscription,
       count(c.call_id)count_call
from tariff_informations t
join services sv on t.tariff_id = sv.tariff_id
join calls c on sv.service_id = c.service_id
group by t.tariff_name
order by 2,3;


--13. Hər abonent üçün son 12 ayda göndərilən SMS-lərin məzmununu və göndərilən SMS növlərini göstər:
--   Ekrana abonentin adı, soyadı, son 12 ayda göndərilən SMS-lərin məzmununu və göndərilən SMS növləri haqqında informasiyalar çıxsın.  
select s.name,
       s.surname,
       si.sms_content,
       st.name sms_type
from subscribers s
join sms_informations si on s.subscribers_id = si.sender_id
join sms_types st on si.sms_type_id = st.sms_type_id
where si.sms_date >= add_months(sysdate, -12)
order by 1,2;
    
     
-- 14. Hər abonent üçün son 6 ayda edilən ödənişlərin məbləğini və xidmətlərin sayını göstər:
--   Ekrana abonentin adı, soyadı, son 6 ayda edilən ödənişlərin məbləğini və xidmətlərin sayı haqqında informasiyalar çıxsın.
select s.name,
       s.surname,
       sum(p.amount) sum_amount_last_6_months,
       count(distinct sv.service_id) count_service
from subscribers s
left join payments p on s.subscribers_id = p.subscribers_id 
left join calls c on s.subscribers_id = c.caller_id
left join services sv on c.service_id = sv.service_id
where p.payment_date >= add_months(sysdate, -6)
group by s.name, s.surname
order by 3,4;


-- 15. Hər abonent üçün ödənişlər və şikayətlərin məbləğini göstər:
--   Ekrana abonentin adı, soyadı, hər abonent üçün ödənişlər və şikayətlərin sayı haqqında informasiyalar çıxsın. 
select s.name,
       s.surname,
       sum(p.amount) sum_amount,
       count(distinct csr.complaint_id) count_complaint
from subscribers s
left join payments p on s.subscribers_id = p.subscribers_id
left join complaints_and_support_requests csr on s.subscribers_id = csr.subscribers_id
group by s.name, s.surname
order by 3,4;


-- 16. Hər tarif üzrə abonentlərin yaş qruplarına görə və aylıq ödədikləri məbləğin orta dəyərini göstər:
--     Ekrana tarifin adı, yaş qrupları, aylıq ödədikləri məbləğin orta dəyəri haqqında informasiyalar çıxsın.   
select t.tariff_name,
       case
            when months_between(sysdate, s.birth_date)/12 <= 18 then '18 və aşağı'
            when months_between(sysdate, s.birth_date)/12 between 19 and 30 then '19-30'
            when months_between(sysdate, s.birth_date)/12 between 31 and 50 then '31-50'
            else '51 və yuxarı'
       end as age_group,
    round(avg(t.monthly_subscription), 2) as avg_monthly_subscription
from tariff_informations t
left join services sv on t.tariff_id = sv.tariff_id
left join calls c on sv.service_id = c.service_id
left join subscribers s on c.caller_id = s.subscribers_id
group by t.tariff_name, 
         case
            when months_between(sysdate, s.birth_date)/12 <= 18 then '18 və aşağı'
            when months_between(sysdate, s.birth_date)/12 between 19 and 30 then '19-30'
            when months_between(sysdate, s.birth_date)/12 between 31 and 50 then '31-50'
            else '51 və yuxarı'
         end
order by t.tariff_name;


-- 17. Hər abonentin ümumi ödədiyi məbləği və onların ödədikləri məbləğin tariflərin ortalama ödəmə məbləğindən yüksək olub 
--     olmadığını göstərən sorğu:
select s.subscribers_id,
       s.name,
       s.surname,
       sum(p.amount) sum_payment,
      (select avg(monthly_subscription) from tariff_informations) avg_tariff_payment,
       case 
            when sum(p.amount) > (select avg(monthly_subscription) from tariff_informations) then 'YES'
            else 'NO'
       end as above_avg_payment
from subscribers s
join payments p on s.subscribers_id = p.subscribers_id
group by  s.subscribers_id, s.name, s.surname
order by 1;

       
-- 18. Hər abonentin zənglərin ümumi müddətini və onların zəng müddətinin abonentin yaş qrupunun ortalama zəng müddətindən 
--     yüksək olub olmadığını göstərən sorğu:             
select s.subscribers_id,
       s.name,
       s.surname,
       sum(c.call_duration) sum_call_duration,
       case
            when months_between(sysdate, s.birth_date)/12 <= 18 then '18 və aşağı'
            when months_between(sysdate, s.birth_date)/12 between 19 and 30 then '19-30'
            when months_between(sysdate, s.birth_date)/12 between 31 and 50 then '31-50'
            else '51 və yuxarı'
       end as age_group,
       avg(sum(c.call_duration)) over (partition by case
                                                        when months_between(sysdate, s.birth_date)/12 <= 18 then '18 və aşağı'
                                                        when months_between(sysdate, s.birth_date)/12 between 19 and 30 then '19-30'
                                                        when months_between(sysdate, s.birth_date)/12 between 31 and 50 then '31-50'
                                                        else '51 və yuxarı'
                                                    end ) as avg_call_duration_age_group,
       case 
            when sum(c.call_duration) > avg(sum(c.call_duration)) over (partition by 
                                                   case
                                                        when months_between(sysdate, s.birth_date)/12 <= 18 then '18 və aşağı'
                                                        when months_between(sysdate, s.birth_date)/12 between 19 and 30 then '19-30'
                                                        when months_between(sysdate, s.birth_date)/12 between 31 and 50 then '31-50'
                                                        else '51 və yuxarı'
                                                   end ) then 'YES'
            else 'NO'
       end as above_avg_duration
from subscribers s
join calls c on s.subscribers_id = c.caller_id
group by s.subscribers_id, s.name, s.surname,
                                                case
                                                        when months_between(sysdate, s.birth_date)/12 <= 18 then '18 və aşağı'
                                                        when months_between(sysdate, s.birth_date)/12 between 19 and 30 then '19-30'
                                                        when months_between(sysdate, s.birth_date)/12 between 31 and 50 then '31-50'
                                                        else '51 və yuxarı'
                                                 end 
order by 5;