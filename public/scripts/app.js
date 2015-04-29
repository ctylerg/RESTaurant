var app = app || {};

$(document).ready(function(){


  app.foods = new app.FoodCollection({
    model: app.FoodModel
  })

  app.parties = new app.PartyCollection({
    model: app.PartyModel
  })

  app.foodListPainter = new app.GeneralListView({
    modelView: app.FoodView,
    collection: app.foods,
    el: $('#menu-list'),
  });

  app.partyListPainter = new app.GeneralListView({
    modelView: app.PartyView,
    collection: app.parties,
    el: $('#party-list'),
  });

  app.parties.fetch();
  app.foods.fetch();



  $('#place-order').on('click', function(){
    var obj = {
      party_id: app.partySelection.attributes.id,
      food_id: app.foodSelection.attributes.id
    };
    console.log(obj);
    $.ajax({
      method: 'post',
      data: obj,
      url: '/api/orders',
      success: function() {
        app.parties.fetch( {reset: true} ); // Reset the party list... update all data

       $('.food-selected').removeClass('food-selected');  // remove selected class for style
       $('.party-selected').removeClass('party-selected');  // remove selected class for style
      }
    });

  });

});
