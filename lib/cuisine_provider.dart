

import 'package:flutter/foundation.dart';

import 'cuisine_model.dart';
import 'global.dart';

class CuisineProvider with ChangeNotifier{
Cuisine cuisine;
List<CuisineElement> cuisineElement=[

  CuisineElement(
    id: "1",
    title: "Italian",
    image: "https://images.pexels.com/photos/2295285/pexels-photo-2295285.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    foodRecipe: [
      Recipe(
        id: 1,
        time: "25 Min",
        detail: lorem,
        title: "Caprese Salad",
        img: "https://images.pexels.com/photos/5710204/pexels-photo-5710204.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        ingre: "Tamato, Bassil, Olive oil, Salt, Black Pepper",
        directions: "$lorem\n$lorem\n$lorem",
     
     
      ),Recipe(
        id: 2,
        time: "15 Min",
        detail: "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
        title: "Pasta Carbonara",
          img: "https://images.pexels.com/photos/5710170/pexels-photo-5710170.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        ingre: "Tamato, Bassil, Olive oil, Salt, Black Pepper",
        directions: "$lorem\n$lorem\n$lorem",

      ),Recipe(
        id: 3,
        time: "32 Min",
        detail: "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
        title: "Bruschetta",
          img: "https://images.pexels.com/photos/4147872/pexels-photo-4147872.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        ingre: "Tamato, Bassil, Olive oil, Salt, Black Pepper",
        directions: "$lorem\n$lorem\n$lorem",

      ),Recipe(
        id: 4,
        time: "40 Min",
        detail: "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
        title: "Mushroom Risotto",
          img: "https://images.pexels.com/photos/7418497/pexels-photo-7418497.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        ingre: "Tamato, Bassil, Olive oil, Salt, Black Pepper",
        directions: "$lorem\n$lorem\n$lorem",

      ),
    ]
  ),
  CuisineElement(
    id: "2",
    title: "Indian",
    image: "https://images.pexels.com/photos/5835358/pexels-photo-5835358.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      foodRecipe: [
        Recipe(
            id: 1,
            time: "50 Min",
            detail: "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
            title: "Chicken Fry",
            img: "https://images.pexels.com/photos/6210876/pexels-photo-6210876.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          ingre: "Tamato, Bassil, Olive oil, Salt, Black Pepper",
          directions: "$lorem\n$lorem\n$lorem",
        ),

        Recipe(
            id: 2,
            time: "20 Min",
            detail: "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
            title: "Biryani",
            img: "https://images.pexels.com/photos/2302809/pexels-photo-2302809.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
          ingre: "Tamato, Bassil, Olive oil, Salt, Black Pepper",
          directions: "$lorem\n$lorem\n$lorem",
        ),

        Recipe(
            id: 3,
            time: "25 Min",
            detail: "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
            title: "Matar Paneer",
            img: "https://images.pexels.com/photos/2679501/pexels-photo-2679501.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
          ingre: "Tamato, Bassil, Olive oil, Salt, Black Pepper",
          directions: "$lorem\n$lorem\n$lorem",

        ),

        Recipe(
            id: 4,
            time: "28 Min",
            detail: "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
            title: "Rogan Josh",
            img: "https://images.pexels.com/photos/2641886/pexels-photo-2641886.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
          ingre: "Tamato, Bassil, Olive oil, Salt, Black Pepper",
          directions: "$lorem\n$lorem\n$lorem",

        ),
      ]
  ),
  CuisineElement(
    id: "3",
    title: "Chinese",
    image: "https://images.pexels.com/photos/5409015/pexels-photo-5409015.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      foodRecipe: [
        Recipe(
            id: 1,
            time: "30 Min",
            detail: "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
            title: "Noodles",
          img: "https://images.pexels.com/photos/4060347/pexels-photo-4060347.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          ingre: "Tamato, Bassil, Olive oil, Salt, Black Pepper",
          directions: "$lorem\n$lorem\n$lorem",
        ),Recipe(
            id: 2,
            time: "22 Min",
            detail: "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
            title: "Manchurian",
            img: "https://images.pexels.com/photos/33162/food-restaurant-menu-asia.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          ingre: "Tamato, Bassil, Olive oil, Salt, Black Pepper",
          directions: "$lorem\n$lorem\n$lorem",

        ),Recipe(
            id: 3,
            time: "26 Min",
            detail: "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
            title: "Momos",
            img: "https://images.pexels.com/photos/5409023/pexels-photo-5409023.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          ingre: "Tamato, Bassil, Olive oil, Salt, Black Pepper",
          directions: "$lorem\n$lorem\n$lorem",

        ),Recipe(
            id: 4,
            time: "45 Min",
            detail: "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
            title: "White Momo",
            img: "https://images.pexels.com/photos/5409009/pexels-photo-5409009.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          ingre: "Tamato, Bassil, Olive oil, Salt, Black Pepper",
          directions: "$lorem\n$lorem\n$lorem",

        ),
      ]
  ),

];

}