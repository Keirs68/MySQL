/*  Putri Maulida
    Tugas 2
*/

-- SOAL 2.1 --
//1. Menampilkan seluruh data produk diurutkan berdasarkan harga_jual mulai dari yang termahal
MariaDB [dbtoko1]> SELECT * FROM produk ORDER BY harga_jual DESC;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               4 |
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inc  |    2000000 |    3000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
|  6 | TK01 | Teh Kotak  |       3000 |       4000 |    2 |       10 |               3 |
+----+------+------------+------------+------------+------+----------+-----------------+
6 rows in set (0.052 sec)

//2. Menampilkan data kode, nama, tmp_lahir, tgl_lahir dari table pelanggan
MariaDB [dbtoko1]> SELECT kode, nama_pelanggan, tmp_lahir, tgl_lahir FROM pelanggan;
+--------+----------------+------------+------------+
| kode   | nama_pelanggan | tmp_lahir  | tgl_lahir  |
+--------+----------------+------------+------------+
| 011101 | Asa            | Bandung    | 1997-09-06 |
| 011102 | Asahi          | Yogyakarta | 1998-08-07 |
| 011103 | Uci            | Kediri     | 2001-09-08 |
| 011104 | Yoshi          | Jakarta    | 1997-09-08 |
| 011105 | Haruto         | Jakarta    | 2001-08-01 |
| 011106 | Kawai Ruka     | Jakarta    | 2002-09-01 |
+--------+----------------+------------+------------+
6 rows in set (0.014 sec)

//3. Menampilkan kode,nama,stok dari table produk yang stok-nya hanya 4
MariaDB [dbtoko1]> SELECT kode, nama, stok FROM produk WHERE stok=4;
+------+------------+------+
| kode | nama       | stok |
+------+------------+------+
| M001 | Meja Makan |    4 |
+------+------------+------+
1 row in set (0.004 sec)

//4. Menampilkan seluruh data pelanggan yang tempat lahirnya Jakarta
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE tmp_lahir='Jakarta';
+----+--------+----------------+------+-----------+------------+------------------+----------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email            | alamat   | kartu_id |
+----+--------+----------------+------+-----------+------------+------------------+----------+----------+
|  4 | 011104 | Yoshi          | L    | Jakarta   | 1997-09-08 | yoshi@gmail.com  | Kediri   |        1 |
|  5 | 011105 | Haruto         | L    | Jakarta   | 2001-08-01 | haruto@gmail.com | Jakarta  |        2 |
|  6 | 011106 | Kawai Ruka     | P    | Jakarta   | 2002-09-01 | ruka@gmail.com   | Surabaya |        1 |
+----+--------+----------------+------+-----------+------------+------------------+----------+----------+
3 rows in set (0.002 sec)

//5. Menampilkan kode, nama, tmp_lahir, tgl_lahir dari pelanggan diurutkan dari yang paling muda usianya
MariaDB [dbtoko1]> SELECT kode, nama_pelanggan, tmp_lahir, tgl_lahir FROM pelanggan ORDER BY tgl_lahir DESC;
+--------+----------------+------------+------------+
| kode   | nama_pelanggan | tmp_lahir  | tgl_lahir  |
+--------+----------------+------------+------------+
| 011106 | Kawai Ruka     | Jakarta    | 2002-09-01 |
| 011103 | Uci            | Kediri     | 2001-09-08 |
| 011105 | Haruto         | Jakarta    | 2001-08-01 |
| 011102 | Asahi          | Yogyakarta | 1998-08-07 |
| 011104 | Yoshi          | Jakarta    | 1997-09-08 |
| 011101 | Asa            | Bandung    | 1997-09-06 |
+--------+----------------+------------+------------+
6 rows in set (0.001 sec)

-- SOAL 2.2 --
//1. Menampilkan data produk yang stoknya 3 dan 10
MariaDB [dbtoko1]> SELECT * FROM produk WHERE stok=3 OR stok=10;
+----+------+-----------+------------+------------+------+----------+-----------------+
| id | kode | nama      | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+-----------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV        |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inc |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas    |    4000000 |    5000000 |   10 |        3 |               4 |
|  5 | T001 | Taro      |       4000 |       5000 |    3 |        2 |               2 |
+----+------+-----------+------------+------------+------+----------+-----------------+
4 rows in set (0.001 sec)

//2. Menampilkan data produk yang harga jualnya kurang dari 5 juta tetapi lebih dari 500 ribu
MariaDB [dbtoko1]> SELECT * FROM produk WHERE harga_jual < 5000000 AND harga_jual > 500000;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inc  |    2000000 |    3000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
+----+------+------------+------------+------------+------+----------+-----------------+
3 rows in set (0.003 sec)

//3. Menampilkan data produk yang harus segera ditambah stoknya
MariaDB [dbtoko1]> SELECT * FROM produk WHERE min_stok > stok;
+----+------+-----------+------------+------------+------+----------+-----------------+
| id | kode | nama      | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+-----------+------------+------------+------+----------+-----------------+
|  6 | TK01 | Teh Kotak |       3000 |       4000 |    2 |       10 |               3 |
+----+------+-----------+------------+------------+------+----------+-----------------+
1 row in set (0.001 sec)

