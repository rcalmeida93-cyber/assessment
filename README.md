# BI Engineer Assessment

##  Overview

This project presents a data modeling and analytics solution for a healthcare dataset.

The goal is to analyze operational performance, revenue generation, and user behavior.

---

##  Data Model

The data was structured using a star schema approach:

* **Fact tables:**

  * appointments
  * transactions
  * events

* **Dimension tables:**

  * users
  * providers
  * date
  * location

This structure enables consistent analysis across multiple business domains.

---

##  Metrics

Key metrics analyzed in this project:

* Total appointments
* Completion rate
* Cancellation rate
* Total revenue
* Revenue per appointment
* Active users
* Revenue by provider

Detailed metric definitions are available in:
 `metric_definitions.xlsx`

---

##  SQL Models

The SQL models include:

* Data transformation and joins
* KPI calculations
* Aggregations for reporting

All SQL logic is available in the `/sql_models` folder.

---

##  Dashboard

The dashboard focuses on:

* Operational performance
* Financial performance
* User engagement

Dashboard mockups are available in the `/dashboard` folder.

---

##  Business Explanation

A stakeholder-oriented explanation of the solution is available in:

 `/explanation/stakeholder_explanation.md`

---

##  Conclusion

This solution enables data-driven decision making by providing a structured and scalable analytics model.

It supports monitoring of key operational and financial metrics while allowing flexible analysis across different dimensions.
