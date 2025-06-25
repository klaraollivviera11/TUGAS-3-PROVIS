import 'package:flutter/material.dart';

// Import the Recipe class from the main file
import '../trending_resep/TrendingResep.dart';

// Pizza recipe data
const pizzaRecipe = Recipe(
  id: '1',
  image: 'https://images.unsplash.com/photo-1513104890138-7c749659a591',
  title: 'Garlic and Cheese pizza',
  description: 'Pizza bawang putih dan keju dengan kerak renyah yang sempurna',
  chef: 'PizzaMaster',
  chefImage: 'https://images.unsplash.com/photo-1566554273541-37a9ca77b91f',
  time: '30 mins',
  rating: 4.8,
  isFeatured: true,
  ingredients: [
    '2 cangkir tepung serbaguna',
    '1 sendok teh garam',
    '3/4 cangkir air hangat',
    '1 sendok makan ragi kering aktif',
    '1 sendok makan minyak zaitun',
    '3 siung bawang putih, cincang halus',
    '2 cangkir keju mozzarella, parut',
    '1/4 cangkir keju parmesan, parut',
    '2 sendok makan daun basil segar, cincang',
  ],
  detailedDescription:
      'Pizza bawang putih dan keju ini menggabungkan perpaduan rasa yang sempurna dengan kerak yang renyah namun kenyal. Kombinasi mozzarella dan parmesan menciptakan tekstur yang kaya dan lembut, sementara bawang putih segar menambahkan cita rasa yang membuat pizza ini tak tertahankan. Sempurna untuk makan malam keluarga atau menjamu tamu.',
);
