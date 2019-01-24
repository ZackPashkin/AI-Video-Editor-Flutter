

// import 'package:flutter/material.dart';
// //import 'package:cloud_firestore/cloud_firestore.dart';
// //import 'dart:async';
// import 'dart:ui';




// class ProfilePage extends StatefulWidget {
//   const ProfilePage({this.userId});

//   final String userId;

//   _ProfilePage createState() => new _ProfilePage(this.userId);
// }

// class _ProfilePage extends State<ProfilePage> {
//   final String profileId;
//   String currentUserId = ''; // googleSignIn.currentUser.id;
//   String view = "grid"; // default view
//   bool isFollowing = false;
//   bool followButtonClicked = false;
//   int postCount = 0;
//   int followerCount = 0;
//   int followingCount = 0;
//   _ProfilePage(this.profileId);

//   editProfile() {
//     //EditProfilePage editPage = new EditProfilePage();

//     Navigator.of(context)
//         .push(new MaterialPageRoute<bool>(builder: (BuildContext context) {
//       return new Center(
//         child: new Scaffold(
//             appBar: new AppBar(
//               leading: new IconButton(
//                 icon: new Icon(Icons.close),
//                 onPressed: () {
//                   Navigator.maybePop(context);
//                 },
//               ),
//               title: new Text('Edit Profile',
//                   style: new TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold)),
//               backgroundColor: Colors.white,
//               actions: <Widget>[
//                 new IconButton(
//                     icon: new Icon(
//                       Icons.check,
//                       color: Colors.blueAccent,
//                     ),
//                     onPressed: () {
//                      // editPage.applyChanges();
//                       Navigator.maybePop(context);
//                     })
//               ],
//             ),
//             body: new ListView(
//               children: <Widget>[
//                 new Container(
//                   //child: editPage,
//                 ),
//               ],
//             )),
//       );
//     }));
     
//   }

//   followUser() {
//     print('following user');
//     setState(() {
//       this.isFollowing = true;
//       followButtonClicked = true;
//     });

//     // Firestore.instance.document("insta_users/$profileId").updateData({
//     //   'followers.$currentUserId': true
//     //   //firestore plugin doesnt support deleting, so it must be nulled / falsed
//     // });

//     // Firestore.instance.document("insta_users/$currentUserId").updateData({
//     //   'following.$profileId': true
//     //   //firestore plugin doesnt support deleting, so it must be nulled / falsed
//     // });

//     // //updates activity feed
//     // Firestore.instance
//     //     .collection("insta_a_feed")
//     //     .document(profileId)
//     //     .collection("items")
//     //     .document(currentUserId)
//     //     .setData({
//     //   "ownerId": profileId,
//     //   "username": currentUserModel.username,
//     //   "userId": currentUserId,
//     //   "type": "follow",
//     //   "userProfileImg": currentUserModel.photoUrl,
//     //   "timestamp": new DateTime.now().toString()
//     // });
//   }

//   unfollowUser() {
//     setState(() {
//       isFollowing = false;
//       followButtonClicked = true;
//     });

//   //   Firestore.instance.document("insta_users/$profileId").updateData({
//   //     'followers.$currentUserId': false
//   //     //firestore plugin doesnt support deleting, so it must be nulled / falsed
//   //   });

//   //   Firestore.instance.document("insta_users/$currentUserId").updateData({
//   //     'following.$profileId': false
//   //     //firestore plugin doesnt support deleting, so it must be nulled / falsed
//   //   });

//   //   Firestore.instance
//   //       .collection("insta_a_feed")
//   //       .document(profileId)
//   //       .collection("items")
//   //       .document(currentUserId)
//   //       .delete();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     Column buildStatColumn(String label, int number) {
//       return new Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           new Text(
//             number.toString(),
//             style: new TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
//           ),
//           new Container(
//               margin: const EdgeInsets.only(top: 4.0),
//               child: new Text(
//                 label,
//                 style: new TextStyle(
//                     color: Colors.grey,
//                     fontSize: 15.0,
//                     fontWeight: FontWeight.w400),
//               ))
//         ],
//       );
//     }

//     Container buildFollowButton(
//         {String text,
//         Color backgroundcolor,
//         Color textColor,
//         Color borderColor,
//         Function function}) {
//       return new Container(
//         padding: const EdgeInsets.only(top: 2.0),
//         child: new FlatButton(
//             onPressed: function,
//             child: new Container(
//               decoration: new BoxDecoration(
//                   color: backgroundcolor,
//                   border: new Border.all(color: borderColor),
//                   borderRadius: new BorderRadius.circular(5.0)),
//               alignment: Alignment.center,
//               child: new Text(text,
//                   style: new TextStyle(
//                       color: textColor, fontWeight: FontWeight.bold)),
//               width: 250.0,
//               height: 27.0,
//             )),
//       );
//     }

