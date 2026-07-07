class GenerateItineraryRequest {
  String? city;
  int? durationDays;
  String? category;
  double? budget;
  bool? isEgyptian;
  bool? isStudent;
  String? language;
  int? travelersCount;

  GenerateItineraryRequest({
    this.city,
    this.durationDays,
    this.category,
    this.budget,
    this.isEgyptian,
    this.isStudent,
    this.language,
    this.travelersCount,
  });

  Map<String, dynamic> toJson() {
    return {
      "city": city,
      "durationDays": durationDays,
      "category": category,
      "budget": budget,
      "isEgyptian": isEgyptian,
      "isStudent": isStudent,
      "language": language,
      "travelersCount": travelersCount,
    };
  }
}