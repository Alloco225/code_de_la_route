import db from "../firebase";

import {
    // getFirestore,
    collection,
    getDocs,
    getDoc,
    where,
    doc, setDoc,
    query, orderBy, limit,
} from "firebase/firestore/lite";


const OPTIONS = { merge: true }

class DataService {
    // async getAll() {
    //     q = query(citiesRef, orderBy("name", "desc"), limit(3));
    //     const col = collection(db, this.collection_name);
    //     const snapshot = await getDocs(col);
    //     const list = snapshot.docs.map((doc) => {
    //         return { id: doc.id, ...doc.data() };
    //     });
    //     return list;
    // }

    construct(collection_name) {
        this.collection_name = collection_name;
    }

    async getAll_() {
        const col = collection(db, this.collection_name);
        const snapshot = await getDocs(col);
        const list = snapshot.docs.map((doc) => {
            return { id: doc.id, ...doc.data() };
        }).reverse(); // latest
        return list;
    }

    async getAll() {
        const col = collection(db, this.collection_name);
        const snapshot = await getDocs(col);
        const list = snapshot.docs.map((doc) => {
            return { id: doc.id, ...doc.data() };
        }).reverse(); // latest
        return list;
    }

    async get(id) {

        const docRef = doc(db, this.collection_name, id);
        const docSnap = await getDoc(docRef);
        if (docSnap.exists()) {
            return { success: true, data: { id: docSnap.id, ...docSnap.data() }, message: 'OK' }
        } else {
            return { success: false, message: 'Commande Introuvable' }
        }
    }

    async create(id, data) {
        console.log("create order", id, data);
        await setDoc(doc(db, this.collection_name, id), data, OPTIONS);
        console.log("created order");
    }

    async update(id, data) {
        console.log("update order", id, data);
        const item = await setDoc(doc(db, this.collection_name, id), data, OPTIONS);
        console.log("updated order", item);
        return item;
    }

    delete(id) {
        return db.doc(id).delete();
    }
}

export default new DataService();
