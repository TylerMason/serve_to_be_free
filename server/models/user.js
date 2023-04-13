const mongoose = require('mongoose')

const userSchema = new mongoose.Schema({
    username: { type: String, required: true },
    password: { type: String, required: true },
    email: { type: String, required: true },
    firstName: { type: String, required: true },
    lastName: { type: String, required: true },
    projects: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Project' }],
    friends: [{ type: mongoose.Schema.Types.ObjectId, ref: 'User' }],
  });
  
  const User = mongoose.model('User', userSchema);
  
  module.exports = User;
  