import axios from '@/services/axios'

class AgencyService {

  construct(){

  }

  register = (data) => new Promise((resolve, reject) => axios.post(process.env.API_URL+'/agency/register', data).then((res) => resolve(res.data)).catch((err) => reject(err)))
  
}

export default new AgencyService();