//4. Menampilkan data pelanggan mulai dari yang paling muda
MariaDB [dbtoko1]> SELECT * FROM pelanggan ORDER BY tgl_lahir DESC;
+----+--------+----------------+------+------------+------------+------------------+------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email            | alamat     | kartu_id |
+----+--------+----------------+------+------------+------------+------------------+------------+----------+
|  6 | 011106 | Kawai Ruka     | P    | Jakarta    | 2002-09-01 | ruka@gmail.com   | Surabaya   |        1 |
|  3 | 011103 | Uci            | P    | Kediri     | 2001-09-08 | uci@gmail.com    | Jakarta    |        3 |
|  5 | 011105 | Haruto         | L    | Jakarta    | 2001-08-01 | haruto@gmail.com | Jakarta    |        2 |
|  2 | 011102 | Asahi          | L    | Yogyakarta | 1998-08-07 | asahi@gmail.com  | Yogyakarta |        2 |
|  4 | 011104 | Yoshi          | L    | Jakarta    | 1997-09-08 | yoshi@gmail.com  | Kediri     |        1 |
|  1 | 011101 | Asa            | P    | Bandung    | 1997-09-06 | asa@gmail.com    | Bandung    |        1 |
+----+--------+----------------+------+------------+------------+------------------+------------+----------+
6 rows in set (0.001 sec)

//5. Menampilkan data pelanggan yang lahirnya di Jakarta dan gendernya perempuan
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE tmp_lahir='Jakarta' AND jk='P';
+----+--------+----------------+------+-----------+------------+----------------+----------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email          | alamat   | kartu_id |
+----+--------+----------------+------+-----------+------------+----------------+----------+----------+
|  6 | 011106 | Kawai Ruka     | P    | Jakarta   | 2002-09-01 | ruka@gmail.com | Surabaya |        1 |
+----+--------+----------------+------+-----------+------------+----------------+----------+----------+
1 row in set (0.003 sec)

//6. Menampilkan data pelanggan yang ID nya 2, 4 dan 6
MariaDB [dbtoko1]> SELECT * from pelanggan WHERE id IN (2,4,6);
+----+--------+----------------+------+------------+------------+-----------------+------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email           | alamat     | kartu_id |
+----+--------+----------------+------+------------+------------+-----------------+------------+----------+
|  2 | 011102 | Asahi          | L    | Yogyakarta | 1998-08-07 | asahi@gmail.com | Yogyakarta |        2 |
|  4 | 011104 | Yoshi          | L    | Jakarta    | 1997-09-08 | yoshi@gmail.com | Kediri     |        1 |
|  6 | 011106 | Kawai Ruka     | P    | Jakarta    | 2002-09-01 | ruka@gmail.com  | Surabaya   |        1 |
+----+--------+----------------+------+------------+------------+-----------------+------------+----------+
3 rows in set (0.004 sec)

//7. Menampilkan data produk yang harganya antara 500 ribu sampai 6 juta
MariaDB [dbtoko1]> SELECT * FROM produk WHERE harga_jual >= 500000 AND harga_jual <= 6000000;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inc  |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               4 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
+----+------+------------+------------+------------+------+----------+-----------------+
4 rows in set (0.001 sec)

-- SOAL 2.3 --
//1. Menampilkan produk yang kode awalnya huruf K dan huruf M
MariaDB [dbtoko1]> SELECT * FROM produk WHERE kode LIKE 'K%' OR kode LIKE 'M%';
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               4 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
+----+------+------------+------------+------------+------+----------+-----------------+
2 rows in set (0.004 sec)

//2. Menampilkan produk yang kode awalnya bukan huruf M
MariaDB [dbtoko1]> SELECT * FROM produk WHERE kode NOT LIKE 'M%';
+----+------+-----------+------------+------------+------+----------+-----------------+
| id | kode | nama      | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+-----------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV        |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inc |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas    |    4000000 |    5000000 |   10 |        3 |               4 |
|  5 | T001 | Taro      |       4000 |       5000 |    3 |        2 |               2 |
|  6 | TK01 | Teh Kotak |       3000 |       4000 |    2 |       10 |               3 |
+----+------+-----------+------------+------------+------+----------+-----------------+
5 rows in set (0.001 sec)

//3. Menampilkan produk-produk televisi
MariaDB [dbtoko1]> SELECT * FROM produk WHERE nama LIKE 'TV%';
+----+------+-----------+------------+------------+------+----------+-----------------+
| id | kode | nama      | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+-----------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV        |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inc |    2000000 |    3000000 |   10 |        3 |               1 |
+----+------+-----------+------------+------------+------+----------+-----------------+
2 rows in set (0.001 sec)

//4. Menampilkan pelanggan mengandung huruf 'SA'
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE nama_pelanggan LIKE '%SA%';
+----+--------+----------------+------+------------+------------+-----------------+------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email           | alamat     | kartu_id |
+----+--------+----------------+------+------------+------------+-----------------+------------+----------+
|  1 | 011101 | Asa            | P    | Bandung    | 1997-09-06 | asa@gmail.com   | Bandung    |        1 |
|  2 | 011102 | Asahi          | L    | Yogyakarta | 1998-08-07 | asahi@gmail.com | Yogyakarta |        2 |
+----+--------+----------------+------+------------+------------+-----------------+------------+----------+
2 rows in set (0.001 sec)

