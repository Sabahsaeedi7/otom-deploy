import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarsRecord extends FirestoreRecord {
  CarsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "model" field.
  String? _model;
  String get model => _model ?? '';
  bool hasModel() => _model != null;

  // "statuse" field.
  String? _statuse;
  String get statuse => _statuse ?? '';
  bool hasStatuse() => _statuse != null;

  // "main_photo" field.
  String? _mainPhoto;
  String get mainPhoto => _mainPhoto ?? '';
  bool hasMainPhoto() => _mainPhoto != null;

  // "gallery" field.
  List<String>? _gallery;
  List<String> get gallery => _gallery ?? const [];
  bool hasGallery() => _gallery != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "car_owner" field.
  DocumentReference? _carOwner;
  DocumentReference? get carOwner => _carOwner;
  bool hasCarOwner() => _carOwner != null;

  // "faverited_by" field.
  List<DocumentReference>? _faveritedBy;
  List<DocumentReference> get faveritedBy => _faveritedBy ?? const [];
  bool hasFaveritedBy() => _faveritedBy != null;

  // "isVip" field.
  bool? _isVip;
  bool get isVip => _isVip ?? false;
  bool hasIsVip() => _isVip != null;

  // "public_view" field.
  bool? _publicView;
  bool get publicView => _publicView ?? false;
  bool hasPublicView() => _publicView != null;

  // "mileage" field.
  String? _mileage;
  String get mileage => _mileage ?? '';
  bool hasMileage() => _mileage != null;

  // "fueltype" field.
  String? _fueltype;
  String get fueltype => _fueltype ?? '';
  bool hasFueltype() => _fueltype != null;

  // "transmission" field.
  String? _transmission;
  String get transmission => _transmission ?? '';
  bool hasTransmission() => _transmission != null;

  // "accident" field.
  String? _accident;
  String get accident => _accident ?? '';
  bool hasAccident() => _accident != null;

  // "price_dinar" field.
  String? _priceDinar;
  String get priceDinar => _priceDinar ?? '';
  bool hasPriceDinar() => _priceDinar != null;

  // "tier_statuse" field.
  String? _tierStatuse;
  String get tierStatuse => _tierStatuse ?? '';
  bool hasTierStatuse() => _tierStatuse != null;

  // "cityLocation" field.
  String? _cityLocation;
  String get cityLocation => _cityLocation ?? '';
  bool hasCityLocation() => _cityLocation != null;

  // "views" field.
  int? _views;
  int get views => _views ?? 0;
  bool hasViews() => _views != null;

  // "brand" field.
  String? _brand;
  String get brand => _brand ?? '';
  bool hasBrand() => _brand != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "ownerRef" field.
  String? _ownerRef;
  String get ownerRef => _ownerRef ?? '';
  bool hasOwnerRef() => _ownerRef != null;

  // "place_state" field.
  String? _placeState;
  String get placeState => _placeState ?? '';
  bool hasPlaceState() => _placeState != null;

  // "plan" field.
  String? _plan;
  String get plan => _plan ?? '';
  bool hasPlan() => _plan != null;

  // "createdat" field.
  DateTime? _createdat;
  DateTime? get createdat => _createdat;
  bool hasCreatedat() => _createdat != null;

  // "expiredDate" field.
  String? _expiredDate;
  String get expiredDate => _expiredDate ?? '';
  bool hasExpiredDate() => _expiredDate != null;

  // "isGold" field.
  bool? _isGold;
  bool get isGold => _isGold ?? false;
  bool hasIsGold() => _isGold != null;

  // "soldout" field.
  bool? _soldout;
  bool get soldout => _soldout ?? false;
  bool hasSoldout() => _soldout != null;

  // "dateOfSale" field.
  DateTime? _dateOfSale;
  DateTime? get dateOfSale => _dateOfSale;
  bool hasDateOfSale() => _dateOfSale != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _model = snapshotData['model'] as String?;
    _statuse = snapshotData['statuse'] as String?;
    _mainPhoto = snapshotData['main_photo'] as String?;
    _gallery = getDataList(snapshotData['gallery']);
    _description = snapshotData['description'] as String?;
    _type = snapshotData['type'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _carOwner = snapshotData['car_owner'] as DocumentReference?;
    _faveritedBy = getDataList(snapshotData['faverited_by']);
    _isVip = snapshotData['isVip'] as bool?;
    _publicView = snapshotData['public_view'] as bool?;
    _mileage = snapshotData['mileage'] as String?;
    _fueltype = snapshotData['fueltype'] as String?;
    _transmission = snapshotData['transmission'] as String?;
    _accident = snapshotData['accident'] as String?;
    _priceDinar = snapshotData['price_dinar'] as String?;
    _tierStatuse = snapshotData['tier_statuse'] as String?;
    _cityLocation = snapshotData['cityLocation'] as String?;
    _views = castToType<int>(snapshotData['views']);
    _brand = snapshotData['brand'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _ownerRef = snapshotData['ownerRef'] as String?;
    _placeState = snapshotData['place_state'] as String?;
    _plan = snapshotData['plan'] as String?;
    _createdat = snapshotData['createdat'] as DateTime?;
    _expiredDate = snapshotData['expiredDate'] as String?;
    _isGold = snapshotData['isGold'] as bool?;
    _soldout = snapshotData['soldout'] as bool?;
    _dateOfSale = snapshotData['dateOfSale'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cars');

  static Stream<CarsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarsRecord.fromSnapshot(s));

  static Future<CarsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CarsRecord.fromSnapshot(s));

  static CarsRecord fromSnapshot(DocumentSnapshot snapshot) => CarsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarsRecord._(reference, mapFromFirestore(data));

  static CarsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      CarsRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'model': snapshot.data['model'],
          'statuse': snapshot.data['statuse'],
          'main_photo': snapshot.data['main_photo'],
          'gallery': safeGet(
            () => snapshot.data['gallery'].toList(),
          ),
          'description': snapshot.data['description'],
          'type': snapshot.data['type'],
          'created_at': convertAlgoliaParam(
            snapshot.data['created_at'],
            ParamType.DateTime,
            false,
          ),
          'car_owner': convertAlgoliaParam(
            snapshot.data['car_owner'],
            ParamType.DocumentReference,
            false,
          ),
          'faverited_by': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['faverited_by'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'isVip': snapshot.data['isVip'],
          'public_view': snapshot.data['public_view'],
          'mileage': snapshot.data['mileage'],
          'fueltype': snapshot.data['fueltype'],
          'transmission': snapshot.data['transmission'],
          'accident': snapshot.data['accident'],
          'price_dinar': snapshot.data['price_dinar'],
          'tier_statuse': snapshot.data['tier_statuse'],
          'cityLocation': snapshot.data['cityLocation'],
          'views': convertAlgoliaParam(
            snapshot.data['views'],
            ParamType.int,
            false,
          ),
          'brand': snapshot.data['brand'],
          'price': convertAlgoliaParam(
            snapshot.data['price'],
            ParamType.double,
            false,
          ),
          'ownerRef': snapshot.data['ownerRef'],
          'place_state': snapshot.data['place_state'],
          'plan': snapshot.data['plan'],
          'createdat': convertAlgoliaParam(
            snapshot.data['createdat'],
            ParamType.DateTime,
            false,
          ),
          'expiredDate': snapshot.data['expiredDate'],
          'isGold': snapshot.data['isGold'],
          'soldout': snapshot.data['soldout'],
          'dateOfSale': convertAlgoliaParam(
            snapshot.data['dateOfSale'],
            ParamType.DateTime,
            false,
          ),
        },
        CarsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<CarsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'cars',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'CarsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarsRecordData({
  String? name,
  String? model,
  String? statuse,
  String? mainPhoto,
  String? description,
  String? type,
  DateTime? createdAt,
  DocumentReference? carOwner,
  bool? isVip,
  bool? publicView,
  String? mileage,
  String? fueltype,
  String? transmission,
  String? accident,
  String? priceDinar,
  String? tierStatuse,
  String? cityLocation,
  int? views,
  String? brand,
  double? price,
  String? ownerRef,
  String? placeState,
  String? plan,
  DateTime? createdat,
  String? expiredDate,
  bool? isGold,
  bool? soldout,
  DateTime? dateOfSale,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'model': model,
      'statuse': statuse,
      'main_photo': mainPhoto,
      'description': description,
      'type': type,
      'created_at': createdAt,
      'car_owner': carOwner,
      'isVip': isVip,
      'public_view': publicView,
      'mileage': mileage,
      'fueltype': fueltype,
      'transmission': transmission,
      'accident': accident,
      'price_dinar': priceDinar,
      'tier_statuse': tierStatuse,
      'cityLocation': cityLocation,
      'views': views,
      'brand': brand,
      'price': price,
      'ownerRef': ownerRef,
      'place_state': placeState,
      'plan': plan,
      'createdat': createdat,
      'expiredDate': expiredDate,
      'isGold': isGold,
      'soldout': soldout,
      'dateOfSale': dateOfSale,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarsRecordDocumentEquality implements Equality<CarsRecord> {
  const CarsRecordDocumentEquality();

  @override
  bool equals(CarsRecord? e1, CarsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.model == e2?.model &&
        e1?.statuse == e2?.statuse &&
        e1?.mainPhoto == e2?.mainPhoto &&
        listEquality.equals(e1?.gallery, e2?.gallery) &&
        e1?.description == e2?.description &&
        e1?.type == e2?.type &&
        e1?.createdAt == e2?.createdAt &&
        e1?.carOwner == e2?.carOwner &&
        listEquality.equals(e1?.faveritedBy, e2?.faveritedBy) &&
        e1?.isVip == e2?.isVip &&
        e1?.publicView == e2?.publicView &&
        e1?.mileage == e2?.mileage &&
        e1?.fueltype == e2?.fueltype &&
        e1?.transmission == e2?.transmission &&
        e1?.accident == e2?.accident &&
        e1?.priceDinar == e2?.priceDinar &&
        e1?.tierStatuse == e2?.tierStatuse &&
        e1?.cityLocation == e2?.cityLocation &&
        e1?.views == e2?.views &&
        e1?.brand == e2?.brand &&
        e1?.price == e2?.price &&
        e1?.ownerRef == e2?.ownerRef &&
        e1?.placeState == e2?.placeState &&
        e1?.plan == e2?.plan &&
        e1?.createdat == e2?.createdat &&
        e1?.expiredDate == e2?.expiredDate &&
        e1?.isGold == e2?.isGold &&
        e1?.soldout == e2?.soldout &&
        e1?.dateOfSale == e2?.dateOfSale;
  }

  @override
  int hash(CarsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.model,
        e?.statuse,
        e?.mainPhoto,
        e?.gallery,
        e?.description,
        e?.type,
        e?.createdAt,
        e?.carOwner,
        e?.faveritedBy,
        e?.isVip,
        e?.publicView,
        e?.mileage,
        e?.fueltype,
        e?.transmission,
        e?.accident,
        e?.priceDinar,
        e?.tierStatuse,
        e?.cityLocation,
        e?.views,
        e?.brand,
        e?.price,
        e?.ownerRef,
        e?.placeState,
        e?.plan,
        e?.createdat,
        e?.expiredDate,
        e?.isGold,
        e?.soldout,
        e?.dateOfSale
      ]);

  @override
  bool isValidKey(Object? o) => o is CarsRecord;
}
