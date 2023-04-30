const UserRoutes = require('express').Router();
const UserContoller = require('./../controllers/user_controllers');



UserRoutes.post("/createAccount",UserContoller.createAccount);
UserRoutes.post(".signIn",UserContoller.signIn);

module.exports = UserRoutes;