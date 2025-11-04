const { Wallet, Transaction, User } = require('../models');

exports.topUp = async (req, res) => {
  try {
    const { top_up_amount } = req.body;

    if (isNaN(top_up_amount) || Number(top_up_amount) <= 0) {
      return res.status(400).json({
        status: 102,
        message: "Paramter amount hanya boleh angka dan tidak boleh lebih kecil dari 0",
        data: null
      });
    }

    const userId = req.user.id;

    const wallet = await Wallet.findOne({ where: { user_id: userId } });
    if (!wallet) {
      return res.status(404).json({
        status: 101,
        message: "Wallet tidak ditemukan",
        data: null
      });
    }

    wallet.balance = Number(wallet.balance) + Number(top_up_amount);
    await wallet.save();

    await Transaction.create({
      user_id: userId,
      transaction_type: 'TOPUP',
      amount: top_up_amount,
      description: 'Top up saldo'
    });

    return res.status(200).json({
      status: 0,
      message: "Top Up Balance berhasil",
      data: {
        balance: Number(wallet.balance)
      }
    });
  } catch (error) {
    console.error("❌ Error di topup:", error);
    return res.status(500).json({
      status: 500,
      message: "Internal Server Error",
      data: null
    });
  }
};