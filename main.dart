import 'package:flutter/material.dart';

void main() {
  runApp(const FacebookPageClone());
}

// =====================
// ROOT APPLICATION
// =====================
class FacebookPageClone extends StatelessWidget {
  const FacebookPageClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facebook Page Clone',
      debugShowCheckedModeBanner: false,
      home: const FacebookProfileScreen(),

      // ===== ROUTES =====
      routes: {
        '/routePage': (context) => const RoutePage(),
      },
    );
  }
}

// =====================
// FACEBOOK PROFILE PAGE
// =====================
class FacebookProfileScreen extends StatefulWidget {
  const FacebookProfileScreen({super.key});

  @override
  State<FacebookProfileScreen> createState() => _FacebookProfileScreenState();
}

class _FacebookProfileScreenState extends State<FacebookProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // =====================
      // APP BAR
      // =====================
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          'facebook',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),

      // =====================
      // DRAWER MENU
      // =====================
      endDrawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Menu Navigasi',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // ===== NAVIGATOR PUSH =====
            ListTile(
              leading: const Icon(Icons.navigation),
              title: const Text('Navigator Push'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NavigatorPushPage(),
                  ),
                );
              },
            ),

            // ===== TEKNIK ROUTE =====
            ListTile(
              leading: const Icon(Icons.route),
              title: const Text('Teknik Route'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/routePage');
              },
            ),

            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      // =====================
      // BODY
      // =====================
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 200, color: Colors.blue),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(radius: 40),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pt Cinta Sejati',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text('Product / Service'),
                            Text('45,798 people like this'),
                          ],
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.thumb_up_alt_outlined),
                        label: const Text('Like'),
                      ),
                    ],
                  ),
                  const Divider(),
                  _infoRow(Icons.star, 'Rating 5 (500 Reviews)'),
                  _infoRow(Icons.phone, 'Ask for phone number'),
                  _infoRow(Icons.info, 'This is a Facebook'),
                ],
              ),
            ),

            Container(
              color: Colors.white,
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                tabs: const [
                  Tab(text: 'Home'),
                  Tab(text: 'Posts'),
                  Tab(text: 'Photos'),
                  Tab(text: 'Videos'),
                  Tab(text: 'Reviews'),
                ],
              ),
            ),

            SizedBox(
              height: 300,
              child: TabBarView(
                controller: _tabController,
                children: const [
                  Center(child: Text('Home Content')),
                  Center(child: Text('Posts Content')),
                  Center(child: Text('Photos Content')),
                  Center(child: Text('Videos Content')),
                  Center(child: Text('Reviews Content')),
                ],
              ),
            ),
          ],
        ),
      ),

      // =====================
      // BOTTOM BAR
      // =====================
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.white,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _BottomAction(icon: Icons.thumb_up_alt_outlined, label: 'Like'),
            _BottomAction(icon: Icons.comment_outlined, label: 'Comment'),
            _BottomAction(icon: Icons.share_outlined, label: 'Share'),
          ],
        ),
      ),
    );
  }
}

// =====================
// NAVIGATOR PUSH PAGE
// =====================
class NavigatorPushPage extends StatelessWidget {
  const NavigatorPushPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _contentPage(
      context,
      'Navigator Push Page',
      'halaman Navigator.push',
    );
  }
}

// =====================
// ROUTE PAGE
// =====================
class RoutePage extends StatelessWidget {
  const RoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return _contentPage(
      context,
      'Route Page',
      'halaman Navigator.pushNamed (Route)',
    );
  }
}

// =====================
// ABOUT PAGE
// =====================
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('About Page')),
    );
  }
}

// =====================
// HELPER CONTENT PAGE
// =====================
Widget _contentPage(BuildContext context, String title, String text) {
  return Scaffold(
    appBar: AppBar(title: Text(title)),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Kembali'),
          ),
        ],
      ),
    ),
  );
}

// =====================
// HELPER WIDGET
// =====================
Widget _infoRow(IconData icon, String text) {
  return Row(
    children: [
      Icon(icon, size: 20),
      const SizedBox(width: 10),
      Text(text),
    ],
  );
}

class _BottomAction extends StatelessWidget {
  final IconData icon;
  final String label;

  const _BottomAction({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon),
      label: Text(label),
    );
  }
}
