import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "customer" field.
  DocumentReference? _customer;
  DocumentReference? get customer => _customer;
  bool hasCustomer() => _customer != null;

  // "seller" field.
  DocumentReference? _seller;
  DocumentReference? get seller => _seller;
  bool hasSeller() => _seller != null;

  // "orderDate" field.
  DateTime? _orderDate;
  DateTime? get orderDate => _orderDate;
  bool hasOrderDate() => _orderDate != null;

  // "status" field.
  OrderStatus? _status;
  OrderStatus? get status => _status;
  bool hasStatus() => _status != null;

  // "totalPrice" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  bool hasTotalPrice() => _totalPrice != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  // "cus_cords" field.
  LatLng? _cusCords;
  LatLng? get cusCords => _cusCords;
  bool hasCusCords() => _cusCords != null;

  // "seller_cords" field.
  LatLng? _sellerCords;
  LatLng? get sellerCords => _sellerCords;
  bool hasSellerCords() => _sellerCords != null;

  // "service" field.
  DocumentReference? _service;
  DocumentReference? get service => _service;
  bool hasService() => _service != null;

  // "payment_method" field.
  PaymentMethod? _paymentMethod;
  PaymentMethod? get paymentMethod => _paymentMethod;
  bool hasPaymentMethod() => _paymentMethod != null;

  // "No_of_hours" field.
  double? _noOfHours;
  double get noOfHours => _noOfHours ?? 0.0;
  bool hasNoOfHours() => _noOfHours != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  void _initializeFields() {
    _customer = snapshotData['customer'] as DocumentReference?;
    _seller = snapshotData['seller'] as DocumentReference?;
    _orderDate = snapshotData['orderDate'] as DateTime?;
    _status = deserializeEnum<OrderStatus>(snapshotData['status']);
    _totalPrice = castToType<double>(snapshotData['totalPrice']);
    _address = snapshotData['address'] as String?;
    _notes = snapshotData['notes'] as String?;
    _cusCords = snapshotData['cus_cords'] as LatLng?;
    _sellerCords = snapshotData['seller_cords'] as LatLng?;
    _service = snapshotData['service'] as DocumentReference?;
    _paymentMethod =
        deserializeEnum<PaymentMethod>(snapshotData['payment_method']);
    _noOfHours = castToType<double>(snapshotData['No_of_hours']);
    _phone = snapshotData['phone'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  DocumentReference? customer,
  DocumentReference? seller,
  DateTime? orderDate,
  OrderStatus? status,
  double? totalPrice,
  String? address,
  String? notes,
  LatLng? cusCords,
  LatLng? sellerCords,
  DocumentReference? service,
  PaymentMethod? paymentMethod,
  double? noOfHours,
  String? phone,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'customer': customer,
      'seller': seller,
      'orderDate': orderDate,
      'status': status,
      'totalPrice': totalPrice,
      'address': address,
      'notes': notes,
      'cus_cords': cusCords,
      'seller_cords': sellerCords,
      'service': service,
      'payment_method': paymentMethod,
      'No_of_hours': noOfHours,
      'phone': phone,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    return e1?.customer == e2?.customer &&
        e1?.seller == e2?.seller &&
        e1?.orderDate == e2?.orderDate &&
        e1?.status == e2?.status &&
        e1?.totalPrice == e2?.totalPrice &&
        e1?.address == e2?.address &&
        e1?.notes == e2?.notes &&
        e1?.cusCords == e2?.cusCords &&
        e1?.sellerCords == e2?.sellerCords &&
        e1?.service == e2?.service &&
        e1?.paymentMethod == e2?.paymentMethod &&
        e1?.noOfHours == e2?.noOfHours &&
        e1?.phone == e2?.phone;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.customer,
        e?.seller,
        e?.orderDate,
        e?.status,
        e?.totalPrice,
        e?.address,
        e?.notes,
        e?.cusCords,
        e?.sellerCords,
        e?.service,
        e?.paymentMethod,
        e?.noOfHours,
        e?.phone
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
