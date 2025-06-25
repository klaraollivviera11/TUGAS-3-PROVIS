import 'package:flutter/material.dart';
import '../Main.dart';
import '../navbar/custom_navbar.dart';
import '../community/community.dart';
import '../profile/Profile.dart';
import '../home/HomePage.dart';

// Impor RecipeViewPage
import 'RecipeView.dart';

class EditRecipePage extends StatefulWidget {
  const EditRecipePage({Key? key}) : super(key: key);

  @override
  State<EditRecipePage> createState() => _EditRecipePageState();
}

class _EditRecipePageState extends State<EditRecipePage> {
  final TextEditingController _titleController = TextEditingController(text: 'Pina Colada');
  final TextEditingController _descriptionController = TextEditingController(text: 'A Tropical Explosion in Every Sip');
  final TextEditingController _timeController = TextEditingController(text: '30min');
  
  // For new ingredient input
  final TextEditingController _ingredientAmountController = TextEditingController();
  final TextEditingController _ingredientNameController = TextEditingController();
  
  // Navigation state
  int _selectedIndex = 2; // Set to 2 for recipe tab
  
  // List to store ingredients
  List<Map<String, String>> ingredients = [
    {'amount': '60ml', 'name': 'White rum'},
    {'amount': '120ml', 'name': 'Pineapple juice'},
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Hindari perpindahan halaman jika pengguna menekan tab yang sedang aktif
    if (index == _selectedIndex) return;

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
        // Stay on current page or reload
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const ProfileRecipePage()),
        );
        break;
    }
  }

  // Fungsi untuk menampilkan dialog konfirmasi publish
  void _showPublishConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Publish Recipe',
            style: TextStyle(
              color: Color(0xFF2A9D8F),
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            'Are you sure you want to publish this recipe?',
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Tutup dialog
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Tutup dialog
                _publishRecipe(); // Panggil fungsi publish
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2A9D8F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Publish',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.white,
        );
      },
    );
  }

  // Fungsi untuk memproses publish dan navigasi ke halaman RecipeView
  void _publishRecipe() {
    // Tampilkan snackbar atau indikator lain bahwa resep berhasil dipublikasikan
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Recipe published successfully!'),
        backgroundColor: Color(0xFF2A9D8F),
        duration: Duration(seconds: 2),
      ),
    );

    // Navigasi ke halaman RecipeView dengan data dari form
    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => RecipeViewPage(
            title: _titleController.text,
            description: _descriptionController.text,
            time: _timeController.text,
            ingredients: List.from(ingredients), // Clone list untuk menghindari masalah referensi
            // Gunakan path gambar yang sama dengan yang di preview
            imageUrl: 'assets/images/pina_colada.jpg',
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _timeController.dispose();
    _ingredientAmountController.dispose();
    _ingredientNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF2A9D8F)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Create Recipe',
          style: TextStyle(
            color: Color(0xFF2A9D8F),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Publish and Delete buttons
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _showPublishConfirmation, // Panggil fungsi konfirmasi
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF90D4CE),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: const Text(
                            'Publish',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Delete functionality
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text(
                                    'Delete Recipe',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  content: const Text(
                                    'Are you sure you want to delete this recipe?',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'Cancel',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        // Kembali ke halaman sebelumnya
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'Delete',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF90D4CE),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: const Text(
                            'Delete',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Recipe image with play button
                  Container(
                    height: 240,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/pina_colada.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        // Optional gradient overlay
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.3),
                              ],
                            ),
                          ),
                        ),
                        // Play button
                        Center(
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                              color: Color(0xFF2A9D8F),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 36,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Title
                  const Text(
                    'Title',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFF90D4CE),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Description
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFF90D4CE),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Time Recipe
                  const Text(
                    'Time Recipe',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _timeController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFF90D4CE),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Ingredients
                  const Text(
                    'Ingredients',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  // List of ingredients
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: ingredients.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          children: [
                            // Drag handle
                            const Icon(
                              Icons.drag_handle,
                              color: Colors.grey,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            // Amount
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: const Color(0xFF90D4CE),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Text(
                                ingredients[index]['amount'] ?? '',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            // Name
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF90D4CE),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Text(
                                  ingredients[index]['name'] ?? '',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            // Delete button
                            IconButton(
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  ingredients.removeAt(index);
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  
                  // Add new ingredient button
                  TextButton(
                    onPressed: () {
                      // Show dialog to add new ingredient
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Add Ingredient'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                controller: _ingredientAmountController,
                                decoration: const InputDecoration(
                                  labelText: 'Amount (e.g., 60ml)',
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                controller: _ingredientNameController,
                                decoration: const InputDecoration(
                                  labelText: 'Ingredient Name',
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                if (_ingredientAmountController.text.isNotEmpty &&
                                    _ingredientNameController.text.isNotEmpty) {
                                  setState(() {
                                    ingredients.add({
                                      'amount': _ingredientAmountController.text,
                                      'name': _ingredientNameController.text,
                                    });
                                  });
                                  _ingredientAmountController.clear();
                                  _ingredientNameController.clear();
                                  Navigator.pop(context);
                                }
                              },
                              child: const Text('Add'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add, color: Color(0xFF2A9D8F)),
                        SizedBox(width: 8),
                        Text(
                          'Add Ingredient',
                          style: TextStyle(
                            color: Color(0xFF2A9D8F),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 80), // Space for bottom navigation
                ],
              ),
            ),
          ),
          
          // Bottom navigation bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomNavbar(
              selectedIndex: _selectedIndex,
              onItemTapped: _onNavItemTapped,
            ),
          ),
        ],
      ),
    );
  }
}

// Gunakan class yang ada dari modul yang diimpor
// Tidak perlu mendefinisikan ulang HomePage, ProfileRecipePage, dan CustomNavbar