const { Wallet } = require('../models');

module.exports = {
  async getBalance(req, res, next) {
    try {
      const user = req.user; // dari middleware auth

      // Cari wallet berdasarkan user_id
      const wallet = await Wallet.findOne({
        where: { user_id: user.id }
      });

      if (!wallet) {
        return res.status(404).json({
          status: 404,
          message: 'Wallet tidak ditemukan',
          data: null
        });
      }

      return res.status(200).json({
        status: 0,
        message: 'Get Balance Berhasil',
        data: {
          balance: wallet.balance
        }
      });
    } catch (error) {
      next(error);
    }
  }
};