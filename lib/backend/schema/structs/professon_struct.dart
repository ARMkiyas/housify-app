// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ProfessonStruct extends FFFirebaseStruct {
  ProfessonStruct({
    String? professon,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _professon = professon,
        super(firestoreUtilData);

  // "professon" field.
  String? _professon;
  String get professon => _professon ?? '';
  set professon(String? val) => _professon = val;

  bool hasProfesson() => _professon != null;

  static ProfessonStruct fromMap(Map<String, dynamic> data) => ProfessonStruct(
        professon: data['professon'] as String?,
      );

  static ProfessonStruct? maybeFromMap(dynamic data) => data is Map
      ? ProfessonStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'professon': _professon,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'professon': serializeParam(
          _professon,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProfessonStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProfessonStruct(
        professon: deserializeParam(
          data['professon'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProfessonStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProfessonStruct && professon == other.professon;
  }

  @override
  int get hashCode => const ListEquality().hash([professon]);
}

ProfessonStruct createProfessonStruct({
  String? professon,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProfessonStruct(
      professon: professon,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProfessonStruct? updateProfessonStruct(
  ProfessonStruct? professonStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    professonStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProfessonStructData(
  Map<String, dynamic> firestoreData,
  ProfessonStruct? professonStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (professonStruct == null) {
    return;
  }
  if (professonStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && professonStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final professonStructData =
      getProfessonFirestoreData(professonStruct, forFieldValue);
  final nestedData =
      professonStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = professonStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProfessonFirestoreData(
  ProfessonStruct? professonStruct, [
  bool forFieldValue = false,
]) {
  if (professonStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(professonStruct.toMap());

  // Add any Firestore field values
  professonStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProfessonListFirestoreData(
  List<ProfessonStruct>? professonStructs,
) =>
    professonStructs?.map((e) => getProfessonFirestoreData(e, true)).toList() ??
    [];
