import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BrandRecord extends FirestoreRecord {
  BrandRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _logo = snapshotData['logo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('brand');

  static Stream<BrandRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BrandRecord.fromSnapshot(s));

  static Future<BrandRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BrandRecord.fromSnapshot(s));

  static BrandRecord fromSnapshot(DocumentSnapshot snapshot) => BrandRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BrandRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BrandRecord._(reference, mapFromFirestore(data));

  static BrandRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      BrandRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'logo': snapshot.data['logo'],
        },
        BrandRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<BrandRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'brand',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'BrandRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BrandRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBrandRecordData({
  String? name,
  String? logo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'logo': logo,
    }.withoutNulls,
  );

  return firestoreData;
}

class BrandRecordDocumentEquality implements Equality<BrandRecord> {
  const BrandRecordDocumentEquality();

  @override
  bool equals(BrandRecord? e1, BrandRecord? e2) {
    return e1?.name == e2?.name && e1?.logo == e2?.logo;
  }

  @override
  int hash(BrandRecord? e) => const ListEquality().hash([e?.name, e?.logo]);

  @override
  bool isValidKey(Object? o) => o is BrandRecord;
}
