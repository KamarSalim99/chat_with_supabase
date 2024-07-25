
import 'package:supabase_flutter/supabase_flutter.dart';
final supabase = Supabase.instance.client;
supabaseInitialize()async{
  await Supabase.initialize(
    url: 'https://iyidecmdyhivdqjjdczx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml5aWRlY21keWhpdmRxampkY3p4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAxNjIyMDIsImV4cCI6MjAxNTczODIwMn0.-SSo8FqwiGpWdaQ0TdCikiQY374vE0BT1EzYk90pYRg',
  );
  
}