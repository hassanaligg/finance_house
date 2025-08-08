import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';


Future<void> setupHive() async {
  final appDocumentsDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentsDir.path);

}
