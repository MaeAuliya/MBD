CREATE TABLE jenis(
	j_id INT PRIMARY KEY,
	j_nama VARCHAR (20)
);

CREATE TABLE produk(
	produk_id VARCHAR(10) PRIMARY KEY,
	produk_kode VARCHAR(20),
	produk_nama VARCHAR(20),
	produk_harga INT,
	produk_stok INT,
	produk_id_jenis INT,
	produk_foto VARCHAR(50),
	CONSTRAINT fk_id_jenis FOREIGN KEY (produk_id_jenis) REFERENCES jenis(j_id)
);

CREATE TABLE pelanggan(
	pelanggan_id VARCHAR(10) PRIMARY KEY,
	pelanggan_nama VARCHAR (20),
	pelanggan_hp VARCHAR (11),
	pelanggan_email VARCHAR(20),
	pelanggan_alamat VARCHAR(50)
);

drop table pembelian
CREATE TABLE pembelian(
	p_id INT PRIMARY KEY,
	p_kode_pembelian VARCHAR (10) NOT NULL UNIQUE,
	p_tanggal DATE,
	p_jumlah INT,
	p_id_pelanggan VARCHAR(10),
	p_id_produk VARCHAR(10),
	p_harga INT,
	p_keterangan VARCHAR(50),
	CONSTRAINT fk_pelanggan_id FOREIGN KEY (p_id_pelanggan) REFERENCES pelanggan(pelanggan_id),
	CONSTRAINT fk_produk_id FOREIGN KEY (p_id_produk) REFERENCES produk(produk_id)
);


CREATE TABLE retur(
	r_id INT PRIMARY KEY,
	r_kode_pembelian VARCHAR(10) NOT NULL UNIQUE ,
	r_jumlah INT,
	r_harga INT,
	r_keterangan VARCHAR (50),
	CONSTRAINT fk_kode_pembelian FOREIGN KEY (r_kode_pembelian) REFERENCES pembelian(p_kode_pembelian)
);
	
