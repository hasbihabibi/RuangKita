import 'package:flutter/material.dart';

import '../../models/room_session.dart';

class RuangPraktikum extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const RuangPraktikum({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  State<RuangPraktikum> createState() => _RuangPraktikumState();
}

class _RuangPraktikumState extends State<RuangPraktikum> {
  final List<RoomSession> _sessions = RoomSession.dummyData();

  // State untuk melacak chip yang aktif
  String _selectedStatus = 'Semua';

  // Daftar pilihan filter
  final List<String> _statuses = [
    'Semua',
    'Berlangsung',
    'Akan Datang',
    'Selesai',
    'Tersedia',
  ];

  // Getter untuk memfilter data tanpa merusak data asli
  List<RoomSession> get _filteredSessions {
    if (_selectedStatus == 'Semua') {
      return _sessions;
    }
    return _sessions.where((s) => s.status == _selectedStatus).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard Studio RuangKita (M02-2135)',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        actions: [
          IconButton(
            onPressed: widget.onToggleTheme,
            icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. Filter ChoiceChip
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Wrap(
              spacing: 8.0,
              children: _statuses.map((status) {
                return ChoiceChip(
                  label: Text(status),
                  selected: _selectedStatus == status,
                  onSelected: (selected) {
                    setState(() {
                      _selectedStatus = status;
                    });
                  },
                );
              }).toList(),
            ),
          ),

          // 2. Daftar Kartu Responsif
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 600) {
                  return ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount:
                        _filteredSessions.length, // Gunakan data hasil filter
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (context, index) =>
                        _buildCard(_filteredSessions[index]),
                  );
                } else if (constraints.maxWidth < 840) {
                  return GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio:
                              1.4, // Tetap gunakan 1.8 agar tidak overflow
                        ),
                    itemCount: _filteredSessions.length,
                    itemBuilder: (context, index) =>
                        _buildCard(_filteredSessions[index]),
                  );
                } else {
                  return GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 1.8,
                        ),
                    itemCount: _filteredSessions.length,
                    itemBuilder: (context, index) =>
                        _buildCard(_filteredSessions[index]),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk merakit 1 Card
  Widget _buildCard(RoomSession session) {
    Color badgeColor = Colors.blue;
    if (session.status == 'Berlangsung') badgeColor = Colors.red;
    if (session.status == 'Akan Datang') badgeColor = Colors.orange;
    if (session.status == 'Selesai') badgeColor = Colors.grey;
    if (session.status == 'Tersedia') badgeColor = Colors.green;

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 3,
      child: InkWell(
        // Bungkus Stack dengan InkWell agar bisa ditekan
        onTap: () => _showDetailSheet(session),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.meeting_room_rounded,
                    size: 40,
                    color: Colors.blueGrey,
                  ),
                  const SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 90),
                          child: Text(
                            session.roomName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          session.activityName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.access_time,
                              size: 16,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              session.time,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Label Status
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                  ),
                ),
                child: Text(
                  session.status,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDetailSheet(RoomSession session) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Memastikan panel tidak terpotong teks panjang
      builder: (context) {
        // State lokal murni hanya untuk bottom sheet
        bool isReminderSet = false;

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    session.roomName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    session.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Nyalakan Pengingat Jadwal'),
                      Switch(
                        value: isReminderSet,
                        onChanged: (value) {
                          // setModalState memastikan switch bisa bergeser
                          setModalState(() {
                            isReminderSet = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
