const express = require('express');
const bodyParser = require("body-parser");

const UE = require('./models/ue');

// importer les controllers
const ueController = require('./controllers/ueController');
const relationController = require('./controllers/relationController');

//Construction des differents routers
const app = express();
const router = express.Router();

router.get('/', (req, res) => {
  res.render('accueil.ejs');
});

router.get('/creation', (req, res) => {
  res.render('creation.ejs');
});

router.get('/edition', async (req, res) => {
  ue = await UE.findByPk(req.query.id);
  res.render('edition.ejs', {data:ue});
});

router.use(bodyParser.json());


// Pour la table UE
router.get('/ue', ueController.getAllUe);
router.get('/ue/:id', ueController.getOneUe);
router.post('/ue', ueController.createUe);
router.post('/update', ueController.modifyUe);

router.use((req, res) => {
  res.status(404).send('Existe pas');
});

module.exports = router;
