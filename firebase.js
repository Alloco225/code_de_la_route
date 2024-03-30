import { initializeApp } from "firebase/app";
import {
    getFirestore,
    // collection,
    // getDocs
} from "firebase/firestore/lite";

let firebaseConfig = {
    apiKey: "AIzaSyAQveQW8aTvum7ZmdmkUd5qNJAZwU8HPyo",
    authDomain: "mikasa-782f3.firebaseapp.com",
    projectId: "mikasa-782f3",
    storageBucket: "mikasa-782f3.appspot.com",
    messagingSenderId: "70669135267",
    appId: "1:70669135267:web:cfbc36e258608cfe5f3e16",
    measurementId: "G-8FXQ83DM40",
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const db = getFirestore(app);

// Get a list of cities from your database
// async function getCities(db) {
//     const citiesCol = collection(db, "cities");
//     const citySnapshot = await getDocs(citiesCol);
//     const cityList = citySnapshot.docs.map((doc) => doc.data());
//     return cityList;
// }
export default db;
