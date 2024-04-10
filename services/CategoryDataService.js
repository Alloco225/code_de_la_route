import db from "../firebase";

import {
  // getFirestore,
  collection,
  getDocs,
} from "firebase/firestore/lite";

// async function getCities(db) {
//     const citiesCol = collection(db, "cities");
//     const snapshot = await getDocs(citiesCol);
//     const list = snapshot.docs.map((doc) => doc.data());
//     return list;
// }

class CategoryDataService {
  async getAll() {
    const col = collection(db, "categories");
    const snapshot = await getDocs(col);
    // return snapshot.docs.map((doc) => doc.data());
    const list = snapshot.docs.map((doc) => {
      return { id: doc.id, ...doc.data() };
    });
    return list;
    // return snapshot.docs;
  }

  create(post) {
    return db.add(post);
  }

  update(id, value) {
    return db.doc(id).update(value);
  }

  delete(id) {
    return db.doc(id).delete();
  }
}

export default new CategoryDataService();
