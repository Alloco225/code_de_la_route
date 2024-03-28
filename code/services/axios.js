// axios.js
import axios from 'axios';

const instance = axios.create({
    withCredentials: true,
});


instance.interceptors.request.use((config) => {
    // const authStore = useAuthStore();
    //     console.log("intercept config token:", authStore.getToken);

    // if (!!authStore.getToken){
    //     config.headers.Authorization = `Bearer ${authStore.getToken}`;
    //     config.headers.Accept = "application/json";
    // }
    return config
})

instance.interceptors.response.use(
    response => response,
    error => {
        if (error.response && error.response.status === 401) {
            console.log("INTERCEPT 401");
            // const requiresAuth = error.config?.headers?.requiresAuth || router?.currentRoute?.value?.meta?.requiresAuth;
            // if (requiresAuth){
            //     const redirectTo = router?.currentRoute?.value?.fullPath;
            //     console.log("INTERCEPT 401 requires auth then", redirectTo);
            //     const authStore = useAuthStore();
            //     if (!!authStore.getToken) {
            //         authStore.logout(redirectTo);
            //     }else{
            //         try {
                        
            //             console.log("router push login");
            //             authStore.redirect(redirectTo);
            //             // router.push('/login' + !!redirectTo ? ('?redirect=' + redirectTo) : '');
            //             // location.assign('/login' + !!redirectTo ? ('?redirect=' + redirectTo) : '');
            //         } catch (error) {
            //             console.log("");
            //         }
            //     }
            // }
        }
        return Promise.reject(error);
    }
);


export default instance;
