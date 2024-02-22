import 'package:flutter/material.dart';
import 'package:state_management/data/static/services.dart';

class RectangleSwiper extends StatelessWidget {
  const RectangleSwiper({
    super.key,
    required this.services,
  });
  final List<OtherService> services;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      //color: Colors.red,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: services.length,
        itemBuilder: (BuildContext context, int index) {
          return RectangleCard(
            service: services[index],
          );
        },
      ),
    );
  }
}

class RectangleCard extends StatelessWidget {
  const RectangleCard({super.key, required this.service});
  final OtherService service;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(service.navigatTo);
      },
      child: Column(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 16.0 / 9.0,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                //width: 200,
                //height: 120,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                      image: AssetImage(service.image), fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Container(
            height: 30,
            //color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              service.txt,
              style: const TextStyle(
                fontSize: 18,
                letterSpacing: 1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
