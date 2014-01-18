config =
  detailedErrors: true
  debug: true
  hostname: null
  port: 4000
  model: 
    defaultAdapter: 'mongo'
  sessions:
    store: 'memory'
    key: 'sid'
    expiry: 14 * 24 * 60 * 60
  db:
    mongo:
      username: null, dbname: 'production', prefix: null, password: null, host: 'localhost', port: 27017
    

module.exports = config


