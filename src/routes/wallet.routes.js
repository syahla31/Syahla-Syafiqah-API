const router = require('express').Router();
const auth = require('../middlewares/auth.middleware');
const ctrl = require('../controllers/wallet.controller');

router.get('/balance', auth, ctrl.balance);
router.post('/topup', auth, ctrl.topup);

module.exports = router;