<p align="center">
<img width="520" src="https://media.discordapp.net/attachments/725033484804030484/1010444382828236800/botidart.png" alt="botidart" />
</p>

<p align="center">
  <b>
    The easiest way to use BotiCord API in Dart
  </b>
</p>


<h2>Examples: </h2>
<h3>Post Bot's Stats: </h3>

```dart
import 'package:boticord/boticord.dart';
import 'package:boticord/src/models/botstats.dart';

void main() async {
  final client = BotiCord(
    token: '',
  );

  final BotStats stats = BotStats(
      servers: 150,
      users: null,
      shards: 1
  );

  await client.postBotStats(stats);
}
```

If you have any questions you can ask **[Marakarka#0575](https://boticord.top/profile/585766846268047370)** on [discord](https://boticord.top/discord).