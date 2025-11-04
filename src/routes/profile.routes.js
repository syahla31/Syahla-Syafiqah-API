const router = require('express').Router();
const auth = require('../middlewares/auth.middleware');
const upload = require('../middlewares/upload.middleware');
const ctrl = require('../controllers/profile.controller');

router.get('/', auth, ctrl.getProfile);
router.put('/update', auth, ctrl.updateProfile);
router.put('/image', auth, upload.single('file'), ctrl.updateProfileImage);

module.exports = router;