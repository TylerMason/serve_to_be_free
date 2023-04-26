const { ObjectId } = require('mongodb');
const mongoose = require('mongoose')

const userSchema = new mongoose.Schema({
  password: { type: String, required: true },
  email: { type: String, required: true },
  firstName: { type: String, required: true },
  lastName: { type: String, required: true },
  profilePictureUrl: { type: String, required: false },
  coverPictureUrl: { type: String, required: false },
  projects: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Project' }],
  friends: [{ type: mongoose.Schema.Types.ObjectId, ref: 'User' }],
  posts: [{type: ObjectId, ref: 'Post'}]
});

const User = mongoose.model('User', userSchema);

module.exports = User;
