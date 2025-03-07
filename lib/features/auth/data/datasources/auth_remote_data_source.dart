import 'package:portofolio_bloc_app/features/auth/data/models/admin_user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteDataSource {
  Future<AdminUserModel> signIn({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<AdminUserModel> signIn(
      {required String email, required String password}) async {
    try {
      final response = await supabaseClient
          .from(
            'admin_users',
          )
          .select('''
        *
      ''')
          .eq('email', email)
          .eq('password', password)
          .single();

      final adminUser = AdminUserModel.fromJson(response);

      return adminUser;
    } catch (e) {
      rethrow;
    }
  }
}
