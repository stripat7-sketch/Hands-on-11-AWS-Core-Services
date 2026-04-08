{\rtf1\ansi\ansicpg1252\cocoartf2868
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 WITH ranked_skus AS (\
    SELECT \
        Category,\
        SKU,\
        SUM(CAST(Amount AS DOUBLE)) as total_revenue,\
        SUM(CAST(Qty AS INT)) as total_units_sold,\
        ROW_NUMBER() OVER (PARTITION BY Category ORDER BY SUM(CAST(Amount AS DOUBLE)) DESC) as rank\
    FROM ecommerce_db.sales_data\
    WHERE Status NOT LIKE '%Cancel%'\
        AND Status NOT LIKE '%Pending%'\
        AND CAST(Qty AS INT) > 0\
        AND Amount != ''\
        AND Amount IS NOT NULL\
    GROUP BY Category, SKU\
)\
SELECT \
    Category,\
    SKU,\
    total_revenue,\
    total_units_sold,\
    rank\
FROM ranked_skus\
WHERE rank <= 5\
ORDER BY Category, rank\
LIMIT 10;}