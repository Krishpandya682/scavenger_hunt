import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference questionnaireCollection =
      FirebaseFirestore.instance.collection("questionnaire");

  Future updateQuestionnaireData(
      String audienceName, int numSections, int numQuesPerSec) async {
    return await questionnaireCollection.doc(uid).set({
      'audienceName': audienceName,
      'numSections': numSections,
      'numQuesPerSec': numQuesPerSec,
    });
  }

  // get questionnaire stream
  Stream<QuerySnapshot> get questionnaire {
    return questionnaireCollection.snapshots();
  }
}
