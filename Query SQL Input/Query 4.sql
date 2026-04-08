{\rtf1\ansi\ansicpg1252\cocoartf2868
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 SELECT \
    SUBSTR(Date, 1, 2) as month,\
    COUNT(*) as total_orders,\
    SUM(CAST(Amount AS DOUBLE)) as total_revenue\
FROM ecommerce_db.sales_data\
WHERE Status NOT LIKE '%Cancel%'\
    AND Status NOT LIKE '%Pending%'\
    AND Amount != ''\
    AND Amount IS NOT NULL\
GROUP BY SUBSTR(Date, 1, 2)\
ORDER BY month ASC\
LIMIT 10;}