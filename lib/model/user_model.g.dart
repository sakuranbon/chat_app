
part of 'user_model.dart';


_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
  uid: json['uid'] as String? ?? '',
  name: json['name'] as String? ?? '',
  email: json['email'] as String? ?? '',
  profilePic: json['profilePic'] as String?,
  room: json['room'] == null
      ? null
      : RoomModel.fromJson(json['room'] as Map<String, dynamic>),
  password: json['password'] as String? ?? '',
);

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'profilePic': instance.profilePic,
      'room': instance.room,
      'password': instance.password,
    };