//     Container buildProfileFollowButton(user) {
//       // viewing your own profile - should show edit button
//       if (currentUserId == profileId) {
//         return buildFollowButton(
//           text: "Edit Profile",
//           backgroundcolor: Colors.white,
//           textColor: Colors.black,
//           borderColor: Colors.grey,
//           function: editProfile,
//         );
//       }

//       // already following user - should show unfollow button
//       if (isFollowing) {
//         return buildFollowButton(
//           text: "Unfollow",
//           backgroundcolor: Colors.white,
//           textColor: Colors.black,
//           borderColor: Colors.grey,
//           function: unfollowUser,
//         );
//       }

//       // does not follow user - should show follow button
//       if (!isFollowing) {
//         return buildFollowButton(
//           text: "Follow",
//           backgroundcolor: Colors.blue,
//           textColor: Colors.white,
//           borderColor: Colors.blue,
//           function: followUser,
//         );
//       }

//       return buildFollowButton(
//           text: "loading...",
//           backgroundcolor: Colors.white,
//           textColor: Colors.black,
//           borderColor: Colors.grey);
//     }

//     Row buildImageViewButtonBar() {
//       Color isActiveButtonColor(String viewName) {
//         if (view == viewName) {
//           return Colors.blueAccent;
//         } else {
//           return Colors.black26;
//         }
//       }

//       return new Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           new IconButton(
//             icon: new Icon(Icons.grid_on, color: isActiveButtonColor("grid")),
//             onPressed: () {
//               //changeView("grid");
//             },
//           ),
//           new IconButton(
//             icon: new Icon(Icons.list, color: isActiveButtonColor("feed")),
//             onPressed: () {
//               //changeView("feed");
//             },
//           ),
//         ],
//       );
//     }

//     // Container buildUserPosts() {
//     //   Future<List<ImagePost>> getPosts() async {
//     //     List<ImagePost> posts = [];
//     //     var snap = await Firestore.instance
//     //         .collection('insta_posts')
//     //         .where('ownerId', isEqualTo: profileId)
//     //         .orderBy("timestamp")
//     //         .getDocuments();
//     //     for (var doc in snap.documents) {
//     //       posts.add(new ImagePost.fromDocument(doc));
//     //     }
//     //     setState(() {
//     //       postCount = snap.documents.length;
//     //     });

//     //     return posts.reversed.toList();
//     //   }

// //       return new Container(
// //           child: new FutureBuilder<List<ImagePost>>(
// //         future: getPosts(),
// //         builder: (context, snapshot) {
// //           if (!snapshot.hasData)
// //             return new Container(
// //                 alignment: FractionalOffset.center,
// //                 padding: const EdgeInsets.only(top: 10.0),
// //                 child: new CircularProgressIndicator());
// //           else if (view == "grid") {
// //             // build the grid
// //             return new GridView.count(
// //                 crossAxisCount: 3,
// //                 childAspectRatio: 1.0,
// // //                    padding: const EdgeInsets.all(0.5),
// //                 mainAxisSpacing: 1.5,
// //                 crossAxisSpacing: 1.5,
// //                 shrinkWrap: true,
// //                 physics: const NeverScrollableScrollPhysics(),
// //                 children: snapshot.data.map((ImagePost imagePost) {
// //                   return new GridTile(child: new ImageTile(imagePost));
// //                 }).toList());
// //           } else if (view == "feed") {
// //             return new Column(
// //                 children: snapshot.data.map((ImagePost imagePost) {
// //               return imagePost;
// //             }).toList());
// //           }
// //         },
// //       ));
// //     }

//     // return new StreamBuilder(
//     //     stream: Firestore.instance
//     //         .collection('insta_users')
//     //         .document(profileId)
//     //         .snapshots(),
//     //     builder: (context, snapshot) {
//     //       if (!snapshot.hasData)
//     //         return new Container(
//     //             alignment: FractionalOffset.center,
//     //             child: new CircularProgressIndicator());

//     //       User user = new User.fromDocument(snapshot.data);

//     //       if (user.followers.containsKey(currentUserId) &&
//     //           user.followers[currentUserId] &&
//     //           followButtonClicked == false) {
//     //         isFollowing = true;
//     //       }

