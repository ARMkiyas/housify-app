import 'package:collection/collection.dart';

enum Roles {
  customer,
  seller,
  admin,
}

enum Professons {
  Plumber,
  Electrician,
}

enum IdTypes {
  PassPort,
  NationalID,
}

enum Pages {
  home,
  category,
  orders,
  profile,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Roles):
      return Roles.values.deserialize(value) as T?;
    case (Professons):
      return Professons.values.deserialize(value) as T?;
    case (IdTypes):
      return IdTypes.values.deserialize(value) as T?;
    case (Pages):
      return Pages.values.deserialize(value) as T?;
    default:
      return null;
  }
}
