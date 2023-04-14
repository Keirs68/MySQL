/*
    Putri Maulida
    Tugas 3 MySQL
*/

-- SOAL 3.1 --
//1. Menampilkan produk yang asset nya diatas 20jt
MariaDB [dbtoko1]> SELECT * FROM produk WHERE harga_beli * stok > 20000000;
+----+------+--------+------------+------------+------+----------+-----------------+
| id | kode | nama   | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+--------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas |    4000000 |    5000000 |   10 |        3 |               4 |
+----+------+--------+------------+------------+------+----------+-----------------+
1 row in set (0.001 sec)

//2. Menampilkan data produk beserta selisih stok dengan minimal stok
MariaDB [dbtoko1]> SELECT SUM(stok - min_stok) AS selisih FROM produk;
+---------+
| selisih |
+---------+
|      10 |
+---------+
1 row in set (0.000 sec)

//3. Menampilkan total asset produk secara keseluruhan
MariaDB [dbtoko1]> SELECT SUM(stok) AS total_asset FROM produk;
+-------------+
| total_asset |
+-------------+
|          32 |
+-------------+
1 row in set (0.001 sec)

//4. Menampilkan data pelanggan yang lahirnya antara tahun 1999 sampai 2004
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE YEAR(tgl_lahir) BETWEEN 1999 AND 2004;
+----+--------+----------------+------+-----------+------------+------------------+----------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email            | alamat   | kartu_id |
+----+--------+----------------+------+-----------+------------+------------------+----------+----------+
|  3 | 011103 | Uci            | P    | Kediri    | 2001-09-08 | uci@gmail.com    | Jakarta  |        3 |
|  5 | 011105 | Haruto         | L    | Jakarta   | 2001-08-01 | haruto@gmail.com | Jakarta  |        2 |
|  6 | 011106 | Kawai Ruka     | P    | Jakarta   | 2002-09-01 | ruka@gmail.com   | Surabaya |        1 |
+----+--------+----------------+------+-----------+------------+------------------+----------+----------+
3 rows in set (0.013 sec)

//5. Menampilkan data pelanggan yang lahirnya tahun 1998
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE YEAR(tgl_lahir) = 1998;
+----+--------+----------------+------+------------+------------+-----------------+------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email           | alamat     | kartu_id |
+----+--------+----------------+------+------------+------------+-----------------+------------+----------+
|  2 | 011102 | Asahi          | L    | Yogyakarta | 1998-08-07 | asahi@gmail.com | Yogyakarta |        2 |
+----+--------+----------------+------+------------+------------+-----------------+------------+----------+
1 row in set (0.001 sec)

//6. Menampilkan data pelanggan yang berulang tahun bulan agustus
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE MONTH(tgl_lahir)=08;
+----+--------+----------------+------+------------+------------+------------------+------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email            | alamat     | kartu_id |
+----+--------+----------------+------+------------+------------+------------------+------------+----------+
|  2 | 011102 | Asahi          | L    | Yogyakarta | 1998-08-07 | asahi@gmail.com  | Yogyakarta |        2 |
|  5 | 011105 | Haruto         | L    | Jakarta    | 2001-08-01 | haruto@gmail.com | Jakarta    |        2 |
+----+--------+----------------+------+------------+------------+------------------+------------+----------+
2 rows in set (0.002 sec)

//7. Menampilkan data pelanggan : nama, tmp_lahir, tgl_lahir dan umur (selisih tahun sekarang dikurang tahun kelahiran)
MariaDB [dbtoko1]> SELECT nama_pelanggan, tmp_lahir, tgl_lahir, (YEAR(NOW())-YEAR(tgl_lahir)) AS umur FROM pelanggan;
+----------------+------------+------------+------+
| nama_pelanggan | tmp_lahir  | tgl_lahir  | umur |
+----------------+------------+------------+------+
| Asa            | Bandung    | 1997-09-06 |   26 |
| Asahi          | Yogyakarta | 1998-08-07 |   25 |
| Uci            | Kediri     | 2001-09-08 |   22 |
| Yoshi          | Jakarta    | 1997-09-08 |   26 |
| Haruto         | Jakarta    | 2001-08-01 |   22 |
| Kawai Ruka     | Jakarta    | 2002-09-01 |   21 |
+----------------+------------+------------+------+
6 rows in set (0.003 sec)

