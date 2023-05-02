const CategoryRoutes = require('express').Router();
const  CategoryContoller = require('./../controllers/category_controller');



CategoryRoutes.get("/", CategoryContoller.fetchAllCategory);
CategoryRoutes.post("/", CategoryContoller.createCategory);
CategoryRoutes.get("/:id",CategoryContoller.fetchCategoryById);


module.exports = CategoryRoutes;