const router = require('express').Router();
const auth = require('../middlewares/auth.middleware');
const ctrl = require('../controllers/balance.controller');

router.get('/', auth, ctrl.getBalance);

module.exports = router;