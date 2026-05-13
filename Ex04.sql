CREATE DATABASE SS10;
USE SS10;

CREATE TABLE Pharmacy_Inventory (
    Inventory_ID INT AUTO_INCREMENT PRIMARY KEY,
    Drug_Name VARCHAR(255),
    Batch_Number VARCHAR(50),
    Expiry_Date DATE,
    Quantity INT
);

CREATE INDEX idx_drug_name ON Pharmacy_Inventory(Drug_Name);
CREATE INDEX idx_expiry_date ON Pharmacy_Inventory(Expiry_Date);

CREATE INDEX idx_drug_expiry ON Pharmacy_Inventory(Drug_Name, Expiry_Date);

INSERT INTO Pharmacy_Inventory (Drug_Name, Batch_Number, Expiry_Date, Quantity)
VALUES
  ('Paracetamol',    'BT-2024-001', '2026-03-15', 500),
  ('Paracetamol',    'BT-2024-002', '2025-08-20', 300),
  ('Amoxicillin',    'BT-2024-003', '2026-11-30', 200),
  ('Amoxicillin',    'BT-2024-004', '2024-05-10',  50),
  ('Ibuprofen',      'BT-2024-005', '2027-01-25', 750),
  ('Ibuprofen',      'BT-2024-006', '2025-12-31', 400),
  ('Metformin',      'BT-2024-007', '2026-07-14', 600),
  ('Metformin',      'BT-2024-008', '2025-04-30', 250),
  ('Atorvastatin',   'BT-2024-009', '2026-09-22', 180),
  ('Atorvastatin',   'BT-2024-010', '2024-11-05',  90),
  ('Omeprazole',     'BT-2024-011', '2026-02-28', 320),
  ('Cetirizine',     'BT-2024-012', '2027-06-10', 450),
  ('Lisinopril',     'BT-2024-013', '2025-10-18', 130),
  ('Azithromycin',   'BT-2024-014', '2026-04-05', 220),
  ('Salbutamol',     'BT-2024-015', '2026-08-12', 100),
  ('Dexamethasone',  'BT-2024-016', '2025-06-30', 170),
  ('Paracetamol',    'BT-2024-017', '2027-02-14', 800),
  ('Ciprofloxacin',  'BT-2024-018', '2026-01-09', 140),
  ('Metronidazole',  'BT-2024-019', '2025-09-17', 280),
  ('Pantoprazole',   'BT-2024-020', '2026-12-20', 360);

EXPLAIN SELECT * FROM Pharmacy_Inventory 
WHERE Drug_Name = 'Paracetamol' AND Expiry_Date < '2026-12-31';

ALTER TABLE Pharmacy_Inventory ADD FULLTEXT(Drug_Name);

SELECT * FROM Pharmacy_Inventory WHERE MATCH(Drug_Name) AGAINST('Paracetamol');
