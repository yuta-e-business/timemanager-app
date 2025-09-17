import 'package:flutter/material.dart';
import 'footer.dart';
import 'package:table_calendar/table_calendar.dart';
import 'answer.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late List<Map<String, dynamic>> _diaryEntries = []; // 日記のエントリを保持するリスト

  @override
  void initState() {
    super.initState();
    // ダミーデータの代わりに実際のデータを使用する場合は、ここでデータをロードする必要があります
    _loadDiaryEntries();
  }

  // 日記のエントリをロードするメソッド
  void _loadDiaryEntries() {
    // diaryEntriesを適切に実装する前提で、日記のエントリを取得する処理を行う
    // 以下はダミーデータの例
    _diaryEntries = [
      {
        'date': '2024-03-27',
        'entries': [
          {'question': '今日一番面白かったことはなんですか？', 'answer': 'soccer'},
          {'question': '今日一番美味しかった料理はなんですか？', 'answer': 'sushi'}
        ]
      },
      // 他の日付のエントリも同様に追加する
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('カレンダー画面'),
      ),
      body: Column(
        children: [
          // カレンダーウィジェットを配置
          // ここではTableCalendarウィジェットを使用する
          // TableCalendarウィジェットに選択された日付のエントリを表示する
          // カレンダーウィジェットのイベントローダーでエントリを返す必要がある
          TableCalendar(
            firstDay: DateTime.utc(2023, 1, 1),
            lastDay: DateTime.utc(2123, 12, 31),
            focusedDay: DateTime.now(),
            eventLoader: (day) {
              // カレンダーセルに表示するイベントを返す
              // ここでは日付に対応するエントリを取得して返す
              List<Map<String, dynamic>> entriesForDay = _diaryEntries.where((entry) => entry['date'] == _formatDate(day)).toList();
              if (entriesForDay.isNotEmpty) {
                return entriesForDay.map((entry) => entry['entries']).expand((element) => element).toList();
              } else {
                return [];
              }
            },
          ),
        ],
      ),
      bottomNavigationBar: Footer(currentIndex: 1),
    );
  }

  // 日付を文字列にフォーマットするメソッド
  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}
