import db from "../firebase";

import {
  collection,
  getDocs,
  doc,
  getDoc,
  query,
  where,
} from "firebase/firestore/lite";

class QuizzDataService {
  async getAll() {
    const col = collection(db, "quizzes");
    const snapshot = await getDocs(col);
    console.log("query", snapshot)
    const list = snapshot.docs.map((doc) => {
      return { id: doc.id, ...doc.data() };
    });
    return list;
  }

  async getFromCategory(category_id) {
    const col = query(collection(db, "quizzes"), where("category", "==", category_id));
    const snapshot = await getDocs(col);
    const list = snapshot.docs.map((doc) => {
      return { id: doc.id, ...doc.data() };
    });
    return list;
  }

  async getOne(id) {
    const col = doc(db, "quizzes", id);
    const snapshot = await getDoc(col);
    return { id: snapshot.id, ...snapshot.data() };
  }
  async get(category_id) {
    const col = query(collection(db, "quizzes"), where("category", "==", category_id));
    const snapshot = await getDocs(col);
    const list = snapshot.docs.map((doc) => {
      return { id: doc.id, ...doc.data() };
    });
    return list;
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

export default new QuizzDataService();
