-- PUTRI MAULIDA
-- TUGAS 7

// Buat fungsi inputPelanggan(), setelah itu panggil fungsinya
MariaDB [dbtoko1]> DESC pelanggan;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| id             | int(11)     | NO   | PRI | NULL    | auto_increment |
| kode           | varchar(10) | YES  | UNI | NULL    |                |
| nama_pelanggan | varchar(50) | YES  |     | NULL    |                |
| jk             | char(1)     | YES  |     | NULL    |                |
| tmp_lahir      | varchar(30) | YES  |     | NULL    |                |
| tgl_lahir      | date        | YES  |     | NULL    |                |
| email          | varchar(30) | YES  |     | NULL    |                |
| alamat         | varchar(40) | YES  |     | NULL    |                |
| kartu_id       | int(11)     | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+
9 rows in set (0.019 sec)

MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> CREATE PROCEDURE inputPelanggan(kode varchar(10), nama_pelanggan varchar(50), jk char(1), tmp_lahir varchar(30), tgl_lahir date, email varchar(30), alamat varchar(40), kartu_id int)
    -> BEGIN
    -> INSERT INTO pelanggan(kode, nama_pelanggan, jk, tmp_lahir, tgl_lahir, email, alamat, kartu_id) VALUES(kode, nama_pelanggan, jk, tmp_lahir, tgl_lahir, email, alamat, kartu_id);
    -> END
    -> $$
Query OK, 0 rows affected (0.018 sec)

-- cara 1
MariaDB [dbtoko1]> DELIMITER ;
MariaDB [dbtoko1]> CALL inputPelanggan('011107', 'Kazuha', 'P', 'Yogyakarta', '2003-09-09', 'kazuha@gmail.com', 'Yogyakarta', 3);
Query OK, 1 row affected (0.007 sec)

//Buat fungsi showPelanggan(), setelah itu panggil fungsinya
MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> CREATE PROCEDURE showPelanggan()
    -> BEGIN
    -> SELECT id, kode, nama_pelanggan, jk, tmp_lahir, tgl_lahir, email, alamat, kartu_id FROM pelanggan;
    -> END $$
Query OK, 0 rows affected (0.006 sec)

MariaDB [dbtoko1]> DELIMITER ;
MariaDB [dbtoko1]> CALL showPelanggan();
+----+--------+----------------+------+------------+------------+------------------+------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email            | alamat     | kartu_id |
+----+--------+----------------+------+------------+------------+------------------+------------+----------+
|  1 | 011101 | Asa            | P    | Bandung    | 1997-09-06 | asa@gmail.com    | Bandung    |        1 |
|  2 | 011102 | Asahi          | L    | Yogyakarta | 1998-08-07 | asahi@gmail.com  | Yogyakarta |        2 |
|  3 | 011103 | Uci            | P    | Kediri     | 2001-09-08 | uci@gmail.com    | Jakarta    |        3 |
|  4 | 011104 | Yoshi          | L    | Jakarta    | 1997-09-08 | yoshi@gmail.com  | Kediri     |        1 |
|  5 | 011105 | Haruto         | L    | Jakarta    | 2001-08-01 | haruto@gmail.com | Jakarta    |        2 |
|  6 | 011106 | Kawai Ruka     | P    | Jakarta    | 2002-09-01 | ruka@gmail.com   | Surabaya   |        1 |
|  7 | 011107 | Kazuha         | P    | Yogyakarta | 2003-09-09 | kazuha@gmail.com | Yogyakarta |        3 |
+----+--------+----------------+------+------------+------------+------------------+------------+----------+
7 rows in set (0.001 sec)

-- cara 2
MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> CREATE PROCEDURE showPelanggan1()
    -> BEGIN
    -> SELECT * FROM pelanggan;
    -> END $$
Query OK, 0 rows affected (0.005 sec)

MariaDB [dbtoko1]> DELIMITER ;
MariaDB [dbtoko1]> CALL showPelanggan1();
+----+--------+----------------+------+------------+------------+------------------+------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email            | alamat     | kartu_id |
+----+--------+----------------+------+------------+------------+------------------+------------+----------+
|  1 | 011101 | Asa            | P    | Bandung    | 1997-09-06 | asa@gmail.com    | Bandung    |        1 |
|  2 | 011102 | Asahi          | L    | Yogyakarta | 1998-08-07 | asahi@gmail.com  | Yogyakarta |        2 |
|  3 | 011103 | Uci            | P    | Kediri     | 2001-09-08 | uci@gmail.com    | Jakarta    |        3 |
|  4 | 011104 | Yoshi          | L    | Jakarta    | 1997-09-08 | yoshi@gmail.com  | Kediri     |        1 |
|  5 | 011105 | Haruto         | L    | Jakarta    | 2001-08-01 | haruto@gmail.com | Jakarta    |        2 |
|  6 | 011106 | Kawai Ruka     | P    | Jakarta    | 2002-09-01 | ruka@gmail.com   | Surabaya   |        1 |
|  7 | 011107 | Kazuha         | P    | Yogyakarta | 2003-09-09 | kazuha@gmail.com | Yogyakarta |        3 |
+----+--------+----------------+------+------------+------------+------------------+------------+----------+
7 rows in set (0.001 sec)

