import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServiceAllRecord extends FirestoreRecord {
  ServiceAllRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "available" field.
  bool? _available;
  bool get available => _available ?? false;
  bool hasAvailable() => _available != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "seller" field.
  DocumentReference? _seller;
  DocumentReference? get seller => _seller;
  bool hasSeller() => _seller != null;

  // "category" field.
  DocumentReference? _category;
  DocumentReference? get category => _category;
  bool hasCategory() => _category != null;

  // "serviceLocation" field.
  String? _serviceLocation;
  String get serviceLocation => _serviceLocation ?? '';
  bool hasServiceLocation() => _serviceLocation != null;

  // "overall_rating" field.
  double? _overallRating;
  double get overallRating => _overallRating ?? 0.0;
  bool hasOverallRating() => _overallRating != null;

  // "no_of_sold" field.
  int? _noOfSold;
  int get noOfSold => _noOfSold ?? 0;
  bool hasNoOfSold() => _noOfSold != null;

  // "no_of_reviews" field.
  int? _noOfReviews;
  int get noOfReviews => _noOfReviews ?? 0;
  bool hasNoOfReviews() => _noOfReviews != null;

  // "orders" field.
  List<DocumentReference>? _orders;
  List<DocumentReference> get orders => _orders ?? const [];
  bool hasOrders() => _orders != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "reviews" field.
  DocumentReference? _reviews;
  DocumentReference? get reviews => _reviews;
  bool hasReviews() => _reviews != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _description = snapshotData['description'] as String?;
    _image = snapshotData['image'] as String?;
    _available = snapshotData['available'] as bool?;
    _time = snapshotData['time'] as DateTime?;
    _location = snapshotData['location'] as LatLng?;
    _seller = snapshotData['seller'] as DocumentReference?;
    _category = snapshotData['category'] as DocumentReference?;
    _serviceLocation = snapshotData['serviceLocation'] as String?;
    _overallRating = castToType<double>(snapshotData['overall_rating']);
    _noOfSold = castToType<int>(snapshotData['no_of_sold']);
    _noOfReviews = castToType<int>(snapshotData['no_of_reviews']);
    _orders = getDataList(snapshotData['orders']);
    _address = snapshotData['address'] as String?;
    _reviews = snapshotData['reviews'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('serviceAll');

  static Stream<ServiceAllRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServiceAllRecord.fromSnapshot(s));

  static Future<ServiceAllRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServiceAllRecord.fromSnapshot(s));

  static ServiceAllRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServiceAllRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServiceAllRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServiceAllRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServiceAllRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServiceAllRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServiceAllRecordData({
  String? title,
  double? price,
  String? description,
  String? image,
  bool? available,
  DateTime? time,
  LatLng? location,
  DocumentReference? seller,
  DocumentReference? category,
  String? serviceLocation,
  double? overallRating,
  int? noOfSold,
  int? noOfReviews,
  String? address,
  DocumentReference? reviews,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'available': available,
      'time': time,
      'location': location,
      'seller': seller,
      'category': category,
      'serviceLocation': serviceLocation,
      'overall_rating': overallRating,
      'no_of_sold': noOfSold,
      'no_of_reviews': noOfReviews,
      'address': address,
      'reviews': reviews,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServiceAllRecordDocumentEquality implements Equality<ServiceAllRecord> {
  const ServiceAllRecordDocumentEquality();

  @override
  bool equals(ServiceAllRecord? e1, ServiceAllRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.price == e2?.price &&
        e1?.description == e2?.description &&
        e1?.image == e2?.image &&
        e1?.available == e2?.available &&
        e1?.time == e2?.time &&
        e1?.location == e2?.location &&
        e1?.seller == e2?.seller &&
        e1?.category == e2?.category &&
        e1?.serviceLocation == e2?.serviceLocation &&
        e1?.overallRating == e2?.overallRating &&
        e1?.noOfSold == e2?.noOfSold &&
        e1?.noOfReviews == e2?.noOfReviews &&
        listEquality.equals(e1?.orders, e2?.orders) &&
        e1?.address == e2?.address &&
        e1?.reviews == e2?.reviews;
  }

  @override
  int hash(ServiceAllRecord? e) => const ListEquality().hash([
        e?.title,
        e?.price,
        e?.description,
        e?.image,
        e?.available,
        e?.time,
        e?.location,
        e?.seller,
        e?.category,
        e?.serviceLocation,
        e?.overallRating,
        e?.noOfSold,
        e?.noOfReviews,
        e?.orders,
        e?.address,
        e?.reviews
      ]);

  @override
  bool isValidKey(Object? o) => o is ServiceAllRecord;
}
