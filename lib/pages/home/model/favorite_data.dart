import '../../../common/image.dart';

class User {
  final String name;
  final String username;
  final String image;
  final double percentDone;
  final String duartion;
  final int calories;
  final List<String> info;
  bool isFavorite;

  User({
    required this.name,
    required this.username,
    required this.image,
    required this.percentDone,
    required this.duartion,
    required this.calories,
    required this.info,
    this.isFavorite = false,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      username: json['username'],
      image: json['image'],
      percentDone: json['percentDone'],
      duartion: json['duartion'],
      calories: json['calories'],
      info: List<String>.from(json['info']),
      isFavorite: json['isFavorite'] ?? false,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'image': image,
      'percentDone': percentDone,
      'duartion': duartion,
      'calories': calories,
      'info': info,
      'isFavorite': isFavorite,
    };
  }

}

List<User> users = [
  User(
      name: 'Parsvakonasana',
      username: 'Extended',
      image: appExtended,
      percentDone: 0.4,
      duartion: '',
      info: [
        "Stand with your feet apart, about 3-4 feet.",
        "Turn your right foot to the right, keeping your left foot slightly turned inward.",
        "  Bend your right knee, making sure it stays above your ankle.",
        "  Lean your upper body to the right, placing your right hand on the floor or a block next to your right foot",
        "  Extend your left arm over your head, palm facing down, and look up toward your left hand. Hold this position and breathe deeply. Repeat on the other side."
      ],
      calories: 10,
      isFavorite: false),
  User(
      name: 'Bitialasana',
      username: 'Cow pose',
      image: appCow,
      percentDone: 0.7,
      duartion: '',
      info: ['test', 'test 1', 'test 2'],
      calories: 14,
      isFavorite: false),
  User(
      name: 'Virabhadrasana',
      username: 'Warrior',
      image: appWarrior,
      percentDone: 0.2,
      duartion: '',
      info: ['test', 'test 1', 'test 2'],
      calories: 25,
      isFavorite: false),
  User(
      name: 'Setu Bandha Sarvangasana',
      username: 'Bridge pose',
      image: appExtended,
      percentDone: 0.8,
      duartion: '',
      info: ['test', 'test 1', 'test 2'],
      calories: 42,
      isFavorite: false),
  User(
      name: 'Kakasana',
      username: 'Crow pose',
      image: appCrow,
      percentDone: 0.9,
      duartion: '20',
      info: ['test', 'test 1', 'test 2'],
      calories: 56,
      isFavorite: false),
  User(
      name: 'Sukhasana',
      username: 'Easy pose',
      image: appEasy,
      percentDone: 0.4,
      duartion: '',
      info: ['test', 'test 1', 'test 2'],
      calories: 80,
      isFavorite: false),
  User(
      name: 'Virabhadrasana',
      username: 'Warrior',
      image: appWarrior,
      percentDone: 0.5,
      duartion: '',
      info: ['test', 'test 1', 'test 2'],
      calories: 120,
      isFavorite: false),
];
List<User> usersBasic = [
  User(
      name: 'Janu Sirshasana',
      username: 'Extended',
      image: appB7,
      percentDone: 0.4,
      duartion: '5 min',
      info: ['test', 'test 1', 'test 2'],
      calories: 30,
      isFavorite: false),
  User(
      name: 'Vajrasana',
      username: 'Cow pose',
      image: appB2,
      percentDone: 0.7,
      duartion: '8 min',
      info: ['test', 'test 1', 'test 2'],
      calories: 50,
      isFavorite: false),
  User(
      name: 'Kakasana',
      username: 'Warrior',
      image: appB3,
      percentDone: 0.2,
      duartion: '12 min',
      info: ['test', 'test 1', 'test 2'],
      calories: 60,
      isFavorite: false),
  User(
      name: 'Kurmasana',
      username: 'Bridge pose',
      image: appB4,
      percentDone: 0.8,
      duartion: '15 min',
      info: ['test', 'test 1', 'test 2'],
      calories: 80,
      isFavorite: false),
  User(
      name: 'Dandasana',
      username: 'Crow pose',
      image: appB6,
      percentDone: 0.9,
      duartion: '4 min',
      info: ['test', 'test 1', 'test 2'],
      calories: 120,
      isFavorite: false),
];
List<User> usersAdvance = [
  User(
      name: 'Janu Sirshasana',
      username: 'Extended',
      image: appA2,
      percentDone: 0.4,
      duartion: '5 min',
      info: ['test', 'test 1', 'test 2'],
      calories: 150,
      isFavorite: false),
  User(
      name: 'Vajrasana',
      username: 'Cow pose',
      image: appA3,
      percentDone: 0.7,
      duartion: '8 min',
      info: ['test', 'test 1', 'test 2'],
      calories: 100,
      isFavorite: false),
  User(
      name: 'Kakasana',
      username: 'Warrior',
      image: appA4,
      percentDone: 0.2,
      duartion: '12 min',
      info: ['test', 'test 1', 'test 2'],
      calories: 60,
      isFavorite: false),
  User(
      name: 'Kurmasana',
      username: 'Bridge pose',
      image: appA6,
      percentDone: 0.8,
      duartion: '15 min',
      info: ['test', 'test 1', 'test 2'],
      calories: 80,
      isFavorite: false),
  User(
      name: 'Dandasana',
      username: 'Crow pose',
      image: appA7,
      percentDone: 0.9,
      duartion: '4 min',
      info: ['test', 'test 1', 'test 2'],
      calories: 220,
      isFavorite: false),
];
