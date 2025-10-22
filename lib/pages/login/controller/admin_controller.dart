// import 'dart:developer';
// import 'dart:io';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
// import 'package:shimmer/shimmer.dart';
// import 'package:yumsharolwebapp/landing/controller/landing_controller.dart';
// import 'package:yumsharolwebapp/login/model/projectmodel.dart';
// import 'package:yumsharolwebapp/login/model/quotemodel.dart';
// import 'package:yumsharolwebapp/login/model/reviewmodel.dart';

// class AdminController extends GetxController {
//   final CollectionReference _projectRef = FirebaseFirestore.instance.collection(
//     'projects',
//   );
//   final CollectionReference _quoteRef = FirebaseFirestore.instance.collection(
//     'quotes',
//   );

//   List<Project> _allproject = [];
//   List<Project> get allproject => _allproject;

//   List<Quote> _allQuotes = [];
//   List<Quote> get allquote => _allQuotes;

//   Project? _selectedproject;
//   Project? get selectedproject => _selectedproject;
//   PlatformFile? _selectedfile;
//   PlatformFile? get selectedfile => _selectedfile;
//   final String _uploadedImageUrl = '';
//   String get uploadedImageUrl => _uploadedImageUrl;

//   // Add these variables to your dialog state
//   Uint8List? _projectselectedImageBytes; // For web
//   Uint8List? get projectselectedImageBytes =>
//       _projectselectedImageBytes; // For web

//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController descController = TextEditingController();
//   final TextEditingController imageUrlController = TextEditingController();

//   // Rx<Project?> editingProject = Rx<Project?>(null);
//   bool isupdatingdata = false;

//   List<Review> _allreviews = [];
//   List<Review> get allreviews => _allreviews;

//   bool _issubmitloading = false;
//   bool get issubmitloading => _issubmitloading;

//   @override
//   void onInit() {
//     super.onInit();
//     loadReviews();
//     loadQuotes();
//     loadProjects();
//   }

//   resetsetselectedgallerycover(BuildContext context) {
//     titleController.clear();
//     descController.clear();
//     _selectedproject = null;
//     _projectselectedImageBytes = null;
//     update();

//     showAddProjectDialog(context, null);
//   }

//   Future<void> addProject(String downloadurl) async {
//     final newProject = Project(
//       id: '',
//       title: titleController.text.trim(),
//       description: descController.text.trim(),
//       imageUrl: downloadurl,
//     );

//     try {
//       var response = await _projectRef.add(newProject.toMap());
//       if (response.id.isNotEmpty) {
//         // Optionally update the ID in Firestore if needed
//         await response.update({'id': response.id});

//         clearForm();
//         loadProjects(); // Call only if successful
//       }
//     } catch (e) {
//       print("Error adding project: $e");
//     }
//   }

//   /// READ (initial load + on change)
//   void loadProjects() {
//     _projectRef.snapshots().listen((snapshot) {
//       _allproject =
//           snapshot.docs
//               .map(
//                 (doc) =>
//                     Project.fromMap(doc.data() as Map<String, dynamic>, doc.id),
//               )
//               .toList();
//       update();
//     });
//   }

//   void loadQuotes() {
//     _quoteRef.snapshots().listen((snapshot) {
//       _allQuotes =
//           snapshot.docs
//               .map(
//                 (doc) =>
//                     Quote.fromMap(doc.data() as Map<String, dynamic>, doc.id),
//               )
//               .toList();

//       update(); // <- use setState(), GetX's update(), or notifyListeners() depending on your state management
//     });
//   }

//   Future<void> updateProjectImageInStorage({
//     required String
//     existingFilePath, // e.g., 'project_images/oldImage123456.png'
//     required BuildContext context,
//   }) async {
//     try {
//       // Reference to existing file path in Firebase Storage
//       Reference storageRef = FirebaseStorage.instance.ref().child(
//         existingFilePath,
//       );

//       UploadTask uploadTask;

