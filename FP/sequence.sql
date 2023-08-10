-- Sequence untuk membuat insert berikutnya pada tabel pasien menjadi increment by 1 (akan langsung menambah id tabel + 1)

CREATE SEQUENCE pasien_sequence
    START WITH 1002
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;

ALTER TABLE PASIEN
    ALTER COLUMN ID_PASIEN SET DEFAULT nextval('pasien_sequence');


-- Insert

INSERT INTO pasien (ID_PASIEN, NAMA_PASIEN, JENIS_KELAMIN, ALAMAT, NO_TELP)
VALUES (nextval('pasien_sequence'), 'Maisan', 'M', 'Jl. Contoh No. 123', '081234567890');
    