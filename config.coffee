module.exports =
  port: process.env.PORT || '9000',
  host: process.env.HOST || '0.0.0.0'
  dist_manifest_path: __dirname + '/public/dist/rev-manifest'
  mongo_url: 'mongodb://localhost/whiteboard'
  auth_facebook:
    client_id: '705809039469055'
    client_secret: 'c890d8a891cc4925ec39796f9162f141'
    callback_url: 'http://localhost:5000/auth/facebook/callback'