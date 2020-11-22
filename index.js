// pour les chemins de fichier
const path = require('path');
// récupère les infos de connection du .env
const dotenv = require('dotenv');
dotenv.config();

//facilite la création du serveur
const express = require('express');
const app = express();

//permet chemin relatif pour CSS et JS
app.use(express.static(path.join(__dirname, 'public')));

const router = require('./app/router');

//log des requêtes dans la console
const morgan = require('morgan');
//pour les CORS
const cors = require('cors');

const PORT = process.env.PORT || 5050;

// permet de débloquer les CORS
app.use(cors());

app.set('views', './views')
app.set('view engine', 'ejs')

app.use(express.urlencoded({extended: true}));
app.use(morgan('dev'));
app.use(router);

// Lance le serveur sur un port
app.listen(PORT, () => {
  console.log(`Listening on ${PORT} ...`);
});