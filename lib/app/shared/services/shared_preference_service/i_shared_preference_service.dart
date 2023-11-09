abstract class ISharedPreferenceService {
  Future<void> add(String item);
  Future<void> edit(String item, int index);
  Future<void> delete(int index);
  Future<List<String>> getAll();
}
