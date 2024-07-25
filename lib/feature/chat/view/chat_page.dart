import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_with_riverpod/core/widgets/message_card.dart';

import '../../../core/config/supabase_initialize.dart';
import '../provider/chat_provider.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late TextEditingController message;

  @override
  void initState() {
    message = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(builder: (context, ref, _) {
          final chatDataState = ref.watch(chatData);
          final supa =ref.read(supabaseProvider);
           return chatDataState.when(
            data: (data) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return data[index].values.elementAt(3)
                                  as bool
                              ? messageCard(color:  Colors.blue, data:data[index].values,alignment: Alignment.topRight)
                              :messageCard(color: Colors.white24, data: data[index].values,alignment: Alignment.topLeft);
                               
                        }),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            child: TextField(
                              controller: message,
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                            )),
                      ),
                      IconButton(
                          onPressed: (){
                            supa.from('Chat').insert({
                              "message": message.text,
                              "is_me": true
                            }).select();
                            setState(() {});
                            message.clear();
                          },
                          icon: Icon(Icons.send))
                    ],
                  )
                ],
              );  
            },
            loading:()=>Center(child: CircularProgressIndicator(),),
            error:(error, _) => Text('Error: $error'),
            );})
      ),
    );
  }
}
