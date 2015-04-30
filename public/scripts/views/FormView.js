// define an app namespace
var app = app || {};
// get our template as a string
  app.FormTemplate = $('#form-template').html();
  app.FormTwoTemplate = $('#comp-template').html();
// define a backbone view
app.FormView = Backbone.View.extend({
  tagName: "section",
  className: "styled-form",
  template: _.template(app.FormTemplate),
  events: {
    'click button': 'submit'
  },
  initialize: function() {
    this.render();
  },
  render: function() {
    // var data = this.model.attributes
    var data = {
      id: "myButton",
      submitValue: "Submit Food"
    };
    // render the html with data on the EL
    this.$el.html(this.template(data));
    // append this EL to the body
    $('body').append(this.$el);
  },
  submit: function() {
    console.log("Your form was submitted");
    var options = {
      name: $('#name').val(),
      cents: $('#cents').val(),
      cuisine: $('#cuisine').val()
    };
    console.log(options.name);

    /*$.ajax({
      method: "post",
      data: options,
      url: '/api/foods',
      dataType: 'json',
      success: function(data) {
        console.log("food submitted");
        console.log(data);
      },
      error: function(err) {
        console.log("food didn't get submitted");
        console.log(err);
      }
    });*/

    var submitModel = new Backbone.Model();
    submitModel.url = '/api/foods';
    submitModel.attributes = options;
    submitModel.save();

  }
});

app.FormTwoView = Backbone.View.extend({
  tagName: "section",
  className: "styled-form",
  template: _.template(app.FormTwoTemplate),
  events: {
    'click button': 'submit'
  },
  initialize: function() {
    this.render();
  },
  render: function() {
    // var data = this.model.attributes
    var data = {
      id: "myButtonTwo",
      submitValue: "Comp Food"
    };
    // render the html with data on the EL
    this.$el.html(this.template(data));
    // append this EL to the body
    $('body').append(this.$el);
  },
  submit: function() {
    console.log("Your food is about to be comped");
    var options = {
      name: $('#food_name').val(),
      cents: $('#food_cents').val(),
      free: $('#food_free').val()
    };
    console.log(options.name);


    var submitModel = new Backbone.Model();
    submitModel.url = '/api/parties';
    submitModel.attributes = options;
    submitModel.destroy();
  }
});

// once the full DOM has loaded...
$(document).ready(function() {

  app.myFormView = new app.FormView();
  app.myFormTwoView = new app.FormTwoView();

});
