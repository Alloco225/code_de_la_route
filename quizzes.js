
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



dataImport();