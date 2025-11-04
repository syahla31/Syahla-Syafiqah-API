const { User } = require('../models');

module.exports = {
  async getProfile(req, res, next) {
    try {
      const user = req.user;
      return res.status(200).json({
        status: 0,
        message: 'Sukses',
        data: {
          email: user.email,
          first_name: user.first_name,
          last_name: user.last_name,
          profile_image: user.profile_image || 'https://yoururlapi.com/profile.jpg'
        }
      });
    } catch (err) {
      next(err);
    }
  },

  async updateProfile(req, res, next) {
    try {
      const user = req.user;
      const { first_name, last_name } = req.body;

      // update ke database
      user.first_name = first_name || user.first_name;
      user.last_name = last_name || user.last_name;
      await user.save();

      return res.status(200).json({
        status: 0,
        message: 'Update Profile berhasil',
        data: {
          email: user.email,
          first_name: user.first_name,
          last_name: user.last_name,
          profile_image: user.profile_image || 'https://yoururlapi.com/profile.jpg'
        }
      });
    } catch (err) {
      next(err);
    }
  },
  async updateProfileImage(req, res, next) {
    try {
      const user = req.user;

      if (!req.file) {
        return res.status(400).json({
          status: 102,
          message: 'Format Image tidak sesuai',
          data: null
        });
      }

      // buat base URL otomatis
      const baseUrl = `${req.protocol}://${req.get('host')}`;
      const filePath = `/uploads/profile/${req.file.filename}`;

      // simpan ke database
      user.profile_image = filePath;
      await user.save();

      return res.status(200).json({
        status: 0,
        message: 'Update Profile Image berhasil',
        data: {
          email: user.email,
          first_name: user.first_name,
          last_name: user.last_name,
          profile_image: `${baseUrl}${filePath}`
        }
      });
    } catch (err) {
      next(err);
    }
  }
};