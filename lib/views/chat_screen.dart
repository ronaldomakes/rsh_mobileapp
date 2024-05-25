import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rsh_mobileapp/widgets/text_field.dart';

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}

List<ChatMessage> messages = [
  ChatMessage(messageContent: "Спасибо!", messageType: "sender"),
  ChatMessage(messageContent: "Хорошо, ваш запрос будет обработан в течений 10 минут", messageType: "receiver"),
  ChatMessage(messageContent: "Здраствуйте, я хотел бы отключить чип", messageType: "sender"),
  ChatMessage(messageContent: "Можете описать вашу проблему", messageType: "receiver"),
  ChatMessage(messageContent: "Здраствутйте вам нужна поддержка?", messageType: "receiver"),

];

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Чат с поддержкой',
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: Color(0xFF3AAC3F),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              padding: EdgeInsets.only(bottom: 70),
              // Added padding to the bottom
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(
                      left: 14, right: 14, top: 10, bottom: 10),
                  child: Align(
                    alignment: (messages[index].messageType == "receiver"
                        ? Alignment.topLeft
                        : Alignment.topRight),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (messages[index].messageType == "receiver"
                            ? Colors.grey.shade200
                            : Color(0xFF9EE840)),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Text(
                        messages[index].messageContent,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 10,
                  child: CustomTextField(
                    controller: TextEditingController(),
                    hintText: "Напишите сообщение",
                    prefixIcon: Icon(Iconsax.message),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Iconsax.send),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
