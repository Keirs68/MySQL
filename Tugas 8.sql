-- Detail Tugas
Buatlah bisnis proses pembayaran dengan menggunakan trigers, dengan skenario sebagai berikut :

1. pelanggan memesan didalam table pesanan

2. dilanjutkan dengan proses pembayaran di table pembayara

3. didalam table pembayaran tambahkan kolom status_pembayaran

4. jika pesanan sudah dibayar maka status pembayaran akan berubah menjadi lunas 

-- Menambahkan kolom status_pembayaran
MariaDB [dbtoko1]> ALTER TABLE pembayaran
    -> ADD COLUMN status_pembayaran varchar(15) DEFAULT 'belum lunas';
Query OK, 0 rows affected (0.021 sec)

MariaDB [dbtoko1]> desc pembayaran;
+-------------------+-------------+------+-----+-------------+----------------+
| Field             | Type        | Null | Key | Default     | Extra          |
+-------------------+-------------+------+-----+-------------+----------------+
| id                | int(11)     | NO   | PRI | NULL        | auto_increment |
| no_kuitansi       | varchar(10) | YES  | UNI | NULL        |                |
| tanggal           | date        | YES  |     | NULL        |                |
| jumlah            | double      | YES  |     | NULL        |                |
| ke                | int(11)     | YES  |     | NULL        |                |
| pesanan_id        | int(11)     | NO   |     | NULL        |                |
| status_pembayaran | varchar(15) | YES  |     | belum lunas |                |
+-------------------+-------------+------+-----+-------------+----------------+
7 rows in set (0.020 sec)

-- Trigger
MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> CREATE TRIGGER set_status_pembayaran BEFORE INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    -> DECLARE total_pembayaran double;
    -> DECLARE total_pesanan double;
    -> SELECT SUM(jumlah) INTO total_pembayaran FROM pembayaran WHERE pesanan_id = NEW.pesanan_id;
    -> SELECT total INTO total_pesanan FROM pesanan WHERE id = NEW.pesanan_id;
    -> IF total_pembayaran >= total_pesanan THEN
    -> UPDATE status_pembayaran
    -> SET status_pembayaran = 'lunas'
    -> WHERE pesanan_id = NEW.pesanan_id;
    -> END IF;
    -> END
    -> $$
Query OK, 0 rows affected (0.011 sec)

MariaDB [dbtoko1]> DELIMITER ; 
MariaDB [dbtoko1]> INSERT INTO pembayaran (no_kuitansi, tanggal, jumlah, ke, pesanan_id) VALUES
    -> ('M001', '2023-05-12', 900000, 1, 1);
Query OK, 1 row affected (0.004 sec)
