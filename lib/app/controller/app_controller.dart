import 'dart:isolate';
import 'dart:ui';

import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class AppController extends GetxController {
  final Rx<ReceivePort> _port = ReceivePort().obs;

  @override
  void onInit() {
    IsolateNameServer.registerPortWithName(
        _port.value.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];

      if (status == DownloadTaskStatus.complete) {
        GetSnackBar(
          message: 'Download complete',
        );
        Fluttertoast.showToast(msg: 'Download Complete');
      } else if (status == DownloadTaskStatus.failed) {
        GetSnackBar(
          message: 'Download failed',
        );
      }
    });

    FlutterDownloader.registerCallback(downloadCallback);
    super.onInit();
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  @pragma('vm:entry-point')
  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send?.send([id, status, progress]);
  }

  void download(String url) async {
    var status = await Permission.storage.status;
    if (status.isGranted) {
      final basestorage = await getExternalStorageDirectory();
      final taskId = await FlutterDownloader.enqueue(
        url: url,
        savedDir: basestorage!.path,
        showNotification:
            true, // show download progress in status bar (for Android)
        openFileFromNotification:
            true, // click on notification to open downloaded file (for Android)
      );
    }
  }
}
