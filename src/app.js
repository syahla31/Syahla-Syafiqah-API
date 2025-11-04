require('dotenv').config();
const express = require('express');
const morgan = require('morgan');
const helmet = require('helmet');
const cors = require('cors');
const path = require('path');

const { sequelize } = require('./models');
const authRoutes = require('./routes/auth.routes');
const walletRoutes = require('./routes/wallet.routes');
const txRoutes = require('./routes/transaction.routes');
const profileRoutes = require('./routes/profile.routes');
const bannerRoutes = require('./routes/banner.routes');
const serviceRoutes = require('./routes/service.routes');
const balanceRoutes = require('./routes/balance.routes');
const topupRoutes = require('./routes/topupRoutes');
const transactionRoutes = require('./routes/transaction.routes');

const app = express();
app.use(helmet());
app.use(cors());
app.use(morgan('dev'));
app.use(express.json());

// biar bisa akses gambar upload
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));

// routes
app.use('/api/auth', authRoutes);
app.use('/api/wallet', walletRoutes);
app.use('/api/profile', profileRoutes);
app.use('/api/banner', bannerRoutes);
app.use('/api/services', serviceRoutes);
app.use('/api/balance', balanceRoutes);
app.use('/api/topup', topupRoutes);
app.use('/api/transaction', transactionRoutes);

// error handler
app.use((err, req, res, next) => {
  console.error(err);
  res.status(err.status || 500).json({
    status: 500,
    message: err.message || 'Server error',
    data: null
  });
});

const PORT = process.env.PORT || 3000;
(async () => {
  await sequelize.sync({ alter: true });
  app.listen(PORT, () => console.log('Server running on', PORT));
})();