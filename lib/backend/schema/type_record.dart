import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TypeRecord extends FirestoreRecord {
  TypeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _photo = snapshotData['photo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('type');

  static Stream<TypeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TypeRecord.fromSnapshot(s));

  static Future<TypeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TypeRecord.fromSnapshot(s));

  static TypeRecord fromSnapshot(DocumentSnapshot snapshot) => TypeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TypeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TypeRecord._(reference, mapFromFirestore(data));

  static TypeRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      TypeRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'photo': snapshot.data['photo'],
        },
        TypeRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<TypeRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'type',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'TypeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TypeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTypeRecordData({
  String? name,
  String? photo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'photo': photo,
    }.withoutNulls,
  );

  return firestoreData;
}

class TypeRecordDocumentEquality implements Equality<TypeRecord> {
  const TypeRecordDocumentEquality();

  @override
  bool equals(TypeRecord? e1, TypeRecord? e2) {
    return e1?.name == e2?.name && e1?.photo == e2?.photo;
  }

  @override
  int hash(TypeRecord? e) => const ListEquality().hash([e?.name, e?.photo]);

  @override
  bool isValidKey(Object? o) => o is TypeRecord;
}
