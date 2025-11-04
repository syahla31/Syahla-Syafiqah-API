const { DataTypes, Model } = require('sequelize');

class Service extends Model {
  static initModel(sequelize) {
    Service.init({
      service_code: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true
      },
      service_name: {
        type: DataTypes.STRING,
        allowNull: false
      },
      service_icon: {
        type: DataTypes.STRING,
        allowNull: false
      },
      service_tariff: {
        type: DataTypes.INTEGER,
        allowNull: false
      }
    }, {
      sequelize,
      modelName: 'Service',
      tableName: 'services',
      timestamps: false
    });
  }
}

module.exports = Service;