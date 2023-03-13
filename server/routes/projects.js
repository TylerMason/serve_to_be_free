const express = require('express');
const router = express.Router();
const Project = require('../models/project.js');

// Get all projects
router.get('/', async (req, res) => {
  try {
    console.log('in')
    const projects = await Project.find();
    res.json(projects);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

// Get one project
router.get('/:id', getProject, (req, res) => {
  res.json(res.project);
});

// Create a project
router.post('/', async (req, res) => {
  const project = new Project({
    name: req.body.name,
    description: req.body.description,
    members: req.body.members,
    posts: req.body.posts
  });

  try {
    const newProject = await project.save();
    res.status(201).json(newProject);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
});

// Update one project
router.patch('/:id', getProject, async (req, res) => {
  if (req.body.name != null) {
    res.project.name = req.body.name;
  }

  if (req.body.description != null) {
    res.project.description = req.body.description;
  }

  if (req.body.members != null) {
    res.project.members = req.body.members;
  }

  if (req.body.posts != null) {
    res.project.posts = req.body.posts;
  }

  try {
    const updatedProject = await res.project.save();
    res.json(updatedProject);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
});

// Delete one project
router.delete('/:id', getProject, async (req, res) => {
  try {
    await res.project.remove();
    res.json({ message: `Removed project ${res.project.name}` });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

async function getProject(req, res, next) {
  let project;

  try {
    project = await Project.findById(req.params.id);

    if (project == null) {
      return res.status(404).json({ message: 'Cannot find project' });
    }
  } catch (err) {
    return res.status(500).json({ message: err.message });
  }

  res.project = project;
  next();
}

module.exports = router;
