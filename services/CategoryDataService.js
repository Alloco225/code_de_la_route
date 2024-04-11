import db from "../firebase";

import {
  collection,
  getDocs,
  doc,
  getDoc,
  query, where,
} from "firebase/firestore/lite";

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

  async get(category_id) {
    const ref = doc(db, "categories", category_id);
    const snapshot = await getDoc(ref);
    // return snapshot.docs.map((doc) => doc.data());
    const document = {id: snapshot.id, ...snapshot.data()}
    return document;
    // return snapshot.docs;
  }
  async getOne(category_id) {
    const ref = doc(db, "categories", category_id);
    const snapshot = await getDoc(ref);
    return {id: snapshot.id, ...snapshot.data(), ref}
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
