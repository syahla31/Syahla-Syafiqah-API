const { Wallet, Transaction } = require('../models');

module.exports = {
  async balance(req, res, next) {
    try {
      const wallet = await Wallet.findOne({ where: { user_id: req.user.id }});
      return res.json({ balance: Number(wallet.balance), currency: wallet.currency });
    } catch(err) { next(err) }
  },

  async topup(req, res, next) {
    try {
      const { amount, reference } = req.body;
      if (!amount || amount <= 0) return res.status(400).json({ error: 'Invalid amount' });
      const tx = await Transaction.create({
        user_id: req.user.id,
        type: 'TOPUP',
        service: 'TOPUP',
        amount,
        status: 'PENDING',
        payload: { reference }
      });
      
      return res.status(201).json({ transaction_id: tx.id, status: tx.status });
    } catch(err){ next(err) }
  }
};