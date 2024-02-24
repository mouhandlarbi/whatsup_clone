import 'package:state_management/data/model/worker.dart';
import 'package:flutter/material.dart';
import 'package:state_management/view/pages/worker_list_page.dart';

class CircleSwiper extends StatelessWidget {
  const CircleSwiper({
    super.key,
    required this.services,
  });
  final List<Servicee> services;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 92,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: services.length,
        itemBuilder: (BuildContext context, int index) {
          Servicee service = services[index];
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
  final Servicee service;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return WorkerList(service: service);
        }));
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
            Text(service.name),
          ],
        ),
      ),
    );
  }
}
