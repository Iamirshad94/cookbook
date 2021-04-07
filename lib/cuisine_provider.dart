

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
        time: "25 Min",
        detail: "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
        title: "Pasta Carbonara",
          img: "https://images.pexels.com/photos/5710170/pexels-photo-5710170.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        ingre: "Tamato, Bassil, Olive oil, Salt, Black Pepper",
        directions: "$lorem\n$lorem\n$lorem",

      ),Recipe(
        id: 3,
        time: "25 Min",
        detail: "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
        title: "Bruschetta",
          img: "https://images.pexels.com/photos/4147872/pexels-photo-4147872.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        ingre: "Tamato, Bassil, Olive oil, Salt, Black Pepper",
        directions: "$lorem\n$lorem\n$lorem",

      ),Recipe(
        id: 4,
        time: "25 Min",
        detail: "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
        title: "Mushroom Risotto",
          img: "https://images.pexels.com/photos/262967/pexels-photo-262967.jpeg?w=4&h=4&fit=crop",
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
            time: "25 Min",
            detail: "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
            title: "Chicken Fry",
            img: "https://images.pexels.com/photos/1624487/pexels-photo-1624487.jpeg?w=4&h=4&fit=crop",
          ingre: "Tamato, Bassil, Olive oil, Salt, Black Pepper",
          directions: "$lorem\n$lorem\n$lorem",
        ),

        Recipe(
            id: 2,
            time: "25 Min",
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
            time: "25 Min",
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
            time: "25 Min",
            detail: "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
            title: "Noodles",
          img: "https://images.pexels.com/photos/4060347/pexels-photo-4060347.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          ingre: "Tamato, Bassil, Olive oil, Salt, Black Pepper",
          directions: "$lorem\n$lorem\n$lorem",
        ),Recipe(
            id: 2,
            time: "25 Min",
            detail: "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
            title: "manchurian",
            img: "https://images.pexels.com/photos/33162/food-restaurant-menu-asia.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          ingre: "Tamato, Bassil, Olive oil, Salt, Black Pepper",
          directions: "$lorem\n$lorem\n$lorem",

        ),Recipe(
            id: 3,
            time: "25 Min",
            detail: "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
            title: "Momos",
            img: "https://images.pexels.com/photos/5409015/pexels-photo-5409015.jpeg?w=4&h=4&fit=crop",
          ingre: "Tamato, Bassil, Olive oil, Salt, Black Pepper",
          directions: "$lorem\n$lorem\n$lorem",

        ),Recipe(
            id: 4,
            time: "25 Min",
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