import 'package:flutter/material.dart';
import '../../widgets/shared/bottom_nav_bar.dart';
import '../../widgets/shared/stat_card.dart';
import '../../routes/app_routes.dart';
import 'widgets/home_card.dart';
import '../report/report_screen.dart';
import '../alerts/alerts_screen.dart';
import '../rewards/rewards_screen.dart';
import '../history/history_screen.dart';
import '../fines/fines_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeContent(),
    const ReportScreen(),
    const AlertsScreen(),
    const RewardsScreen(),
    const HistoryScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color(0xFF2196F3),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome back,',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'John Doe',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.account_circle, color: Colors.white, size: 32),
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.fines);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(Icons.card_giftcard, color: Colors.white, size: 20),
                    const SizedBox(width: 8),
                    const Text(
                      '150 Points',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Stats Cards
                  Row(
                    children: [
                      StatCard(
                        title: 'Total Reports',
                        value: '12',
                        icon: Icons.description,
                        iconColor: const Color(0xFF2196F3),
                      ),
                      const SizedBox(width: 12),
                      StatCard(
                        title: 'Approved',
                        value: '8',
                        icon: Icons.check_circle,
                        iconColor: const Color(0xFF4CAF50),
                      ),
                      const SizedBox(width: 12),
                      StatCard(
                        title: 'Pending',
                        value: '3',
                        icon: Icons.pending,
                        iconColor: const Color(0xFFFF9800),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Report Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.report);
                      },
                      icon: const Icon(Icons.warning, color: Colors.white),
                      label: const Text(
                        'Report a Violation',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2196F3),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Recent Activity
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Recent Activity',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF333333),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.history);
                        },
                        child: const Text(
                          'View All',
                          style: TextStyle(
                            color: Color(0xFF2196F3),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Activity List
                  HomeCard(
                    icon: Icons.check_circle,
                    iconColor: const Color(0xFF4CAF50),
                    title: 'Littering report approved',
                    time: '2 hours ago',
                    points: '+15',
                  ),
                  const SizedBox(height: 12),
                  HomeCard(
                    icon: Icons.pending,
                    iconColor: const Color(0xFFFF9800),
                    title: 'Noise violation submitted',
                    time: '5 hours ago',
                  ),
                  const SizedBox(height: 12),
                  HomeCard(
                    icon: Icons.card_giftcard,
                    iconColor: const Color(0xFFFF9800),
                    title: 'Bonus points earned!',
                    time: '1 day ago',
                    points: '+25',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
