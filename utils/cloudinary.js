const cloudinary = require("cloudinary").v2;
cloudinary.config({ 
  cloud_name: 'df70bjmnu', 
  api_key: '938991976946237', 
  api_secret: 'xj-LdTtN5AY2_uf5pOeMDt6Mb9E' 
});
module.exports = cloudinary;