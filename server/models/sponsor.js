const { ObjectId } = require('mongodb');
const mongoose = require('mongoose')

const sponsorSchema = new mongoose.Schema({
    Name: { type: String, required: true },
    Amount: { type: String, required: true },
    
  });
  
  const Sponsor = mongoose.model('Sponsor', sponsorSchema);
  
  module.exports = Sponsor;
  