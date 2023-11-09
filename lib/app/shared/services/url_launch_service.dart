import 'package:url_launcher/url_launcher.dart';

abstract class UrlLauncherService {
  UrlLauncherService._();

  static Future<bool> launchString(String url) async {
    return await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication).onError((_, __) => false);
  }
}
