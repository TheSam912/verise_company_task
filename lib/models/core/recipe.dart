class Recipe {
  String title;
  String photo;
  String calories;
  String time;
  String rate;
  String description;

  var ingredients;
  List<TutorialStep>? tutorial;
  List<Review>? reviews;

  Recipe(
      {required this.title,
      required this.photo,
      required this.calories,
      required this.time,
      required this.rate,
      required this.description,
      this.ingredients,
      this.tutorial,
      this.reviews});

  factory Recipe.fromJson(Map<String, Object> json) {
    return Recipe(
      title: json['title'] as String,
      photo: json['photo'] as String,
      calories: json['calories'] as String,
      time: json['time'] as String,
      rate: json['rate'] as String,
      description: json['description'] as String,
    );
  }
}

class TutorialStep {
  String step;
  String description;

  TutorialStep({required this.step, required this.description});

  Map<String, Object> toMap() {
    return {
      'step': step,
      'description': description,
    };
  }

  factory TutorialStep.fromJson(Map<String, Object> json) => TutorialStep(
        step: json['step'] as String,
        description: json['description'] as String,
      );

  static List<TutorialStep> toList(List<Map<String, Object>> json) {
    return List.from(json)
        .map(
            (e) => TutorialStep(step: e['step'], description: e['description']))
        .toList();
  }
}

class Review {
  String? username;
  String? review;

  Review({this.username, this.review});

  factory Review.fromJson(Map<String, Object> json) => Review(
        review: json['review'] as String,
        username: json['username'] as String,
      );

  Map<String, Object> toMap() {
    return {
      'username': username as String,
      'review': review as String,
    };
  }

  static List<Review> toList(List<Map<String, Object>> json) {
    return List.from(json)
        .map((e) => Review(username: e['username'], review: e['review']))
        .toList();
  }
}

class Ingredient {
  String name;
  String size;

  Ingredient({required this.name, required this.size});

  factory Ingredient.fromJson(Map<String, Object> json) => Ingredient(
        name: json['name'] as String,
        size: json['size'] as String,
      );

  Map<String, Object> toMap() {
    return {
      'name': name,
      'size': size,
    };
  }

  static List<Ingredient> toList(List<Map<String, Object>> json) {
    return List.from(json)
        .map((e) => Ingredient(name: e['name'], size: e['size']))
        .toList();
  }
}
