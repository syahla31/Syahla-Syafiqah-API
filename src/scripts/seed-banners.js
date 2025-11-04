require('dotenv').config();
const { sequelize, Banner } = require('../models');

const banners = [
  {
    banner_name: 'Banner 1',
    banner_image: 'https://nutech-integrasi.app/dummy.jpg',
    description: 'Lorem ipsum dolor sit amet'
  },
  {
    banner_name: 'Banner 2',
    banner_image: 'https://nutech-integrasi.app/dummy.jpg',
    description: 'Lorem ipsum dolor sit amet'
  },
  {
    banner_name: 'Banner 3',
    banner_image: 'https://nutech-integrasi.app/dummy.jpg',
    description: 'Lorem ipsum dolor sit amet'
  },
  {
    banner_name: 'Banner 4',
    banner_image: 'https://nutech-integrasi.app/dummy.jpg',
    description: 'Lorem ipsum dolor sit amet'
  },
  {
    banner_name: 'Banner 5',
    banner_image: 'https://nutech-integrasi.app/dummy.jpg',
    description: 'Lorem ipsum dolor sit amet'
  }
];

(async () => {
  try {
    console.log('Syncing database...');
    await sequelize.sync({ alter: true }); 

    console.log('Seeding banners...');
    await Banner.bulkCreate(banners, { ignoreDuplicates: true });

    console.log('Seeding banners done!');
    process.exit(0);
  } catch (err) {
    console.error('Error seeding banners:', err);
    process.exit(1);
  }
})();