import 'package:floor/floor.dart';
import 'package:khadim_e_insaniyat/modules/home/modules/patient_entry/models/patient_entry_model.dart';

@dao
abstract class PatientEntryDao{
  @Query('SELECT * FROM PatientEntryModel')
  Future<List<PatientEntryModel>> getAllPatientsEntry();

  @Query('SELECT * FROM PatientEntryModel WHERE id = :id')
  Future<PatientEntryModel?> findById(String id);

  @insert
  Future<void> insertPatientEntry(PatientEntryModel patient);

  @update
  Future<void> updatePatientEntry(PatientEntryModel patient);
}