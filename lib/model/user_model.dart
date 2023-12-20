class UserModel{
  String name;
  String friend;
  String office;
  String spouse;
  String guardian;
  String neighbour;
  String createdAt;
  String uid;
  String phoneNumber;
  String profilePic;

  UserModel({
    required this.name,
    required this.friend,
    required this.profilePic,
    required this.office,
    required this.spouse,
    required this.guardian,
    required this.neighbour,
    required this.createdAt,
    required this.uid,
    required this.phoneNumber
  });

  factory UserModel.fromMap(Map<String,dynamic>map){
    return UserModel(
        name: map['name'] ?? '',
        friend: map['friend'] ?? '',
        office: map['office'] ?? '',
        spouse: map['spouse'] ?? '',
        guardian: map['guardian'] ?? '',
        neighbour: map['neighbour'] ?? '',
        createdAt: map['createdAt'] ?? '',
        uid: map['uid'] ?? '',
        phoneNumber: map['phoneNumber'] ?? '',
        profilePic: map['profilePic'] ?? ''
    );
  }
  Map<String,dynamic> toMap(){
    return{
      "name":name ,
      "friend": friend,
      "office":office,
      "spouse":spouse,
      "guardian": guardian,
      "neighbour":neighbour,
      "createdAt":createdAt,
      "uid":uid,
      "phoneNumber":phoneNumber,
      "profilePic":profilePic
    };
  }

}