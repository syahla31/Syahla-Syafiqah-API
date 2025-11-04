require('dotenv').config();
const { sequelize, User, Wallet } = require('../models');

(async () => {
  try {
    console.log('Syncing database...');
    await sequelize.sync();

    console.log('Seeding wallets...');

    const users = await User.findAll();

    if (!users.length) {
      console.log('Tidak ada user di database. Jalankan seeder user dulu.');
      process.exit(0);
    }

    for (const user of users) {
      const existingWallet = await Wallet.findOne({ where: { user_id: user.id } });

      if (!existingWallet) {
        await Wallet.create({
          user_id: user.id,
          balance: 1000000,
          currency: 'IDR'
        });
        console.log(`Wallet dibuat untuk user ${user.email}`);
      } else {
        console.log(`Wallet sudah ada untuk user ${user.email}`);
      }
    }

    console.log('Wallet seeding selesai!');
    process.exit(0);
  } catch (err) {
    console.error('Error seeding wallets:', err);
    process.exit(1);
  }
})();