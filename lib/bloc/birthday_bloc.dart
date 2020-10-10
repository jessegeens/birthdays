import 'dart:async';

import 'package:birthdays/bloc/bloc.dart';
import 'package:birthdays/data/birthday_repository.dart';
import 'package:birthdays/data/repository.dart';
import 'package:birthdays/model/birthday.dart';
import 'package:flutter/foundation.dart';

class BirthdayBloc implements BLoC {

  Repository<Birthday> _repository = BirthdayRepository();

  final _birthdayController = StreamController<List<Birthday>>();
  
  Stream<List<Birthday>> get birthdayStream => _birthdayController.stream;
  
  BirthdayBloc(){
    _repository.receive().forEach( 
      //(bdays) => _birthdayController.sink.add(bdays.map(() =>))
      (bdays) {
        _birthdayController.sink.add(bdays.toList());
      }
    );
  }

  @override
  void dispose() {
    _birthdayController.close();
  }
  
}