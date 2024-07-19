import 'package:pinterest_clone/core/storages/preference_storages/base_storage.dart';
import 'package:pinterest_clone/core/storages/storage_adapters/base_storage_adapter.dart';
import 'package:pinterest_clone/core/storages/storage_adapters/default_storage_adapter.dart';

abstract class DefaultStorage<T> extends BaseStorage<T> {
  @override
  Future<BaseStorageAdapter<T>> get adapter async => DefaultStorageAdapter<T>();
}
