 const CartModel = require('./../models.cart_model');

 const CartController = {

    addToCart: async function(req,res){

        try{
            const { product, user, quantity} = req.body;

            const foundCart = await CartModel.findOne({ user: user});

            //if cart does not exists
            if(!foundCart){
                const newCart = new CartModel({ user: user});
                newCart.items.push({
                    product: product,
                    quantity: quantity
                });
                await newCart.save();
                return res.json({ success: true,data: newCart, message:" Product added to cart"});
             }
            
             // If cart already exists
          const updatedCart =    await CartModel.findOneAndUpdate(
                {
                    user: user

                },
                { $push : { items: { product: product, quantity: quantity }}},
                { new: true},// returns new updated version of this cart
             );
             
             return res.json({ success: true,data: updatedCart, message:" Product added to cart"});


        }
        catch(ex){
            return res.json({ success: false, message:ex});

        }

    },

    removeFromCart: async function(req,res){

        

    }

 };