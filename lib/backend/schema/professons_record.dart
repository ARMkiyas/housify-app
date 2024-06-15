import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ProfessonsRecord extends FirestoreRecord {
  ProfessonsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "professoion" field.
  String? _professoion;
  String get professoion => _professoion ?? '';
  bool hasProfessoion() => _professoion != null;

  // "category_name" field.
  String? _categoryName;
  String get categoryName => _categoryName ?? '';
  bool hasCategoryName() => _categoryName != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _professoion = snapshotData['professoion'] as String?;
    _categoryName = snapshotData['category_name'] as String?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('professons');

  static Stream<ProfessonsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProfessonsRecord.fromSnapshot(s));

  static Future<ProfessonsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProfessonsRecord.fromSnapshot(s));

  static ProfessonsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProfessonsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProfessonsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProfessonsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProfessonsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProfessonsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProfessonsRecordData({
  String? professoion,
  String? categoryName,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'professoion': professoion,
      'category_name': categoryName,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProfessonsRecordDocumentEquality implements Equality<ProfessonsRecord> {
  const ProfessonsRecordDocumentEquality();

  @override
  bool equals(ProfessonsRecord? e1, ProfessonsRecord? e2) {
    return e1?.professoion == e2?.professoion &&
        e1?.categoryName == e2?.categoryName &&
        e1?.image == e2?.image;
  }

  @override
  int hash(ProfessonsRecord? e) =>
      const ListEquality().hash([e?.professoion, e?.categoryName, e?.image]);

  @override
  bool isValidKey(Object? o) => o is ProfessonsRecord;
}
