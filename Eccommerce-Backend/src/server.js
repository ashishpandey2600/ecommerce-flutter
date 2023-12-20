const express = require('express');
const bodyParser = require('body-parser');
const helmet = require('helmet');
const morgan = require('morgan');
const cors = require('cors');
const mongoose = require('mongoose');

const app = express(); 
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));
app.use(helmet());
app.use(morgan('dev'));
app.use(cors());
// Pls Turn off your hostel wifi then use mongo db after connecting the hosspot
mongoose.connect("mongodb+srv://ashishpandey2600:9461069794*aA@mycluster.nq3tqbx.mongodb.net/ecommercedatabse?retryWrites=true&w=majority");
// mongoose.connect("mongodb://atlas-sql-644c8011de3aee4c9e2277a2-ityvi.a.query.mongodb.net/ecommercedatabse?ssl=true&authSource=admin");

const UserRoutes = require('./routes/user_routes');
app.use("/api/user",UserRoutes);

const CategoryRoutes = require('./routes/category_routes');
app.use("/api/category",CategoryRoutes);

const ProductRoutes = require('./routes/product_routes');
app.use("/api/product",ProductRoutes);

const CartRoutes = require('./routes/cart_routes');
app.use("/api/cart",CartRoutes);

const OrderRoutes = require('./routes/order_routes');
app.use("/api/order",OrderRoutes);
 
const PORT = 5000;
app.listen(PORT,()=> console.log(`Server started at PORT: ${PORT}`));


//Users -> Model( structure and fields), Routes(Routes controller ke funciton ko call krta hai) and Controller