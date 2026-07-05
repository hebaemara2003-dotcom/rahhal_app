class TopRatedPlaces {
  TopRatedPlaces({
    this.id,
    this.name,
    this.visitingTime,
    this.price,
    this.city,
    this.category,
    this.rating,
    this.historicalBackGround,
    this.latitude,
    this.longitude,
    this.mainImageUrl,
    this.galleryImages,
    this.isFavorite,
  });

  TopRatedPlaces.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    visitingTime = json['visitingTime'];
    price = (json['price'] as num?)?.toDouble();
    city = json['city'];
    category = json['category'];
    rating = (json['rating'] as num?)?.toDouble();
    historicalBackGround = json['historicalBackGround'];
    latitude = (json['latitude'] as num?)?.toDouble();
    longitude = (json['longitude'] as num?)?.toDouble();
    mainImageUrl = json['mainImageUrl'];

    if (json['galleryImages'] != null) {
      galleryImages = List<dynamic>.from(json['galleryImages']);
    }

    isFavorite = json['isFavorite'];
  }

  int? id;
  String? name;
  String? visitingTime;
  double? price;
  String? city;
  String? category;
  double? rating;
  String? historicalBackGround;
  double? latitude;
  double? longitude;
  String? mainImageUrl;
  List<dynamic>? galleryImages;
  bool? isFavorite;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['id'] = id;
    map['name'] = name;
    map['visitingTime'] = visitingTime;
    map['price'] = price;
    map['city'] = city;
    map['category'] = category;
    map['rating'] = rating;
    map['historicalBackGround'] = historicalBackGround;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['mainImageUrl'] = mainImageUrl;
    map['galleryImages'] = galleryImages;
    map['isFavorite'] = isFavorite;

    return map;
  }
}