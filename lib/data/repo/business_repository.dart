import 'package:state_management/data/api/business_api.dart';
import 'package:state_management/data/model/business.dart';

class BusinessRepository {
  factory BusinessRepository() {
    return _businessRepository;
  }
  BusinessRepository._();
  static final BusinessRepository _businessRepository = BusinessRepository._();
  BusinessApi api = BusinessApi();

  Future<List<Business>> getBusinesss() async {
    var res = await api.getBusinesssLocally();
    //hprint(res.toString());
    //List list = res.data['business'];
    return res.map((e) => Business.fromMap(e)).toList();
  }
}
