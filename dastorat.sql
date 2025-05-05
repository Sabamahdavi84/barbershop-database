
SELECT * FROM CustomerAppointmentCounts;


--کوئری CROSS JOIN برای لیست کامل آرایشگرها و خدمات:
SELECT 
    h.id AS hairdresser_id,
    h.name AS hairdresser_name,
    s.id AS service_id,
    s.name AS service_name
FROM 
    Hairdressers h
CROSS JOIN 
    Services s
ORDER BY 
    h.name, s.name;



--پیدا کردن نوبت‌ها بین دو تاریخ مشخص
SELECT *
FROM Appointments
WHERE appointment_date BETWEEN '2025-04-01' AND '2025-04-30';


--پیدا کردن خدمات خاص
SELECT *
FROM Services
WHERE id IN (1, 3, 5);


--پیدا کردن مشتری‌هایی که اسمشون با "s" شروع می‌شه
SELECT *
FROM Customers
WHERE name LIKE 'A%';



--پیوند های طبیعی دو جدول با هم
--۱. Appointments + Customers
--نمایش تاریخ نوبت و نام مشتری.
SELECT 
    a.appointment_date,
    c.name AS customer_name
FROM 
    Appointments a
INNER JOIN 
    Customers c ON a.customer_id = c.id;

--۲. Hairdresser_Services + Services
--نمایش خدمات و قیمت‌های آن‌ها که توسط آرایشگرها ارائه می‌شوند.
SELECT 
    hs.hairdresser_id,
    s.name AS service_name,
    s.price
FROM 
    Hairdresser_Services hs
INNER JOIN 
    Services s ON hs.service_id = s.id;

--۳. Addresses + Salons
--نمایش سالن‌ها به همراه نام شهر و خیابان آدرس‌های آن‌ها.
SELECT 
    s.name AS salon_name,
    a.city,
    a.street_name
FROM 
    Addresses a
INNER JOIN 
    Salons s ON a.salon_id = s.id;

--۴. Appointments + Hairdressers
--نمایش نوبت‌هایی که توسط آرایشگرهایی با سطح "Professional" انجام شده‌اند.
SELECT 
    a.appointment_date,
    h.name AS hairdresser_name
FROM 
    Appointments a
INNER JOIN 
    Hairdressers h ON a.hairdresser_id = h.id
WHERE 
    h.level = 'Professional';

--۵. Salons_Hairdressers + Hairdressers
--نمایش آرایشگرهایی که در سالن با شناسه ۱ کار می‌کنند.
SELECT 
    h.name AS hairdresser_name,
    sh.Salons_id
FROM 
    Salons_Hairdressers sh
INNER JOIN 
    Hairdressers h ON sh.Hairdressers_id = h.id
WHERE 
    sh.Salons_id = 1;


--پیوند طبیعی با سه جدول:
--پیدا کردن نام مشتری، نام سرویس و تاریخ قرار ملاقات برای مشتریانی که خدمات خاصی را در یک تاریخ مشخص دریافت کرده‌اند
SELECT
    C.name AS customer_name,
    S.name AS service_name,
    A.appointment_date
FROM
    Customers AS C
JOIN
    Appointments AS A ON C.id = A.customer_id
JOIN
    Services AS S ON A.service_id = S.id;

--روش دوم:
SELECT
    C.name AS customer_name,
    S.name AS service_name,
    A.appointment_date
FROM
    Customers AS C,
    Appointments AS A,
    Services AS S
WHERE
    C.id = A.customer_id AND
    A.service_id = S.id;

--نمایش آرایشگر، سالن، و تاریخ قرارش
SELECT
    H.name AS hairdresser_name,
    SA.name AS salon_name,
    A.appointment_date
FROM
    Hairdressers AS H
JOIN
    Appointments AS A ON H.id = A.hairdresser_id
JOIN
    Salons AS SA ON A.salon_id = SA.id;

--نمایش نام مشتری، تاریخ نوبت، و نام آرایشگر
SELECT
    C.name AS customer_name,
    A.appointment_date,
    H.name AS hairdresser_name
FROM
    Customers AS C
JOIN
    Appointments AS A ON C.id = A.customer_id
JOIN
    Hairdressers AS H ON A.hairdresser_id = H.id;


--نام مشتری، تاریخ نوبت، و شهری که نوبت در اون گرفته شده
SELECT
    C.name AS customer_name,
    A.appointment_date,
    AD.city
FROM 
    Customers AS C
JOIN
    Appointments AS A ON C.id = A.customer_id
JOIN
    Salons AS S ON A.salon_id = S.id
JOIN
    Addresses AS AD ON S.id = AD.salon_id;



--پیوند طبیعی با خودش
--یافتن شناسه‌ی آرایشگرهایی که خدمات مشترک ارائه می‌دهند
SELECT 
    hs1.hairdresser_id AS hairdresser1,
    hs2.hairdresser_id AS hairdresser2,
    hs1.service_id
FROM 
    Hairdresser_Services hs1
JOIN 
    Hairdresser_Services hs2 
    ON hs1.service_id = hs2.service_id 
    AND hs1.hairdresser_id < hs2.hairdresser_id;


--یافتن آرایشگرانی که در همان سطح قرار دارند
SELECT
    H1.name AS hairdresser_name,
    H2.name AS same_level_hairdresser
FROM
    Hairdressers AS H1
JOIN
    Hairdressers AS H2 ON H1.level = H2.level AND H1.id <> H2.id;
--شرط H1.id <> H2.id به‌این‌منظور است که خود آرایشگر با خودش مقایسه نشود.


--یافتن نام آرایشگرها همراه با نام مدیر مستقیمشون
SELECT 
    h1.name AS hairdresser_name,
    h2.name AS manager_name
FROM 
    Hairdressers h1
JOIN 
    Hairdressers h2 ON h1.manager_id = h2.id;


--عملگر نیم پیوند
--لیست مشتری‌هایی که حداقل یک نوبت گرفته‌اند، بدون نمایش اطلاعات نوبت‌ها
SELECT DISTINCT c.id, c.name
FROM Customers c
WHERE EXISTS (
    SELECT 1
    FROM Appointments a
    WHERE a.customer_id = c.id
);

--لیست مشتری‌هایی که نوبت گرفتن در سال ۲۰۲۵
SELECT DISTINCT c.*
FROM Customers c, Appointments a, Salons s
WHERE c.id = a.customer_id
  AND a.appointment_date >= '2025-01-01'
  AND a.appointment_date < '2026-01-01';