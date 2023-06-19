import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: HelpCenter(),
    ));

class HelpCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Help Center',
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Selamat datang di Help Center Sittok.',
              style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 1.0,
                color: Colors.black,
              ),
            ),
            Text(
              'Kami di sini untuk membantu Anda menemukan solusi dan jawaban atas pertanyaan dan masalah yang Anda hadapi.',
              style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 1.0,
                color: Colors.black,
              ),
            ),
            Text(
              'Help Center kami dirancang untuk memberikan panduan yang jelas dan mendalam mengenai produk dan layanan kami.',
              style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 1.0,
                color: Colors.black,
              ),
            ),
            Text(
              'Silakan temukan jawaban yang Anda cari dengan menjelajahi berbagai topik yang tersedia.',
              style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 1.0,
                color: Colors.black,
              ),
            ),
            Text(
              'Jika Anda tidak menemukan jawaban yang Anda cari di Help Center kami, jangan ragu untuk menghubungi tim dukungan kami. Anda dapat menghubungi kami melalui WhatsApp di [nomor WhatsApp] atau melalui email dan Instagram.',
              style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 1.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.email),
              onPressed: () {
// Action to open email link
              },
            ),
            IconButton(
              icon: Icon(Icons.phone),
              onPressed: () {
// Action to open WhatsApp link
              },
            ),
            IconButton(
              icon: Icon(Icons.link),
              onPressed: () {
// Action to open Instagram link
              },
            ),
          ],
        ),
      ),
    );
  }
}
