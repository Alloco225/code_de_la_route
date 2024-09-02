<template>
  <div class="profile-container">
    <h1>Mon Profil</h1>
    <div class="profile-info">
      <p><strong>Nom:</strong> {{ userProfile.name }}</p>
      <p><strong>Email:</strong> {{ userProfile.email }}</p>
      <p><strong>Score total:</strong> {{ userProfile.totalScore }}</p>
      <p><strong>Nombre de quizz joués:</strong> {{ userProfile.quizzesPlayed }}</p>
    </div>
    <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
      Modifier le profil
    </button>
  </div>
</template>

<script>
export default {
  name: 'UserProfile',
  data() {
    return {
      userProfile: {
        name: 'John Doe',
        email: 'john.doe@example.com',
        totalScore: 100,
        quizzesPlayed: 5,
      },
    };
  },
};
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
