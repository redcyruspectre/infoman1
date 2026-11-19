# INFOMAN1 – Week 3 Lab: Logical ERD & Relational Schema
# INFOMAN1 Week 3 Lab: Logical ERD Modeling
**Name:** Red Cyrus Oloresisimo
**Student ID:** 2510818
**Section:** BSIT-II
## Task 1 — Attribute Classification & Weak Entity
### 1.1 Attribute Classification
| Attribute | Entity | Type | Reason |
|---|---|---|---|
| full_name | owner | Composite | The scenario defines it as "consisting of first name and last name", so it is decomposed into `first_name` and `last_name`. |
| full_name | veterinarian | Composite | Like the owner's name, it is split into `first_name` and `last_name`. This supports sorting and searching by surname. |
| vaccination history (vaccine_name, vaccination_date) | pet | Multivalued | A single pet can have many vaccine name/date pairs. A multivalued attribute cannot be stored in one column in a relational table, so it is resolved into the separate weak entity `vaccination_record`. |
| age | pet | Derived | Age can be computed from a birth date (CURRENT_DATE − birth_date). It is stored directly because the scenario lists it as a pet attribute. The trade-off is that a stored age goes stale and has to be updated over time. |
| phone_number | owner | Simple, single-valued | The scenario gives one atomic phone number per owner. |
| species | pet | Simple, single-valued | One atomic value per pet (e.g., Dog, Cat). |
| specialization | veterinarian | Simple, single-valued | One atomic value per veterinarian. |
| appointment_date | appointment | Simple, single-valued | Each appointment occurs on one date. |
| reason_for_visit | appointment | Simple, single-valued | One descriptive value per appointment. |
## Task 1 — Classify Attributes and Identify Weak Entities
### 1.2 Weak Entity: Vaccination Record
**(a) Existence dependency.** A vaccination record depends on a pet for its existence. The scenario states that "each vaccination record only makes sense in relation to the specific pet it belongs to". A record such as "Rabies, 2026-03-10" means nothing unless we know which pet received it. If the pet is removed, its vaccination records have no meaning left.
1. **Composite Attributes:**
    * `full_name` (Owner): the scenario says it is "consisting of first name and last name", so it is split into `first_name` and `last_name`.
    * `full_name` (Veterinarian): the same decomposition applies, giving `first_name` and `last_name`.
**(b) No standalone primary key.** The record's own attributes, `vaccine_name` and `vaccination_date`, cannot identify it alone. Many different pets can receive the same vaccine on the same day, so the pair repeats across pets. The scenario confirms this: a record "cannot be uniquely identified or looked up on its own."
2. **Multivalued Attributes:**
    * Vaccination history (Pet): a pet can have many vaccine name and date pairs, which cannot fit in one column. It is resolved into the separate weak entity `vaccination_record`.
**(c) Identifying relationship and partial key.** The record is identified through its identifying relationship with its owner entity, `pet`. Its primary key combines the borrowed key of the pet with its own partial key (discriminator):
PK = `pet_id` (FK to `pet`) + partial key (`vaccine_name`, `vaccination_date`).
`vaccination_date` is part of the discriminator because the same vaccine (for example, a booster) can be given to the same pet more than once on different dates.
3. **Derived Attributes:**
    * `age` (Pet): age can be derived from a birth date (CURRENT_DATE − birth_date). The scenario lists `age` as a stored attribute, so it is kept in the schema. The trade-off is that a stored age becomes outdated over time.
**(d) Notation.** In ERD theory, a weak entity is drawn as a double rectangle and its identifying relationship as a double diamond, with the partial key underlined by a dashed line. In the Crow's Foot logical ERD (Task 3), this is shown as a solid (identifying) line from `pet` to `vaccination_record`, with `pet_id` marked as both PK and FK.
4. **Simple (single-valued) Attributes:**
    * `phone_number`, `species`, `specialization`, `appointment_date`, `reason_for_visit`: each holds one atomic value.
## Task 2 — Cardinality & Participation (Crow's Foot)
In each line end, the symbol closest to the entity is the **outer** symbol (maximum cardinality). The symbol farther from the entity is the **inner** symbol (minimum cardinality, or participation).
5. **Weak Entity Identification:**
    * Vaccination Record is a weak entity.
    * **Existence dependency:** the scenario says it "only makes sense in relation to the specific pet it belongs to", so it cannot exist without a Pet.
    * **No standalone primary key:** `vaccine_name` and `vaccination_date` repeat across pets, and the scenario says it "cannot be uniquely identified or looked up on its own".
    * **Identifying relationship and partial key:** it is identified through its identifying relationship with Pet. Its PK is the parent key `pet_id` plus the partial key (`vaccine_name`, `vaccination_date`).