//   //         return new Scaffold(
//   //             appBar: new AppBar(
//   //               title: new Text(
//   //                 user.username,
//   //                 style: const TextStyle(color: Colors.black),
//   //               ),
//   //               backgroundColor: Colors.white,
//   //             ),
//   //             body: new ListView(
//   //               children: <Widget>[
//   //                 new Padding(
//   //                   padding: const EdgeInsets.all(16.0),
//   //                   child: new Column(
//   //                     children: <Widget>[
//   //                       new Row(
//   //                         children: <Widget>[
//   //                           new CircleAvatar(
//   //                             radius: 40.0,
//   //                             backgroundColor: Colors.grey,
//   //                             backgroundImage: new NetworkImage(user.photoUrl),
//   //                           ),
//   //                           new Expanded(
//   //                             flex: 1,
//   //                             child: new Column(
//   //                               children: <Widget>[
//   //                                 new Row(
//   //                                   mainAxisSize: MainAxisSize.max,
//   //                                   mainAxisAlignment:
//   //                                       MainAxisAlignment.spaceEvenly,
//   //                                   children: <Widget>[
//   //                                     buildStatColumn("posts", postCount),
//   //                                     buildStatColumn("followers",
//   //                                         _countFollowings(user.followers)),
//   //                                     buildStatColumn("following",
//   //                                         _countFollowings(user.following)),
//   //                                   ],
//   //                                 ),
//   //                                 new Row(
//   //                                     mainAxisAlignment:
//   //                                         MainAxisAlignment.spaceEvenly,
//   //                                     children: <Widget>[
//   //                                       buildProfileFollowButton(user)
//   //                                     ]),
//   //                               ],
//   //                             ),
//   //                           )
//   //                         ],
//   //                       ),
//   //                       new Container(
//   //                           alignment: Alignment.centerLeft,
//   //                           padding: const EdgeInsets.only(top: 15.0),
//   //                           child: new Text(
//   //                             user.displayName,
//   //                             style: new TextStyle(fontWeight: FontWeight.bold),
//   //                           )),
//   //                       new Container(
//   //                         alignment: Alignment.centerLeft,
//   //                         padding: const EdgeInsets.only(top: 1.0),
//   //                         child: new Text(user.bio),
//   //                       ),
//   //                     ],
//   //                   ),
//   //                 ),
//   //                 new Divider(),
//   //                 buildImageViewButtonBar(),
//   //                 new Divider(height: 0.0),
//   //                 buildUserPosts(),
//   //               ],
//   //             ));
//   //       });
//   // }

//   changeView(String viewName) {
//     setState(() {
//       view = viewName;
//     });
//   }

//   int _countFollowings(Map followings) {
//     int count = 0;

//     void countValues(key, value) {
//       if (value) {
//         count += 1;
//       }
//     }

//     followings.forEach(countValues);

//     return count;
//   }
// }
  
// // class ImageTile extends StatelessWidget {
// //   final ImagePost imagePost;

// //   ImageTile(this.imagePost);

// //   clickedImage(BuildContext context) {
// //     Navigator.of(context)
// //         .push(new MaterialPageRoute<bool>(builder: (BuildContext context) {
// //       return new Center(
// //         child: new Scaffold(
// //             appBar: new AppBar(
// //               title: new Text('Photo',
// //                   style: new TextStyle(
// //                       color: Colors.black, fontWeight: FontWeight.bold)),
// //               backgroundColor: Colors.white,
// //             ),
// //             body: new ListView(
// //               children: <Widget>[
// //                 new Container(
// //                   child: imagePost,
// //                 ),
// //               ],
// //             )),
// //       );
// //     }));
// //   }

//   // Widget build(BuildContext context) {
//   //   return new GestureDetector(
//   //       onTap: () => clickedImage(context),
//   //       child: new Image.network(imagePost.mediaUrl, fit: BoxFit.cover));
//   // }
// //}

// // class User {
// //   const User(
// //       {this.username,
// //       this.id,
// //       this.photoUrl,
// //       this.email,
// //       this.displayName,
// //       this.bio,
// //       this.followers,
// //       this.following});

// //   final String email;
// //   final String id;
// //   final String photoUrl;
// //   final String username;
// //   final String displayName;
// //   final String bio;
// //   final Map followers;
// //   final Map following;

// //   factory User.fromDocument(DocumentSnapshot document) {
// //     return new User(
// //       email: document['email'],
// //       username: document['username'],
// //       photoUrl: document['photoUrl'],
// //       id: document.documentID,
// //       displayName: document['displayName'],
// //       bio: document['bio'],
// //       followers: document['followers'],
// //       following: document['following'],
// //     );
// //   }
// // }

