import 'package:flutter/material.dart';
import 'package:state_management/data/model/promo.dart';

class PromoSlider extends StatefulWidget {
  const PromoSlider({
    super.key,
    required this.promos,
  });
  final List<Promo> promos;
  @override
  State<PromoSlider> createState() => _PromoSliderState();
}

class _PromoSliderState extends State<PromoSlider>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      //color: Colors.amber,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
              height: 180,
              //color: Colors.green,
              child: TabBarView(
                controller: controller,
                children: [
                  ...widget.promos.map((e) => PromoCard(promo: e)).toList(),
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
