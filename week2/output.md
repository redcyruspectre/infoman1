# INFOMAN1 – Week 2 Lab: Conceptual ERD Case Study
**Name:** Red Cyrus Oloresisimo
**Student ID:** 2510818
**Section:** BSIT-II

## Task 1 — Candidate Entities

| Entity | Justification |
|---|---|
| Customer | The scenario states that "the shop has many customers" who bring in cars for repair, making Customer an independent participant with its own distinct identity. |
| Car | The scenario specifies that "each car has a model, a plate number, and a color, and belongs to exactly one customer," giving Car its own tracking attributes separate from its owner. |
| Service Appointment | The scenario states that "a mechanic works on it during a scheduled service appointment" and "each service appointment has a date and a short repair note," making it a distinct event entity that records each service visit. |

## Task 2 — Attributes per Entity

### Customer
- Primary Key: `customer_id`
- Attributes:
  - `customer_id` — Domain: numeric integer, auto-generated
  - `full_name` — Domain: text string (alphabetic characters and spaces)
  - `contact_number` — Domain: text string, valid phone format (10–15 digits)

### Car
- Primary Key: `plate_number`
- Attributes:
  - `plate_number` — Domain: alphanumeric string (e.g., `'ABC-1234'`)
  - `model` — Domain: text string (e.g., `'Toyota Vios'`)
  - `color` — Domain: text string (e.g., `'Black'`, `'Silver'`)

### Mechanic
- Primary Key: `mechanic_id`
- Attributes:
  - `mechanic_id` — Domain: numeric integer, auto-generated
  - `name` — Domain: text string
  - `specialty` — Domain: text string (e.g., `'engine'`, `'brakes'`, `'electrical'`)

### Service Appointment
- Primary Key: `appointment_id`
- Attributes:
  - `appointment_id` — Domain: numeric integer, auto-generated
  - `date` — Domain: calendar date (`YYYY-MM-DD`)
  - `repair_note` — Domain: text string (short summary of repair work done)

## Task 3 — Relationships

| Relationship (verb phrase) | Between | Cardinality | Checked both directions? |
|---|---|---|---|
| owns | Customer ↔ Car | 1:N | Yes — one customer may bring in one or more cars for repair, while each car belongs to exactly one customer. |
| scheduled for | Car ↔ Service Appointment | 1:N | Yes — one car may be brought in for many service appointments over different visits, while each service appointment is scheduled for one specific car. |
| performs | Mechanic ↔ Service Appointment | 1:N | Yes — one mechanic may work on many service appointments over time, while each service appointment is handled by one assigned mechanic. |
| services | Mechanic ↔ Car | M:N | Yes — one mechanic may work on many different cars over time, and one car may be serviced by different mechanics on different visits (resolved through Service Appointment). |
| Mechanic | The scenario notes that "the shop employs several mechanics, each with a name and a specialty," establishing Mechanic as a distinct entity that exists independently of any single repair visit. |

## Task 4 — Conceptual ERD

![Conceptual ERD](erd.png)