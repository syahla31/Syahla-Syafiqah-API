const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const { User, Wallet } = require('../models');

const SALT = parseInt(process.env.SALT_ROUNDS || '10');

module.exports = {
  async register(req, res, next) {
    try {
      const { email, first_name, last_name, password } = req.body;

      // Validasi input
      if (!email || !first_name || !last_name || !password) {
        return res.status(400).json({
          status: 101,
          message: "Parameter tidak lengkap",
          data: null
        });
      }

      // Validasi format email
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      if (!emailRegex.test(email)) {
        return res.status(400).json({
          status: 102,
          message: "Parameter email tidak sesuai format",
          data: null
        });
      }

      // Cek apakah email sudah terdaftar
      const exists = await User.findOne({ where: { email }});
      if (exists) {
        return res.status(400).json({
          status: 103,
          message: "Email sudah digunakan",
          data: null
        });
      }

      // Hash password dan simpan user
      const hash = await bcrypt.hash(password, SALT);
      const user = await User.create({
        first_name,
        last_name,
        email,
        password_hash: hash
      });

      // Buat wallet default
      await Wallet.create({ user_id: user.id, balance: 0.00 });

      // Respons sukses
      return res.status(200).json({
        status: 0,
        message: "Registrasi berhasil silahkan login",
        data: null
      });

    } catch (err) {
      console.error(err);
      return res.status(500).json({
        status: 500,
        message: "Terjadi kesalahan pada server",
        data: null
      });
    }
  },

  async login(req, res, next) {
    try {
      const { email, password } = req.body;

      if (!email || !password) {
        return res.status(400).json({
          status: 102,
          message: "Parameter tidak lengkap",
          data: null
        });
      }

      // validasi format email
      if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
        return res.status(400).json({
          status: 102,
          message: "Parameter email tidak sesuai format",
          data: null
        });
      }

      const user = await User.findOne({ where: { email } });
      if (!user) {
        return res.status(401).json({
          status: 103,
          message: "Username atau password salah",
          data: null
        });
      }

      const ok = await bcrypt.compare(password, user.password_hash);
      if (!ok) {
        return res.status(401).json({
          status: 103,
          message: "Username atau password salah",
          data: null
        });
      }

      const token = jwt.sign(
        { id: user.id, email: user.email },
        process.env.JWT_SECRET,
        { expiresIn: '7d' }
      );

      return res.status(200).json({
        status: 0,
        message: "Login Sukses",
        data: { token }
      });

    } catch (err) {
      next(err);
    }
  }
};