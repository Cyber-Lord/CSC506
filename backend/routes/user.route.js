const express = require('express')
const User = require('../models/user.model')
const router = express.Router()

router.post('/signup',(req,res)=>{
    User.findOne({email:req.body.email},(err,user)=>{
        if(err){
            console.log(err)
            res.json(err)
        }
        else{
            if(user == null){
                const user = User({
                    email:req.body.email,
                    password:req.body.password
                })
                user.save()
                .then((err)=>{
                    if(err){
                        console.log(err)
                        res.json(err)
                    }
                    else{
                        console.log(user)
                        res.json(user)
                    }
                })
            }
          else{
            res.json({
                message:'email is not available'
            })
          }
        }
    })
})

router.post('/signin',(req,res)=>{
    User.findOne({email:req.body.email,password:req.body.password,phone:req.body.phone,address:req.body.address},(err,user)=>{
        if(err){
            console.log(err)
            res.json(err)
        }
        else{
            res.json(user)
        }
    })
})    
/* router.get('/',(req,res)=>{
    console.log('Hello World')
}) */

module.exports = router