//       if (kIsWeb) {
//         // Upload using bytes for Web
//         uploadTask = storageRef.putData(
//           _selectedfile!.bytes!,
//           SettableMetadata(
//             contentType:
//                 _selectedfile!.extension == 'png' ? 'image/png' : 'image/jpeg',
//           ),
//         );
//       } else {
//         // Upload using file path for Mobile/Desktop
//         File imageFile = File(_selectedfile!.path!);
//         uploadTask = storageRef.putFile(imageFile);
//       }

//       // Await upload
//       TaskSnapshot snapshot = await uploadTask;

//       // Check if upload was successful
//       if (snapshot.state == TaskState.success) {
//         String downloadUrl = await snapshot.ref.getDownloadURL();
//         print("Update successful! New Download URL: $downloadUrl");

//         // Update Firestore or local state with the new downloadUrl
//         updateProject(
//           downloadurl: downloadUrl,
//         ); // Replace with your update logic
//       } else {
//         print("Update failed with state: ${snapshot.state}");
//       }
//       showSuccessDialog(
//         context: context,
//         content: 'Image updated successfully!',
//       );
//     } catch (e) {
//       print("Update failed with error: $e");
//       showSuccessDialog(context: context, content: 'Image updation Fail!');
//     }
//   }

//   /// UPDATE
//   Future<void> updateProject({required String? downloadurl}) async {
//     if (_selectedproject == null) return;

//     final updated = Project(
//       id: _selectedproject!.id,
//       title: titleController.text.trim(),
//       description: descController.text.trim(),
//       imageUrl: downloadurl!,
//     );

//     await _projectRef.doc(updated.id).update(updated.toMap());
//     clearForm();
//     loadProjects();
//   }

//   /// DELETE
//   Future<void> deleteProject(String id) async {
//     await _projectRef.doc(id).delete();
//     loadProjects();
//   }

//   /// FORM HELPERS
//   void editProject(Project project) {
//     _selectedproject = project;
//     titleController.text = project.title;
//     descController.text = project.description;
//     imageUrlController.text = project.imageUrl;
//   }

//   void clearForm() {
//     titleController.clear();
//     descController.clear();
//     imageUrlController.clear();
//     _selectedproject = null;
//   }

//   Future<void> loadReviews() async {
//     try {
//       final snapshot =
//           await FirebaseFirestore.instance
//               .collection('reviews')
//               .orderBy('timestamp', descending: true)
//               .get();

//       var data =
//           snapshot.docs
//               .map((doc) => Review.fromDocument(doc.id, doc.data()))
//               .toList();
//       _allreviews = data;

//       // Update the state to reflect the loaded reviews
//       update();
//       print('✅ Reviews loaded successfully: ${_allreviews.length} reviews');
//     } catch (e) {
//       print('❌ Error fetching reviews: $e');
//       rethrow;
//     }
//   }

//   Future<void> submitReview({
//     required String name,
//     required int rating,
//     required String review,
//     required BuildContext context,
//   }) async {
//     try {
//       _issubmitloading = true;
//       update();
//       var response = await FirebaseFirestore.instance
//           .collection('reviews')
//           .add({
//             'name': name,
//             'rating': rating,
//             'review': review,
//             'timestamp': FieldValue.serverTimestamp(),
//           });

//       // Check if the document was created successfully
//       if (response.id.isNotEmpty) {
//         Get.find<LandingController>().setcurrentpage('Home');
//         showSuccessDialog(
//           context: Get.context ?? context,
//           title: 'Success',
//           content: 'Review submitted successfully!',
//         );
//         loadReviews();
//         print('Quote added successfully with ID: ${response.id}');
//         _issubmitloading = false;
//         update();
//       } else {
//         _issubmitloading = false;
//         update();

//         throw Exception('Failed to add quote');
//       }
//       print('✅ Review submitted');
//     } catch (e) {
//       _issubmitloading = false;
//       update();
//       print('❌ Error submitting review: $e');
//       rethrow;
//     }
//   }

