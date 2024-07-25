import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/config/supabase_initialize.dart';

final supabaseProvider = Provider((ref) => supabase);

final chatData = StreamProvider((ref) {
  final chatStream = ref.watch(supabaseProvider).from('Chat').select('*').asStream();
  return chatStream;
});

