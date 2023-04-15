const mongoose = require('mongoose');

const projectSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true
  },
  privacy: {
    type: String,
    required: true
  },
  description: {
    type: String,
    required: true
  },
  posts: {
    type: [
      {
        member: {
          type: String,
          required: true
        },
        name: {
          type: String,
          required: true
        },
        text: {
          type: String,
          required: true
        }
      }
    ],
    required: false,
  },
  projectPicture: {
    type: String,
    required: true
  },
});

module.exports = mongoose.model('Project', projectSchema);
