// detail.dart
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('日記詳細'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '日記の詳細:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // 日記の詳細を表示するウィジェット（ここに質問と回答の内容が表示される想定）
            Text(
              '今日一番美味しいと感じた食事はなんですか？\n回答: 〇〇〇〇〇',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            // 編集や削除ボタンなどのオプションを配置する
            ElevatedButton(
              onPressed: () {
                // 編集画面に遷移する処理
                Navigator.pushNamed(context, '/edit');
              },
              child: Text('編集'),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // 削除処理などを実行する（このサンプルでは未実装）
                // そして、ホーム画面に戻る
                Navigator.pop(context);
              },
              child: Text('削除'),
            ),
          ],
        ),
      ),
    );
  }
}
