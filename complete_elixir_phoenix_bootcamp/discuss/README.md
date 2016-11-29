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


  [materialize]: http://materializecss.com/getting-started.html
