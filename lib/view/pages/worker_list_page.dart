import 'package:flutter/material.dart';
import 'package:state_management/data/model/worker.dart';
import 'package:state_management/data/repo/worker_repository.dart';
import 'package:state_management/view/components/commun/worker_card.dart';

class WorkerList extends StatefulWidget {
  const WorkerList({
    super.key,
    required this.service,
  });
  final Servicee service;

  @override
  State<WorkerList> createState() => _WorkerListState();
}

class _WorkerListState extends State<WorkerList> {
  final String serviceName = "plumber";
  List<Worker> workers = [];
  WorkerRepository workerRepo = WorkerRepository();
  bool isLoading = false;
  setUser() async {
    isLoading = true;
    setState(() {});
    //users = await UsersApi.getUsersLocally(context);
    workers = await workerRepo.getWorkers();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    setUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("looking for ${widget.service.name}"),
        centerTitle: true,
      ),
      body: ListView(
        children: workers.map((e) => WorkerCard(worker: e)).toList(),
      ),
    );
  }
}
