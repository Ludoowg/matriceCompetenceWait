require('dotenv').config();
const knex = require('knex');


///Connect database function and export it 

module.exports = function () {

    return knex({
        client: 'mysql',
        connection: {
            host: process.env.DATABASE_HOST,
            user: process.env.DATABASE_USER,
            password: process.env.DATABASE_PASSWORD,
            database: process.env.DATABASE_NAME
        }
    })
}