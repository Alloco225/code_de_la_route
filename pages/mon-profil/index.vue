<template>
  <div class="bg-gray-700 flex flex-col h-full px-5 py-5">
    <header class="text-center flex justify-between items-end">
      <button
        @click="$router.go(-1)"
        class="w-8 h-8 flex justify-center items-center bg-black bg-opacity-70 hover:bg-opacity-100 text-white rounded-full"
      >
        <ion-icon name="chevron-back-outline"></ion-icon>
      </button>
      <h1 class="text-2xl font-medium">Mon Profil</h1>
      <button
        class="w-8 h-8 flex justify-center items-center bg-black bg-opacity-70 hover:bg-opacity-100 text-white rounded-full"
      >
        <ion-icon name="settings-outline"></ion-icon>
      </button>
    </header>
    <div class="pt-10">
      <section class="flex flex-col items-center text-center text-white">
        <img
          :src="userProfile.photoURL ?? '/favicon.png'"
          alt="User Avatar"
          class="w-24 h-24 object-contain rounded-full border-2 border-black p-0.5"
        />
        <h2 class="text-xl font-bold mt-3">{{ userProfile.name }}</h2>
        <p>{{ userProfile.email }}</p>
      </section>

      <section
        class="grid grid-cols-3 items-center text-center mt-5 rounded border mx-5"
      >
        <div class="flex flex-conl items-center text-center gap-2 p-3">
          <strong>Panneaux</strong>
          <p>{{ userProfile.signs + '/' + totalPanneaux }}</p>
        </div>
        <div class="flex flex-col items-center text-center gap-2 p-3">
          <strong>Quizz</strong>
          <p>{{ userProfile.quizzesPlayed+'/'+totalQuizzes }}</p>
        </div>
        <div class="flex flex-col items-center text-center gap-2 p-3">
          <strong>Score</strong>
          <p>{{ userProfile.totalScore + '/' + maxScore }}</p>
        </div>
      </section>

      <section class="mt-10 text-center">
        <h2 class="text-xl font-bold mb-5">Médailles</h2>

        <article v-if="!isLoggedIn" class="text-center rounded border p-5">
          <h3 class="text-xl font-bold">
            Connectez-vous pour débloquer vos médailles
          </h3>
          <button
            class="bg-black text-white px-5 py-2 rounded-full flex items-center gap-2 mx-auto"
            @click="login"
          >
            <ion-icon name="logo-google"></ion-icon>
            Connectez-vous avec Google
          </button>
        </article>
        <ul class="grid grid-cols-3 gap-5" v-else>
          <li
            class="relative flex flex-col items-center text-center gap-2 p-3 rounded border"
            v-for="achievement in achievements"
            :key="achievement.id"
          >
            <div
              class="absolute rounded border z-10 top-0 left-0 w-full h-full bg-black bg-opacity-50 flex justify-center items-center"
              v-if="!userAchievements.includes(achievement.id)"
            >
              <ion-icon
                name="lock-closed"
                class="text-white"
                size="large"
              ></ion-icon>
            </div>
            <div class="relative w-24 h-24 flex justify-center items-center">
              <img
                :src="'/images/badges/badge_' + achievement.badge + '.png'"
                :key="achievement.title"
                class="w-24 h-24 object-contain bg-gray-200 rounded-full"
              />
              <ion-icon
                :name="
                  achievement.icon
                    .split('.')[1]
                    .replace('_', '-')
                    .toLowerCase() + '-outline'
                "
                class="absolute text-white"
                size="large"
              ></ion-icon>
            </div>
            <strong>{{ achievement.title }}</strong>
          </li>
        </ul>
      </section>
    </div>
  </div>
</template>