-- SOAL 3.2 --
//1. Berapa jumlah pelanggan yang tahun lahirnya 1998
MariaDB [dbtoko1]> SELECT COUNT(*) AS jumlah_pelanggan FROM pelanggan WHERE YEAR(tgl_lahir)=1998;
+------------------+
| jumlah_pelanggan |
+------------------+
|                1 |
+------------------+
1 row in set (0.005 sec)

//2. Berapa jumlah pelanggan perempuan yang tempat lahirnya di Jakarta
MariaDB [dbtoko1]> SELECT COUNT(*) AS jumlah_pelanggan FROM pelanggan WHERE jk='P' AND tmp_lahir='Jakarta';
+------------------+
| jumlah_pelanggan |
+------------------+
|                1 |
+------------------+
1 row in set (0.004 sec)

//3. Berapa jumlah total stok semua produk yang harga jualnya dibawah 10rb
MariaDB [dbtoko1]> SELECT SUM(stok) AS total_stok FROM produk WHERE harga_jual < 10000;
+------------+
| total_stok |
+------------+
|          5 |
+------------+
1 row in set (0.004 sec)

//4. Ada berapa produk yang mempunyai kode awal K

MariaDB [dbtoko1]> SELECT COUNT(*) AS jumlah_produk_K FROM produk WHERE kode LIKE 'K%';
+-----------------+
| jumlah_produk_K |
+-----------------+
|               1 |
+-----------------+
1 row in set (0.006 sec)

//5. Berapa harga jual rata-rata produk yang diatas 1jt
MariaDB [dbtoko1]> SELECT AVG(harga_jual) AS harga_rata2 FROM produk WHERE harga_jual > 1000000;
+-------------+
| harga_rata2 |
+-------------+
|     3500000 |
+-------------+
1 row in set (0.001 sec)

//6. Tampilkan jumlah stok yang paling besar
MariaDB [dbtoko1]> SELECT MAX(stok) AS jumlah_stok_terbesar FROM produk;
+----------------------+
| jumlah_stok_terbesar |
+----------------------+
|                   10 |
+----------------------+
1 row in set (0.001 sec)

//7. Ada berapa produk yang stoknya kurang dari minimal stok
MariaDB [dbtoko1]> SELECT COUNT(*) AS jumlah_produk FROM produk WHERE stok < min_stok;
+---------------+
| jumlah_produk |
+---------------+
|             1 |
+---------------+
1 row in set (0.001 sec)

//8. Berapa total asset dari keseluruhan produk
MariaDB [dbtoko1]> SELECT SUM(stok) AS total_asset FROM produk;
+-------------+
| total_asset |
+-------------+
|          32 |
+-------------+
1 row in set (0.001 sec)

-- SOAL 3.3 --
//1. Tampilkan data produk : id, nama, stok dan informasi jika stok telah sampai batas minimal atau kurang dari minimum stok dengan informasi ‘segera belanja’ jika tidak ‘stok aman’.
MariaDB [dbtoko1]> SELECT id, nama, stok,
    -> CASE
    -> WHEN stok <= min_stok THEN 'Segera Belanja'
    -> ELSE 'Stok Aman'
    -> END AS Informasi
    -> FROM produk;
+----+------------+------+----------------+
| id | nama       | stok | Informasi      |
+----+------------+------+----------------+
|  1 | TV         |    3 | Stok Aman      |
|  2 | TV 21 Inc  |   10 | Stok Aman      |
|  3 | Kulkas     |   10 | Stok Aman      |
|  4 | Meja Makan |    4 | Stok Aman      |
|  5 | Taro       |    3 | Stok Aman      |
|  6 | Teh Kotak  |    2 | Segera Belanja |
+----+------------+------+----------------+
6 rows in set (0.001 sec)

