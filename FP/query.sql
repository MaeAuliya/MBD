-- Maisan
-- View untuk melihat poli yang paling banyak menangani pasien

SELECT id_poli, nama_poli, count(rekam_medis.id_pasien) as jumlah_pasien FROM public.poli
join dokter using (id_poli)
join rekam_medis_dokter using(id_dokter)
join rekam_medis using(id_rekammed)
group by id_poli
order by jumlah_pasien desc limit 1


-- Farim
-- View untuk melihat jenis obat dengan stok tersedikit

SELECT jenis_obat.Jenis_Obat, MIN(Obat.Stok_Obat) AS Stok_Tersedikit
FROM jenis_obat
JOIN Obat ON jenis_obat.ID_Jenis_Obat = obat.ID_Jenis_Obat
GROUP BY jenis_obat.Jenis_Obat
ORDER BY MIN(Obat.Stok_Obat) ASC limit 1;


-- Afril
-- View untuk menampilkan nama nama pasien yang di periksa dokter X

SELECT P.nama_pasien
FROM Pasien AS P
JOIN Rekam_Medis AS RM ON P.id_pasien = RM.id_pasien
JOIN Rekam_Medis_Dokter AS RMD ON RM.id_rekammed = RMD.id_rekammed
JOIN Dokter AS D ON RMD.id_dokter = D.id_dokter
WHERE D.nama_dokter = 'Liman Damanik';


--Shalom
SELECT *
FROM TRANSAKSI
WHERE TOTAL_HARGA > 1000000;
