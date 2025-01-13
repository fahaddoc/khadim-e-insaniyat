import 'package:floor/floor.dart';

final migration2to3 = Migration(2, 3, (database) async {
  await database.execute('ALTER TABLE PatientEntryModel ADD COLUMN medicines');
});