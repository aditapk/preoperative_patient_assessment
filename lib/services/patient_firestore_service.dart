import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/patient_information_model.dart';

class PatientFirestoreService {
  var collection = FirebaseFirestore.instance.collection('patients');
  // write patient to firebase
  Future<String> post(Patient patient) async {
    Map<String, dynamic> map = patient.toMap();
    var doc = await collection.add(map);

    return doc.id;
  }

  Future<bool> updateWithId(String id, Patient patient) async {
    Map<String, dynamic> map = patient.toMap();
    try {
      await collection.doc(id).set(map);
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<void> deleteWithId(String id) async {
    try {
      await collection.doc(id).delete();
    } catch (err) {
      print('Have some error on deleting');
    }
  }

  // get patients from firebase
  Future<Map<String, dynamic>> getAll() async {
    List<Patient> patients = [];
    List<String> ids = [];
    var querySnapshot = await collection.get();
    for (var doc in querySnapshot.docs) {
      var data = doc.data();
      patients.add(Patient.fromMap(data));
      ids.add(doc.id);
    }
    return <String, dynamic>{'patients': patients, 'ids': ids};
  }

  // get patient by ID
  Future<Patient> getById(String id) async {
    var docRef = collection.doc(id);
    var snapshot = await docRef.get();
    return Patient.fromMap(snapshot.data()!);
  }
}
