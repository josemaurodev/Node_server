const mongoose = require("mongoose");

let dataSchema = new mongoose.Schema({
   'jnome': {
    require: true,
    type: String
   },
   'jclube': {
    require: true,
    type: String
   },
   'jcategoria': {
    require: true,
    type: String
   }
});

module.exports = mongoose.model("node_js", dataSchema);