// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MedicinesDao? _medicinesDaoInstance;

  PatientEntryDao? _patientEntryDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 3,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `MedicinesListingModel` (`id` TEXT NOT NULL, `companyName` TEXT NOT NULL, `item` TEXT NOT NULL, `invoice` TEXT NOT NULL, `quantities` INTEGER NOT NULL, `type` TEXT, `sellingAmount` REAL NOT NULL, `purchasingAmount` REAL NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PatientEntryModel` (`id` TEXT NOT NULL, `name` TEXT NOT NULL, `age` INTEGER NOT NULL, `date` TEXT NOT NULL, `contact` TEXT NOT NULL, `identity` TEXT NOT NULL, `address` TEXT NOT NULL, `medicines` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MedicinesDao get medicinesDao {
    return _medicinesDaoInstance ??= _$MedicinesDao(database, changeListener);
  }

  @override
  PatientEntryDao get patientEntryDao {
    return _patientEntryDaoInstance ??=
        _$PatientEntryDao(database, changeListener);
  }
}

class _$MedicinesDao extends MedicinesDao {
  _$MedicinesDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _medicinesListingModelInsertionAdapter = InsertionAdapter(
            database,
            'MedicinesListingModel',
            (MedicinesListingModel item) => <String, Object?>{
                  'id': item.id,
                  'companyName': item.companyName,
                  'item': item.item,
                  'invoice': item.invoice,
                  'quantities': item.quantities,
                  'type': item.type,
                  'sellingAmount': item.sellingAmount,
                  'purchasingAmount': item.purchasingAmount
                }),
        _medicinesListingModelUpdateAdapter = UpdateAdapter(
            database,
            'MedicinesListingModel',
            ['id'],
            (MedicinesListingModel item) => <String, Object?>{
                  'id': item.id,
                  'companyName': item.companyName,
                  'item': item.item,
                  'invoice': item.invoice,
                  'quantities': item.quantities,
                  'type': item.type,
                  'sellingAmount': item.sellingAmount,
                  'purchasingAmount': item.purchasingAmount
                }),
        _medicinesListingModelDeletionAdapter = DeletionAdapter(
            database,
            'MedicinesListingModel',
            ['id'],
            (MedicinesListingModel item) => <String, Object?>{
                  'id': item.id,
                  'companyName': item.companyName,
                  'item': item.item,
                  'invoice': item.invoice,
                  'quantities': item.quantities,
                  'type': item.type,
                  'sellingAmount': item.sellingAmount,
                  'purchasingAmount': item.purchasingAmount
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MedicinesListingModel>
      _medicinesListingModelInsertionAdapter;

  final UpdateAdapter<MedicinesListingModel>
      _medicinesListingModelUpdateAdapter;

  final DeletionAdapter<MedicinesListingModel>
      _medicinesListingModelDeletionAdapter;

  @override
  Future<List<MedicinesListingModel>> getAllMedicines() async {
    return _queryAdapter.queryList('SELECT * FROM MedicinesListingModel',
        mapper: (Map<String, Object?> row) => MedicinesListingModel(
            id: row['id'] as String?,
            companyName: row['companyName'] as String,
            item: row['item'] as String,
            invoice: row['invoice'] as String,
            quantities: row['quantities'] as int,
            sellingAmount: row['sellingAmount'] as double,
            purchasingAmount: row['purchasingAmount'] as double,
            type: row['type'] as String?));
  }

  @override
  Future<void> insertMedicine(MedicinesListingModel medicine) async {
    await _medicinesListingModelInsertionAdapter.insert(
        medicine, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateMedicine(MedicinesListingModel medicine) async {
    await _medicinesListingModelUpdateAdapter.update(
        medicine, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteMedicine(MedicinesListingModel medicine) async {
    await _medicinesListingModelDeletionAdapter.delete(medicine);
  }
}

class _$PatientEntryDao extends PatientEntryDao {
  _$PatientEntryDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _patientEntryModelInsertionAdapter = InsertionAdapter(
            database,
            'PatientEntryModel',
            (PatientEntryModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'age': item.age,
                  'date': item.date,
                  'contact': item.contact,
                  'identity': item.identity,
                  'address': item.address,
                  'medicines': _medicineListConverter.encode(item.medicines)
                }),
        _patientEntryModelUpdateAdapter = UpdateAdapter(
            database,
            'PatientEntryModel',
            ['id'],
            (PatientEntryModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'age': item.age,
                  'date': item.date,
                  'contact': item.contact,
                  'identity': item.identity,
                  'address': item.address,
                  'medicines': _medicineListConverter.encode(item.medicines)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PatientEntryModel> _patientEntryModelInsertionAdapter;

  final UpdateAdapter<PatientEntryModel> _patientEntryModelUpdateAdapter;

  @override
  Future<List<PatientEntryModel>> getAllPatientsEntry() async {
    return _queryAdapter.queryList('SELECT * FROM PatientEntryModel',
        mapper: (Map<String, Object?> row) => PatientEntryModel(
            id: row['id'] as String?,
            name: row['name'] as String,
            age: row['age'] as int,
            date: row['date'] as String,
            contact: row['contact'] as String,
            identity: row['identity'] as String,
            address: row['address'] as String,
            medicines:
                _medicineListConverter.decode(row['medicines'] as String)));
  }

  @override
  Future<PatientEntryModel?> findById(String id) async {
    return _queryAdapter.query('SELECT * FROM PatientEntryModel WHERE id = ?1',
        mapper: (Map<String, Object?> row) => PatientEntryModel(
            id: row['id'] as String?,
            name: row['name'] as String,
            age: row['age'] as int,
            date: row['date'] as String,
            contact: row['contact'] as String,
            identity: row['identity'] as String,
            address: row['address'] as String,
            medicines:
                _medicineListConverter.decode(row['medicines'] as String)),
        arguments: [id]);
  }

  @override
  Future<void> insertPatientEntry(PatientEntryModel patient) async {
    await _patientEntryModelInsertionAdapter.insert(
        patient, OnConflictStrategy.abort);
  }

  @override
  Future<void> updatePatientEntry(PatientEntryModel patient) async {
    await _patientEntryModelUpdateAdapter.update(
        patient, OnConflictStrategy.abort);
  }
}

// ignore_for_file: unused_element
final _medicineListConverter = MedicineListConverter();
