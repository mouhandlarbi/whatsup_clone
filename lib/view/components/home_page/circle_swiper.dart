import 'package:flutter/material.dart';
import 'package:state_management/data/static/services.dart';

class CircleSwiper extends StatelessWidget {
  const CircleSwiper({
    super.key,
    required this.services,
  });
  final List<HomeService> services;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 92,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: services.length,
        itemBuilder: (BuildContext context, int index) {
          HomeService service = services[index];
          return CircleIcon(
            selected: false,
            service: service,
          );
        },
      ),
    );
  }
}

class CircleIcon extends StatelessWidget {
  const CircleIcon({
    super.key,
    required this.selected,
    required this.service,
  });
  final bool selected;
  final HomeService service;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(service.navigatTo);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.grey[300],
              child: Icon(
                service.icone,
                size: 32,
                color: Colors.black,
              ),
            ),
            Text(service.txt),
          ],
        ),
      ),
    );
  }
}
