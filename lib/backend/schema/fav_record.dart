import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FavRecord extends FirestoreRecord {
  FavRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "carref" field.
  DocumentReference? _carref;
  DocumentReference? get carref => _carref;
  bool hasCarref() => _carref != null;

  // "userref" field.
  DocumentReference? _userref;
  DocumentReference? get userref => _userref;
  bool hasUserref() => _userref != null;

  void _initializeFields() {
    _carref = snapshotData['carref'] as DocumentReference?;
    _userref = snapshotData['userref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('fav');

  static Stream<FavRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FavRecord.fromSnapshot(s));

  static Future<FavRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FavRecord.fromSnapshot(s));

  static FavRecord fromSnapshot(DocumentSnapshot snapshot) => FavRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FavRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FavRecord._(reference, mapFromFirestore(data));

  static FavRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      FavRecord.getDocumentFromData(
        {
          'carref': convertAlgoliaParam(
            snapshot.data['carref'],
            ParamType.DocumentReference,
            false,
          ),
          'userref': convertAlgoliaParam(
            snapshot.data['userref'],
            ParamType.DocumentReference,
            false,
          ),
        },
        FavRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<FavRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'fav',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'FavRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FavRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFavRecordData({
  DocumentReference? carref,
  DocumentReference? userref,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'carref': carref,
      'userref': userref,
    }.withoutNulls,
  );

  return firestoreData;
}

class FavRecordDocumentEquality implements Equality<FavRecord> {
  const FavRecordDocumentEquality();

  @override
  bool equals(FavRecord? e1, FavRecord? e2) {
    return e1?.carref == e2?.carref && e1?.userref == e2?.userref;
  }

  @override
  int hash(FavRecord? e) => const ListEquality().hash([e?.carref, e?.userref]);

  @override
  bool isValidKey(Object? o) => o is FavRecord;
}
