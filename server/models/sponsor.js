const { ObjectId } = require('mongodb');
const mongoose = require('mongoose')

const sponsorSchema = new mongoose.Schema({
    amount: { type: String, required: true },
    user: {
        type: ObjectId,
        ref: 'User',
        required: true
      },

  });
  
  const Sponsor = mongoose.model('Sponsor', sponsorSchema);
  
  module.exports = Sponsor;
  