
import path from "path";
import fs from "fs";

import db from "./firebase.js";

import {
    // getFirestore,
    collection,
    getDocs,
    getDoc,
    where,
    doc, setDoc,
    query, orderBy, limit,
} from "firebase/firestore/lite";



function dataImport(){
    
    const directoryPath = "./collections";
    
    
    const OPTIONS = { merge: true }
    
    
    fs.readdir(directoryPath, function (err, files) {
        if (err) {
            return console.log("Unable to scan directory: " + err);
        }
    
    
    
        files.forEach(function (file) {
            console.log("file");
    
            const collection_name = file.split('.')[0]
            console.log("collection_name", collection_name)
    
            fs.readFile(directoryPath + '/'+ file, 'utf-8', function(err, data){
                if (err) {
                    return console.log("Unable to read file: " + err);
                }
                const documents = JSON.parse(data);
                
                documents.forEach(async (document, index) => {
                    console.log("document")
    
                    const id = index + '';
    
                    const item = await setDoc(doc(db, collection_name, id), document, OPTIONS);
                    console.log("updated", collection_name, "with", id, item);
                });
            })
        });
    });
    
}


function importQuizzes() {

    const directoryPath = "./quizzes";


    const OPTIONS = { merge: true }


    fs.readdir(directoryPath, function (err, files) {
        if (err) {
            return console.log("Unable to scan directory: " + err);
        }



        files.forEach(function (file) {
            console.log("file");

            const fileName = file.split('.')[0]
            console.log("quizzId", fileName)

            fs.readFile(directoryPath + '/' + file, 'utf-8', function (err, data) {
                if (err) {
                    return console.log("Unable to read file: " + err);
                }
                const documents = JSON.parse(data);

                documents.forEach(async (document, index) => {
                    console.log("document")

                    const id = index + '';

                    const item = await setDoc(doc(db, collection_name, id), document, OPTIONS);
                    console.log("updated", collection_name, "with", id, item);
                });
            })
        });
    });

}




dataImport();