<script>
import { getAuth, onAuthStateChanged } from 'firebase/auth'
import { GoogleAuthProvider, signInWithPopup } from 'firebase/auth'
import { getFirestore, collection, getDocs, doc } from 'firebase/firestore'
export default {
  name: 'UserProfile',
  data() {
    return {
      achievements: [],
      userAchievements: [],
      userProfile: {
        name: 'Guest User',
        email: 'guest@example.com',
        totalScore: 0,
        quizzesPlayed: 0,
        averageScore: 0,
        fullMarksQuizzes: 0,
      },
    }
  },
  computed: {
    isLoggedIn() {
      return this.userProfile.name !== 'Guest User'
    },
    totalQuizzes() {
      return 17
    },
    totalPanneaux() {
      return 10
    },
    maxScore() {
      return 20
    },
  },
  async created() {
    this.fetchAchievements()
    const auth = getAuth()
    onAuthStateChanged(auth, async (user) => {
      if (user) {
        this.userProfile.name = user.displayName
        this.userProfile.email = user.email
        // Assuming there's a method to fetch user's total score and quizzes played
        // This is a placeholder for actual logic to fetch these values
        this.userProfile.totalScore = await this.calculateAverageScore() // Placeholder value
        this.userProfile.quizzesPlayed = 5 // Placeholder value
        this.userProfile.fullMarksQuizzes = await this.countFullMarksQuizzes() // Placeholder value
        this.fetchUserAchievements()
      } else {
        console.log('No user logged in')
      }
    })
  },
  async mounted() {
    console.log('mounted categories')
  },
  methods: {
    async calculateAverageScore() {
      const scoresMap = await this.getAllScores()

      if (Object.keys(scoresMap).length === 0) {
        return 0 // Return 0 if there are no scores
      }

      let totalSum = 0
      for (const score in scoresMap) {
        totalSum += scoresMap[score]
      }
      const totalCount = Object.keys(scoresMap).length // Assuming quizzListController.quizzList.length is not applicable in this context

      const avg = totalSum / totalCount
      return avg.toFixed(1)
    },
    async countFullMarksQuizzes() {
      const scoresMap = await this.getAllScores()
      const maxScore = 20
      let fullMarksCount = 0
      for (const score in scoresMap) {
        if (scoresMap[score] === maxScore) {
          fullMarksCount++
        }
      }
      return fullMarksCount
    },
    async getAllScores() {
      const scoresMap = {}
      const db = getFirestore()
      const userRef = doc(db, 'users', this.userProfile.email)
      const quizzesRef = collection(userRef, 'quizzes')
      getDocs(quizzesRef)
        .then((snapshot) => {
          snapshot.docs.forEach((doc) => {
            const data = doc.data()
            scoresMap[data.quizId] = data.score
          })
        })
        .catch((err) => {
          console.error('Error getting quiz scores: ', err)
        })
      return scoresMap
    },
    fetchAchievements() {
      const db = getFirestore()
      const achievementsRef = collection(db, 'achievements')
      getDocs(achievementsRef)
        .then((snapshot) => {
          snapshot.docs.forEach((doc) => {
            this.achievements.push(doc.data())
          })
        })
        .catch((err) => {
          console.error('Error getting documents: ', err)
        })
    },

    fetchUserAchievements() {
      const db = getFirestore()
      const achievementsRef = collection(
        db,
        'users',
        this.userProfile.email,
        'achievements'
      )
      getDocs(achievementsRef)
        .then((snapshot) => {
          snapshot.docs.forEach((doc) => {
            this.userAchievements.push(doc.data())
          })
        })
        .catch((err) => {
          console.error('Error getting documents: ', err)
        })
    },
    login() {
      const provider = new GoogleAuthProvider()
      signInWithPopup(getAuth(), provider)
        .then((result) => {
          // This gives you a Google Access Token. You can use it to authenticate with your API.
          const credential = GoogleAuthProvider.credentialFromResult(result)
          const token = credential.accessToken
          // The signed-in user info.
          const user = result.user
          console.log('Logged in with Google:', user)
        })
        .catch((error) => {
          // Handle Errors here.
          const errorCode = error.code
          const errorMessage = error.message
          // The email of the user's account used.
          const email = error.email
          // The credential that was used.
          const credential = GoogleAuthProvider.credentialFromError(error)
          console.error(
            'Error logging in with Google:',
            errorCode,
            errorMessage,
            email,
            credential
          )
        })
    },
  },
}
</script>

<style scoped>
.profile-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: 20px;
}

.profile-info {
  margin-bottom: 20px;
}

.profile-info p {
  margin-bottom: 10px;
}

.profile-info strong {
  font-weight: bold;
}

button {
  margin-top: 20px;
}
</style>
