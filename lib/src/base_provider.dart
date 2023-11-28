
import 'package:flutter/material.dart';

import 'enum/status.dart';
import 'lifecycle_base.dart';



abstract class BaseProvider extends ChangeNotifier with LifecycleBase {
  Status _status = Status.loading;
  BuildContext? _context;

  BuildContext get context => _context!;

  /*
  * Trạng thái của view
  * */
  Status get status => _status;

  /*
  * Route hiện tại
  * */
  String? get currentRoute => settings?.name?.split('?').firstOrNull;

  /*
  * Route kèm parameter
  * */
  String? get originalRoute => settings?.name;

  /*
  * Arguments từ page trước
  * */
  dynamic getArguments() => settings?.arguments;

  /*
  * Parameter từ page trước
  * */
  Map<String, dynamic>? getParameter() => Uri.tryParse(originalRoute ?? '')?.queryParameters;

  /*
  * Hàm dùng để call api ngay sau khi [initialData] được
  * sử dụng khi [initialData] có [supper]
  * */

  Future<void> fetchData() async {}

  /*
  * Thay đổi lại trạng thái của giao diện
  * */
  void setStatus(Status s) {
    _status = s;
    update();
  }

  /*
  * Lấy ra context và argument, phục vụ navigation, [getArgument]
  *
  * Không cần đến context trong [ViewModel]
  * */
  void setBuildContext(BuildContext ctx) {
    _context = ctx;
  }

  /*
  * Thực hiện show dialog khi có lỗi xảy ra
  * */
  void setErrorMessage(dynamic msg) {}

  /*
  * Luôn sử dụng update để thông báo thay đổi dữ liệu. [update] sẽ an toàn hơn [notifyListeners]
  *
  * Không sử dụng thuần [notifyListeners]
  * */
  void update() {
    if (mounted) notifyListeners();
  }
}
