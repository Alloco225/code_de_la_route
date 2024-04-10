import { initializeApp } from "firebase/app";
import {
    getFirestore,
    // collection,
    // getDocs
} from "firebase/firestore/lite";
import firebaseConfig from '/_firebase.js'


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
