var app = app || {};

$(document).ready(function() {
  app.foods = new app.FoodCollection({
    model: app.FoodModel
  });

  app.foods.fetch();

})
