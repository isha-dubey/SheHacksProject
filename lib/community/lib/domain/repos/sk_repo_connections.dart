import 'package:shehacks/community/lib/domain/business/connections/sk_connection_type.dart';
import 'package:shehacks/community/lib/domain/models/sk_connection.dart';

abstract class SKRepoConnections {
  Future<List<SKConnection>> getConnections(SKConnectionType connectionType);
}
