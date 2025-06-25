import 'package:flutter/material.dart';

// Import the Recipe class from the main file
import '../trending_resep/TrendingResep.dart';

// Burger recipe data
const burgerRecipe = Recipe(
  id: '3',
  image: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd',
  title: 'Chicken Burger',
  description: 'Burger ayam lezat dengan patty ayam berbumbu dan topping segar',
  chef: 'Chef Tom',
  chefImage: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e',
  time: '20 mins',
  rating: 4.5,
  isFeatured: false,
  ingredients: [
    '1 lb ayam giling',
    '1 telur',
    '1/2 cangkir tepung roti',
    '1 sendok teh bubuk bawang putih',
    '1 sendok teh bubuk bawang bombay',
    '1/2 sendok teh paprika',
    'Garam dan merica secukupnya',
    '4 roti burger',
    'Selada, tomat, bawang untuk topping',
    'Mayones dan mustard untuk saji',
  ],
  detailedDescription:
      'Burger ayam ini adalah alternatif yang lebih sehat dibandingkan burger daging sapi tradisional tanpa mengorbankan rasa. Patty ayam berbumbu ini juicy dan lezat, dilengkapi dengan topping segar dan pilihan saus. Sempurna untuk makan malam cepat di hari kerja atau barbeku akhir pekan.',
);
