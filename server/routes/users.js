const express = require('express')
const router = express.Router()
const User = require('../models/user.js')
const Project = require('../models/project.js');



//Getting all
router.get('/', async (req, res) => {
    try {
        const users = await User.find()
        res.json(users)
    } catch (err) {
        res.status(500).json({ message: err.message })
    }
})

router.get('/numMembers', async (req, res) => {
    try {
        const users = await User.find()
        res.json({ numUsers: users.length })
    } catch (err) {
        res.status(500).json({ message: err.message })
    }
})


// Works?
router.put('/:id/updateProfilePic', async (req, res) => {
    try {
        const user = await User.findById(req.params.id);
        user.profilePictureUrl = req.body.profilePictureUrl;
        const updatedUser = await user.save();
        res.status(200).json(updatedUser);
    } catch (err) {
        console.log(err);
        res.status(400).json({ message: err.message });
    }
});

router.put('/:id/updateUser', async (req, res) => {
    try {
        const user = await User.findById(req.params.id);
        const updatedUser = await User.findByIdAndUpdate(
            req.params.id,
            { ...user.toObject(), ...req.body },
            { new: true }
        );
        res.status(200).json(updatedUser);
    } catch (err) {
        console.log(err);
        res.status(400).json({ message: err.message });
    }
});


//creating one
router.post('/', async (req, res) => {
    // console.log(req.body)
    const user = new User({
        firstName: req.body.firstName,
        lastName: req.body.lastName,
        password: req.body.password,
        email: req.body.email,
        profilePictureUrl: req.body.profilePictureUrl,
        coverPictureUrl: req.body.coverPictureUrl,
        projects: req.body.projects,
        friends: req.body.friends,
        posts: req.body.posts
    })
    try {
        const newUser = await user.save()
        res.status(201).json(newUser)
    } catch (err) {
        console.log(err, 'o')
        res.status(400).json({ message: err.message })
        // res.json({ "test": "fail" })
    }
})

//Getting One
router.get('/:id', getUser, (req, res) => {
    res.json(res.user)
})

router.get('/:id/myPosts', getUser, async (req, res) => {
    let myPosts = []
    let projects = await Project.find()

    for (proj of projects) {

        for (member of proj.members) {
            if (req.params.id == member) {
                myPosts = [...myPosts, ...proj.posts];
            }
        }
    }
    myPosts = myPosts.sort((a, b) => {
        let aDate = new Date(a.date)
        let bDate = new Date(b.date)
        if (aDate == "Invalid Date") { return 1 }
        if (bDate == "Invalid Date") { return -1 }

        return new Date(b.date) - new Date(a.date)
    });

    myPosts = myPosts.map((post) => {
        const postDate = new Date(post.date)
        if (isNaN(postDate)) {
            return post
        }
        let newObj = post
        const dateString = postDate.toLocaleDateString()
        const timeString = postDate.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })
        newObj.date = `${dateString} ${timeString}`
        console.log(newObj)
        return newObj
    })
    console.log(myPosts)
    res.json(myPosts)
})


//get one by username
router.get('/username/:username', async (req, res) => {
    try {
        const user = await User.findOne({ username: req.params.username })
        if (user == null) {
            return res.status(404).json({ message: 'cannot find user' })

        }
        res.json(user)
    } catch (err) {
        res.status(500).json({ message: err.message })

    }
})

//get one by email
router.get('/email/:email', async (req, res) => {
    try {
        const user = await User.findOne({ email: req.params.email })
        if (user == null) {
            return res.status(404).json({ message: 'cannot find user' })

        }
        res.json(user)
    } catch (err) {
        res.status(500).json({ message: err.message })

    }
})
//updating one
router.patch('/:id', getUser, async (req, res) => {
    if (req.body.username != null) {
        res.user.username = req.body.username
    }
    if (req.body.password != null) {
        res.user.password = req.body.password
    }
    if (req.body.email != null) {
        res.user.email = req.body.email
    }
    try {
        const updatedUser = await res.user.save()
        res.json(updatedUser)
    } catch (err) {
        res.status(400).json({ message: err.message })
    }
})

//deleting one
router.delete('/:id', getUser, async (req, res) => {
    try {
        await res.user.remove()
        res.json({ message: `Removed subscriber ${res.user.username}` })
    } catch (err) {
        res.status(500).json({ message: err.message })
    }
})

async function getUser(req, res, next) {
    let user
    try {
        user = await User.findById(req.params.id);

        if (user == null) {
            return res.status(404).json({ message: 'cannot find user' })
        }
    } catch (err) {
        return res.status(500).json({ message: err.message })

    }

    res.user = user
    next()
}


module.exports = router