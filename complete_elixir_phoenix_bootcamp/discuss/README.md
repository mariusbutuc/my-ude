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
  1. Routing to the controller
    * restful: `new`, `create`, `index`, `delete`, `edit`, `update`
  1. Setting up the controller
    * `Discuss.TopicController`—singular
  1. Code reuse with `import`, `alias` and `use`
    * OOP Code reuse: class inheritance—`TopicController < ControllerBaseClass`
    * FP, Elixir-specific:
      - `import`: functions from the imported module are now part of the current module's public interface
      - `alias`: internally, lookup function names in the aliased module; _not_exposed as part of current module's public interface
      - `use`: used for very fancy setup… complicated?
    * in Phoenix
      - leverage the direct access to `web/web.ex` to share behaviour
  1. Phoenix's `Conn` Struct
    * `%Plug.Conn{}` – the total focal point of everything Phoenix is doing
  1. Models in Phoenix
    * Two requirements
      - declare a schema: enable Phoenix to understand what's happening inside of Phoenix
      - add validation logic: form errors will be displayed based on these
        + `changeset/2` function
          * `struct` represents our current state
          * `params` represents the desired state
        + `#Ecto.Changeset` struct
          * `changes` from where the record is now to where it needs to be
        + `validate_required`


  [materialize]: http://materializecss.com/getting-started.html
