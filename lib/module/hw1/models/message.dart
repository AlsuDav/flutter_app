import './user.dart';

class Message {
  final User sender;
  final String avatar;
  final String time;
  final int unreadCount;
  final bool isRead;
  final String text;

  Message({
    required this.sender,
    required this.avatar,
    required this.time,
    required this.unreadCount,
    required this.text,
    required this.isRead,
  });
}

final List<Message> recentChats = [
  Message(
    sender: user1,
    avatar: 'assets/images/ava_1.jpg',
    time: '01:25',
    text: "typing...",
    unreadCount: 1,
      isRead: true,
  ),
  Message(
    sender: user2,
    avatar: 'assets/images/ava_2.jpg',
    time: '12:46',
    text: "Will I be in it?",
    unreadCount: 1,
      isRead: true,
  ),
  Message(
    sender: user3,
    avatar: 'assets/images/ava_3.jpg',
    time: '05:26',
    text: "That's so cute.",
    unreadCount: 3,
      isRead: true,
  ),
  Message(
      sender: currentUser,
      avatar: 'assets/images/ava_4.jpg',
      time: '12:45',
      text: "Let me see what I can do.",
      unreadCount: 2,
      isRead: true),
  Message(
      sender: currentUser,
      avatar: 'assets/images/ava_4.jpg',
      time: '12:45',
      text: "Let me see what I can do.",
      unreadCount: 2,
      isRead: true),
  Message(
      sender: currentUser,
      avatar: 'assets/images/ava_4.jpg',
      time: '12:45',
      text: "Let me see what I can do.",
      unreadCount: 2,
      isRead: true),
  Message(
      sender: currentUser,
      avatar: 'assets/images/ava_4.jpg',
      time: '12:45',
      text: "Let me see what I can do.",
      unreadCount: 2,
      isRead: true),
  Message(
      sender: currentUser,
      avatar: 'assets/images/ava_4.jpg',
      time: '12:45',
      text: "Let me see what I can do.",
      unreadCount: 2,
      isRead: true),
  Message(
      sender: currentUser,
      avatar: 'assets/images/ava_4.jpg',
      time: '12:45',
      text: "Let me see what I can do.",
      unreadCount: 2,
      isRead: true),

];

final List<Message> allChats = [
  Message(
    sender: user1,
    avatar: 'assets/images/ava_1.jpg',
    time: '12:59',
    text: "No! I just wanted",
    unreadCount: 0,
    isRead: true,
  ),
  Message(
    sender: user2,
    avatar: 'assets/images/ava_2.jpg',
    time: '10:41',
    text: "You did what?",
    unreadCount: 1,
    isRead: false,
  ),
  Message(
    sender: user3,
    avatar: 'assets/images/ava_3.jpg',
    time: '05:51',
    unreadCount: 0,
    isRead: true,
    text: "just signed up for a tutor",
  ),
  Message(
    sender: user3,
    avatar: 'assets/images/ava_3.jpg',
    time: '05:51',
    unreadCount: 0,
    isRead: true,
    text: "just signed up for a tutor",
  ),
  Message(
    sender: user3,
    avatar: 'assets/images/ava_3.jpg',
    time: '05:51',
    unreadCount: 0,
    isRead: true,
    text: "just signed up for a tutor",
  ),
  Message(
    sender: user3,
    avatar: 'assets/images/ava_3.jpg',
    time: '05:51',
    unreadCount: 0,
    isRead: true,
    text: "just signed up for a tutor",
  ),
  Message(
    sender: user3,
    avatar: 'assets/images/ava_3.jpg',
    time: '05:51',
    unreadCount: 0,
    isRead: true,
    text: "just signed up for a tutor",
  ),
  Message(
    sender: user3,
    avatar: 'assets/images/ava_3.jpg',
    time: '05:51',
    unreadCount: 0,
    isRead: true,
    text: "just signed up for a tutor",
  ),
  Message(
    sender: user3,
    avatar: 'assets/images/ava_3.jpg',
    time: '05:51',
    unreadCount: 0,
    isRead: true,
    text: "just signed up for a tutor",
  ),
  Message(
    sender: user3,
    avatar: 'assets/images/ava_3.jpg',
    time: '05:51',
    unreadCount: 0,
    isRead: true,
    text: "just signed up for a tutor",
  ),
  Message(
    sender: user3,
    avatar: 'assets/images/ava_3.jpg',
    time: '05:51',
    unreadCount: 0,
    isRead: true,
    text: "just signed up for a tutor",
  ),

];

final List<Message> messages = [
  Message(
    sender: user1,
    time: '12:09 AM',
    avatar: user1.avatar,
    text: "ты никогда меня не любила",
      isRead: true, unreadCount: 0,
  ),
  Message(
    sender: currentUser,
    time: '12:05 AM',
    isRead: true,
    text: "эй!",
    // isRead: true,
    unreadCount: 0,
    avatar: currentUser.avatar,
  ),
  Message(
    sender: currentUser,
    time: '12:05 AM',
    isRead: true,
    text: "Я специально сходила на кухню и проверила. ТАМ ПОЛНАЯ МИСКА ",
    avatar: currentUser.avatar,
    unreadCount: 0,
  ),
  Message(
    sender: user1,
    time: '11:58 PM',
    avatar: user1.avatar,
    text: "а в египте я божественное существо, там меня бы не предали",
    isRead: true,
    unreadCount: 0,
  ),
  Message(
    sender: user1,
    time: '11:58 PM',
    avatar: user1.avatar,
    text: "Неужели так трудно просто дать мне еды",
    isRead: true,
    unreadCount: 0,
  ),
  Message(
    sender: currentUser,
    time: '11:45 PM',
    isRead: true,
    text:
    "На кухне стоит полная миска с кормом",
    avatar: currentUser.avatar,
    unreadCount: 0,
  ),
  Message(
    sender: user1,
    time: '11:30 PM',
    avatar: user1.avatar,
    text: "Покорми меня",
    unreadCount: 1,
    isRead: true,
  ),
];