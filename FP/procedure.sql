-- Maisan

    CREATE OR REPLACE PROCEDURE delete_patient_and_related_data(patient_id INT)
    AS $$
    BEGIN
    DELETE FROM TRANSAKSI_OBAT WHERE ID_TRANSAKSI IN (SELECT ID_TRANSAKSI FROM TRANSAKSI WHERE ID_PASIEN = patient_id);
    DELETE FROM TRANSAKSI WHERE ID_PASIEN = patient_id;
    DELETE FROM REKAM_MEDIS_DOKTER WHERE ID_REKAMMED IN (SELECT ID_REKAMMED FROM REKAM_MEDIS WHERE ID_PASIEN = patient_id);
    DELETE FROM REKAM_MEDIS WHERE ID_PASIEN = patient_id;
    DELETE FROM PASIEN WHERE ID_PASIEN = patient_id;
    END;
    $$ LANGUAGE plpgsql;


-- Farim
CREATE PROCEDURE tambahRekamMedis(ID_Pasien INT, tanggal DATE, riwayat_penyakit TEXT, diagnosa TEXT, pengobatan TEXT)
BEGIN
    INSERT INTO rekam_medis (ID_Pasien, Tanggal_Rekam_Medis, Riwayat_Penyakit, Diagnosa, Pengobatan)
    VALUES (ID_Pasien, tanggal, riwayat_penyakit, diagnosa, pengobatan);
END;


-- Afril
CREATE OR REPLACE PROCEDURE UPDATE_STOK_OBAT(
    obat_id INT,
    new_stock INT
)
AS $$
BEGIN
    UPDATE OBAT SET STOK_OBAT = new_stock WHERE ID_OBAT = obat_id;
END;
$$ LANGUAGE plpgsql;


--shalom
CREATE OR REPLACE PROCEDURE update_tipe_transaksi(
  p_row_id INTEGER,
  p_new_value TEXT
)
LANGUAGE plpgsql
AS $$
BEGIN
  UPDATE TRANSAKSI
  SET tipe_transaksi = p_new_value
  WHERE row_id = p_row_id;
END;
$$;
