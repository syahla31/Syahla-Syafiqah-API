const router = require('express').Router();
const ctrl = require('../controllers/banner.controller');

router.get('/', ctrl.getBanner);

module.exports = router;