import 'package:url_launcher/url_launcher.dart';

class Utilities {
  void launchMailTo(String email, String subject) async {
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': subject,
      },
    );
    String urlString = _emailLaunchUri.toString();
    if (await canLaunch(urlString)) {
      await launch(urlString);
    } else {
      print('MISY ERREUR EMAIL ENVOIE');
      throw 'Impossible d\'ouvrir $urlString';
    }
  }
}
