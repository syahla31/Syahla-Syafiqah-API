const jwt = require('jsonwebtoken');
const { User } = require('../models');

module.exports = async (req, res, next) => {
  const h = req.headers.authorization;
  if (!h) {
    return res.status(401).json({
      status: 108,
      message: 'Token tidak valid atau kadaluarsa',
      data: null
    });
  }

  const token = h.split(' ')[1];
  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    const user = await User.findByPk(decoded.id);
    if (!user) {
      return res.status(401).json({
        status: 108,
        message: 'Token tidak valid atau kadaluarsa',
        data: null
      });
    }

    req.user = user;
    next();
  } catch (err) {
    return res.status(401).json({
      status: 108,
      message: 'Token tidak valid atau kadaluarsa',
      data: null
    });
  }
};