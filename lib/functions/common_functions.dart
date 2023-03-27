import 'package:flutter_share/flutter_share.dart';

class CommonFunctions {
  static Future<void> sharePost({
    required String title,
    String? text,
    String? url,
    String? chooserTitle,
  }) async {
    await FlutterShare.share(
      title: title,
      text: text,
      linkUrl: url,
      chooserTitle: chooserTitle,
    );
  }

  static Future<void> shareEvent({
    required String title,
    String? text,
    String? url,
    String? chooserTitle,
  }) async {
    await FlutterShare.share(
      title: title,
      text: text,
      linkUrl: url,
      chooserTitle: chooserTitle,
    );
  }

  static Future<void> shareProfile({
    required String title,
    String? text,
    String? url,
    String? chooserTitle,
  }) async {
    await FlutterShare.share(
      title: title,
      text: text,
      linkUrl: url,
      chooserTitle: chooserTitle,
    );
  }
}
