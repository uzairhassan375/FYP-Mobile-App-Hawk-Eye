import 'package:flutter/material.dart';
import '../widgets/status_tag.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  String _selectedFilter = 'ALL';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text(
          'Report History',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Color(0xFF2196F3)),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter Chips
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: _buildFilterChip('ALL', '5'),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildFilterChip('APPROVED', '2'),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildFilterChip('PENDING', '2'),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildFilterChip('REJECTED', '1'),
                ),
              ],
            ),
          ),
          // Report List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildReportCard(
                  title: 'Littering',
                  description: 'Student threw plastic bottle on the ground near...',
                  date: 'Today',
                  location: 'Main Cafeteria',
                  status: 'Approved',
                  points: '+15',
                ),
                const SizedBox(height: 12),
                _buildReportCard(
                  title: 'Noise Disturbance',
                  description: 'Loud music playing in library study area',
                  date: 'Yesterday',
                  location: 'Central Library, Floor 2',
                  status: 'Pending',
                ),
                const SizedBox(height: 12),
                _buildReportCard(
                  title: 'Smoking in Prohibited Area',
                  description: 'Student smoking near the main entrance',
                  date: 'Jan 9',
                  location: 'Main Gate',
                  status: 'Approved',
                  points: '+20',
                ),
                const SizedBox(height: 12),
                _buildReportCard(
                  title: 'Parking Violation',
                  description: 'Vehicle parked in no-parking zone',
                  date: 'Jan 8',
                  location: 'Parking Lot B',
                  status: 'Pending',
                ),
                const SizedBox(height: 12),
                _buildReportCard(
                  title: 'Vandalism',
                  description: 'Graffiti found on building walls',
                  date: 'Jan 6',
                  location: 'Block C, Ground Floor',
                  status: 'Rejected',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, String count) {
    final isSelected = _selectedFilter == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilter = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF2196F3) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? const Color(0xFF2196F3) : const Color(0xFFE0E0E0),
          ),
        ),
        child: Text(
          '$label ($count)',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : const Color(0xFF333333),
          ),
        ),
      ),
    );
  }

  Widget _buildReportCard({
    required String title,
    required String description,
    required String date,
    required String location,
    required String status,
    String? points,
  }) {
    IconData statusIcon;
    if (status == 'Approved') {
      statusIcon = Icons.check_circle;
    } else if (status == 'Pending') {
      statusIcon = Icons.pending;
    } else {
      statusIcon = Icons.cancel;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF2196F3).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.description,
              color: Color(0xFF2196F3),
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ),
                    StatusTag(status: status, icon: statusIcon),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF666666),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF999999),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Icon(
                      Icons.location_on,
                      size: 14,
                      color: Color(0xFFF44336),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        location,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF999999),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (points != null) ...[
            const SizedBox(width: 8),
            Text(
              points,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4CAF50),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
