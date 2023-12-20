 const CartModel = require('./../models/cart_model');

 const CartController = {

  getCartForUser: async function(req,res){

    try{
        const user = req.params.user;
        const foundCart = await CartModel.findOne({ user: user});
        if(!foundCart){
            return res.json({ success: true,data: []});
        }
        return res.json({ success: true,data: foundCart.items});
    }catch(ex){
        return res.json({ success: false,data: foundCart, message:" Product added to cart"});
    }
},
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
        try{
            const { user, product} =req.body;
            const updatedCart = await CartModel.findOneAndUpdate(
                { user: user},
                { $pull: {items: { product: product } } },
                { new: true }

            );
            return res.json({ success: true,data: updatedCart, message:" Product removed from cart"});

        }catch(ex){
            return res.json({ success: false, message:ex});
        }


    }

 };
 module.exports = CartController;