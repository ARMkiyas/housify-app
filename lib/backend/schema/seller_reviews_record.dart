import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SellerReviewsRecord extends FirestoreRecord {
  SellerReviewsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "customerName" field.
  String? _customerName;
  String get customerName => _customerName ?? '';
  bool hasCustomerName() => _customerName != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "feedback" field.
  String? _feedback;
  String get feedback => _feedback ?? '';
  bool hasFeedback() => _feedback != null;

  // "DateTime" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  bool hasDateTime() => _dateTime != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "userImage" field.
  String? _userImage;
  String get userImage => _userImage ?? '';
  bool hasUserImage() => _userImage != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _customerName = snapshotData['customerName'] as String?;
    _rating = castToType<double>(snapshotData['rating']);
    _feedback = snapshotData['feedback'] as String?;
    _dateTime = snapshotData['DateTime'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _userImage = snapshotData['userImage'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('SellerReviews')
          : FirebaseFirestore.instance.collectionGroup('SellerReviews');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('SellerReviews').doc(id);

  static Stream<SellerReviewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SellerReviewsRecord.fromSnapshot(s));

  static Future<SellerReviewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SellerReviewsRecord.fromSnapshot(s));

  static SellerReviewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SellerReviewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SellerReviewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SellerReviewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SellerReviewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SellerReviewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSellerReviewsRecordData({
  String? customerName,
  double? rating,
  String? feedback,
  DateTime? dateTime,
  DocumentReference? user,
  String? userImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'customerName': customerName,
      'rating': rating,
      'feedback': feedback,
      'DateTime': dateTime,
      'user': user,
      'userImage': userImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class SellerReviewsRecordDocumentEquality
    implements Equality<SellerReviewsRecord> {
  const SellerReviewsRecordDocumentEquality();

  @override
  bool equals(SellerReviewsRecord? e1, SellerReviewsRecord? e2) {
    return e1?.customerName == e2?.customerName &&
        e1?.rating == e2?.rating &&
        e1?.feedback == e2?.feedback &&
        e1?.dateTime == e2?.dateTime &&
        e1?.user == e2?.user &&
        e1?.userImage == e2?.userImage;
  }

  @override
  int hash(SellerReviewsRecord? e) => const ListEquality().hash([
        e?.customerName,
        e?.rating,
        e?.feedback,
        e?.dateTime,
        e?.user,
        e?.userImage
      ]);

  @override
  bool isValidKey(Object? o) => o is SellerReviewsRecord;
}
