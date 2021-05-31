import 'dart:math';

import 'package:flutter_bloc_testing/data/repositories/remote/random_counter/CounterRepo.dart';

class CounterRepoImpl extends CounterRepo {
  @override
  Future<int> generateNegativeNumber() async {
    return Future.delayed(Duration(milliseconds: 2000))
        .then((onValue) => Random().nextInt(100) * -1);
  }

  @override
  Future<int> generatePositiveNumber() async {
    return Future.delayed(Duration(milliseconds: 2000))
        .then((onValue) => Random().nextInt(100) * 1);
  }
}
