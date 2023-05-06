import 'package:shehacks/community/lib/domain/models/sk_connection.dart';
import 'package:shehacks/community/lib/domain/repos/sk_repo_connections.dart';
import '../../domain/business/connections/sk_connection_type.dart';

class SKRepoConnectionsFake extends SKRepoConnections {
  @override
  Future<List<SKConnection>> getConnections(SKConnectionType connectionType) {
    return Future.delayed(const Duration(seconds: 2)).then((value) => [
          SKConnection(title: "flutter_hyd", isPrivate: true, isChannel: true),
          SKConnection(
              title: "android_india", isPrivate: true, isChannel: true),
          SKConnection(title: "Carl Jung", isPrivate: true, isChannel: false),
          SKConnection(title: "Anmol Verma", isPrivate: true, isChannel: false),
          SKConnection(title: "Someone XYZ", isPrivate: true, isChannel: false)
        ]);
  }
}
