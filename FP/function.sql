-- Maisan
-- Function untuk menampilkan history transaksi dari pasien dengan parameter ID pasien

CREATE OR REPLACE FUNCTION get_patient_transaction_history(patient_id INT)
  RETURNS TABLE (
    ID_TRANSAKSI INT,
    TANGGAL_TRANSAKSI DATE,
    TOTAL_HARGA INT,
    METODE_BAYAR VARCHAR(50)
  )
AS $$
BEGIN
  RETURN QUERY
    SELECT
      t.ID_TRANSAKSI AS ID_TRANSAKSI,
      t.TANGGAL_TRANSAKSI AS TANGGAL_TRANSAKSI,
      t.TOTAL_HARGA AS TOTAL_HARGA,
      t.METODE_BAYAR AS METODE_BAYAR
    FROM
      TRANSAKSI t
    WHERE
      t.ID_PASIEN = patient_id;
END;
$$ LANGUAGE plpgsql;


SELECT *
FROM get_patient_transaction_history(123);


-- Farim
-- Function untuk menghitung total pembayaran

CREATE FUNCTION hitungTotalPembayaran(ID_Transaksi INT) RETURNS DECIMAL(10,2)
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(harga) INTO total
    FROM obat
    WHERE pembayaran_obat = ID_Transaksi;
    
    RETURN total;
END;


-- Shaloom

