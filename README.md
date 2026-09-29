# Retail Sales Analysis

## О проекте / About project 

Анализ данных о продажах интернет-магазина за 2009-2011 года. Проведен полный анализ данных: от первичной разведки, восстановления "пробелов" в базе данных до финальных аналитических выводов. Проект демонстрирует работу с реальным датасетом и проблемой качества данных (пропущенные строки, разный/нестандартный формат данных) с построеннием воспроизводимого пайплайна с помощью Python и SQL. 

Analysis of an online store's sales data from 2009 to 2011. A comprehensive analysis was conducted, spanning from initial data exploration and filling in data gaps to deriving final analytical insights. The project involved working with a real-world dataset and addressing data quality issues (such as raw input strings and inconsistent or non-standard formats) while building a reproducible pipeline using Python and SQL.

## Источник Данных / Data Source

Online Retail II (UCI Machine Learning Repository), период (period) 01.12.2009 – 09.12.2011.

## Data Quality

Исходный датасет содержал ряд проблем качества данных: пропущенные Customer ID (22.77% строк), нестандартные товарные коды (0.70%), отсутствующие описания товаров (0.41%) и неконсистентное форматирование стран (1.98%). Каждая проблема была исследована, задокументирована и обработана через систему булевых флагов (без физического удаления строк), сохраняющих гибкость для разных типов анализа. 
Полный отчёт — в [data_quality_report.md](reports/data_quality_report.md).

The initial dataset presented several data quality issues: missing Customer IDs (22.77% of rows), non-standard product codes (0.70%), missing product descriptions (0.41%), and inconsistent country formatting (1.98%). Each issue was investigated, documented, and handled using a system of Boolean flags—without physically removing rows—thereby maintaining flexibility for various types of analysis.
Full report - in [data_quality_report.md](reports/data_quality_report.md).

## Ключевые выводы / Key Points

1.1. Большая часть выручки по дням недели приходится на четверг (20.48 %), меньшая - на субботу (0.05 %), вероятно, в этот день магазин закрыт. 
1.2. Самая большой средний чек в году приходится на декабрь (в обоих годах, средняя чек > 700), самая меньший - в феврале и апреле 2010 года (< 330).
1.3. Самый прибыльный сезон - последний квартал года (окт-дек). 
1.4. Большая часть выручки приходится на United Kingdom (85 %), меньшая (среди стран с положительной выручкой) Saudi Arabia (<0.01%).
1.5. Самый продаваемый товар - REGENCY CAKESTAND 3 TIER (344563.25).
2. Соотношение отмененных продаж к общим продажам - 7.28 %, соотношение списанных долгов к общим продажам - 0.7 %
3. Количество зарегестрированных пользователей (44876), намного больше чем гостевых (8752) (из них после исключения отменённых — 36975 и 8361 соответственно). Средний чек зарегестрированного пользователя также выше, чем у гостевого пользователя - 479.88 и 367.24, соответственно.

1.1. The largest share of revenue by day of the week falls on Thursday (20.48%), and the smallest on Saturday (0.05%); the store is likely closed on that day.
1.2. The highest average transaction value of the year occurs in December (in both years, the average exceeds 700), while the lowest occurs in February and April 2010 (below 330).
1.3. The most profitable season is the final quarter of the year (Oct–Dec).
1.4. The largest share of revenue comes from the United Kingdom (85%), and the smallest (among countries with positive revenue) from Saudi Arabia (<0.01%).
1.5. The best-selling product is the REGENCY CAKESTAND 3 TIER (344,563.25).
2. The ratio of cancelled sales to total sales is 7.28%; the ratio of written-off debts to total sales is 0.7%.
3. The number of registered users (44,876) is significantly higher than that of guest users (8,752) (or 36,975 and 8,361, respectively, after excluding cancelled orders). The average order value for registered users is also higher than for guest users: 479.88 versus 367.24.

## Структура репозитория / Repository Structure

.
├── data
│   ├── processed
│   │   ├── filtered_combined.parquet
│   │   └── retail.db
│   └── raw
│       └── online_retail_II.xlsx
├── Data Quality.txt
├── notebooks
│   └── 01_cleaning_eda.ipynb
├── README.md
├── reports
│   └── data_quality_report.md
├── requirements.txt
├── scripts
│   └── setup_env.sh
└── sql
    └── queries.sql

## Как запустить / How to Launch

```bash
git clone <https://github.com/8803038/retail-sales> 
cd retail-sales
bash scripts/setup_env.sh
source venv/bin/activate
jupyter notebook
```

## Stack

-- **Excel** - первичный анализ данных, сводные таблицы 
-- **Bash, Jupyter** - окружение  
-- **Python (NumPy, Pandas)** - очистка данных
-- **SQLite** - аналитические запросы, оконные функции

-- **Excel** – initial data analysis, pivot tables
-- **Bash, Jupyter** – environment
-- **Python (NumPy, Pandas)** – data cleaning
-- **SQLite** – analytical queries, window functions
