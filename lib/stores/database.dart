import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final CollectionReference psalms = FirebaseFirestore.instance.collection('psalms');
  final CollectionReference soccasionalPrayers = FirebaseFirestore.instance.collection('occasional_prayers');
}