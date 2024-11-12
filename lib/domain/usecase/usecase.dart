import 'package:flutter_supabase/data/repository/supabase_repository.dart';
import 'package:flutter_supabase/presentation/home/model/user_model.dart';

abstract interface class UseCase<T, Params> {
  Future<T> execute(Params params);
}

class CreateUseCase implements UseCase<void, UserModel> {
  final SupabaseRepository _repository = SupabaseRepository();

  CreateUseCase([SupabaseRepository? repository]);

  @override
  Future execute(UserModel userModel) {
    return _repository.create(userModel);
  }
}

class ReadUseCase implements UseCase<void, String> {
  final SupabaseRepository _repository = SupabaseRepository();

  ReadUseCase([SupabaseRepository? repository]);

  @override
  Future execute(String name) {
    return _repository.read(name);
  }
}

class UpdateUseCase implements UseCase<void, UserModel> {
  final SupabaseRepository _repository = SupabaseRepository();

  UpdateUseCase([SupabaseRepository? repository]);

  @override
  Future execute(UserModel userModel) {
    return _repository.update(userModel);
  }
}

class DeleteUseCase implements UseCase<void, String> {
  final SupabaseRepository _repository = SupabaseRepository();

  DeleteUseCase([SupabaseRepository? repository]);

  @override
  Future execute(String name) {
    return _repository.delete(name);
  }
}
