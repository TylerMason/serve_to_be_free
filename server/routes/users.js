const express = require('express')
const router = express.Router()
const User = require('../models/user.js')

//Getting all
router.get('/', async (req, res) => {
    try {
        console.log('in users')
        const users = await User.find()
        res.json(users)
    } catch (err) {
        res.status(500).json({ message: err.message })
    }
})

//creating one
router.post('/', async (req, res) => {
    console.log(req.body)
    const user = new User({
        firstName: req.body.firstName,
        lastName: req.body.lastName,
        password: req.body.password,
        email: req.body.email,
    })
    try {
        const newUser = await user.save()
        res.status(201).json(newUser)
    } catch (err) {
        res.status(400).json({ message: err.message })
        // res.json({ "test": "fail" })
    }
})

//Getting One
router.get('/:id', getUser, (req, res) => {
    res.json(res.user)
})

router.get('/:id/myPosts', getUser, (req, res) => {
    res.json(res.user)
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
        console.log(user)

        if (user == null) {
            return res.status(404).json({ message: 'cannot find user' })
        }
    } catch (err) {
        return res.status(500).json({ message: err.message })

    }
    console.log(user)

    res.user = user
    next()
}


module.exports = router