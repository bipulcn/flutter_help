import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SDataService {
  final BuildContext context;
  SDataService(this.context);

  final supabase = Supabase.instance.client;

  Future<List> getData() async {
    try {
      final response = await supabase.from('smartcontact').select();
      return response;
    } catch (e) {
      return [];
    }
  }
}
