class User {
  final int id;
  final String name;
  final String avatar;

  User({
    required this.id,
    required this.name,
    required this.avatar,
  });
}

final User currentUser =
User(id: 0, name: 'Boss', avatar: 'assets/images/ava_2.jpg');

final User user1 =
User(id: 1, name: 'Кот', avatar: 'assets/images/ava_1.jpg');

final User user2 =
User(id: 2, name: 'Good boy', avatar: 'assets/images/ava_3.jpg');

final User user3 =
User(id: 3, name: 'burger', avatar: 'assets/images/ava_4.jpg');

// final User jason = User(id: 4, name: 'Json', avatar: 'assets/images/Jason.jpg');
//
// final User judd = User(id: 5, name: 'Judd', avatar: 'assets/images/Judd.jpg');
//
// final User leslie =
// User(id: 6, name: 'Leslie', avatar: 'assets/images/Leslie.jpg');
//
// final User nathan =
// User(id: 7, name: 'Nathan', avatar: 'assets/images/Nathan.jpg');
//
// final User stanley =
// User(id: 8, name: 'Stanley', avatar: 'assets/images/Stanley.jpg');
//
// final User virgil =
// User(id: 9, name: 'Virgil', avatar: 'assets/images/Virgil.jpg');