// void openProfile(BuildContext context, String userId) {
//   Navigator.of(context)
//       .push(new MaterialPageRoute<bool>(builder: (BuildContext context) {
//     return new ProfilePage(userId: userId);
//   }));
// }


// //edit profile page--------------------------------------------------------------------------------
// //------------------------------------------------------------------------------------------------------------
// // import "package:flutter/material.dart";
// // import 'dart:async';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'main.dart'; //for currentuser
// // import 'profile_page.dart'; //for the user class

// // class EditProfilePage extends StatelessWidget {
// //   TextEditingController nameController = new TextEditingController();
// //   TextEditingController bioController = new TextEditingController();

// //   changeProfilePhoto(BuildContext Context) {
// //     return showDialog(
// //       context: Context,
// //       builder: (BuildContext context) {
// //         return new AlertDialog(
// //           title: new Text('Change Photo'),
// //           content: new SingleChildScrollView(
// //             child: new ListBody(
// //               children: <Widget>[
// //                 new Text(
// //                     'Changing your profile photo has not been implemented yet'),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }

// //   // applyChanges() {
// //   //   Firestore.instance
// //   //       .collection('insta_users')
// //   //       .document(currentUserModel.id)
// //   //       .updateData({
// //   //     "displayName": nameController.text,
// //   //     "bio": bioController.text,
// //   //   });
// //   // }