//Buat fungsi inputProduk(), setelah itu panggil fungsinya
MariaDB [dbtoko1]> DESC produk;
+-----------------+-------------+------+-----+---------+----------------+
| Field           | Type        | Null | Key | Default | Extra          |
+-----------------+-------------+------+-----+---------+----------------+
| id              | int(11)     | NO   | PRI | NULL    | auto_increment |
| kode            | varchar(10) | YES  | UNI | NULL    |                |
| nama            | varchar(45) | YES  |     | NULL    |                |
| harga_beli      | double      | YES  |     | NULL    |                |
| harga_jual      | double      | YES  |     | NULL    |                |
| stok            | int(11)     | YES  |     | NULL    |                |
| min_stok        | int(11)     | YES  |     | NULL    |                |
| jenis_produk_id | int(11)     | NO   |     | NULL    |                |
+-----------------+-------------+------+-----+---------+----------------+
8 rows in set (0.027 sec)

MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> CREATE PROCEDURE inputProduk(kode varchar(10), nama varchar(45), harga_beli double, harga_jual double, stok int, min_stok int, jenis_produk_id int)
    -> BEGIN
    -> INSERT INTO produk(kode, nama, harga_beli, harga_jual, stok, min_stok, jenis_produk_id) VALUES(kode, nama, harga_beli, harga_jual, stok, min_stok, jenis_produk_id);
    -> END $$
Query OK, 0 rows affected (0.006 sec)

MariaDB [dbtoko1]> DELIMITER ;
MariaDB [dbtoko1]> CALL inputProduk('S001', 'Sofa', 3000000, 4000000, 7, 4, 4);
Query OK, 1 row affected (0.005 sec)

//Buat fungsi showProduk(), setelah itu panggil fungsinya
MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> CREATE PROCEDURE showProduk1()
    -> BEGIN
    -> SELECT * FROM produk;
    -> END $$
Query OK, 0 rows affected (0.006 sec)

MariaDB [dbtoko1]> DELIMITER ;
MariaDB [dbtoko1]> CALL showProduk1;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inc  |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
|  7 | S001 | Sofa       |    3000000 |    4000000 |    7 |        4 |               4 |
+----+------+------------+------------+------------+------+----------+-----------------+
6 rows in set (0.001 sec)

//Buat fungsi totalPesanan(), setelah itu panggil fungsinya
MariaDB [dbtoko1]> SELECT * FROM pesanan;
+----+------------+--------+--------------+
| id | tanggal    | total  | pelanggan_id |
+----+------------+--------+--------------+
|  1 | 2023-03-03 | 200000 |            1 |
|  2 | 2022-02-02 |  30000 |            1 |
+----+------------+--------+--------------+
2 rows in set (0.001 sec)

-- menggunakan declare untuk mendefinisikan variable baru
MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> CREATE PROCEDURE totalPesanan()
    -> BEGIN
    -> DECLARE total_pesanan double;
    -> SELECT SUM(total) INTO total_pesanan FROM pesanan;
    -> SELECT total_pesanan;
    -> END $$
Query OK, 0 rows affected (0.004 sec)

MariaDB [dbtoko1]> DELIMITER ;
MariaDB [dbtoko1]> CALL totalPesanan();
+---------------+
| total_pesanan |
+---------------+
|        230000 |
+---------------+
1 row in set (0.003 sec)

-- tanpa menggunakan declare
MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> CREATE PROCEDURE totalPesanan1()
    -> BEGIN
    -> SELECT SUM(total) FROM pesanan;
    -> END $$
Query OK, 0 rows affected (0.004 sec)

MariaDB [dbtoko1]> DELIMITER ;
MariaDB [dbtoko1]> CALL totalPesanan1();
+------------+
| SUM(total) |
+------------+
|     230000 |
+------------+
1 row in set (0.001 sec)

//Tampilkan seluruh pesanan dari semua pelanggan
MariaDB [dbtoko1]> CREATE PROCEDURE showSeluruhPesanan()
    -> BEGIN
    -> SELECT pesanan.id, pelanggan.nama_pelanggan,pelanggan.alamat, pesanan.tanggal AS tgl_pesanan, pesanan.total AS total_harga_pesanan FROM pesanan
    -> INNER JOIN pelanggan ON pesanan.pelanggan_id = pelanggan.id;
    -> END $$
Query OK, 0 rows affected (0.004 sec)

MariaDB [dbtoko1]> DELIMITER ;
MariaDB [dbtoko1]> CALL showSeluruhPesanan;
+----+----------------+---------+-------------+---------------------+
| id | nama_pelanggan | alamat  | tgl_pesanan | total_harga_pesanan |
+----+----------------+---------+-------------+---------------------+
|  1 | Asa            | Bandung | 2023-03-03  |              200000 |
|  2 | Asa            | Bandung | 2022-02-02  |               30000 |
+----+----------------+---------+-------------+---------------------+
2 rows in set (0.002 sec)

//Buatkan query panjang di atas menjadi sebuah view baru: pesanan_produk_vw (menggunakan join dari table pesanan,pelanggan dan produk)
MariaDB [dbtoko1]> CREATE VIEW pesanan_produk_vw AS
    -> SELECT pesanan.id, pesanan.tanggal, pesanan.total, pelanggan.kode AS kode_pelanggan, pelanggan.nama_pelanggan, pelanggan.jk, pelanggan.alamat, produk.kode AS kode_produk, produk.nama AS nama_produk, produk.harga_jual, pesanan_items.harga
    -> FROM pesanan
    -> INNER JOIN pelanggan ON pesanan.pelanggan_id = pelanggan.id
    -> INNER JOIN pesanan_items ON pesanan.id = pesanan_items.pesanan_id
    -> INNER JOIN produk ON pesanan_items.produk_id = produk.id;
Query OK, 0 rows affected (0.004 sec)

MariaDB [dbtoko1]> SELECT * FROM pesanan_produk_vw;
Empty set (0.003 sec)
