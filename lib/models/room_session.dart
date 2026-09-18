class RoomSession {
  final String roomName;
  final String activityName;
  final String time;
  final String status;
  final String description;

  RoomSession({
    required this.roomName,
    required this.activityName,
    required this.time,
    required this.status,
    required this.description,
  });

  static List<RoomSession> dummyData() {
    return [
      RoomSession(
        roomName: 'Ruang Audio 1',
        activityName: 'Rekaman Produksi Konten Video Dokumenter Angkatan 2025',
        time: '08.30 - 10.30',
        status: 'Berlangsung',
        description: 'Ruangan sedang digunakan untuk proses rekaman podcast dan mixing audio. Harap mahasiswa tidak berisik di luar pintu dan mengecek jadwal sebelum masuk.',
      ),
      RoomSession(
        roomName: 'Studio Foto 1',
        activityName: 'Pemrotretan Produk Katalog',
        time: '11.00 - 13.00',
        status: 'Akan Datang',
        description: 'Sesi pemrotretan untuk produk komersial UMKM menggunakan setup lighting standar dan background putih.',
      ),
      RoomSession(
        roomName: 'Ruang Editing Video',
        activityName: 'Rendering Final Project',
        time: '07.30 - 09.10',
        status: 'Selesai',
        description: 'Proses rendering dan color grading film pendek mahasiswa telah selesai tanpa kendala teknis.',
      ),
      RoomSession(
        roomName: 'Studio Streaming',
        activityName: 'Tidak Ada Jadwal',
        time: '-',
        status: 'Tersedia',
        description: 'Ruangan dalam keadaan kosong. Semua perangkat web camera, microphone condenser, dan green screen siap digunakan.',
      ),
      RoomSession(
        roomName: 'Studio Foto 2',
        activityName: 'Pemrotretan Pasfoto Wisuda',
        time: '13.30 - 15.30',
        status: 'Berlangsung',
        description: 'Pemrotretan pasfoto untuk keperluan ijazah dan buku kenangan wisuda mahasiswa tingkat akhir.',
      ),
      RoomSession(
        roomName: 'Studio Audio 2',
        activityName: 'Rekaman Voice Over Animasi',
        time: '16.00 - 18.00',
        status: 'Akan Datang',
        description: 'Sesi pengisian suara karakter untuk proyek animasi 3D tugas akhir mahasiswa multimedia.',
      ),
      RoomSession(
        roomName: 'Ruang Editing Video',
        activityName: 'Sinkronisasi Audio Visual',
        time: '09.30 - 11.40',
        status: 'Selesai',
        description: 'Penyelarasan efek suara Foley dengan gerakan visual pada video animasi pendek telah selesai.',
      ),
      RoomSession(
        roomName: 'Studio Streaming',
        activityName: 'Webinar Nasional IT 2026',
        time: '19.20 - 21.00',
        status: 'Akan Datang',
        description: 'Persiapan siaran langsung webinar nasional. Tim teknis sedang memastikan koneksi internet stabil dan OBS berjalan lancar',
      ),
    ];
  }
}
