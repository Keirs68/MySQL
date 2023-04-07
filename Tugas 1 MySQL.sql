//masuk kedalam mariadb dengan command prompt xampp
C:\xampp\mysql\bin>mysql -u root -p

//untuk melihat seluruh database
MariaDB [(none)]> show databases;

//membuat database
MariaDB [(none)]> create database dbtoko1;

//menggunakan database
MariaDB [(none)]> use dbtoko1;

//membuat table kartu
MariaDB [dbtoko1]> create table kartu(
    -> id int NOT NULL auto_increment primary key,
    -> kode varchar(10) unique,
    -> nama varchar(30) NOT NULL,
    -> diskon double default 0,
    -> iuran double default 0
    -> );

//melihat tabel yang sudah dibuat
MariaDB [dbtoko1]> show tables;

//melihat deskripsi tabel
MariaDB [dbtoko1]> desc kartu;

//membuat table pelanggan
MariaDB [dbtoko1]> CREATE TABLE pelanggan(
    -> id int NOT NULL auto_increment primary key,
    -> kode varchar(10) unique,
    -> nama varchar(45),
    -> jk char(1),
    -> tmp_lahit varchar(20),
    -> tgl_lahir date,
    -> email varchar(30),
    -> kartu_id int NOT NULL references kartu(id)
    -> );

//membuat table pesanan
MariaDB [dbtoko1]> CREATE TABLE pesanan(
    -> id int NOT NULL auto_increment primary key,
    -> tanggal date,
    -> total double,
    -> pelanggan_id int NOT NULL REFERENCES pelanggan(id)
    -> );

//membuat table pembayaran
MariaDB [dbtoko1]> CREATE TABLE pembayaran(
    -> id int NOT NULL auto_increment primary key,
    -> no_kuitansi varchar(10) unique,
    -> tanggal date,
    -> jumlah double,
    -> ke int,
    -> pesanan_id int NOT NULL REFERENCES pesanan(id)
    -> );

//membuat table jenis produk
MariaDB [dbtoko1]> CREATE TABLE jenis_produk(
    -> id int NOT NULL auto_increment primary key,
    -> nama varchar(20)
    -> );

//menambahkan kolom keterangan pada table jenis_produk
MariaDB [dbtoko1]> ALTER TABLE jenis_produk
    -> ADD COLUMN keterangan varchar(30) AFTER nama;

//mengubah nama kolom keterangan menjadi ket
MariaDB [dbtoko1]> ALTER TABLE jenis_produk
    -> CHANGE keterangan ket varchar(30) ;

//mengubah jenis tipe data ket varchar(30) menjadi varchar(50)
MariaDB [dbtoko1]> ALTER TABLE jenis_produk
    -> MODIFY ket varchar(50) AFTER nama;


-- Tugas 1 --
//membuat table produk
MariaDB [dbtoko1]> CREATE TABLE produk(
    -> id int NOT NULL auto_increment primary key,
    -> kode varchar(10) unique,
    -> nama varchar(45),
    -> harga_beli double,
    -> harga_jual double,
    -> stok int,
    -> min_stok int,
    -> jenis_produk_id int NOT NULL REFERENCES jenis_produk(id)
    -> );

//membuat table pesanan_item
MariaDB [dbtoko1]> CREATE TABLE pesanan_items(
    -> id int NOT NULL auto_increment primary key,
    -> produk_id int NOT NULL REFERENCES produk(id),
    -> pesanan_id int NOT NULL REFERENCES pesanan(id),
    -> qty int,
    -> harga double
    -> );

//membuat table vendor
MariaDB [dbtoko1]> CREATE TABLE vendor(
    -> id int NOT NULL auto_increment primary key,
    -> nomor varchar(4),
    -> nama varchar(40),
    -> kota varchar(30),
    -> kontak varchar(30)
    -> );

//membuat table pembelian
MariaDB [dbtoko1]> CREATE TABLE pembelian(
    -> id int NOT NULL auto_increment primary key,
    -> tanggal date,
    -> nomor varchar(10),
    -> produk_id int NOT NULL REFERENCES produk(id),
    -> jumlah int,
    -> harga double,
    -> vendor_id int NOT NULL REFERENCES vendor(id)
    -> );

//menambahkan kolom alamat pada table pelanggan dengan tipe data varchar (40)
MariaDB [dbtoko1]> ALTER TABLE pelanggan
    -> ADD COLUMN alamat varchar(40) AFTER email;

//mengubah kolom nama pada pelanggan menjadi nama_pelanggan
MariaDB [dbtoko1]> ALTER TABLE pelanggan
    -> CHANGE nama nama_pelanggan varchar(45);

//mengedit tipe data nama_pelanggan menjadi varchar(50)
MariaDB [dbtoko1]> ALTER TABLE pelanggan
    -> MODIFY nama_pelanggan varchar(50) AFTER kode;