// plugins/supabase.js
import { createClient } from '@supabase/supabase-js';
import supabaseConfig from '~/_supabase';
import Vue from 'vue'


const supabaseUrl = supabaseConfig.SUPABASE_URL;
const supabaseKey = supabaseConfig.SUPABASE_ANON_KEY;

const supabase = createClient(supabaseUrl, supabaseKey);

// console.log("supabase", supabase);

Vue.prototype.$supabase = supabase;

export default supabase;

// export default ({ app }) => {
//   const supabase = createClient(supabaseUrl, supabaseKey);

//   app.$supabase = supabase;
// };
