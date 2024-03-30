const fs = require('fs/promises');

let quiz_panneaux = [

]



fs.readdir('./panneaux').then((files) =>{
    console.log("files", files);
})
