const { DataTypes, Model } = require('sequelize');

class Transaction extends Model {
  static initModel(sequelize) {
    Transaction.init({
      id: { type: DataTypes.UUID, defaultValue: DataTypes.UUIDV4, primaryKey: true },
      user_id: { type: DataTypes.UUID, allowNull: false },
      transaction_type: { type: DataTypes.STRING, allowNull: false },
      invoice_number: { type: DataTypes.STRING },
      service_code: { type: DataTypes.STRING },
      service_name: { type: DataTypes.STRING },
      total_amount: { type: DataTypes.DECIMAL(18,2) },
      description: { type: DataTypes.STRING }
    }, {
      sequelize,
      modelName: 'transaction',
      tableName: 'transactions',
      timestamps: true
    });
  }
}

module.exports = Transaction;