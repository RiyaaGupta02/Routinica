class Recipe {
  //so here whatever criterias required from the API by testing its endpoints
  // chose them & put them here
  final String name;
  final String images;
  final double rating;
  final String totalTime;

  // then need to initialise var or else error comes
  Recipe(
      {required this.name,
      required this.images,
      required this.rating,
      required this.totalTime});
  //this allow us to instantiate var getting from the JSON file
  // lets create a factory recipe from json func

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        name: json['name'], //json name cos its a key getting from api
        images: json['images'][0]['hostedLargeUrl']
            as String, //as img not a String an array hence bringing it like this
        rating: json['rating'] as double,
        totalTime: json['totalTime'] as String);
  }

  // now create another func recipe from the snapshots
  // take list of data converting to recipe
  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  // now will create an API integration
  //as unable to read the api one so func for able to read data coming
  @override
  String toString() {
    //customizing our printed output
    return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime}';
  }
}
