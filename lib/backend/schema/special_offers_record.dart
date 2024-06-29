import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SpecialOffersRecord extends FirestoreRecord {
  SpecialOffersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "banner_image" field.
  String? _bannerImage;
  String get bannerImage => _bannerImage ?? '';
  bool hasBannerImage() => _bannerImage != null;

  void _initializeFields() {
    _title = snapshotData['Title'] as String?;
    _description = snapshotData['Description'] as String?;
    _bannerImage = snapshotData['banner_image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('specialOffers');

  static Stream<SpecialOffersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SpecialOffersRecord.fromSnapshot(s));

  static Future<SpecialOffersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SpecialOffersRecord.fromSnapshot(s));

  static SpecialOffersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SpecialOffersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SpecialOffersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SpecialOffersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SpecialOffersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SpecialOffersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSpecialOffersRecordData({
  String? title,
  String? description,
  String? bannerImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Title': title,
      'Description': description,
      'banner_image': bannerImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class SpecialOffersRecordDocumentEquality
    implements Equality<SpecialOffersRecord> {
  const SpecialOffersRecordDocumentEquality();

  @override
  bool equals(SpecialOffersRecord? e1, SpecialOffersRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.bannerImage == e2?.bannerImage;
  }

  @override
  int hash(SpecialOffersRecord? e) =>
      const ListEquality().hash([e?.title, e?.description, e?.bannerImage]);

  @override
  bool isValidKey(Object? o) => o is SpecialOffersRecord;
}