// //   Widget buildTextField({String name, TextEditingController controller}) {
// //     return new Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: <Widget>[
// //         new Padding(
// //           padding: const EdgeInsets.only(top: 12.0),
// //           child: Text(
// //             name,
// //             style: new TextStyle(color: Colors.grey),
// //           ),
// //         ),
// //         new TextField(
// //           controller: controller,
// //           decoration: new InputDecoration(
// //             hintText: name,
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return new FutureBuilder(
// //         future: Firestore.instance
// //             .collection('insta_users')
// //             .document(currentUserModel.id)
// //             .get(),
// //         builder: (context, snapshot) {
// //           if (!snapshot.hasData)
// //             return new Container(
// //                 alignment: FractionalOffset.center,
// //                 child: new CircularProgressIndicator());

// //           User user = new User.fromDocument(snapshot.data);

// //           nameController.text = user.displayName;
// //           bioController.text = user.bio;

// //           return new Column(
// //             children: <Widget>[
// //               new Padding(
// //                 padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
// //                 child: new CircleAvatar(
// //                   backgroundImage: NetworkImage(currentUserModel.photoUrl),
// //                   radius: 50.0,
// //                 ),
// //               ),
// //               new FlatButton(
// //                   onPressed: () {
// //                     changeProfilePhoto(context);
// //                   },
// //                   child: new Text(
// //                     "Change Photo",
// //                     style: const TextStyle(
// //                         color: Colors.blue,
// //                         fontSize: 20.0,
// //                         fontWeight: FontWeight.bold),
// //                   )),
// //               new Padding(
// //                 padding: const EdgeInsets.all(16.0),
// //                 child: new Column(
// //                   children: <Widget>[
// //                     buildTextField(name: "Name", controller: nameController),
// //                     buildTextField(name: "Bio", controller: bioController),
// //                   ],
// //                 ),
// //               )
// //             ],
// //           );
// //         });
// //   }
// // }



















































































































































//---whole page photos profile-----------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------
// import 'dart:ui';
// import 'package:flutter/material.dart';
// //import 'package:test_app1/user_card.dart';



// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> with TickerProviderStateMixin {
//   final List<CardModel> userList = cards;
//   double percentSlide = 1.0;

//   int cardIndex = 0;

//   double scrollPercent = 0.0;
//   double cardPercent = 0.0;
//   Offset startDrag;
//   double startDragPercentScroll;
//   double singleCardStart;
//   double singleCardEnd;
//   AnimationController singleCardFinish,
//       followCtrl,
//       scaleCtrl,
//       openUserCtrl,
//       userInfoCtrl,
//       zoomCtrl;
//   Animation followAnim, scaleAnim, openUserAnim, userInfoAnim, zoomAnim;

//   @override
//   void initState() {
//     super.initState();
//     singleCardFinish = AnimationController(
//       duration: Duration(milliseconds: 15),
//       vsync: this,
//     )..addListener(() {
//         setState(() {
//           scrollPercent = lerpDouble(
//               singleCardStart, singleCardEnd, singleCardFinish.value);
//         });
//       });

//     followCtrl = AnimationController(
//       duration: Duration(milliseconds: 35),
//       vsync: this,
//     );

//     followAnim = Tween(begin: 46.0, end: 100.0).animate(followCtrl)
//       ..addListener(() {
//         setState(() {});
//       });

//     scaleCtrl = AnimationController(
//       duration: Duration(milliseconds: 10),
//       vsync: this,
//     );

//     scaleAnim = Tween(begin: 1.0, end: 0.0).animate(scaleCtrl)
//       ..addListener(() {
//         setState(() {});
//       });

//     userInfoCtrl = AnimationController(
//       duration: Duration(milliseconds: 28),
//       vsync: this,
//     );

//     userInfoAnim = Tween(begin: 0.0, end: 1.0).animate(userInfoCtrl)
//       ..addListener(() {
//         setState(() {});
//       });

//     zoomCtrl = AnimationController(
//       duration: Duration(milliseconds: 28),
//       vsync: this,
//     );

//     zoomAnim = Tween(begin: 1.1, end: 1.0).animate(zoomCtrl)
//       ..addListener(() {
//         setState(() {});
//       });

//     openUserCtrl = AnimationController(
//       duration: Duration(milliseconds: 30),
//       vsync: this,
//     );

//     openUserAnim = Tween(begin: 290.0, end: 540.0).animate(openUserCtrl)
//       ..addListener(() {
//         setState(() {});
//       });

//     followCtrl.forward();
//     scaleCtrl.forward();
//     openUserCtrl.forward();
//   }

//   @override
//   void dispose() {
//     singleCardFinish.dispose();
//     followCtrl.dispose();
//     scaleCtrl.dispose();
//     openUserCtrl.dispose();
//     super.dispose();
//   }

//   void _hDragStart(DragStartDetails details) {
//     startDrag = details.globalPosition;
//     startDragPercentScroll = scrollPercent;
//   }

//   void _hDragUpdate(DragUpdateDetails details) {
//     final cardDrag = (details.globalPosition.dx - startDrag.dx) / context.size.width;

//     setState(() {
//       scrollPercent =
//           (startDragPercentScroll + (-cardDrag / userList.length))
//               .clamp(0.0, 1.0 - (1 / userList.length));
//       cardPercent = cardDrag;
//       if (cardPercent < 0) {
//         percentSlide = -cardPercent;
//       } else {
//         percentSlide = cardPercent;
//       }
//     });
//   }

//   void _hDragEnd(DragEndDetails details) {
//     singleCardStart = scrollPercent;
//     singleCardEnd =
//         (scrollPercent * userList.length).round() / userList.length;

//     singleCardFinish.forward(from: 0.0);
//     setState(() {
//       if (cardPercent < -0.5 && cardIndex < (userList.length - 1))
//         cardIndex++;
//       else if (cardPercent > 0.5 && cardIndex > 0) cardIndex--;

//       percentSlide = 1.0;
//     });
//   }

//   List<Widget> _buildCards() {
//     return [
//       _buildCard(0, 6, scrollPercent, userList[0].imagePath, false),
//       _buildCard(1, 6, scrollPercent, userList[1].imagePath, false),
//       _buildCard(2, 6, scrollPercent, userList[2].imagePath, true),
//       _buildCard(3, 6, scrollPercent, userList[3].imagePath, false),
//       _buildCard(4, 6, scrollPercent, userList[4].imagePath, true),
//       _buildCard(5, 6, scrollPercent, userList[5].imagePath, false),
//     ];
//   }

//   Widget _buildCard(int cardId, int cardCount, double scrollPercent,
//       String imgPath, bool isFollow) {
//     final cardScrollPercent = scrollPercent / (1 / cardCount);
//     return FractionalTranslation(
//       translation: Offset(cardId - cardScrollPercent,
//           0.0), //MediaQuery.of(context).size.width * cardId
//       child: Transform(
//         transform: Matrix4.translationValues(0.0, 0.0, 0.0)..scale(zoomAnim.value),
//         child: Card(
//           imgPath: imgPath,
//           isFollow: isFollow,
//         ),
//       ),
//     );
//   }

//   Color _color = Colors.white;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           GestureDetector(
//             onHorizontalDragStart: _hDragStart,
//             onHorizontalDragUpdate: _hDragUpdate,
//             onHorizontalDragEnd: _hDragEnd,
//             child: Stack(
//               overflow: Overflow.clip,
//               children: _buildCards(),
//             ),
//           ),
//           Transform(
//             transform: Matrix4.translationValues(0.0, openUserAnim.value, 0.0),
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 30.0,
//                     vertical: 10.0,
//                   ),
//                   child: Opacity(
//                     opacity: percentSlide,
//                     child: Transform(
//                       transform: Matrix4.translationValues(
//                           0.0, 44.0 * (1.0 - percentSlide), 0.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 22.0),
//                                 child: Text(
//                                   userList[cardIndex].followers,
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16.0,
//                                   ),
//                                 ),
//                               ),
//                               Text(
//                                 'followers',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 14.0),
//                               ),
//                             ],
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: <Widget>[
//                               Padding(
//                                 padding: const EdgeInsets.only(bottom: 4.0),
//                                 child: Text(
//                                   userList[cardIndex].posts,
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16.0,
//                                   ),
//                                 ),
//                               ),
//                               Text(
//                                 'films',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 14.0),
//                               ),
//                             ],
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: <Widget>[
//                               Padding(
//                                 padding: const EdgeInsets.only(bottom: 4.0),
//                                 child: Text(
//                                   userList[cardIndex].following,
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16.0,
//                                   ),
//                                 ),
//                               ),
//                               Text(
//                                 'following',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 14.0),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: double.infinity,
//                   height: 400.0,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(40.0),
//                       topRight: Radius.circular(40.0),
//                     ),
//                   ),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding:
//                             const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 30.0),
//                         child: Opacity(
//                           opacity: percentSlide,
//                           child: Transform(
//                             transform: Matrix4.translationValues(
//                                 0.0, 44.0 * (1.0 - percentSlide), 0.0),
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: <Widget>[
//                                 InkWell(
//                                   onTap: () {
//                                     if (openUserCtrl.status ==
//                                         AnimationStatus.completed) {
//                                       openUserCtrl.reverse();
//                                     } else {
//                                       openUserCtrl.forward();
//                                     }

//                                     if (userInfoCtrl.status ==
//                                         AnimationStatus.completed) {
//                                       userInfoCtrl.reverse();
//                                     } else {
//                                       userInfoCtrl.forward();
//                                     }

//                                     if (zoomCtrl.status ==
//                                         AnimationStatus.completed) {
//                                       zoomCtrl.reverse();
//                                     } else {
//                                       zoomCtrl.forward();
//                                     }
//                                   },
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: <Widget>[
//                                       Text(
//                                         userList[cardIndex].name,
//                                         style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 20.0,
//                                         ),
//                                       ),
//                                       Text(
//                                         userList[cardIndex].location,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 FlatButton(
//                                   padding: const EdgeInsets.all(0.0),
//                                   onPressed: () {
//                                     if (userList[cardIndex].isFollow == false) {
//                                       followCtrl.reverse();
//                                       scaleCtrl.reverse();
//                                       userList[cardIndex].isFollow = true;
//                                     } else {
//                                       followCtrl.forward();
//                                       scaleCtrl.forward();
//                                       userList[cardIndex].isFollow = false;
//                                     }

//                                     // if (followCtrl.status ==
//                                     //     AnimationStatus.completed) {
//                                     //   followCtrl.reverse();
//                                     // } else {
//                                     //   followCtrl.forward();
//                                     // }

//                                     // if (scaleCtrl.status ==
//                                     //     AnimationStatus.completed) {
//                                     //   scaleCtrl.reverse();
//                                     // } else {
//                                     //   scaleCtrl.forward();
//                                     // }

//                                     _color == Colors.white
//                                         ? _color = Color(0xFFE63426)
//                                         : _color = Colors.white;
//                                   },
//                                   child: Container(
//                                     alignment: Alignment.center,
//                                     width: followAnim.value,
//                                     height: 46.0,
//                                     decoration: BoxDecoration(
//                                         color: _color,
//                                         border: Border.all(
//                                           color: Color(0xFFE63426),
//                                           width: 3.0,
//                                         ),
//                                         borderRadius:
//                                             BorderRadius.circular(50.0)),
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Stack(
//                                         alignment: Alignment.center,
//                                         children: <Widget>[
//                                           Transform(
//                                             alignment: Alignment.center,
//                                             transform: Matrix4
//                                                 .translationValues(
//                                                     0.0, 0.0, 0.0)
//                                               ..scale(1.0 - scaleAnim.value),
//                                             child: Opacity(
//                                               opacity: 1.0 - scaleAnim.value,
//                                               child: Text(
//                                                 'Films',
//                                                 style: TextStyle(
//                                                   color: Color(0xFFE63426),
//                                                   letterSpacing: 1.0,
//                                                   fontSize: 16.0,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           Transform(
//                                             alignment: Alignment.center,
//                                             transform:
//                                                 Matrix4.translationValues(
//                                                     0.0, 0.0, 0.0)
//                                                   ..scale(scaleAnim.value),
//                                             child: Opacity(
//                                               opacity: scaleAnim.value,
//                                               child: Icon(Icons.person_outline,
//                                                   color: Colors.black),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       Opacity(
//                         opacity: userInfoAnim.value,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 30.0),
//                               child: Text(
//                                 'The widget has a very nifty feature which allows a Floating Action Button to be docked in it. Adding BottomAppBar in Scaffold.',
//                                 style: TextStyle(
//                                   color: Colors.grey,
//                                   fontStyle: FontStyle.italic,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: 10.0,
//                                 vertical: 10.0,
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: <Widget>[
//                                   Padding(
//                                     padding:
//                                         const EdgeInsets.only(bottom: 12.0),
//                                     child: Text(
//                                       'Films',
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         letterSpacing: 1.1,
//                                         fontSize: 18.0,
//                                       ),
//                                     ),
//                                   ),
//                                   SingleChildScrollView(
//                                     scrollDirection: Axis.horizontal,
//                                     physics: const BouncingScrollPhysics(),
//                                     child: Row(
//                                       children: <Widget>[
//                                         Padding(
//                                           padding: const EdgeInsets.only(
//                                               right: 10.0),
//                                           child: Container(
//                                             width: 120.0,
//                                             height: 120.0,
//                                             decoration: BoxDecoration(
//                                               shape: BoxShape.rectangle,
//                                               borderRadius:
//                                                   BorderRadius.circular(10.0),
//                                               image: DecorationImage(
//                                                 image:
//                                                     AssetImage('images/p1.jpg'),
//                                                 fit: BoxFit.cover,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.only(
//                                               right: 10.0),
//                                           child: Container(
//                                             width: 120.0,
//                                             height: 120.0,
//                                             decoration: BoxDecoration(
//                                               shape: BoxShape.rectangle,
//                                               borderRadius:
//                                                   BorderRadius.circular(10.0),
//                                               image: DecorationImage(
//                                                 image:
//                                                     AssetImage('images/p2.jpg'),
//                                                 fit: BoxFit.cover,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.only(
//                                               right: 10.0),
//                                           child: Container(
//                                             width: 120.0, //default 160
//                                             height: 120.0,
//                                             decoration: BoxDecoration(
//                                               shape: BoxShape.rectangle,
//                                               borderRadius:
//                                                   BorderRadius.circular(10.0),
//                                               image: DecorationImage(
//                                                 image:
//                                                     AssetImage('images/p3.jpg'),
//                                                 fit: BoxFit.cover,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.only(
//                                               right: 10.0),
//                                           child: Container(
//                                             width: 80.0,
//                                             height: 80.0,
//                                             decoration: BoxDecoration(
//                                               shape: BoxShape.rectangle,
//                                               borderRadius:
//                                                   BorderRadius.circular(10.0),
//                                               image: DecorationImage(
//                                                 image:
//                                                     AssetImage('images/p4.jpg'),
//                                                 fit: BoxFit.cover,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.only(
//                                               right: 10.0),
//                                           child: Container(
//                                             width: 120.0,
//                                             height: 120.0,
//                                             decoration: BoxDecoration(
//                                               shape: BoxShape.rectangle,
//                                               borderRadius:
//                                                   BorderRadius.circular(10.0),
//                                               image: DecorationImage(
//                                                 image:
//                                                     AssetImage('images/p5.jpg'),
//                                                 fit: BoxFit.cover,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       // bottomNavigationBar: BottomNavigationBar(
//       //   iconSize: 30.0,
//       //   fixedColor: Color(0xFFE63426),
//       //   currentIndex: 1,
//       //   type: BottomNavigationBarType.fixed,
//       //   items: [
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.event_note),
//       //       title: Text(''),
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.search),
//       //       title: Text(''),
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.notifications_none),
//       //       title: Text(''),
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.message),
//       //       title: Text(''),
//       //     ),
//       //   ],
//       // ),
      
//       // floatingActionButton: FloatingActionButton(
//       //   backgroundColor: Color(0xFFE63426),
//       //   child: Icon(Icons.add),
//       //   onPressed: () {},
//       // ),
      
//     );
//   }
// }

// class Card extends StatelessWidget {
//   final String imgPath;
//   final bool isFollow;

//   Card({this.imgPath, this.isFollow = false});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: double.infinity,
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage(imgPath),
//           fit: BoxFit.cover,
//           colorFilter: ColorFilter.mode(Colors.black26, BlendMode.multiply),
//         ),
//       ),
//     );
//   }
// }



// //import 'package:flutter/material.dart';

// class CardModel {
//   String imagePath, followers, posts, following, name, location;
//   bool isFollow;

//   CardModel(
//     this.imagePath,
//     this.followers,
//     this.posts,
//     this.following,
//     this.name,
//     this.location,
//     this.isFollow,
//   );
// }

// final List<CardModel> cards = [
//     CardModel(
//       'images/1.jpg',
//       '869',
//       '12',
//       '437',
//       'Aliya Zamarina',
//       'Nantes, France',
//       false,
//     ),
//     CardModel(
//       'images/2.jpg',
//       '1,5K',
//       '11',
//       '369',
//       'Emily Burton',
//       'Paris, US',
//       false,
//     ),
//     CardModel(
//       'images/3.jpg',
//       '559',
//       '15',
//       '407',
//       'Jane Doe',
//       'Sterlitamak, Russia',
//       true,
//     ),
//     CardModel(
//       'images/4.jpg',
//       '607',
//       '7',
//       '651',
//       'Xeyna Dalamar',
//       'Perpignan, Sweden',
//       false,
//     ),
//     CardModel(
//       'images/5.jpg',
//       '869',
//       '6',
//       '437',
//       'Cleopatra Davis',
//       'Villeurbanne, Estonia',
//       true,
//     ),
//     CardModel(
//       'images/6.jpg',
//       '1,5K',
//       '9',
//       '369',
//       'Leila Russo',
//       'Berlin, Germany',
//       false,
//     ),
//   ];














































































// //import 'dart:async';
// //import 'dart:math' as math;
// //import 'package:flutter/cupertino.dart';
// //import 'package:flutter/material.dart';


// // class ProfilePage extends StatelessWidget {
  
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       padding: EdgeInsets.all(25.0),
// //       child: Text('profile', style: TextStyle(fontSize: 37.0),),
// //     );
// //   }
// // }


// // class ProfilePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return CupertinoPageScaffold(
// //       navigationBar: CupertinoNavigationBar(
// //         //trailing: trailingButtons,
// //       ),
// //       child: DecoratedBox(
// //         decoration: const BoxDecoration(color: Color(0xFFEFEFF4)),
// //         child: ListView(
// //           children: <Widget>[
// //             const Padding(padding: EdgeInsets.only(top: 32.0)),
// //             GestureDetector(
// //               onTap: () {
// //                 Navigator.of(context, rootNavigator: true).push(
// //                   CupertinoPageRoute<bool>(
// //                     fullscreenDialog: true,
// //                     builder: (BuildContext context) => Tab3Dialog(),
// //                   ),
// //                 );
// //               },
// //               child: Container(
// //                 decoration: const BoxDecoration(
// //                   color: CupertinoColors.white,
// //                   border: Border(
// //                     top: BorderSide(color: Color(0xFFBCBBC1), width: 0.0),
// //                     bottom: BorderSide(color: Color(0xFFBCBBC1), width: 0.0),
// //                   ),
// //                 ),
// //                 height: 44.0,
// //                 child: Padding(
// //                   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
// //                   child: SafeArea(
// //                     top: false,
// //                     bottom: false,
// //                     child: Row(
// //                       children: const <Widget>[
// //                         Text(
// //                           'Sign in',
// //                           style: TextStyle(color: CupertinoColors.activeBlue),
// //                         )
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class Tab3Dialog extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return CupertinoPageScaffold(
// //       navigationBar: CupertinoNavigationBar(
// //         leading: CupertinoButton(
// //           child: const Text('Cancel'),
// //           padding: EdgeInsets.zero,
// //           onPressed: () {
// //             Navigator.of(context).pop(false);
// //           },
// //         ),
// //       ),
// //       child: Center(
// //         child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: <Widget>[
// //             const Icon(
// //               CupertinoIcons.profile_circled,
// //               size: 160.0,
// //               color: Color(0xFF646464),
// //             ),
// //             const Padding(padding: EdgeInsets.only(top: 18.0)),
// //             CupertinoButton(
// //               color: CupertinoColors.activeBlue,
// //               child: const Text('Sign in'),
// //               onPressed: () {
// //                 Navigator.pop(context);
// //               },
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }