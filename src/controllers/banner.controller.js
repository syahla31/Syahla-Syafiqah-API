const { Banner } = require('../models');

module.exports = {
  async getBanner(req, res, next) {
    try {
      const data = await Banner.findAll({
        attributes: ['banner_name', 'banner_image', 'description']
      });

      return res.status(200).json({
        status: 0,
        message: 'sukses',
        data
      });
    } catch (err) {
      next(err);
    }
  }
};