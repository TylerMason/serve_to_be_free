require('dotenv').config()


// Import the mongoose module
const express = require('express')
const app = express()
const mongoose = require("mongoose");

mongoose.set('strictQuery', false);

// Define the database URL to connect to.
const mongoDB = process.env.DATABASE_URL;

// Wait for database to connect, logging an error if there is a problem 
main().catch(err => console.log(err));
async function main() {
    await mongoose.connect(mongoDB);
}

const db = mongoose.connection
db.on('error', (error) => console.log(error))
db.on('open', () => console.log('Connected to database'))

app.use(express.json())

const usersRouter = require('./routes/users.js')
const projectsRouter = require('./routes/projects.js')
app.use('/users', usersRouter)
app.use('/projects', projectsRouter)


app.listen(3000, () => console.log('Server Started'))


