import 'package:flutter/material.dart';

// Import the Recipe class from the main file
import '../trending_resep/TrendingResep.dart';

// Tiramisu recipe data
const tiramisuRecipe = Recipe(
  id: '4',
  image: 'https://images.unsplash.com/photo-1571877227200-a0d98ea607e9',
  title: 'Tiramisu',
  description:
      'Dessert kaya rasa yang direndam kopi, dengan lapisan mascarpone dan cokelat',
  chef: 'DessertPro',
  chefImage: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2',
  time: '3 hrs',
  rating: 4.9,
  isFeatured: false,
  ingredients: [
    '6 kuning telur',
    '3/4 cangkir gula putih',
    '2/3 cangkir susu',
    '1 1/4 cangkir krim kental',
    '1/2 sendok teh ekstrak vanila',
    '1 pound keju mascarpone',
    '1/4 cangkir kopi kental, suhu ruangan',
    '2 sendok makan rum',
    '24 biskuit ladyfinger',
    '1 sendok makan bubuk cokelat tanpa pemanis',
  ],
  detailedDescription:
      'Dessert Italia klasik ini adalah keseimbangan sempurna antara mascarpone yang lembut, biskuit ladyfinger yang direndam kopi, dan sedikit cokelat. Lapisan-lapisannya menciptakan tampilan yang indah dan rasanya menyatu untuk hidangan yang canggih dan lezat. Buat sebelumnya untuk pengembangan rasa terbaik.',
);
