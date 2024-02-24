import 'package:flutter/material.dart';
import 'package:state_management/data/model/worker.dart';
import 'package:state_management/view/components/commun/rectangle_swiper.dart';
import 'package:state_management/view/components/commun/title_divider.dart';

class WorkerDetailPage extends StatelessWidget {
  const WorkerDetailPage({
    super.key,
    required this.worker,
  });
  final Worker worker;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Text(
            worker.name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
          // Text(
          //   worker.description,
          //   style: TextStyle(
          //     fontSize: 16,
          //     fontWeight: FontWeight.w400,
          //     color: Colors.grey[600],
          //   ),
          // ),
          //DetailsImage(worker: worker),
          Prol(worker: worker),
          const TitleDivider(txt: "Recent Projects"),
          RectangleSwiper(projects: worker.portfolio),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("message"),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Appeler"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DetailsImage extends StatelessWidget {
  const DetailsImage({super.key, required this.worker});
  final Worker worker;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.amber,
        image: DecorationImage(
          image: AssetImage(worker.portfolio[0].thumbnail),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(12),
                ),
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.black.withOpacity(0.0),
                    ])),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const DetailsImageItem(
                  title: "jobs",
                  isIcon: false,
                  subtile: "120",
                ),
                const DetailsImageItem(
                  title: "Share",
                  isIcon: true,
                  icone: Icons.share,
                ),
                DetailsImageItem(
                  title: "Rating",
                  isIcon: false,
                  subtile: worker.rating.toString(),
                ),
                const DetailsImageItem(
                  title: "Share",
                  isIcon: true,
                  icone: Icons.favorite,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DetailsImageItem extends StatelessWidget {
  const DetailsImageItem(
      {super.key,
      required this.title,
      required this.isIcon,
      this.icone,
      this.subtile});
  final String title;
  final bool isIcon;
  final String? subtile;
  final IconData? icone;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        isIcon
            ? Icon(
                icone,
                color: Colors.white,
              )
            : Text(
                subtile!,
                style: const TextStyle(color: Colors.white),
              ),
      ],
    );
  }
}

class Prol extends StatelessWidget {
  const Prol({
    super.key,
    required this.worker,
  });
  final Worker worker;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: double.infinity,
      child: Row(
        children: [
          Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.red,
                radius: 62,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("data"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("data"),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("data"),
              )
            ],
          ),
          Column(
            children: [
              Text(worker.name),
              Text(worker.email),
            ],
          )
        ],
      ),
    );
  }
}