//2. Tampilkan data pelanggan: id, nama, umur dan kategori umur : jika umur < 17 → ‘muda’ , 17-55 → ‘Dewasa’, selainnya ‘Tua’
MariaDB [dbtoko1]> SELECT id, nama_pelanggan, timestampdiff(year, tgl_lahir, curdate()) AS umur,
    -> CASE
    -> WHEN timestampdiff(year, tgl_lahir, curdate()) < 17 THEN 'Muda'
    -> WHEN timestampdiff(year, tgl_lahir, curdate()) > 17 AND timestampdiff(year, tgl_lahir, curdate()) <= 55 THEN 'Dewasa'
    -> ELSE 'Tua'
    -> END AS 'kategori_umur'
    -> FROM pelanggan;
+----+----------------+------+---------------+
| id | nama_pelanggan | umur | kategori_umur |
+----+----------------+------+---------------+
|  1 | Asa            |   25 | Dewasa        |
|  2 | Asahi          |   24 | Dewasa        |
|  3 | Uci            |   21 | Dewasa        |
|  4 | Yoshi          |   25 | Dewasa        |
|  5 | Haruto         |   21 | Dewasa        |
|  6 | Kawai Ruka     |   20 | Dewasa        |
+----+----------------+------+---------------+
6 rows in set (0.001 sec)

//3. Tampilkan data produk: id, kode, nama, dan bonus untuk kode ‘TV01’ →’DVD Player’ , ‘K001’ → ‘Rice Cooker’ selain dari diatas ‘Tidak Ada’
MariaDB [dbtoko1]> SELECT id, kode, nama,
    -> CASE
    -> WHEN kode='TV01' THEN 'DVD Player'
    -> WHEN kode='K001' THEN 'Rice Cooker'
    -> ELSE 'Tidak Ada'
    -> END AS bonus
    -> FROM produk;
+----+------+------------+-------------+
| id | kode | nama       | bonus       |
+----+------+------------+-------------+
|  1 | TV01 | TV         | DVD Player  |
|  2 | TV02 | TV 21 Inc  | Tidak Ada   |
|  3 | K001 | Kulkas     | Rice Cooker |
|  4 | M001 | Meja Makan | Tidak Ada   |
|  5 | T001 | Taro       | Tidak Ada   |
|  6 | TK01 | Teh Kotak  | Tidak Ada   |
+----+------+------------+-------------+
6 rows in set (0.001 sec)

-- SOAL 3.4 --
//1. Tampilkan data statistik jumlah tempat lahir pelanggan
MariaDB [dbtoko1]> SELECT tmp_lahir, COUNT(tmp_lahir) AS jumlah_pelanggan FROM pelanggan GROUP BY tmp_lahir;
+------------+------------------+
| tmp_lahir  | jumlah_pelanggan |
+------------+------------------+
| Bandung    |                1 |
| Jakarta    |                3 |
| Kediri     |                1 |
| Yogyakarta |                1 |
+------------+------------------+
4 rows in set (0.001 sec)

//2. Tampilkan jumlah statistik produk berdasarkan jenis produk
MariaDB [dbtoko1]> SELECT jenis_produk_id, COUNT(jenis_produk_id) AS jumlah_produk FROM produk GROUP BY jenis_produk_id;
+-----------------+---------------+
| jenis_produk_id | jumlah_produk |
+-----------------+---------------+
|               1 |             3 |
|               2 |             1 |
|               3 |             1 |
|               4 |             1 |
+-----------------+---------------+

//3. Tampilkan data pelanggan yang usianya dibawah rata usia pelanggan
-- RATA2 UMUR
MariaDB [dbtoko1]> SELECT AVG(timestampdiff(year, tgl_lahir, curdate())) AS rata2_usia FROM pelanggan;
+------------+
| rata2_usia |
+------------+
|    22.6667 |
+------------+
1 row in set (0.001 sec)

MariaDB [dbtoko1]> SELECT * ,  timestampdiff(year, tgl_lahir, curdate()) AS umur FROM pelanggan
    -> WHERE timestampdiff(year, tgl_lahir, curdate()) <  (SELECT AVG(timestampdiff(year, tgl_lahir, curdate())) AS rata2_usia FROM pelanggan);
