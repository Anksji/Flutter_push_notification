import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_and_notification/data/models/UserModel.dart';
import 'package:login_and_notification/data/repository/user_repository/user_repo.dart';

class FirebaseUserRepository implements UserRepository{

  final _userCollection = FirebaseFirestore.instance.collection("users");

  @override
  Future<void> addUserData(UserModel newUser) async{
   await _userCollection
       .doc(newUser.userId)
       .set(newUser.toJson())
       .catchError((error)=>print(error));
  }

  @override
  Future<UserModel> getUserById(String uid) async{
    return await _userCollection
    .doc(uid)
    .get()
    .then((doc) =>  UserModel().fromMap(doc.data()!))
    .catchError((error){});
  }

  @override
  Stream<UserModel> loggedUserStream(UserModel loggedFirebaseUser) {
   return _userCollection
       .doc(loggedFirebaseUser.userId)
       .snapshots()
       .map((doc) =>  UserModel().fromMap(doc.data()!));
  }

  @override
  Future<void> updateUserData(UserModel updatedUser) async{
    await _userCollection.doc(updatedUser.userId)
    .get().then((doc) async {
      if(doc.exists){
        await doc.reference.update(updatedUser.toJson());
      }
    }).catchError((error){});
  }

  static final FirebaseUserRepository _instance=FirebaseUserRepository._internal();

  factory FirebaseUserRepository(){
    return _instance;
  }

  FirebaseUserRepository._internal();


}