//creating my namespace

var app = app || {};

//model
app.FoodModel = Backbone.Model.extend();


//template


//modelView

// collection

app.FoodList = Backbone.Collection.extend({
  url: '/api/foods',
  model: app.FoodModel
});

//collectionView

app.FoodListView = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.collection, "sync", this.render);
  },
  render: function() {
    var foodCount = this.collection.models.length;
    for (var i = 0; i < foodCount.length; i++) {
      var food = this.collection.models[i];
      var view = new app.FoodCardView({model: model});
      view.render();
    }
  }
});
// );
$(document).ready(function() {

});
