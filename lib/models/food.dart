class GenerateFoodResponse {
  List<FoodRecommendation>? recommendation;

  GenerateFoodResponse({
    this.recommendation
  });

  factory GenerateFoodResponse.fromJson(Map<String, dynamic> json) {
    return GenerateFoodResponse(
      recommendation: (json['recommendation'] as List<dynamic>?)
          ?.map((item) => FoodRecommendation.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'recommendation': recommendation?.map((item) => item.toJson()).toList(),
    };
  }
}

class FoodRecommendation {
  String? id;
  String? reasoning;
  String? ratingCount;
  String? description;
  String? rating;
  String? price;
  String? city;
  String? name;
  dynamic image;
  String? market;
  String? category;
  Restaurant? restaurant;

  FoodRecommendation({
    this.id,
    this.reasoning,
    this.ratingCount,
    this.description,
    this.rating,
    this.price,
    this.city,
    this.name,
    this.image,
    this.market,
    this.category,
    this.restaurant,
  });

  factory FoodRecommendation.fromJson(Map<String, dynamic> json) {
    return FoodRecommendation(
      id: json['id'] as String?,
      reasoning: json['reasoning'] as String?,
      ratingCount: json['ratingCount'] as String?,
      description: json['description'] as String?,
      rating: json['rating'] as String?,
      price: json['price'] as String?,
      city: json['city'] as String?,
      name: json['name'] as String?,
      image: json['image'],
      market: json['market'] as String?,
      category: json['category'] as String?,
      restaurant: json['restaurant'] != null
          ? Restaurant.fromJson(json['restaurant'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reasoning': reasoning,
      'ratingCount': ratingCount,
      'description': description,
      'rating': rating,
      'price': price,
      'city': city,
      'name': name,
      'image': image,
      'market': market,
      'category': category,
      'restaurant': restaurant?.toJson(),
    };
  }

}

class Restaurant {
  String? name;
  String? description;
  String? image;
  String? address;
  double? latitude;
  double? longitude;

  Restaurant({
    this.name,
    this.description,
    this.image,
    this.address,
    this.latitude,
    this.longitude,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      address: json['address'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'image': image,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
