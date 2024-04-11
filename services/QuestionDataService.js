import db from "../firebase";

import {
  collection,
  getDocs,
} from "firebase/firestore/lite";

class QuestionDataService {
  async getAll() {
    const col = collection(db, "questions");
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

export default new QuestionDataService();
