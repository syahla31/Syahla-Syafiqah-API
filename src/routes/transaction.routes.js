const express = require('express');
const router = express.Router();
const { createTransaction } = require('../controllers/transaction.controller');
const { getTransactionHistory } = require('../controllers/transaction.controller');
const auth = require('../middlewares/auth.middleware');

router.post('/', auth, createTransaction);
router.get('/history', auth, getTransactionHistory);

module.exports = router;
