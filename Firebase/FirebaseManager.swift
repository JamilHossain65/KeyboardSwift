//
//  FirebaseManager.swift
//  SmartKeyboard
//
//  Created by Jamil on 11/27/20.
//  Copyright © 2020 Jamil Hossain. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

//https://firebase.google.com/docs/firestore/quickstart

public class FirebaseManager: NSObject {
    public static let sharedInstance = FirebaseManager()
    public var deviceUDID = UIDevice.current.identifierForVendor!.uuidString
    //public var db = Firestore.firestore()
    
    public override init() {
        
    }
    
    func initialize(){
        FirebaseApp.configure()
    }
    
    func addUserDataToDatabase(device_id:String){
        /*
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db.collection("users").addDocument(data: [
            "id"             : device_id,
            "name"           : "Jamil",
            "birth_country"  : "Bangladesh",
            "living_country" : "Bangladesh",
            "mobile"         : "1760614503",
            "mobile_country_code": "880",
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
 */
    }
    
    /*
     -(void)addUserDataToDatabase:(NSString*)device_id{
         // Add a new document with a generated ID
         FIRFirestore *defaultFirestore = [FIRFirestore firestore];
         
         __block FIRDocumentReference *ref =
             [[defaultFirestore collectionWithPath:@"user"] addDocumentWithData:@{
               @"id": device_id,
               @"name": @"Jamil",
               @"birth_country": @"Bangladesh",
               @"living_country": @"Bangladesh",
               @"mobile": @"1760614503",
               @"mobile_country_code": @"880",
             } completion:^(NSError * _Nullable error) {
               if (error != nil) {
                 NSLog(@"Error adding document: %@", error);
               } else {
                 NSLog(@"Document added with ID: %@", ref.documentID);
               }
             }];
     }

     -(void)addPointDataToDatabase:(NSString*)device_id point:(NSNumber*)point{
         // Add a new document with a generated ID
         FIRFirestore *defaultFirestore = [FIRFirestore firestore];
         
         __block FIRDocumentReference *ref =
             [[defaultFirestore collectionWithPath:@"points"] addDocumentWithData:@{
               @"id": device_id,
               @"current_point": point,
             } completion:^(NSError * _Nullable error) {
               if (error != nil) {
                 NSLog(@"Error adding document: %@", error);
               } else {
                 NSLog(@"Document added with ID: %@", ref.documentID);
               }
             }];
     }

     -(void)addPaymentDataToDatabase:(NSString*)device_id point:(NSNumber*)point{
         // Add a new document with a generated ID
         FIRFirestore *defaultFirestore = [FIRFirestore firestore];
         
         __block FIRDocumentReference *ref =
             [[defaultFirestore collectionWithPath:@"payment"] addDocumentWithData:@{
               @"id": device_id,
               @"current_point": point,
               @"request_status": @0,
               @"requested_amount": @10,
               @"total_paid": @200,
             } completion:^(NSError * _Nullable error) {
               if (error != nil) {
                 NSLog(@"Error adding document: %@", error);
               } else {
                 NSLog(@"Document added with ID: %@", ref.documentID);
               }
             }];
     }


     -(void)fetchDataFromDatabase {
         /*
         FIRDocumentReference *docRef =
             [[ref collectionWithPath:@"cities"] documentWithPath:@"SF"];
         [docRef getDocumentWithCompletion:^(FIRDocumentSnapshot *snapshot, NSError *error) {
           if (snapshot.exists) {
             // Document data may be nil if the document exists but has no keys or values.
             NSLog(@"Document data: %@", snapshot.data);
           } else {
             NSLog(@"Document does not exist");
           }
         }];*/
     }

     -(void)updateDataToDatabase {
         FIRFirestore *defaultFirestore = [FIRFirestore firestore];
         FIRCollectionReference *colRef = [defaultFirestore collectionWithPath:@"user"];
         FIRQuery *query = [colRef queryWhereField:@"id" isEqualTo:deviceID];
         
         [query getDocumentsWithCompletion:^(FIRQuerySnapshot *snapshot, NSError *error) {
             
             if (error != nil) {
                 NSLog(@"Error getting documents: %@", error);
             } else {
                 FIRDocumentSnapshot *document = snapshot.documents.firstObject;
                 [document.reference updateData:@{
                     @"mobile_country_code": @"+880"
                 }];
             }
             
         }];
     }
     */
}
