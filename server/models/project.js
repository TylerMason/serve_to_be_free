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
  city: {
    type: String,
    required: false
  },
  state: {
    type: String,
    required: false
  },
  date: {
    type: String,
    required: false
  },
  members: {
    type: [String]
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
        },
        date: {
          type: String,
          required: true
        },
        imageUrl: {
          type: String,
          required: false
        }
      }
    ],
    required: false,
  },
  projectPicture: {
    type: String,
    required: true
  },
  sponsors: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Sponsor' }]

});

module.exports = mongoose.model('Project', projectSchema);
