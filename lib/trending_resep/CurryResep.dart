import 'package:flutter/material.dart';

// Import the Recipe class from the main file
import '../trending_resep/TrendingResep.dart';

// Curry recipe data
const curryRecipe = Recipe(
  id: '2',
  image: 'https://images.unsplash.com/photo-1565557623262-b51c2513a641',
  title: 'Chicken Curry',
  description:
      'Nikmati Kari Ayam yang harum ini dengan campuran rempah-rempah dan saus krim',
  chef: 'gymincooking',
  chefImage: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80',
  time: '45 mins',
  rating: 4.7,
  isFeatured: false,
  ingredients: [
    '1 lb (450g) dada ayam tanpa tulang dan kulit, potong dadu',
    '2 sendok makan minyak sayur',
    '1 bawang bombay besar, cincang halus',
    '3 siung bawang putih, cincang halus',
    '1 sendok makan jahe, parut',
    '2 sendok makan bubuk kari',
    '1 sendok teh kunyit',
    '1 sendok teh jintan',
    '1 kaleng (400ml) santan',
    'Garam dan merica secukupnya',
    'Daun ketumbar segar untuk hiasan',
  ],
  detailedDescription:
      'Ayam ternak sebagai yah, muy masak mah nak sia, pangan kaya orang masak, sedapan rasani orang atasi bahan yang bagus, rasa nya sedap masak makang bagus.',
);
