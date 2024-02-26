class Business {
  String businessId;
  String ownerId;
  bool isIndividual;
  String businessName;
  String? businessEmail;
  String? businessPhoneNumber;
  String? businessLogo;
  String local;
  String services;
  String portfolio;
  String price;
  String rating;
  bool isAvailable;
  String? description;

  Business({
    required this.businessId,
    required this.ownerId,
    required this.isIndividual,
    required this.businessName,
    this.businessEmail,
    this.businessPhoneNumber,
    this.businessLogo,
    required this.local,
    required this.services,
    required this.portfolio,
    required this.price,
    required this.rating,
    required this.isAvailable,
    this.description,
  });

  static Business fromMap(Map<String, dynamic> map) {
    return Business(
      businessId: map["businessId"],
      ownerId: map["ownerId"],
      isIndividual: map["isIndividual"],
      businessName: map["businessName"],
      local: map["local"],
      services: map["services"],
      portfolio: map["portfolio"],
      price: map["price"],
      rating: map["rating"],
      isAvailable: map["isAvailable"],
      businessEmail: map["businessEmail"],
      businessLogo: map["businessLogo"],
      businessPhoneNumber: map["businessPhoneNumber"],
      description: map["description"],
    );
  }
}
