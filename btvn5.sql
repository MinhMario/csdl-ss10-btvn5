
CREATE TABLE Records_North (
    Record_ID    INT PRIMARY KEY,
    Patient_Name VARCHAR(100),
    Diagnosis    TEXT,
    Record_Date  DATE
);

CREATE TABLE Records_South (
    Record_ID    INT PRIMARY KEY,
    Patient_Name VARCHAR(100),
    Diagnosis    TEXT,
    Record_Date  DATE
);


INSERT INTO Records_North VALUES (1, 'Nguyen Van A', 'Flu',  '2026-04-28');
INSERT INTO Records_North VALUES (2, 'Tran Van B',   'Cold', '2026-04-27');

INSERT INTO Records_South VALUES (1, 'Le Thi B',     'Cold', '2026-04-28');
INSERT INTO Records_South VALUES (3, 'Pham Thi C',   'Fever','2026-04-26');


CREATE OR REPLACE VIEW National_Record_View AS
    SELECT Record_ID, Patient_Name, Diagnosis, Record_Date, 'North' AS Branch_Name
    FROM Records_North
UNION ALL
    SELECT Record_ID, Patient_Name, Diagnosis, Record_Date, 'South' AS Branch_Name
    FROM Records_South;


-- Xem toàn bộ dữ liệu
SELECT * FROM National_Record_View;

-- Kiểm tra trường hợp trùng Record_ID
SELECT * FROM National_Record_View
WHERE Record_ID = 1;

-- union all xử lý trùng lặp giữ tất cả tốc độ nhanh hơn dùng khi gộp dữ liệu từ nhiều chi nhánh
-- union xoá dòng trùng tốc độ chậm hơn  dùng khi cần loại trùng hoàn tonaf