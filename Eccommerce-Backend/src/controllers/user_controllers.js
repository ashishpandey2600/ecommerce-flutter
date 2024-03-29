const UserModel = require('./../models/user_model');
const bcrypt = require('bcrypt');
const UserContoller = {


createAccount: async function(req,res){
            try{
                const userData = req.body;
                const newUser = new UserModel(userData);
                await newUser.save();
                return req.json({ success: true, data: newUser, message: "User created" });
            }
            catch(ex){
                return res.json({success: false,message: ex});
            }
          },

 signIn: async function(req,res){
    try{
        const{
            email,password
        }=req.body;
        const foundUser = await UserModel.findOne({email:email, password:password});
        if(!foundUser){
            return res.json({ success: false, message:"User not found!"});

        }
       const passwordsMatch=bcrypt.compare(password, foundUser.password);
       if(!passwordsMatch){
        return res.json({ success: false, message:"Incorrect password! "});
       }
       return res.json({success: true, data:foundUser});

    }catch(ex){
        return res.json({success: false,message: ex});

    }

 }
};



module.exports = UserContoller;
