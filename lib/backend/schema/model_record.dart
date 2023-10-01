import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ModelRecord extends FirestoreRecord {
  ModelRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  int? _name;
  int get name => _name ?? 0;
  bool hasName() => _name != null;

  void _initializeFields() {
    _name = castToType<int>(snapshotData['name']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('model');

  static Stream<ModelRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ModelRecord.fromSnapshot(s));

  static Future<ModelRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ModelRecord.fromSnapshot(s));

  static ModelRecord fromSnapshot(DocumentSnapshot snapshot) => ModelRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ModelRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ModelRecord._(reference, mapFromFirestore(data));

  static ModelRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ModelRecord.getDocumentFromData(
        {
          'name': convertAlgoliaParam(
            snapshot.data['name'],
            ParamType.int,
            false,
          ),
        },
        ModelRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ModelRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'model',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'ModelRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ModelRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createModelRecordData({
  int? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class ModelRecordDocumentEquality implements Equality<ModelRecord> {
  const ModelRecordDocumentEquality();

  @override
  bool equals(ModelRecord? e1, ModelRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(ModelRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is ModelRecord;
}
