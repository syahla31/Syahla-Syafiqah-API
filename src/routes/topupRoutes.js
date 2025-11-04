const express = require('express');
const router = express.Router();
const { topUp } = require('../controllers/topupController');
const auth = require('../middlewares/auth.middleware');

router.post('/', auth, topUp);

module.exports = router;