const { Wallet, Transaction, Service } = require('../models');
const { v4: uuidv4 } = require('uuid');

exports.createTransaction = async (req, res) => {
  try {
    const { service_code } = req.body;

    // 🔍 Validasi input
    if (!service_code) {
      return res.status(400).json({
        status: 102,
        message: "Service ataus Layanan tidak ditemukan",
        data: null
      });
    }

    // 🔒 Ambil user dari JWT
    const user = req.user;

    // 🔍 Cari layanan berdasarkan service_code
    const service = await Service.findOne({ where: { service_code } });
    if (!service) {
      return res.status(400).json({
        status: 102,
        message: "Service ataus Layanan tidak ditemukan",
        data: null
      });
    }

    // 💰 Ambil wallet user
    const wallet = await Wallet.findOne({ where: { user_id: user.id } });
    if (!wallet) {
      return res.status(404).json({
        status: 101,
        message: "Wallet tidak ditemukan",
        data: null
      });
    }

    // ⚖️ Cek saldo cukup
    const tariff = Number(service.service_tariff);
    if (Number(wallet.balance) < tariff) {
      return res.status(400).json({
        status: 103,
        message: "Saldo tidak mencukupi",
        data: null
      });
    }

    // 💸 Kurangi saldo
    wallet.balance = Number(wallet.balance) - tariff;
    await wallet.save();

    // 🧾 Generate invoice number unik
    const invoiceNumber = `INV${Date.now()}-${uuidv4().slice(0, 5).toUpperCase()}`;

    // 🧠 Simpan transaksi
    const transaction = await Transaction.create({
      user_id: user.id,
      transaction_type: 'PAYMENT',
      invoice_number: invoiceNumber,
      service_code: service.service_code,
      service_name: service.service_name,
      total_amount: tariff,
      description: `Pembayaran ${service.service_name}`
    });

    // ✅ Response sukses
    return res.status(200).json({
      status: 0,
      message: "Transaksi berhasil",
      data: {
        invoice_number: transaction.invoice_number,
        service_code: service.service_code,
        service_name: service.service_name,
        transaction_type: 'PAYMENT',
        total_amount: tariff,
        created_on: transaction.createdAt
      }
    });
  } catch (error) {
    console.error("❌ Error di transaksi:", error);
    return res.status(500).json({
      status: 500,
      message: "Internal Server Error",
      data: null
    });
  }
};

exports.getTransactionHistory = async (req, res) => {
  try {
    const userId = req.user.id;
    const { limit, offset } = req.query;

    // Query dasar
    const queryOptions = {
      where: { user_id: userId },
      order: [['createdAt', 'DESC']], 
    };

    if (limit) queryOptions.limit = parseInt(limit);
    if (offset) queryOptions.offset = parseInt(offset);

    const transactions = await Transaction.findAll(queryOptions);

    const records = transactions.map((trx) => ({
      invoice_number: trx.invoice_number,
      transaction_type: trx.transaction_type,
      description: trx.description,
      total_amount: parseFloat(trx.total_amount),
      created_on: trx.createdAt
    }));

    return res.status(200).json({
      status: 0,
      message: 'Get History Berhasil',
      data: {
        offset: offset ? parseInt(offset) : 0,
        limit: limit ? parseInt(limit) : null,
        records
      }
    });

  } catch (error) {
    console.error('❌ Error getTransactionHistory:', error);
    return res.status(500).json({
      status: 500,
      message: 'Internal Server Error',
      data: null
    });
  }
};