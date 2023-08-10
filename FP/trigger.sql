-- Maisan
CREATE OR REPLACE FUNCTION auto_rekamed_date()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
BEGIN
NEW.TANGGAL_PERIKSA = CURRENT_TIMESTAMP;
RETURN NEW;
END;
$$;

CREATE TRIGGER fill_rekamed_date
BEFORE INSERT
ON REKAM_MEDIS
FOR EACH ROW
EXECUTE PROCEDURE auto_rekamed_date();


INSERT INTO REKAM_MEDIS VALUES (34,34,'Asam Lambung');


-- farim
FOR EACH ROW
BEGIN
    DECLARE ID_obat INT;
    DECLARE jumlah_beli INT;
    
    SELECT pembayaran_obat, COUNT(*) INTO ID_Obat, jumlah_beli
    FROM obat
    WHERE pembayaran_obat = NEW.ID_Transaksi;
    
    UPDATE obat
    SET stok = stok - jumlah_beli
    WHERE ID_Obat = ID_Obat;
END;


-- Afril
CREATE TRIGGER tambah_catatan_medis
AFTER INSERT ON entitas_transaksi
FOR EACH ROW
BEGIN
    DECLARE id_pasien INT;
    DECLARE id_rekam_medis INT;
    DECLARE tgl_sekarang DATE;


-- shalom

