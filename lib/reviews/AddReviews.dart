import 'package:flutter/material.dart';
import '../profile/Profile.dart';
import '../search/Search.dart';
import '../profile/Following.dart';
import '../profile/Followers.dart';
import '../Main.dart';
import '../search/DetailMenu.dart';
import '../community/Community.dart';
import '../home/HomePage.dart';

class ReviewForm extends StatelessWidget {
  const ReviewForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF008080),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const ReviewFormPage(),
    );
  }
}

class ReviewFormPage extends StatefulWidget {
  const ReviewFormPage({Key? key}) : super(key: key);

  @override
  State<ReviewFormPage> createState() => _ReviewFormPageState();
}

class _ReviewFormPageState extends State<ReviewFormPage> {
  int _rating = 2; // Default rating (2 stars)
  bool _recommended = true; // Default recommendation (Yes)
  final TextEditingController _reviewController = TextEditingController();
  bool _showSuccessModal = false;

  int _selectedIndex = 1;

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
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  void _submitReview() {
    // Show success modal
    setState(() {
      _showSuccessModal = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main content
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const DetailMenu()),
                  );
                },
                child: const Icon(Icons.arrow_back, color: Color(0xFF008080)),
              ),
              const Expanded(
                child: Center(
                  child: Text(
              'Leave A Review',
              style: TextStyle(
                color: Color(0xFF008080),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
                  ),
                ),
              ),
              const SizedBox(width: 24), // Balance the header
            ],
                ),
              ),
              
              // Food image and name
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Column(
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&h=400&q=80',
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                width: double.infinity,
                color: const Color(0xFF008080),
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: const Center(
                  child: Text(
              'Chicken Burger',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
                  ),
                ),
              ),
            ],
                ),
              ),
              
                    const SizedBox(height: 16),
                    
                    // Rating stars
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(5, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _rating = index + 1;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Icon(
                                index < _rating ? Icons.star : Icons.star_border,
                                color: const Color(0xFF008080),
                                size: 32,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    
                    const SizedBox(height: 4),
                    
                    // Rating text
                    const Center(
                      child: Text(
                        'Your overall rating',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Review text field
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFADE1E5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: _reviewController,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          hintText: 'Leave us Review!',
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Add photo button
                    GestureDetector(
                      onTap: () {
                        // Handle add photo
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: const BoxDecoration(
                              color: Color(0xFFADE1E5),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.black54,
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Add Photo',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Recommendation question
                    const Text(
                      'Do you recommend this recipe?',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    
                    const SizedBox(height: 8),
                    
                    // Yes/No options
                    Row(
                      children: [
                        // No option
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _recommended = false;
                              });
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color(0xFF008080),
                                      width: 2,
                                    ),
                                    color: _recommended ? Colors.transparent : Colors.transparent,
                                  ),
                                  child: _recommended
                                      ? null
                                      : const Center(
                                          child: Icon(
                                            Icons.circle,
                                            size: 10,
                                            color: Color(0xFF008080),
                                          ),
                                        ),
                                ),
                                const SizedBox(width: 8),
                                const Text('No'),
                              ],
                            ),
                          ),
                        ),
                        
                        // Yes option
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _recommended = true;
                              });
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color(0xFF008080),
                                      width: 2,
                                    ),
                                    color: _recommended ? Colors.transparent : Colors.transparent,
                                  ),
                                  child: _recommended
                                      ? const Center(
                                          child: Icon(
                                            Icons.circle,
                                            size: 10,
                                            color: Color(0xFF008080),
                                          ),
                                        )
                                      : null,
                                ),
                                const SizedBox(width: 8),
                                const Text('Yes'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Cancel and Submit buttons
                    Row(
                      children: [
                        // Cancel button
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (_) => const DetailMenu()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFADE1E5),
                              foregroundColor: Colors.black54,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: const Text('Cancel'),
                          ),
                        ),
                        
                        const SizedBox(width: 16),
                        
                        // Submit button
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _submitReview,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF008080),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: const Text('Submit'),
                          ),
                        ),
                      ],
                    ),
                    
                    // Add bottom padding for navigation bar
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
          
          // Success Modal Overlay
          if (_showSuccessModal)
            Container(
              color: Colors.black.withOpacity(0.5),
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: Container(
                  width: 280,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Thank You For\nYour Review!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF008080),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.check,
                            color: Color(0xFF008080),
                            size: 40,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigate to home
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF008080),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: const Text('Go To Home'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
            // Bagian ini akan mengisi sisa ruang yang tersisa
            child: Center(),
          ),
          // Bottom Navigation
          Positioned(
            bottom: 30,
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
    );
  }
}
