-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Jul 2023 pada 12.41
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_polkam`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_dosen`
--

CREATE TABLE `tb_dosen` (
  `id_dosen` int(45) NOT NULL,
  `nrp` varchar(45) NOT NULL,
  `nidn` varchar(45) NOT NULL,
  `nama_lengkap` varchar(45) NOT NULL,
  `gelar` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `gender` set('L','P') NOT NULL,
  `pendidikan_terakhir` varchar(45) NOT NULL,
  `foto` varchar(45) NOT NULL,
  `kode_prodi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_dosen`
--

INSERT INTO `tb_dosen` (`id_dosen`, `nrp`, `nidn`, `nama_lengkap`, `gelar`, `email`, `gender`, `pendidikan_terakhir`, `foto`, `kode_prodi`) VALUES
(1, '098765', '098765', 'Fitri', 'ST., MSc .', 'fitri@gmail.com', 'L', 'Magister (S2)', 'fitri.jpeg', 1),
(2, '123456', '123456', 'Andri Nofiar Am', 'S.Kom., M.Kom', 'andri@gmail.com', 'L', 'Magister (S2)', 'andri.jpeg', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kelas`
--

CREATE TABLE `tb_kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(45) NOT NULL,
  `kode_prodi` int(11) NOT NULL,
  `id_dosen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_kelas`
--

INSERT INTO `tb_kelas` (`id_kelas`, `nama_kelas`, `kode_prodi`, `id_dosen`) VALUES
(1, 'TIF 2 A', 2, 1),
(2, 'TIF 2 B', 1, 1),
(3, 'TPS 1 B', 3, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_mahasiswa`
--

CREATE TABLE `tb_mahasiswa` (
  `id_mahasiswa` int(11) NOT NULL,
  `nim` int(11) NOT NULL,
  `nama_lengkap` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `gender` set('L','P') NOT NULL,
  `status_study` set('Study','Lulus') NOT NULL,
  `jenjang_study` set('D2','D3','D4') NOT NULL,
  `semester_awal` varchar(45) NOT NULL,
  `kode_prodi` int(11) NOT NULL,
  `id_semester` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `foto` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_mahasiswa`
--

INSERT INTO `tb_mahasiswa` (`id_mahasiswa`, `nim`, `nama_lengkap`, `email`, `gender`, `status_study`, `jenjang_study`, `semester_awal`, `kode_prodi`, `id_semester`, `id_kelas`, `foto`) VALUES
(1, 202113029, 'Rizky Firmansyah', 'rizkyfirmansyahh13@gmail.com', 'L', 'Study', 'D3', 'Tidak', 1, 4, 2, 'fitri.jpeg'),
(2, 202113029, 'Rizky Firmansyah', 'rizkyfirmansyahh13@gmail.com', 'L', 'Study', 'D3', 'Tidak', 1, 4, 2, 'andri.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_prodi_kaprodi`
--

CREATE TABLE `tb_prodi_kaprodi` (
  `id_kaprodi` int(11) NOT NULL,
  `kode_kaprodi` int(11) NOT NULL,
  `id_dosen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_prodi_kaprodi`
--

INSERT INTO `tb_prodi_kaprodi` (`id_kaprodi`, `kode_kaprodi`, `id_dosen`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_program_studi`
--

CREATE TABLE `tb_program_studi` (
  `kode_prodi` int(11) NOT NULL,
  `kode_dikti` int(11) NOT NULL,
  `nama_prodi` varchar(45) NOT NULL,
  `jenjang` varchar(45) NOT NULL,
  `akreditasi` varchar(45) NOT NULL,
  `singkatan` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_program_studi`
--

INSERT INTO `tb_program_studi` (`kode_prodi`, `kode_dikti`, `nama_prodi`, `jenjang`, `akreditasi`, `singkatan`) VALUES
(1, 1, 'Teknik Informatika', 'D3', 'A', 'TIF'),
(2, 2, 'Perawatan Dan Perbaikan Mesin', 'D3', 'A', 'PPM'),
(3, 3, 'Teknik Pengolahan Sawit', 'D3', 'A', 'TPS');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_semester`
--

CREATE TABLE `tb_semester` (
  `id_semester` int(11) NOT NULL,
  `semester` varchar(45) NOT NULL,
  `keterangan` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_semester`
--

INSERT INTO `tb_semester` (`id_semester`, `semester`, `keterangan`) VALUES
(1, 'Semester 1', 'Tingkat 1'),
(2, 'Semester 2', 'Tingkat 1'),
(3, 'Semester 3', 'Tingkat 2'),
(4, 'Semester 4', 'Tingkat 2'),
(5, 'Semester 5', 'Tingkat 3'),
(6, 'Semester 6', 'Tingkat 3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `email` varchar(128) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `password` varchar(128) NOT NULL,
  `aktif` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`email`, `nama`, `password`, `aktif`) VALUES
('rizkyfirmansyahh13@gmail.com', 'Rizky Firmansyah', 'e10adc3949ba59abbe56e057f20f883e', 'Y');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_dosen`
--
ALTER TABLE `tb_dosen`
  ADD PRIMARY KEY (`id_dosen`);

--
-- Indeks untuk tabel `tb_kelas`
--
ALTER TABLE `tb_kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indeks untuk tabel `tb_mahasiswa`
--
ALTER TABLE `tb_mahasiswa`
  ADD PRIMARY KEY (`id_mahasiswa`);

--
-- Indeks untuk tabel `tb_prodi_kaprodi`
--
ALTER TABLE `tb_prodi_kaprodi`
  ADD PRIMARY KEY (`id_kaprodi`);

--
-- Indeks untuk tabel `tb_program_studi`
--
ALTER TABLE `tb_program_studi`
  ADD PRIMARY KEY (`kode_prodi`);

--
-- Indeks untuk tabel `tb_semester`
--
ALTER TABLE `tb_semester`
  ADD PRIMARY KEY (`id_semester`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
