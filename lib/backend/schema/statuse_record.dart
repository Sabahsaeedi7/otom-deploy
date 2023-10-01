import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StatuseRecord extends FirestoreRecord {
  StatuseRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('statuse');

  static Stream<StatuseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StatuseRecord.fromSnapshot(s));

  static Future<StatuseRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StatuseRecord.fromSnapshot(s));

  static StatuseRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StatuseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StatuseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StatuseRecord._(reference, mapFromFirestore(data));

  static StatuseRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      StatuseRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
        },
        StatuseRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<StatuseRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'statuse',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'StatuseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StatuseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStatuseRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class StatuseRecordDocumentEquality implements Equality<StatuseRecord> {
  const StatuseRecordDocumentEquality();

  @override
  bool equals(StatuseRecord? e1, StatuseRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(StatuseRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is StatuseRecord;
}