+----+--------+----------------+------+-----------+------------+------------------+----------+----------+------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email            | alamat   | kartu_id | umur |
+----+--------+----------------+------+-----------+------------+------------------+----------+----------+------+
|  3 | 011103 | Uci            | P    | Kediri    | 2001-09-08 | uci@gmail.com    | Jakarta  |        3 |   21 |
|  5 | 011105 | Haruto         | L    | Jakarta   | 2001-08-01 | haruto@gmail.com | Jakarta  |        2 |   21 |
|  6 | 011106 | Kawai Ruka     | P    | Jakarta   | 2002-09-01 | ruka@gmail.com   | Surabaya |        1 |   20 |
+----+--------+----------------+------+-----------+------------+------------------+----------+----------+------+
3 rows in set (0.001 sec)

//4. Tampilkan data produk yang harganya diatas rata-rata harga produk
-- RATA2 HARGA PRODUK
MariaDB [dbtoko1]> SELECT AVG(harga_beli) AS rata2_harga FROM produk;
+--------------------+
| rata2_harga        |
+--------------------+
| 1667833.3333333333 |
+--------------------+
1 row in set (0.000 sec)

MariaDB [dbtoko1]> SELECT * FROM produk WHERE harga_beli > (SELECT AVG(harga_beli) FROM produk);
+----+------+-----------+------------+------------+------+----------+-----------------+
| id | kode | nama      | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+-----------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV        |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inc |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas    |    4000000 |    5000000 |   10 |        3 |               1 |
+----+------+-----------+------------+------------+------+----------+-----------------+
3 rows in set (0.001 sec)

//5. Tampilkan data pelanggan yang memiliki kartu dimana iuran tahunan kartu diatas 90rb
MariaDB [dbtoko1]> SELECT * FROM pelanggan INNER JOIN kartu ON pelanggan.kartu_id = kartu.id WHERE kartu.iuran > 90000;
Empty set (0.001 sec)

//6. Tampilkan statistik data produk dimana harga produknya dibawah rata-rata harga produk secara keseluruhan
MariaDB [dbtoko1]> SELECT AVG(harga_beli) AS rata2_harga_produk, COUNT(*) AS jumlah_produk FROM produk WHERE harga_beli < (SELECT AVG(harga_beli) FROM produk);
+--------------------+---------------+
| rata2_harga_produk | jumlah_produk |
+--------------------+---------------+
|  335666.6666666667 |             3 |
+--------------------+---------------+
1 row in set (0.001 sec)

//7. Tampilkan data pelanggan yang memiliki kartu dimana diskon kartu yang diberikan diatas 3%
MariaDB [dbtoko1]> SELECT * FROM pelanggan INNER JOIN kartu ON pelanggan.kartu_id = kartu.id WHERE kartu.diskon > 0.03;
+----+--------+----------------+------+------------+------------+------------------+------------+----------+----+-------+--------+--------+-------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email            | alamat     | kartu_id | id | kode  | nama   | diskon | iuran |
+----+--------+----------------+------+------------+------------+------------------+------------+----------+----+-------+--------+--------+-------+
|  1 | 011101 | Asa            | P    | Bandung    | 1997-09-06 | asa@gmail.com    | Bandung    |        1 |  1 | 10111 | Gold   |  20000 |  2000 |
|  2 | 011102 | Asahi          | L    | Yogyakarta | 1998-08-07 | asahi@gmail.com  | Yogyakarta |        2 |  2 | 10112 | Silver |  15000 |  1500 |
|  4 | 011104 | Yoshi          | L    | Jakarta    | 1997-09-08 | yoshi@gmail.com  | Kediri     |        1 |  1 | 10111 | Gold   |  20000 |  2000 |
|  5 | 011105 | Haruto         | L    | Jakarta    | 2001-08-01 | haruto@gmail.com | Jakarta    |        2 |  2 | 10112 | Silver |  15000 |  1500 |
|  6 | 011106 | Kawai Ruka     | P    | Jakarta    | 2002-09-01 | ruka@gmail.com   | Surabaya   |        1 |  1 | 10111 | Gold   |  20000 |  2000 |
+----+--------+----------------+------+------------+------------+------------------+------------+----------+----+-------+--------+--------+-------+
5 rows in set (0.001 sec)



