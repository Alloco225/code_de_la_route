import axios from 'axios';
// import axios from './axios';

class AuthDataService {
  constructor() {
  }

  authenticate() {
    return new Promise((resolve, reject) => {
      axios
        .get('/api/user', {})
        .then(res => {
          resolve(res?.data)
        })
        .catch(err => reject(err))
    })
  }

  getOtpCode(data) {
    return new Promise((resolve, reject) => {
      axios
        .post('/api/otp', data)
        .then(res => {
          resolve(res?.data)
        })
        .catch(err => reject(err))
    })
  }

  login(data) {
    return new Promise((resolve, reject) => {
      axios
        .post('/api/login', data)
        .then(res => {
          resolve(res?.data)
        })
        .catch(err => reject(err))
    })
  }

  loginViaFacebook() {
    return new Promise((resolve, reject) => {
      FB.login(function (response) {
        if (response.authResponse) {
          console.log('Welcome!  Fetching your information.... ');
          FB.api('/me', { fields: 'name, email' }, function (response) {
            document.getElementById("profile").innerHTML = "Good to see you, " + response.name + ". i see your email address is " + response.email
          });
        } else {
          //  <!-- If you are not logged in, the login dialog will open for you to login asking for permission to get your public profile and email -->
          console.log('User cancelled login or did not fully authorize.');
        }
      });

    //   FB.login(
    //     function (response) {
    //       if (response.authResponse) {
    //         const credential = firebase.auth.FacebookAuthProvider.credential(
    //           response.authResponse.accessToken
    //         )

    //         console.log("facebook Credentials", credential)

    //         firebase
    //           .auth()
    //           .signInWithCredential(credential)
    //           .then((userCredential) => {
    //             console.log("firebase Credentials", userCredential)
    //             // User signed in successfully
    //             const user = userCredential.user
    //             console.log('User:', user)
    //             return userCredential;
    //           })
    //           .catch((error) => {
    //             // Handle errors
    //             console.error(error)
    //           })
    //       } else {
    //         // User canceled login or did not fully authorize
    //         console.log('User canceled login or did not fully authorize.')
    //       }
    //     },
    //     { scope: 'public_profile,email' }
    //   )
    })
  }


  loadDashboardData() {
    return new Promise((resolve, reject) => {
      axios
        .post('/api/dashboard', {
        })
        .then(res => {
          resolve(res?.data)
        })
        .catch(err => reject(err))
    })
  }

  logout() {
    return new Promise((resolve, reject) => {
      axios.get('/api/logout', {
        "_token": $('meta[name="csrf-token"]').attr('content')
      })
        .then(res => {
          resolve(res?.data)
        })
        .catch(err => reject(err))
    })
  }


  onboarding(data) {
    return new Promise((resolve, reject) => {
      axios
        .post('/api/onboarding', data)
        .then(res => {
          resolve(res?.data)
        })
        .catch(err => reject(err))
    })
  }

  register(data) {
    return new Promise((resolve, reject) => {
      axios
        .post('/api/register', data)
        .then(res => {
          resolve(res?.data)
        })
        .catch(err => reject(err))
    })
  }

  verifyOtp(data) {
    return new Promise((resolve, reject) => {
      axios
        .post('/api/otp/verify', data)
        .then(res => {
          resolve(res?.data)
        })
        .catch(err => reject(err))
    })
  }


}
export default new AuthDataService();
