import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

class model
{
  static String folderpath ="";


   Future<bool>permissioncheck() async {
    PermissionStatus status = await Permission.storage.status;

    if(status.isDenied)
    {
      Map<Permission, PermissionStatus> status = await [
        Permission.storage,
      ].request();
    }
    if( status.isGranted) {
      _createFolder();

      return status.isGranted;
    }

    return Future.value();
  }

  _createFolder()async{
    final folderName="love_shayari";
    final path= Directory("storage/emulated/0/DCIM/$folderName");
    if ((await path.exists())){
      // TODO:
      print("exist");
    }else{
      // TODO:
      print("not exist");
      path.create();
    }

    model.folderpath =path.path;
  }
}




