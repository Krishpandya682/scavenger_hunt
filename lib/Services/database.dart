import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scavanger_hunt/models/questionnaire.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  //collection reference
  final CollectionReference questionnaireCollection =
      FirebaseFirestore.instance.collection("questionnaire");

  Future updateQuestionnaireData(
      String audienceName, int numSections, int numQuesPerSec) async {
    return await questionnaireCollection.doc(uid).set({
      'audienceName': audienceName,
      'numSections': numSections,
      'numQuesPerSec': numQuesPerSec
    });
  }

  Future addInData(
      int num, String introTitle, String introImage, String introText) async {
    return await questionnaireCollection.doc(uid).update({
      'IntroTitle' + num.toString(): introTitle,
      'IntroImage' + num.toString(): introImage,
      'IntroText' + num.toString(): introText,
    });
  }

  Future addOutData(
      int num, String outroTitle, String outroImage, String outroText) async {
    return await questionnaireCollection.doc(uid).update({
      'OutroTitle' + num.toString(): outroTitle,
      'OutroImage' + num.toString(): outroImage,
      'OutroText' + num.toString(): outroText,
    });
  }

  Future addPassword(int num, String password) async {
    return await questionnaireCollection
        .doc(uid)
        .update({'Password' + num.toString(): password});
  }

  Future addQuestion(int secNum, int questNum, String extra, String question,
      String answer) async {
    return await questionnaireCollection.doc(uid).update({
      'Extra' + questNum.toString(): extra,
      'Question' + questNum.toString(): question,
      'Answer' + questNum.toString(): answer
    });
  }

  Future getQuestion() async {
    final docRef =
        FirebaseFirestore.instance.collection("questionnaire").doc(uid);

// Source can be CACHE, SERVER, or DEFAULT.
    const source = Source.cache;

    docRef.get(const GetOptions(source: source)).then(
          (res) => print("Successfully completed"),
          onError: (e) => print("Error completing: $e"),
        );
  }

  //get questionnaire list from snapshot
  List<Questionnaire> _questionnaireListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Questionnaire(
          audienceName: doc.get('audienceName') ?? '',
          numQuesPerSec: doc.get('numQuesPerSec') ?? 3,
          numSections: doc.get('numSections') ?? 1);
    }).toList();
  }

  // get questionnaire stream
  Stream<List<Questionnaire>> get questionnaire {
    return questionnaireCollection
        .snapshots()
        .map(_questionnaireListFromSnapshot);
  }

  Future<Map<String, dynamic>> readData(Map<String, dynamic> userData) async {
    print("Uid is =" + uid.toString());
    return await FirebaseFirestore.instance
        .collection('questionnaire')
        .doc(uid)
        .get()
        .then((docSnap) => userData = docSnap.data()!);
  }
}
