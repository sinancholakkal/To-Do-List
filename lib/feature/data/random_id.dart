 import 'dart:math';

String getRandomId() {
    final Random random = Random();
    return "task${random.nextInt(10000000)}";
  }