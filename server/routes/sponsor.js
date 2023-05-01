const express = require('express')
const Sponsor = require('../models/sponsor.js')
const router = express.Router()

// Create a sponsor for a project
// router.post('/:projectId/sponsors', getProject, async (req, res) => {
//     try {
//       const { amount } = req.body;
      
//       // Create a new sponsor instance
//       const sponsor = new Sponsor({
//         amount,
//         project: res.project._id,
//         user: req.user._id, // Assuming req.user contains the user information
//       });
      
//       // Save the sponsor to the database
//       const newSponsor = await sponsor.save();
      
//       // Associate the sponsor with the project
//       res.project.sponsors.push(newSponsor._id);
//       await res.project.save();
      
//       res.status(201).json(newSponsor);
//     } catch (err) {
//       res.status(400).json({ message: err.message });
//     }
//   });

//   // Get project sponsors by project ID
//     router.get('/:projectId', getProject, async (req, res) => {
//         try {
//         const sponsors = await Sponsor.find({ project: res.project._id });
//         res.json(sponsors);
//         } catch (err) {
//         res.status(500).json({ message: err.message });
//         }
//     });
    router.get('/:id', getSponsor, (req, res) => {
        res.json(res.sponsor)
    })
    async function getSponsor(req, res, next) {
        let sponsor
        try {
            sponsor = await Sponsor.findById(req.params.id);
    
            if (sponsor == null) {
                return res.status(404).json({ message: 'cannot find sponsor' })
            }
        } catch (err) {
            return res.status(500).json({ message: err.message })
    
        }
    
        res.sponsor = sponsor
        next()
    }
  
  


module.exports = router