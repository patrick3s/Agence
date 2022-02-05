import '../../../authentication/domain/entities/user_entity.dart';

extension UserDTO on UserEntity {
  Map<String, dynamic> toMap() => {
        'provider': provider,
        'lastLogged': lastLogged,
      };

  static UserEntity fromMap(Map<String, dynamic> map) {
    return UserEntity(
      map['provider'] ?? '',
      map['lastLogged'] ?? '',
    );
  }
}
