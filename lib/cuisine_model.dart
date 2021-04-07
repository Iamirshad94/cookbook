class Cuisine {
  Cuisine({
    this.cuisine,
  });

  List<CuisineElement> cuisine;

  factory Cuisine.fromJson(Map<String, dynamic> json) => Cuisine(
    cuisine: List<CuisineElement>.from(json["cuisine"].map((x) => CuisineElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cuisine": List<dynamic>.from(cuisine.map((x) => x.toJson())),
  };
}

class CuisineElement {
  CuisineElement({
    this.id,
    this.image,
    this.title,
    this.foodRecipe
    
  });

  String id;
  String image;
  String title;
  List <Recipe> foodRecipe;


  factory CuisineElement.fromJson(Map<String, dynamic> json) => CuisineElement(
    id: json["id"],
    image: json["image"],
    title: json["title"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "title": title,

  };

}

class Recipe {
  int id;
  String time;
  String title;
  String detail;
  String img;
  String ingre;
  String directions;

  Recipe({
    this.id,
    this.time,
    this.title,
    this.detail,
    this.img,
    this.ingre,
    this.directions,
});

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
    id: json["id"],
    time: json["time"],
    title: json["title"],
    detail: json["detail"],
    img: json["img"],
    ingre: json["ingre"],
    directions: json["directions"],

  );

  Map<String, dynamic> toJson() => {
    "id":id,
    "time": time,
    "title": title,
    "detail": detail,
    "img": img,
    "ingre": ingre,
    "directions": directions,

  };
}

