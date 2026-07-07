class BasketResponse {
  BasketResponse({
    this.id,
    this.items,
    this.totalCost,
    this.numberOfPlaces,
    this.durationDays,
  });

  BasketResponse.fromJson(dynamic json) {
    id = json['id'];
    totalCost = json['totalCost'];
    numberOfPlaces = json['numberOfPlaces'];
    durationDays = json['durationDays'];

    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items!.add(BasketItem.fromJson(v));
      });
    }
  }

  String? id;
  List<BasketItem>? items;
  double? totalCost;
  int? numberOfPlaces;
  int? durationDays;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['totalCost'] = totalCost;
    map['numberOfPlaces'] = numberOfPlaces;
    map['durationDays'] = durationDays;

    if (items != null) {
      map['items'] = items!.map((e) => e.toJson()).toList();
    }

    return map;
  }
}

class BasketItem {
  BasketItem({
    this.id,
    this.type,
    this.entityId,
    this.name,
    this.city,
    this.description,
    this.imageUrl,
    this.price,
    this.quantity,
    this.addedAt,
  });

  BasketItem.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    entityId = json['entityId'];
    name = json['name'];
    city = json['city'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    price = json['price'];
    quantity = json['quantity'];
    addedAt = json['addedAt'];
  }

  int? id;
  String? type;
  int? entityId;
  String? name;
  String? city;
  String? description;
  String? imageUrl;
  double? price;
  int? quantity;
  String? addedAt;

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "type": type,
      "entityId": entityId,
      "name": name,
      "city": city,
      "description": description,
      "imageUrl": imageUrl,
      "price": price,
      "quantity": quantity,
      "addedAt": addedAt,
    };
  }
}