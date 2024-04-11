
import axios from 'axios';
import store from "../store";
import router from "../router";

const instance = axios.create({
  withCredentials: true,
});


instance.interceptors.request.use((config) => {
  if (!!store.getters.token) {
    config.headers.Authorization = `Bearer ${store.getters.token}`;
    config.headers.Accept = "application/json";
  }
  return config
})

instance.interceptors.response.use(
  response => response,
  error => {
    // TODO add roles in the interceptor
    console.log("interceptor error");
    if (error.response && error.response.status === 401) {
      console.log("request not authorized");
      const requiresAuth = error.config?.headers?.requiresAuth || router?.currentRoute?.meta?.requiresAuth;
      // if (requiresAuth) {
      const redirectTo = router?.currentRoute?.fullPath;
      store.dispatch('logout', redirectTo);
      // }
    }
    if (error.response) {
      // The request was made and the server responded with a status code
      console.log('Server responded with a non-2xx status:', error.response.status);
    } else if (error.request) {
      // The request was made but no response was received
      console.log('No response received. Is the server down or the internet connection lost?');
    } else {
      // Something happened in setting up the request that triggered an Error
      console.log('Error setting up the request:', error.message);
    }
    return Promise.reject(error);
  }
);


export default instance;
