import 'package:flutter/material.dart';
import 'package:state_management/data/model/business.dart';
import 'package:state_management/view/pages/business_detail_page%20.dart';

class SquarSwiper extends StatelessWidget {
  const SquarSwiper({
    super.key,
    required this.businesses,
  });
  final List<Business> businesses;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      //color: Colors.red,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: businesses.length,
        itemBuilder: (BuildContext context, int index) {
          return SquarCard(
            business: businesses[index],
          );
        },
      ),
    );
  }
}

class SquarCard extends StatelessWidget {
  const SquarCard({
    super.key,
    required this.business,
  });
  final Business business;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return BusinessDetailPage(
            business: business,
          );
        }));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        width: 120,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
              image: AssetImage(
                business.businessLogo ?? "assets/images/profile.jpg",
              ),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
