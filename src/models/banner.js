const { DataTypes, Model } = require('sequelize');

class Banner extends Model {
  static initModel(sequelize) {
    Banner.init({
      banner_name: {
        type: DataTypes.STRING,
        allowNull: false
      },
      banner_image: {
        type: DataTypes.STRING,
        allowNull: false
      },
      description: {
        type: DataTypes.TEXT,
        allowNull: true
      }
    }, {
      sequelize,
      modelName: 'Banner',
      tableName: 'banners',
      timestamps: false
    });
  }
}

module.exports = Banner;