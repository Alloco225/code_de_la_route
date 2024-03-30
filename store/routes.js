import { readonly } from "vue";
//
const appRoutes = readonly({
  mettre_en_location: {
    index: '/mettre-en-location',
    as: {
      agence: '/mettre-en-location/agence',
      demarcheur: '/mettre-en-location/demarcheur',
    },
    form: {
      agence: {
        1: '/mettre-en-location/agence/1-presentation-agence',
        2: '/mettre-en-location/agence/2-information-admin',
        3: '/mettre-en-location/agence/3-mon-equipe',
        4: '/mettre-en-location/agence/4-abonnement',
      }
    }
  }
});


export default appRoutes;
