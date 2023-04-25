const mongoose = require('mongoose')

const commentSchema = new mongoose.Schema({
    content: { type: String, required: true },

    // number of likes from users. Does a like need to have a User attached to it?
    likes: { type: String, required: true },

    // Have to connect more comments to other comments
    comments: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Comment' }],

    // possible connection to a post that someone made in order to connect to a specific post
    post: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Post' }],
  });
  
  const Comment = mongoose.model('Comment', commentSchema);
  
  module.exports = Comment;
  