//   Future<void> showSuccessDialog({
//     required BuildContext context,
//     String title = 'Success',
//     required String content,
//     VoidCallback? onOk,
//   }) async {
//     return showDialog<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Row(
//             children: const [
//               Icon(Icons.check_circle, color: Colors.green),
//               SizedBox(width: 8),
//               Text('Success'),
//             ],
//           ),
//           content: Text(content),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close dialog
//                 if (onOk != null) onOk(); // Optional action
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Future<void> submitQuoteForm({
//     required String fullName,
//     required String email,
//     required String phone,
//     required String serviceType,
//     required String projectDescription,
//     required BuildContext context,
//   }) async {
//     try {
//       _issubmitloading = true;
//       update();
//       var response = await FirebaseFirestore.instance.collection('quotes').add({
//         'fullName': fullName,
//         'email': email,
//         'phone': phone,
//         'serviceType': serviceType,
//         'projectDescription': projectDescription,
//         'timestamp': FieldValue.serverTimestamp(),
//       });

//       // Check if the document was created successfully
//       if (response.id.isNotEmpty) {
//         Get.find<LandingController>().setcurrentpage('Home');
//         showSuccessDialog(
//           context: Get.context ?? context,
//           title: 'Success',
//           content: 'Quote submitted successfully!',
//         );
//         print('Quote added successfully with ID: ${response.id}');
//         _issubmitloading = false;
//         update();
//       } else {
//         _issubmitloading = false;
//         update();

//         throw Exception('Failed to add quote');
//       }

//       print('✅ Quote request submitted!');
//     } catch (e) {
//       _issubmitloading = false;
//       update();
//       print('❌ Failed to submit: $e');
//       rethrow;
//     }
//   }

//   Future<Uint8List> networkImageToBytes(String imageUrl) async {
//     final response = await http.get(Uri.parse(imageUrl));
//     if (response.statusCode == 200) {
//       return response.bodyBytes;
//     } else {
//       throw Exception('Failed to load image from $imageUrl');
//     }
//   }

//   setselectedproject({required String id, required BuildContext context}) {
//     _selectedproject = _allproject.firstWhere((gal) => gal.id == id);
//     update();
//     showAddProjectDialog(context, id);
//   }

//   String extractStoragePath(String downloadUrl) {
//     final uri = Uri.parse(downloadUrl);
//     final encodedPath =
//         uri.pathSegments.contains('o')
//             ? uri.pathSegments[uri.pathSegments.indexOf('o') + 1]
//             : '';
//     return Uri.decodeFull(
//       encodedPath,
//     ); // returns 'project_images/1753179950592'
//   }

//   void showAddProjectDialog(BuildContext contextmain, String? id) {
//     final formKey = GlobalKey<FormState>();

//     showDialog(
//       context: contextmain,
//       builder: (context) {
//         if (_selectedproject != null) {
//           titleController.text = _selectedproject!.title;
//           descController.text = _selectedproject!.description;
//         }

//         return StatefulBuilder(
//           builder: (context, setState) {
//             Future<void> pickAndUploadImage(BuildContext context) async {
//               try {
//                 FilePickerResult? result = await FilePicker.platform.pickFiles(
//                   type: FileType.image,
//                   allowMultiple: false,
//                   withData: true, // important for web
//                 );

//                 if (result != null && result.files.isNotEmpty) {
//                   PlatformFile file = result.files.first;
//                   setState(() {
//                     _selectedfile = file;
//                     _projectselectedImageBytes = file.bytes;
//                   });
//                 }
//               } catch (e) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text(
//                       "Failed to pick/upload image: ${e.toString()}",
//                     ),
//                     backgroundColor: Colors.red,
//                   ),
//                 );
//               }
//             }

//             addprojectimagetostorage() async {
//               String fileName =
//                   DateTime.now().millisecondsSinceEpoch.toString();

//               // Reference to Firebase Storage
//               Reference storageRef = FirebaseStorage.instance.ref().child(
//                 'project_images/$fileName',
//               );

//               try {
//                 UploadTask uploadTask;

//                 if (kIsWeb) {
//                   // Upload using bytes for Web
//                   uploadTask = storageRef.putData(
//                     _selectedfile!.bytes!,
//                     SettableMetadata(
//                       contentType:
//                           _selectedfile!.extension == 'png'
//                               ? 'image/png'
//                               : 'image/jpeg',
//                     ),
//                   );
//                 } else {
//                   // Upload using file path for Mobile/Desktop
//                   File imageFile = File(_selectedfile!.path!);
//                   uploadTask = storageRef.putFile(imageFile);
//                 }

//                 // Await upload
//                 TaskSnapshot snapshot = await uploadTask;

//                 // Check if upload was successful
//                 if (snapshot.state == TaskState.success) {
//                   String downloadUrl = await snapshot.ref.getDownloadURL();
//                   print("Upload successful! Download URL: $downloadUrl");
//                   addProject(downloadUrl);
//                   // Do something with downloadUrl (e.g. save to Firestore)
//                 } else {
//                   print("Upload failed with state: ${snapshot.state}");
//                 }
//               } catch (e) {
//                 print("Upload failed with error: $e");
//               }
//               showSuccessDialog(
//                 context: context,
//                 content: 'Image Uploaded successfully!',
//               );
//             }

//             void submitForm() async {
//               log("id is null outside : ");
//               if (formKey.currentState!.validate()) {
//                 if (id == null) {
//                   log("id is null : ");
//                   if (_projectselectedImageBytes == null) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text('Please select an image')),
//                     );
//                     return;
//                   }

//                   if (descController.text.isEmpty) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text('Description is required')),
//                     );
//                     return;
//                   }

//                   setState(() {
//                     isupdatingdata = true;
//                   });

//                   addprojectimagetostorage().whenComplete(() {
//                     setState(() {
//                       isupdatingdata = false;
//                     });
//                     Navigator.of(context).pop();
//                   });
//                 } else {
//                   log("id is not null : $id");
//                   setState(() {
//                     isupdatingdata = true;
//                   });

//                   if (_projectselectedImageBytes != null) {
//                     String existingStoragePath = extractStoragePath(
//                       _selectedproject!.imageUrl,
//                     );

//                     await updateProjectImageInStorage(
//                       existingFilePath: existingStoragePath,
//                       context: context,
//                     ).whenComplete(() {
//                       setState(() {
//                         isupdatingdata = false;
//                       });
//                       Navigator.of(context).pop();
//                     });
//                   } else {
//                     updateProject(
//                       downloadurl: _selectedproject!.imageUrl,
//                     ).whenComplete(() {
//                       setState(() {
//                         isupdatingdata = false;
//                       });
//                       Navigator.of(context).pop();
//                     });
//                   }
//                 }
//               } else {}
//             }

//             return AlertDialog(
//               backgroundColor: Colors.white,
//               title: Text(
//                 _selectedproject != null
//                     ? 'Update Project Image'
//                     : 'Add New Project Image',
//                 style: GoogleFonts.poppins(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               content: SizedBox(
//                 width: 350,
//                 child: Form(
//                   key: formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       // Image Upload Section
//                       InkWell(
//                         onTap: () => pickAndUploadImage(context),
//                         // : pickImage(context),
//                         child: Container(
//                           width: double.maxFinite,
//                           height: 150,
//                           decoration: BoxDecoration(
//                             color: Colors.grey[200],
//                             borderRadius: BorderRadius.circular(8),
//                             border: Border.all(color: Colors.grey),
//                           ),
//                           child:
//                               _selectedproject == null &&
//                                       _projectselectedImageBytes == null
//                                   ? Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Icon(Icons.add_photo_alternate, size: 40),
//                                       SizedBox(height: 8),
//                                       Text(
//                                         'Tap to select image',
//                                         style: TextStyle(color: Colors.grey),
//                                       ),
//                                     ],
//                                   )
//                                   : _selectedproject == null &&
//                                       _projectselectedImageBytes != null
//                                   ? Image.memory(
//                                     _projectselectedImageBytes!,
//                                     fit: BoxFit.cover,
//                                     errorBuilder: (context, error, stackTrace) {
//                                       return Center(
//                                         child: Text('Could not load image'),
//                                       );
//                                     },
//                                   )
//                                   : _selectedproject != null &&
//                                       _projectselectedImageBytes == null
//                                   ? ClipRRect(
//                                     borderRadius: BorderRadius.circular(8),
//                                     child: CachedNetworkImage(
//                                       imageUrl: _selectedproject!.imageUrl,

//                                       fit: BoxFit.cover,
//                                       placeholder:
//                                           (context, url) => Shimmer.fromColors(
//                                             baseColor: Colors.grey.shade300,
//                                             highlightColor:
//                                                 Colors.grey.shade100,
//                                             child: Container(
//                                               height: 140,
//                                               color: Colors.white,
//                                             ),
//                                           ),
//                                       errorWidget: (context, url, error) {
//                                         log(error.toString());
//                                         return Container(
//                                           height: 140,
//                                           color: Colors.white,
//                                           child: const Center(
//                                             child: Icon(
//                                               Icons.broken_image,
//                                               color: Colors.grey,
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   )
//                                   : _selectedproject != null &&
//                                       _projectselectedImageBytes != null
//                                   ? Image.memory(
//                                     _projectselectedImageBytes!,
//                                     fit: BoxFit.cover,
//                                     errorBuilder: (context, error, stackTrace) {
//                                       return Center(
//                                         child: Text('Could not load image'),
//                                       );
//                                     },
//                                   )
//                                   : ClipRRect(
//                                     borderRadius: BorderRadius.circular(8),
//                                     child: CachedNetworkImage(
//                                       imageUrl: _selectedproject!.imageUrl,

//                                       fit: BoxFit.cover,
//                                       placeholder:
//                                           (context, url) => Shimmer.fromColors(
//                                             baseColor: Colors.grey.shade300,
//                                             highlightColor:
//                                                 Colors.grey.shade100,
//                                             child: Container(
//                                               height: 140,
//                                               color: Colors.white,
//                                             ),
//                                           ),
//                                       errorWidget: (context, url, error) {
//                                         log(error.toString());
//                                         return Container(
//                                           height: 140,
//                                           color: Colors.white,
//                                           child: const Center(
//                                             child: Icon(
//                                               Icons.broken_image,
//                                               color: Colors.grey,
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   ),
//                         ),
//                       ),

//                       SizedBox(height: 16),

//                       // Title Field
//                       TextFormField(
//                         controller: titleController,
//                         decoration: InputDecoration(
//                           labelText: 'Title',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.black),
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           prefixIcon: Icon(Icons.title),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter a title';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(height: 16),

//                       TextFormField(
//                         controller: descController,
//                         decoration: InputDecoration(
//                           labelText: 'Description',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.black),
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           prefixIcon: Icon(Icons.title),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter a Description';
//                           }
//                           return null;
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                     // setselectedcoverreset();
//                   },
//                   child: const Text(
//                     'Cancel',
//                     style: TextStyle(color: Colors.red),
//                   ),
//                 ),
//                 OutlinedButton(
//                   onPressed: submitForm,
//                   style: OutlinedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 15,
//                       vertical: 15,
//                     ),
//                     side: const BorderSide(color: Colors.blue),
//                   ),
//                   child:
//                       isupdatingdata
//                           ? SizedBox(
//                             height: 20,
//                             width: 20,
//                             child: CircularProgressIndicator(),
//                           )
//                           : Text(
//                             _selectedproject != null ? "Update" : "Submit",
//                             style: TextStyle(color: Colors.blue),
//                           ),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }
// }
