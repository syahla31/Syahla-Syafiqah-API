const { DataTypes, Model } = require('sequelize');

class User extends Model {
  static initModel(sequelize) {
    User.init({
      id: { type: DataTypes.UUID, defaultValue: DataTypes.UUIDV4, primaryKey: true },
      name: { type: DataTypes.STRING },
      email: { type: DataTypes.STRING, allowNull: false, unique: true },
      password_hash: { type: DataTypes.STRING, allowNull: false }
    }, { sequelize, modelName: 'user', tableName: 'users', timestamps: true });
  }
}

module.exports = User;