import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_with_riverpod/core/config/supabase_initialize.dart';

import 'feature/chat/view/chat_page.dart';


void main(){
  supabaseInitialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: ChatPage(),
      ),
    );
  }
}

