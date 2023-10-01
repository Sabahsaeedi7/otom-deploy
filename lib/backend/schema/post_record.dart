import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostRecord extends FirestoreRecord {
  PostRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "content" field.
  DocumentReference? _content;
  DocumentReference? get content => _content;
  bool hasContent() => _content != null;

  // "created" field.
  DateTime? _created;
  DateTime? get created => _created;
  bool hasCreated() => _created != null;

  // "expierd" field.
  bool? _expierd;
  bool get expierd => _expierd ?? false;
  bool hasExpierd() => _expierd != null;

  // "expier_date" field.
  DateTime? _expierDate;
  DateTime? get expierDate => _expierDate;
  bool hasExpierDate() => _expierDate != null;

  // "remain_days" field.
  int? _remainDays;
  int get remainDays => _remainDays ?? 0;
  bool hasRemainDays() => _remainDays != null;

  // "show_permit" field.
  bool? _showPermit;
  bool get showPermit => _showPermit ?? false;
  bool hasShowPermit() => _showPermit != null;

  // "post_owner" field.
  DocumentReference? _postOwner;
  DocumentReference? get postOwner => _postOwner;
  bool hasPostOwner() => _postOwner != null;

  void _initializeFields() {
    _content = snapshotData['content'] as DocumentReference?;
    _created = snapshotData['created'] as DateTime?;
    _expierd = snapshotData['expierd'] as bool?;
    _expierDate = snapshotData['expier_date'] as DateTime?;
    _remainDays = castToType<int>(snapshotData['remain_days']);
    _showPermit = snapshotData['show_permit'] as bool?;
    _postOwner = snapshotData['post_owner'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('post');

  static Stream<PostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostRecord.fromSnapshot(s));

  static Future<PostRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostRecord.fromSnapshot(s));

  static PostRecord fromSnapshot(DocumentSnapshot snapshot) => PostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostRecord._(reference, mapFromFirestore(data));

  static PostRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      PostRecord.getDocumentFromData(
        {
          'content': convertAlgoliaParam(
            snapshot.data['content'],
            ParamType.DocumentReference,
            false,
          ),
          'created': convertAlgoliaParam(
            snapshot.data['created'],
            ParamType.DateTime,
            false,
          ),
          'expierd': snapshot.data['expierd'],
          'expier_date': convertAlgoliaParam(
            snapshot.data['expier_date'],
            ParamType.DateTime,
            false,
          ),
          'remain_days': convertAlgoliaParam(
            snapshot.data['remain_days'],
            ParamType.int,
            false,
          ),
          'show_permit': snapshot.data['show_permit'],
          'post_owner': convertAlgoliaParam(
            snapshot.data['post_owner'],
            ParamType.DocumentReference,
            false,
          ),
        },
        PostRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<PostRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'post',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'PostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostRecordData({
  DocumentReference? content,
  DateTime? created,
  bool? expierd,
  DateTime? expierDate,
  int? remainDays,
  bool? showPermit,
  DocumentReference? postOwner,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'content': content,
      'created': created,
      'expierd': expierd,
      'expier_date': expierDate,
      'remain_days': remainDays,
      'show_permit': showPermit,
      'post_owner': postOwner,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostRecordDocumentEquality implements Equality<PostRecord> {
  const PostRecordDocumentEquality();

  @override
  bool equals(PostRecord? e1, PostRecord? e2) {
    return e1?.content == e2?.content &&
        e1?.created == e2?.created &&
        e1?.expierd == e2?.expierd &&
        e1?.expierDate == e2?.expierDate &&
        e1?.remainDays == e2?.remainDays &&
        e1?.showPermit == e2?.showPermit &&
        e1?.postOwner == e2?.postOwner;
  }

  @override
  int hash(PostRecord? e) => const ListEquality().hash([
        e?.content,
        e?.created,
        e?.expierd,
        e?.expierDate,
        e?.remainDays,
        e?.showPermit,
        e?.postOwner
      ]);

  @override
  bool isValidKey(Object? o) => o is PostRecord;
}
