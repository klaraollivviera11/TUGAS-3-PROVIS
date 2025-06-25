import 'package:flutter/material.dart';
import '../Main.dart';
import '../navbar/custom_navbar.dart';
import '../community/community.dart';
import '../myresep/EditRecipe.dart';
import '../search/Search.dart';
import 'Following.dart' show FollowingPage;
import 'Followers.dart' show FollowersPage;
import '../profile/EditProfile.dart';
import '../profile/ShareProfile.dart';
import '../home/HomePage.dart';

class ProfileRecipePage extends StatefulWidget {
  const ProfileRecipePage({Key? key}) : super(key: key);

  @override
  State<ProfileRecipePage> createState() => _ProfileRecipePageState();
}

class _ProfileRecipePageState extends State<ProfileRecipePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 3;

  // Sample data for recipes
  final List<Map<String, dynamic>> recipes = [
    {
      'title': 'Béchamel Pasta',
      'description': 'A creamy and indulgent...',
      'image': 'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9',
      'rating': 4,
      'time': '30min',
      'isFavorite': false,
    },
    {
      'title': 'Grilled Skewers',
      'description': 'Succulent morsels...',
      'image': 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1',
      'rating': 4,
      'time': '30min',
      'isFavorite': true,
    },
    {
      'title': 'Nut brownie',
      'description': 'Is a rich and indulgent dessert...',
      'image': 'https://www.shugarysweets.com/wp-content/uploads/2021/02/walnut-brownies-thick.jpg',
      'rating': 4,
      'time': '30min',
      'isFavorite': false,
    },
    {
      'title': 'Oatmeal pancakes',
      'description': 'These nutritious delights offer a satisfying...',
      'image': 'https://images.unsplash.com/photo-1506084868230-bb9d95c24759',
      'rating': 4,
      'time': '30min',
      'isFavorite': true,
    },
  ];

  // Sample data for favorite recipes
  final List<Map<String, dynamic>> favorites = [
    {
      'title': 'French Toast',
      'description': 'Delicious slices of bread...',
      'image': 'https://images.unsplash.com/photo-1484723091739-30a097e8f929',
      'rating': 5,
      'time': '20min',
      'isFavorite': true,
    },
    {
      'title': 'Fruit Crepes',
      'description': 'Fruity-filled chocolate crepes',
      'image': 'https://images.unsplash.com/photo-1519676867240-f03562e64548',
      'rating': 4,
      'time': '20min',
      'isFavorite': true,
    },
    {
      'title': 'Baked Chicken',
      'description': 'Delicious and juicy wings',
      'image': 'https://images.unsplash.com/photo-1527477396000-e27163b481c2',
      'rating': 5,
      'time': '30min',
      'isFavorite': true,
    },
    {
      'title': 'Quinoa Salad',
      'description': 'Nutrient-rich quinoa tossed in salad',
      'image': 'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af',
      'rating': 4,
      'time': '30min',
      'isFavorite': true,
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
          MaterialPageRoute(builder: (_) => const RecipePage()),
        );
        break;
      case 3:
        // Tetap di halaman profil
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                _buildProfileHeader(),
                _buildProfileActions(),
                _buildProfileStats(),
                _buildTabBar(),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildRecipeGrid(), // Recipe tab content
                      _buildFavoritesGrid(), // Favorites tab content
                    ],
                  ),
                ),
                // Add some bottom padding to make room for the navbar
                const SizedBox(height: 80),
              ],
            ),
          ),
          // Add the CustomNavbar here
          CustomNavbar(
            selectedIndex: _selectedIndex,
            onItemTapped: _onNavItemTapped,
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330'),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                color: const Color(0xFF2A9D8F),
                width: 2,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hafsah Hamidah',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2A9D8F),
                  ),
                ),
                const Text(
                  '@hafsahcantik',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'My passion is cooking and sharing new recipes with the world.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Column(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xFFAFDED9),
                radius: 16,
                child: IconButton(
                  icon: const Icon(Icons.add, size: 16, color: Color(0xFF2A9D8F)),
                  onPressed: () {
                    // Navigate to RecipeViewPage when the + button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditRecipePage(),
                      ),
                    );
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ),
              const SizedBox(height: 8),
              CircleAvatar(
                backgroundColor: const Color(0xFFAFDED9),
                radius: 16,
                child: IconButton(
                  icon: const Icon(Icons.menu, size: 16, color: Color(0xFF2A9D8F)),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // Navigate to EditProfile page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditProfile()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFAFDED9),
                foregroundColor: const Color(0xFF2A9D8F),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text(
                'Edit Profile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // Navigate to ShareProfile page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ShareProfile()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFAFDED9),
                foregroundColor: const Color(0xFF2A9D8F),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text(
                'Share Profile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileStats() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem('60', 'recipes'),
          Container(
            height: 30,
            width: 1,
            color: Colors.grey.shade300,
          ),
          InkWell(
            onTap: () {
              // Navigate to Following page using MaterialPageRoute
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FollowingPage()),
              );
            },
            child: _buildStatItem('120', 'Following'),
          ),
          Container(
            height: 30,
            width: 1,
            color: Colors.grey.shade300,
          ),
          InkWell(
            onTap: () {
              // Navigate to Followers page using MaterialPageRoute
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FollowersPage()),
              );
            },
            child: _buildStatItem('250', 'Followers'),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: TabBar(
        controller: _tabController,
        labelColor: const Color(0xFF2A9D8F),
        unselectedLabelColor: Colors.grey,
        indicatorColor: const Color(0xFF2A9D8F),
        indicatorWeight: 3,
        tabs: const [
          Tab(text: 'Recipe'),
          Tab(text: 'Favorites'),
        ],
      ),
    );
  }

  Widget _buildRecipeGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        return _buildRecipeCard(recipe);
      },
    );
  }

  Widget _buildFavoritesGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        final recipe = favorites[index];
        return _buildRecipeCard(recipe);
      },
    );
  }

  Widget _buildRecipeCard(Map<String, dynamic> recipe) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.network(
                  recipe['image'],
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    icon: Icon(
                      recipe['isFavorite'] ? Icons.favorite : Icons.favorite_border,
                      color: recipe['isFavorite'] ? Colors.red : Colors.grey,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        recipe['isFavorite'] = !recipe['isFavorite'];
                      });
                    },
                    constraints: const BoxConstraints(
                      minWidth: 30,
                      minHeight: 30,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe['title'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  recipe['description'],
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${recipe['rating']}',
                          style: const TextStyle(
                            color: Color(0xFF2A9D8F),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.star,
                          color: Color(0xFF2A9D8F),
                          size: 14,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          color: Colors.grey,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          recipe['time'],
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}