//5. Menampilkan pelanggan yang lahirnya bukan di Jakarta dan mengandung huruf ‘yo‘
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE tmp_lahir NOT IN ('Jakarta') AND tmp_lahir LIKE '%YO%';
+----+--------+----------------+------+------------+------------+-----------------+------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email           | alamat     | kartu_id |
+----+--------+----------------+------+------------+------------+-----------------+------------+----------+
|  2 | 011102 | Asahi          | L    | Yogyakarta | 1998-08-07 | asahi@gmail.com | Yogyakarta |        2 |
+----+--------+----------------+------+------------+------------+-----------------+------------+----------+
1 row in set (0.001 sec)

//6. Menampilkan pelanggan yang karakter huruf ke – 2 nya adalah A
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE nama_pelanggan LIKE '_A%';
+----+--------+----------------+------+-----------+------------+------------------+----------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email            | alamat   | kartu_id |
+----+--------+----------------+------+-----------+------------+------------------+----------+----------+
|  5 | 011105 | Haruto         | L    | Jakarta   | 2001-08-01 | haruto@gmail.com | Jakarta  |        2 |
|  6 | 011106 | Kawai Ruka     | P    | Jakarta   | 2002-09-01 | ruka@gmail.com   | Surabaya |        1 |
+----+--------+----------------+------+-----------+------------+------------------+----------+----------+
2 rows in set (0.001 sec)

-- SOAL 2.4 --
//1. Menampilkan 2 data produk termahal
MariaDB [dbtoko1]> SELECT * FROM produk ORDER BY harga_beli DESC LIMIT 2;
+----+------+--------+------------+------------+------+----------+-----------------+
| id | kode | nama   | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+--------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas |    4000000 |    5000000 |   10 |        3 |               4 |
|  1 | TV01 | TV     |    3000000 |    4000000 |    3 |        2 |               1 |
+----+------+--------+------------+------------+------+----------+-----------------+
2 rows in set (0.001 sec)

//2. Menampilkan produk yang paling murah
MariaDB [dbtoko1]> SELECT * FROM produk ORDER BY harga_beli LIMIT 1;
+----+------+-----------+------------+------------+------+----------+-----------------+
| id | kode | nama      | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+-----------+------------+------------+------+----------+-----------------+
|  6 | TK01 | Teh Kotak |       3000 |       4000 |    2 |       10 |               3 |
+----+------+-----------+------------+------------+------+----------+-----------------+
1 row in set (0.001 sec)

//3. Menampilkan produk yang stoknya paling banyak
MariaDB [dbtoko1]> SELECT * FROM produk ORDER BY stok DESC LIMIT 1;
+----+------+-----------+------------+------------+------+----------+-----------------+
| id | kode | nama      | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+-----------+------------+------------+------+----------+-----------------+
|  2 | TV02 | TV 21 Inc |    2000000 |    3000000 |   10 |        3 |               1 |
+----+------+-----------+------------+------------+------+----------+-----------------+
1 row in set (0.001 sec)

//4. Menampilkan dua produk yang stoknya paling sedikit
MariaDB [dbtoko1]> SELECT * FROM produk ORDER BY stok LIMIT 2;
+----+------+-----------+------------+------------+------+----------+-----------------+
| id | kode | nama      | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+-----------+------------+------------+------+----------+-----------------+
|  6 | TK01 | Teh Kotak |       3000 |       4000 |    2 |       10 |               3 |
|  1 | TV01 | TV        |    3000000 |    4000000 |    3 |        2 |               1 |
+----+------+-----------+------------+------------+------+----------+-----------------+

/5. /Menampilkan pelanggan yang paling muda
MariaDB [dbtoko1]> SELECT * FROM pelanggan ORDER BY tgl_lahir DESC LIMIT 1;
+----+--------+----------------+------+-----------+------------+----------------+----------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email          | alamat   | kartu_id |
+----+--------+----------------+------+-----------+------------+----------------+----------+----------+
|  6 | 011106 | Kawai Ruka     | P    | Jakarta   | 2002-09-01 | ruka@gmail.com | Surabaya |        1 |
+----+--------+----------------+------+-----------+------------+----------------+----------+----------+
1 row in set (0.001 sec)

//6. Menampilkan pelanggan yang paling tua
MariaDB [dbtoko1]> SELECT * FROM pelanggan ORDER BY tgl_lahir LIMIT 1;
+----+--------+----------------+------+-----------+------------+---------------+---------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email         | alamat  | kartu_id |
+----+--------+----------------+------+-----------+------------+---------------+---------+----------+
|  1 | 011101 | Asa            | P    | Bandung   | 1997-09-06 | asa@gmail.com | Bandung |        1 |
+----+--------+----------------+------+-----------+------------+---------------+---------+----------+
1 row in set (0.001 sec)
