import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prova/app/shared/services/shared_preference_service/i_shared_preference_service.dart';

class MockService extends Mock implements ISharedPreferenceService {}

void main() {
  final service = MockService();

  group('SharedPreferenceService', () {
    test('método add deve adicionar um item', () async {
      const item = 'item123';
      when(() => service.add(item)).thenAnswer((_) async {});

      await service.add(item);

      verify(() => service.add(item));
    });

    test('método delete deve deletar um item', () async {
      var index = 1;
      when(() => service.delete(index)).thenAnswer((_) async {});

      await service.delete(index);

      verify(() => service.delete(index));
    });

    test('método edit deve editar um item existente', () async {
      var item = 'item';
      var index = 1;
      when(() => service.edit(item, index)).thenAnswer((_) async {});

      await service.edit(item, index);

      verify(() => service.edit(item, index));
    });

    test('método getAll deve obter todos os items salvos', () async {
      var items = ['item1', 'item2', 'item3'];
      when(() => service.getAll()).thenAnswer((_) async => items);

      var result = await service.getAll();

      verify(() => service.getAll());
      expect(result, items);
    });
  });
}
