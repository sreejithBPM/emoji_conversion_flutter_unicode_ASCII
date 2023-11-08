import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EmojiConverter(),
    );
  }
}

class EmojiConverter extends StatefulWidget {
  @override
  _EmojiConverterState createState() => _EmojiConverterState();
}

class _EmojiConverterState extends State<EmojiConverter> {
  final TextEditingController _textController = TextEditingController();
  String originalMessage = '';
  String convertedMessage = '';

  Map<String, String> emojiMapping = {
    "😊": ":)",
    "❤️": "<3",
    "😂": ":D",
    "👍": "+1",
    "🙏": ":pray:",
    "🎉": ":tada:",
    "🍔": ":hamburger:",
    "🍕": ":pizza:",
    "🌟": ":star:",
    "🔥": ":fire:",
    "🎈": ":balloon:",
    "🎁": ":gift:",
    "🚀": ":rocket:",
    "⚡": ":zap:",
    "💡": ":bulb:",
    "🐱": ":cat:",
    "🐶": ":dog:",
    "🐦": ":bird:",
    "🐢": ":turtle:",
    "🌸": ":flower:",
    "🍁": ":maple_leaf:",
    "🌞": ":sun:",
    "🌝": ":full_moon_with_face:",
    "🌚": ":new_moon_with_face:",
    "🌍": ":earth_americas:",
    "🌎": ":earth_africa:",
    "🌏": ":earth_asia:",
    "🌴": ":palm_tree:",
    "🍺": ":beer:",
    "🍻": ":beers:",
    "🍸": ":cocktail:",
    "🍷": ":wine_glass:",
    "🍹": ":tropical_drink:",
    "🍺": ":beer:",
    "🍼": ":baby_bottle:",
    "🎂": ":cake:",
    "🍩": ":doughnut:",
    "🍦": ":ice_cream:",
    "🤣": "sidesmile",
    // Add more mappings as needed
  };

  String unicodeToASCII(String text) {
    emojiMapping.forEach((unicode, ascii) {
      text = text.replaceAll(unicode, ascii);
    });
    return text;
  }

  String asciiToUnicode(String text) {
    emojiMapping.forEach((unicode, ascii) {
      text = text.replaceAll(ascii, unicode);
    });
    return text;
  }

  void _handleConvert() {
    final message = _textController.text;
    setState(() {
      originalMessage = message;
      convertedMessage = unicodeToASCII(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emoji Converter'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(labelText: 'Enter a message with emojis'),
            ),
          ),
          ElevatedButton(
            onPressed: _handleConvert,
            child: Text('Convert'),
          ),
          SizedBox(height: 20),
          Text('Original Message: $originalMessage'),
          Text('Converted Message: $convertedMessage'),
          Text('Converted Back: ${asciiToUnicode(convertedMessage)}'),
        ],
      ),
    );
  }
}