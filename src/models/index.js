const sequelize = require('../config/db');
const User = require('./user');
const Wallet = require('./wallet');
const Transaction = require('./transaction');
const Banner = require('./banner');
const Service = require('./service');

User.initModel(sequelize);
Wallet.initModel(sequelize);
Transaction.initModel(sequelize);
Banner.initModel(sequelize);
Service.initModel(sequelize);

// Relasi
User.hasOne(Wallet, { foreignKey: 'user_id' });
Wallet.belongsTo(User, { foreignKey: 'user_id' });

User.hasMany(Transaction, { foreignKey: 'user_id' });
Transaction.belongsTo(User, { foreignKey: 'user_id' });

module.exports = { sequelize, User, Wallet, Transaction, Banner, Service };