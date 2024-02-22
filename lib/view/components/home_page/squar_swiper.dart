import 'package:flutter/material.dart';
import 'package:state_management/data/static/services.dart';

class SquarSwiper extends StatelessWidget {
  const SquarSwiper({
    super.key,
    required this.services,
  });
  final List<OtherService> services;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      //color: Colors.red,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: services.length,
        itemBuilder: (BuildContext context, int index) {
          return SquarCard(
            service: services[index],
          );
        },
      ),
    );
  }
}

class SquarCard extends StatelessWidget {
  const SquarCard({super.key, required this.service});
  final OtherService service;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(service.navigatTo);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        width: 120,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
              image: AssetImage(service.image), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
