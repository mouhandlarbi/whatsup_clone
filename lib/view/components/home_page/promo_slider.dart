import 'package:flutter/material.dart';
import 'package:state_management/data/api/promo_api.dart';
import 'package:state_management/data/model/promo.dart';

class PromoSlider extends StatefulWidget {
  const PromoSlider({
    super.key,
  });

  @override
  State<PromoSlider> createState() => _PromoSliderState();
}

class _PromoSliderState extends State<PromoSlider>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  List<Promo> promos = [];
  bool isPromoLoding = false;
  setPromo() async {
    isPromoLoding = true;
    setState(() {});
    promos = await PromosApi.getPromosLocally(context);
    isPromoLoding = false;
    setState(() {});
  }

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    setPromo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      //color: Colors.amber,
      child: isPromoLoding
          ? const CircularProgressIndicator()
          : Stack(
              alignment: Alignment.topCenter,
              children: [
                SizedBox(
                    height: 180,
                    //color: Colors.green,
                    child: TabBarView(
                      controller: controller,
                      children: [
                        ...promos.map((e) => PromoCard(promo: e)).toList(),
                      ],
                    )),
                Positioned(
                  bottom: 0,
                  child: TabPageSelector(
                    borderStyle: BorderStyle.none,
                    color: Colors.grey,
                    selectedColor: Colors.black,
                    controller: controller,
                  ),
                ),
              ],
            ),
    );
  }
}

class PromoCard extends StatelessWidget {
  const PromoCard({
    super.key,
    required this.promo,
  });
  final Promo promo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(promo.pageRoute);
        },
        child: Container(
          decoration: BoxDecoration(
            //color: Colors.blue,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(promo.img),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
