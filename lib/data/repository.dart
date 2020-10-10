import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Repository<T> {

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<Iterable<T>> receive();

  Future update(T obj);

  Future create(T obj);

  Future delete(T obj);
}