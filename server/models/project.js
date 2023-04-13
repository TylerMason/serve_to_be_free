const mongoose = require('mongoose');

const projectSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true
  },
  description: {
    type: String,
    required: true
  },
  members: [{
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  }],
  postIds: [{
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Post',
    required: false
  }],
  profileImage: {
    type: String,
    required: true
  },
  coverPhoto: {
    type: String,
    required: true
  }
});

module.exports = mongoose.model('Project', projectSchema);
