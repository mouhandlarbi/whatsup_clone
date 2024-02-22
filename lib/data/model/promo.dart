class Promo {
  final String img;
  final String pageRoute;
  Promo({
    required this.img,
    required this.pageRoute,
  });

  static Promo fromJson(json) => Promo(
        img: json['img'],
        pageRoute: json['navigatTo'],
      );
}
