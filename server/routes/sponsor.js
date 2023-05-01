const express = require('express')
const Sponsor = require('../models/sponsor.js')
const router = express.Router()

// Create a sponsor for a project
router.post('/:projectId/sponsors', getProject, async (req, res) => {
    try {
      const { amount } = req.body;
      
      // Create a new sponsor instance
      const sponsor = new Sponsor({
        amount,
        project: res.project._id,
        user: req.user._id, // Assuming req.user contains the user information
      });
      
      // Save the sponsor to the database
      const newSponsor = await sponsor.save();
      
      // Associate the sponsor with the project
      res.project.sponsors.push(newSponsor._id);
      await res.project.save();
      
      res.status(201).json(newSponsor);
    } catch (err) {
      res.status(400).json({ message: err.message });
    }
  });

  // Get project sponsors by project ID
router.get('/:projectId/sponsors', getProject, async (req, res) => {
    try {
      const sponsors = await Sponsor.find({ project: res.project._id });
      res.json(sponsors);
    } catch (err) {
      res.status(500).json({ message: err.message });
    }
  });
  
  


module.exports = router