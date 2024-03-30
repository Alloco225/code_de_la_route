class AppRouteService {

  construct(){

    this.routes = {
      mettre_en_location: {
        index: 'mettre-en-location',
        as: {
          agence: 'mettre-en-location/agence',
          demarcheur: 'mettre-en-location/démarcheur',
        }
      }
    }
  }

  
}

export default new AppRouteService();
