import 'package:flutter/material.dart';
import '../Main.dart';
import '../navbar/custom_navbar.dart';
import '../community/community.dart';
import '../myresep/EditRecipe.dart';
import '../search/Search.dart';
import 'Followers.dart' show FollowersPage;
import '../home/HomePage.dart';


class FollowingPage extends StatefulWidget {
  const FollowingPage({Key? key}) : super(key: key);

  @override
  State<FollowingPage> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 3; // Set to profile tab
  
  // Sample data for following users
  final List<Map<String, dynamic>> following = [
    {
      'username': '@nnoel_dsp',
      'name': 'Manuel Simbolon',
      'image': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
    },
    {
      'username': '@chef_mami',
      'name': 'Emily Wangui',
      'image': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
    },
    {
      'username': '@asifavegan',
      'name': 'Asifa Sababi',
      'image': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80',
    },
    {
      'username': '@yathycookguy',
      'name': 'Yathy',
      'image': 'https://images.unsplash.com/photo-1544005313-94ddf0286df2',
    },
    {
      'username': '@kariacu',
      'name': 'Karii Riyasiddel',
      'image': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d',
    },
    {
      'username': '@asifavegan',
      'name': 'Asifa Sababia',
      'image': 'https://images.unsplash.com/photo-1499952127939-9bbf5af6c51c',
    },
    {
      'username': '@speedchef',
      'name': 'Speed sisuu',
      'image': 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d',
    },
    {
      'username': '@flavorswithflavian',
      'name': 'Flavian',
      'image': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
    },
    {
      'username': '@rawfood_',
      'name': 'Raw Food',
      'image': 'https://images.unsplash.com/photo-1531123897727-8f129e1688ce',
    },
    {
      'username': '@veganfood',
      'name': 'Vegan Food',
      'image': 'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0',
    },
    {
      'username': '@veganfoodie',
      'name': 'Vegan Foodie',
      'image': 'https://images.unsplash.com/photo-1514516879220-2c8f3b1a5e6b',
    },
    {
      'username': '@veganfoodlover',
      'name': 'Vegan Food Lover',
      'image': 'https://images.unsplash.com/photo-1514516879220-2c8f3b1a5e6b',
    },
    {
      'username': '@veganfoodblogger',
      'name': 'Vegan Food Blogger',
      'image': 'https://images.unsplash.com/photo-1514516879220-2c8f3b1a5e6b',
    },
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

       switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const Community()),
        );
        break;
      case 2:
        // Navigasi ke halaman resep, pastikan kelas RecipePage telah didefinisikan
        // atau diganti dengan kelas yang sesuai di proyek Anda
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const EditRecipePage()),
        );
        break;
      case 3:
        // Tetap di halaman profil
        break;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                _buildHeader(context),
                _buildSearchBar(),
                Expanded(
                  child: _buildFollowingList(),
                ),
                const SizedBox(height: 80), // Space for navigation bar
              ],
            ),
            // Add the CustomNavbar here
            CustomNavbar(
              selectedIndex: _selectedIndex,
              onItemTapped: _onNavItemTapped,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF2A9D8F)),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () => Navigator.of(context).pop(),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '@hafsahcantik',
                style: TextStyle(
                  color: Color(0xFF2A9D8F),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFF2A9D8F),
                          width: 2.0,
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.only(bottom: 4),
                    child: const Text(
                      '120 Following',
                      style: TextStyle(
                        color: Color(0xFF2A9D8F),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      // Navigate to followers page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const FollowersPage()),
                      );
                    },
                    child: const Text(
                      '250 Followers',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFF90D4CE),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        controller: _searchController,
        decoration: const InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.white70),
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(bottom: 12),
        ),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildFollowingList() {
    return ListView.builder(
      itemCount: following.length,
      padding: const EdgeInsets.all(0),
      itemBuilder: (context, index) {
        final user = following[index];
        return _buildFollowingItem(user);
      },
    );
  }

  Widget _buildFollowingItem(Map<String, dynamic> user) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          // Profile Image
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(user['image']),
          ),
          const SizedBox(width: 12),
          
          // Username and Name
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user['username'],
                  style: const TextStyle(
                    color: Color(0xFF2A9D8F),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  user['name'],
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          
          // Following Button
          Container(
            height: 30,
            margin: const EdgeInsets.only(right: 8),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF90D4CE),
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: const Size(80, 30),
              ),
              child: const Text(
                'Following',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          
          // More Options Button
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.grey),
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomNavBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        color: Color(0xFF006D77),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.home_outlined, color: Colors.white),
            onPressed: () => _onNavItemTapped(0),
          ),
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline, color: Colors.white),
            onPressed: () => _onNavItemTapped(1),
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () => _onNavItemTapped(2),
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () => _onNavItemTapped(3),
          ),
        ],
      ),
    );
  }
}