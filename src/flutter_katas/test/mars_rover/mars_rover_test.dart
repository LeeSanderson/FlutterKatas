import 'package:flutter_katas/mars_rover/mars_rover.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Mars rover should', () {
    final rover = MarsRover();

    test('not move if given an empty command string', () => expect(rover.execute(''), equals('0:0:N')));
  });
}
