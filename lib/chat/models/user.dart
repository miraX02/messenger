import 'package:flutter/foundation.dart' show immutable;

import '../../core/firebase_field_names.dart';

@immutable
class UserModel {
  final String fullName;
  final String uid;

  const UserModel({
    required this.fullName,
    required this.uid,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      FirebaseFieldNames.fullName: fullName,
      FirebaseFieldNames.uid: uid,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      fullName: map[FirebaseFieldNames.fullName] as String,
      uid: map[FirebaseFieldNames.uid] as String,
    );
  }
}
