import 'package:flutter/material.dart';
import 'main.dart';
import 'calendar.dart';

class Footer extends StatelessWidget {
  final int currentIndex;

  Footer({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'メイン画面',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'カレンダー',
        ),
      ],
      currentIndex: currentIndex,
      onTap: (index) {
        // すべてのインデックスの遷移を許可するため、条件を削除
        if (index == 0) { // メイン画面のアイテムが選択された場合
          Navigator.pushReplacement( // 現在の画面を置き換えてメイン画面に遷移
            context,
            MaterialPageRoute(builder: (context) => MainScreen()),
          );
        } else if (index == 1) { // カレンダー画面のアイテムが選択された場合
          Navigator.push( // 現在の画面を置き換えてカレンダー画面に遷移
            context,
            MaterialPageRoute(builder: (context) => CalendarScreen()),
          );
        }
      },
    );
  }
}
