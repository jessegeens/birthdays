import 'package:birthdays/data/repository.dart';
import 'package:birthdays/model/birthday.dart';
import 'package:flutter/foundation.dart';

class BirthdayRepository extends Repository<Birthday> {
  
  BirthdayRepository();

  @override
  Stream<Iterable<Birthday>> receive() {
    return firestore
     .collection("birthdays")
     //.where("user", isEqualTo: "user" )
     .snapshots()
     .map((qsnapshot) {
        debugPrint("qsnapshot ${qsnapshot.toString()}");
        return qsnapshot.docs.map(
          (doc) => Birthday(doc.id, doc.data()["name"], DateTime.now())
        );
     } );
  }

  @override
  Future create(Birthday birthday) {
      // TODO: implement create
      throw UnimplementedError();
    }
  
    @override
    Future delete(Birthday birthday) {
      // TODO: implement delete
      throw UnimplementedError();
    }
  
    @override
    Future update(Birthday birthday) {
    // TODO: implement update
    throw UnimplementedError();
  }
  
}