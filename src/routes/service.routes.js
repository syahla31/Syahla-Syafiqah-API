const router = require('express').Router();
const auth = require('../middlewares/auth.middleware');
const ctrl = require('../controllers/service.controller');

router.get('/', auth, ctrl.getAllServices);

module.exports = router;