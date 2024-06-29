import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SellersRecord extends FirestoreRecord {
  SellersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id_number" field.
  String? _idNumber;
  String get idNumber => _idNumber ?? '';
  bool hasIdNumber() => _idNumber != null;

  // "name_id" field.
  String? _nameId;
  String get nameId => _nameId ?? '';
  bool hasNameId() => _nameId != null;

  // "id_type" field.
  IdTypes? _idType;
  IdTypes? get idType => _idType;
  bool hasIdType() => _idType != null;

  // "verified" field.
  bool? _verified;
  bool get verified => _verified ?? false;
  bool hasVerified() => _verified != null;

  // "id_image_front" field.
  String? _idImageFront;
  String get idImageFront => _idImageFront ?? '';
  bool hasIdImageFront() => _idImageFront != null;

  // "id_image_back" field.
  String? _idImageBack;
  String get idImageBack => _idImageBack ?? '';
  bool hasIdImageBack() => _idImageBack != null;

  // "DOB" field.
  DateTime? _dob;
  DateTime? get dob => _dob;
  bool hasDob() => _dob != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _idNumber = snapshotData['id_number'] as String?;
    _nameId = snapshotData['name_id'] as String?;
    _idType = deserializeEnum<IdTypes>(snapshotData['id_type']);
    _verified = snapshotData['verified'] as bool?;
    _idImageFront = snapshotData['id_image_front'] as String?;
    _idImageBack = snapshotData['id_image_back'] as String?;
    _dob = snapshotData['DOB'] as DateTime?;
    _address = snapshotData['address'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('sellers')
          : FirebaseFirestore.instance.collectionGroup('sellers');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('sellers').doc(id);

  static Stream<SellersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SellersRecord.fromSnapshot(s));

  static Future<SellersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SellersRecord.fromSnapshot(s));

  static SellersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SellersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SellersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SellersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SellersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SellersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSellersRecordData({
  String? idNumber,
  String? nameId,
  IdTypes? idType,
  bool? verified,
  String? idImageFront,
  String? idImageBack,
  DateTime? dob,
  String? address,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_number': idNumber,
      'name_id': nameId,
      'id_type': idType,
      'verified': verified,
      'id_image_front': idImageFront,
      'id_image_back': idImageBack,
      'DOB': dob,
      'address': address,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class SellersRecordDocumentEquality implements Equality<SellersRecord> {
  const SellersRecordDocumentEquality();

  @override
  bool equals(SellersRecord? e1, SellersRecord? e2) {
    return e1?.idNumber == e2?.idNumber &&
        e1?.nameId == e2?.nameId &&
        e1?.idType == e2?.idType &&
        e1?.verified == e2?.verified &&
        e1?.idImageFront == e2?.idImageFront &&
        e1?.idImageBack == e2?.idImageBack &&
        e1?.dob == e2?.dob &&
        e1?.address == e2?.address &&
        e1?.user == e2?.user;
  }

  @override
  int hash(SellersRecord? e) => const ListEquality().hash([
        e?.idNumber,
        e?.nameId,
        e?.idType,
        e?.verified,
        e?.idImageFront,
        e?.idImageBack,
        e?.dob,
        e?.address,
        e?.user
      ]);

  @override
  bool isValidKey(Object? o) => o is SellersRecord;
}
