import 'package:boticord/boticord.dart';
import 'package:boticord/src/models/bot.dart';

void main() async {
  final client = BotiCord(
    token: '',
  );

  final Bot response = await client.getBotInfo('947141336451153931');
  print(response.information.shortDescription);
}
