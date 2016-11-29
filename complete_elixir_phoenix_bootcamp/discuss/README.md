# Discuss learnings of Phoenix

  1. intro
    * `mix phoenix.new discuss`
    * `mix ecto.create`
    * `mix phoenix.server`
    * live reload, enabled by default
  1. Server Side Templating
    * versus Single Page App
  1. Templates versus Layouts
    * Layout: base template, shared across pages
    * Bootstrap: baked in by default, but dated
    * Alternative: [Materialize CSS][materialize]
      - CSS only, no need for JS, yet
  1. MVC, or how to make muffins
    * not limited to OOP
      - batter: model — the content that the user syncs their teeth into
      - muffin pan: view — take that content and shovel it into the view, to make it look good
      - cook: controller — take the two components and make them work together: what type of muffins am I making in the first place?
  1. Exploring Router and Controller
  1. Views vs. Templates
    * naming conventions are critical
    * there is magic behind the scenes
    * `iex> Discuss.PageView.render("index.html")`
  1. The Model Layer
  1. Migrations
    * instruct Postgres about the types of data that it will have
    * `mix ecto.gen.migration add_topics`
    * `mix ecto.migrate`
  1. Postico
  1. Game Plan for adding new `Topic`s
    * need new URL for the user to visit » new _route_
    * new routes must map to a method in the controller » add new _method_ in _controller_…
    * need to show a form to the user » new _template_, that contains the form
    * need to translate the data in the form to something we can persist in the DB » create a `Topic` _model_


  [materialize]: http://materializecss.com/getting-started.html
