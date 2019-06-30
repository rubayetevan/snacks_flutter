import 'package:simple_permissions/simple_permissions.dart';

class PermissionManager {
  Future<bool> requestWritePermission() async {
    PermissionStatus permissionStatus =
        await SimplePermissions.requestPermission(
            Permission.WriteExternalStorage);

    if (permissionStatus == PermissionStatus.authorized) {
      print('permission granted');
      return true;
    }
    print('permission is not granted');
    return false;
  }
}

final permissionManger = PermissionManager();
