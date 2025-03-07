import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:io';

class SupabaseService {
  final SupabaseClient supabase;

  SupabaseService({required this.supabase});

  /// **Upload a file to Supabase Storage**
  Future<String?> uploadFile(
      String bucket, String filePath, String fileName) async {
    try {
      await supabase.storage.from(bucket).upload(fileName, File(filePath));
      final publicUrl = supabase.storage.from(bucket).getPublicUrl(fileName);
      return publicUrl; // Return the public URL of the uploaded file
    } catch (e) {
      throw Exception('File upload failed: $e');
    }
  }

  /// **Delete a file from Supabase Storage**
  Future<void> deleteFile(String bucket, String fileName) async {
    try {
      await supabase.storage.from(bucket).remove([fileName]);
    } catch (e) {
      throw Exception('File deletion failed: $e');
    }
  }
}
