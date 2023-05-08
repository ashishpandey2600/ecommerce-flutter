const { Schema, model } = require('mongoose');
const uuid = require('uuid');
const bcrypt = require('bcrypt');

const userSchema = new Schema({
    id: { type: String, unique: true },
    fullName: { type: String, default: "" },
    email: { type: String, unique: true, required: true },
    password: { type: String, required: true },
    phoneNumber: { type: String, default: "" },
    address: { type: String, default: "" },
    city: { type: String, default: "" },
    state: { type: String, default: "" },
    profileProgress: { type: Number, default: 0 },
    //0-> account created, 1 hai to adderss daldiya tohompage to ja sakte ho- kind on status
    updated: { type: Date },
    createdOn: { type: Date }


});
//findone function

userSchema.pre('save', function (next) {
    this.id = uuid.v1();
    this.updatedOn = new Date();
    this.createdOn = new Date();

    //Hash the password
    const salt = bcrypt.genSaltSync(10);
    const hash = bcrypt.hash(this.password, salt);
    this.password = hash;
    next();
});

userSchema.pre(['update', 'findOneAndUpdate', 'UpdateOne'], function (next) {
    const update = this.getUpdate();
    delete update._id;
    delete update.id;

    this.updatedOn = new Date();

    next();
});

const UserModel = model('user', userSchema);

module.exports = UserModel;

