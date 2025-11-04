const { Service } = require('../models');

module.exports = {
  async getAllServices(req, res, next) {
    try {
      const services = await Service.findAll();

      return res.status(200).json({
        status: 0,
        message: 'Sukses',
        data: services
      });
    } catch (error) {
      next(error);
    }
  }
};