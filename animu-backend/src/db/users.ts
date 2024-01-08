import mongoose from "mongoose";
import bcrypt from 'bcrypt';
import "dotenv/config";

export const UserSchema = new mongoose.Schema({
  username: {
    type: String,
    required: [true, 'Please provide username'],
    maxlength: 50,
    minlength: 3,
  },
  email: {
    type: String,
    required: [true, 'Please provide email'],
    match: [
      /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/,
      'Please provide a valid email',
    ],
    unique: true,
  },
  password: {
    type: String,
    required: [true, 'Please provide password'],
    minlength: [6, 'Password length should be greater than 6'],
    select:false
  }
},{timestamps:true});


UserSchema.pre('save', async function (next) {
  if (!this.isModified('authentication.password')) return;
  const salt = await bcrypt.genSalt(10);
  this.password = await bcrypt.hash(this.password, salt);
  next();
});
export const UserModel = mongoose.model("users", UserSchema);

export const getUsers = () => UserModel.find();
export const getUserByEmail = (email: String) =>
  UserModel.findOne({ email :email });
export const getUserByUsername = (username: String) =>
  UserModel.findOne({ username :username });
export const getUserById = (id: String) => UserModel.findById(id);
export const createUser = (values: Record<string, any>) =>
  new UserModel(values).save().then((user) => user.toObject());
export const deleteUserById = (id: String) => UserModel.findOneAndDelete(id);
export const updateUser = (id: String, values: Record<string, any>) =>
  UserModel.findByIdAndUpdate(id, values);
