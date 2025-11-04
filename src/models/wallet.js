const { DataTypes, Model } = require('sequelize');

class Wallet extends Model {
  static initModel(sequelize) {
    Wallet.init({
      id: { type: DataTypes.UUID, defaultValue: DataTypes.UUIDV4, primaryKey: true },
      user_id: { type: DataTypes.UUID, allowNull: false },
      balance: { type: DataTypes.DECIMAL(18,2), defaultValue: 0 },
      currency: { type: DataTypes.STRING, defaultValue: 'IDR' }
    }, { sequelize, modelName: 'wallet', tableName: 'wallets', timestamps: true });
  }
}

module.exports = Wallet;