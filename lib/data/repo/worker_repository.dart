import 'package:state_management/data/api/worker_api.dart';
import 'package:state_management/data/model/worker.dart';

class WorkerRepository {
  factory WorkerRepository() {
    return _workerRepository;
  }
  WorkerRepository._();
  static final WorkerRepository _workerRepository = WorkerRepository._();
  WorkerApi api = WorkerApi();

  Future<List<Worker>> getWorkers() async {
    var res = await api.getWorkersLocally();
    //List list = res.data['workers'];
    return res.map((e) => Worker.fromMap(e)).toList();
  }
}
