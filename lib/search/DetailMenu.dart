import 'package:flutter/material.dart';
import '../profile/Profile.dart';
import '../search/Search.dart';
import '../profile/Following.dart';
import '../profile/Followers.dart';
import '../Main.dart';
import '../search/DetailMenu.dart';
import '../community/Community.dart';
import '../reviews/Reviews.dart';
import '../home/HomePage.dart';

class DetailMenu extends StatelessWidget {
  const DetailMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe App',
      theme: ThemeData(
        primaryColor: const Color(0xFF2A9D8F),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2A9D8F),
          primary: const Color(0xFF2A9D8F),
        ),
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const DetailMenuScreen(),
    );
  }
}

class DetailMenuScreen extends StatefulWidget {
  const DetailMenuScreen({super.key});

  @override
  _DetailMenuScreenState createState() => _DetailMenuScreenState();
}

class _DetailMenuScreenState extends State<DetailMenuScreen> {
  int _selectedIndex = 0;
  List<bool> _isFavorited = [];
  final List<String> _steps = [
    'Panaskan oven hingga suhu 220°C (428°F) dan siapkan loyang dengan kertas roti.',
    'Gilas adonan pizza hingga berbentuk bundar atau sesuai ukuran loyang, lalu letakkan di atas loyang.',
    'Oleskan saus tomat segar secara merata di atas adonan, kemudian taburi dengan keju mozzarella parut.',
    'Tambahkan irisan salami di atas keju, lalu taburi oregano kering dan serpihan cabai merah jika suka.',
    'Panggang pizza di oven selama 12-15 menit hingga kulitnya renyah dan keju meleleh sempurna. Angkat dan hias dengan daun basil segar sebelum disajikan.',
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
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const RecipePage()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const ProfileRecipePage()),
        );
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = 1; // Set the default selected index to 1 (bubble chat icon)
    _isFavorited = List<bool>.filled(10, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header bar
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.teal,
                          ),
                          onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (_) => const Community()),
                              );
                            },
                        ),
                        const Spacer(),
                        const Text(
                          'Salami and cheese pizza',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Colors.teal,
                            shape: BoxShape.circle,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isFavorited[0] = !_isFavorited[0];
                              });
                            },
                            child: Icon(
                              _isFavorited[0]
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Colors.teal,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.share,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Image with overlaid title and icons
                  Center(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1513104890138-7c749659a591',
                            width: 300,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: 300,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => const Reviews(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "Salami and cheese pizza",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                // Ubah bagian ini di file asal
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.star, color: Colors.amber, size: 16),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const Reviews()),
                                        );
                                      },
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      '4.5', // Example rating
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.comment, color: Colors.grey, size: 16),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const Reviews()),
                                        );
                                      },
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      '12',
                                      style: TextStyle(fontSize: 12, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Author Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1513104890138-7c749659a591',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              '@josh-ryan',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Josh Ryan - Chef',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.teal[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Following',
                            style: TextStyle(color: Colors.teal),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.more_vert, color: Colors.teal),
                      ],
                    ),
                  ),

                  const Divider(indent: 16, endIndent: 16),

                  // Detail Section with time on the right
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Text(
                          'Detail',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2A9D8F),
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.access_time, size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(
                          '30min',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      "Pizza lezat dengan topping salami, keju mozzarella, saus tomat segar, dan rempah-rempah pilihan, dipanggang hingga kulitnya renyah dan keju meleleh sempurna, menciptakan hidangan yang memanjakan selera untuk segala suasana.",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Ingredients
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Bahan-Bahan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      '• 1 pizza dough (adonan pizza)\n'
                      '• 1/2 cangkir saus tomat segar\n'
                      '• 1 cangkir keju mozzarella parut\n'
                      '• 100 gram salami, iris tipis\n'
                      '• 1 sendok teh oregano kering\n'
                      '• 1/2 sendok teh serpihan cabai merah (opsional)\n'
                      '• 1 sendok makan minyak zaitun\n'
                      '• Daun basil segar untuk hiasan',
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Steps
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      '5 Langkah Mudah',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        for (var i = 0; i < _steps.length; i++)
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.teal[50],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(_steps[i]),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Custom Bottom Navigation
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 240,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(4, (index) {
                      final icons = [
                        Icons.home_outlined,
                        Icons.chat_bubble_outline,
                        Icons.search,
                        Icons.person_outline,
                      ];

                      final isSelected = _selectedIndex == index;

                      return GestureDetector(
                        onTap: () => _onNavItemTapped(index),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration:
                              isSelected &&
                                      index ==
                                          1 // Ensure only bubble chat is underlined
                                  ? const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                    ),
                                  )
                                  : null,
                          child: Icon(icons[index], color: Colors.white),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
