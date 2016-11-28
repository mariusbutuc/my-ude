# [The Complete Elixir and Phoenix Bootcamp][on-udemy] » Notes

  1. [Reference repo][reference-repo]

  1. [There are no methods in Elixir—just **functions**][elixir-functions]:

    > There are no objects in Elixir (nor methods). If they are about structs, then they should be referred to as structs (or generally as data) (and use "functions" instead of "methods").

    –José Valim

  1. [List comprehension][list-comprehension]
    + create a list based on existing lists
    + _distinct_ from the use of map and filter functions

  1. We played with [Lists][docs-list], let's learn about [Tuples][docs-tuple]:

    > "like an array, where each index has a very special meaning"

    + the ordering / contract is in the developer's head!
    + can be seen as a key/value pair, where the key is the index

  1. Pattern Matching

    > Elixir's replacement for variable assignment

    + Elixir, as a language governed by its design
    + `=` starts the pattern matching sequence
      * create a mirror structure on the left hand side
        - matches the data structure
        - matches the number of values / elements
    + enables you to _avoid_ writing `if` statements
      * pattern matching in `case` statements

  1. The Elixir Ecosystem
    + **Code** we write » _fed into_ » **Elixir** » _transpiled into_ » **Erlang** » _compiled and executed on_ » **BEAM**
    + leveraging underlying Erlang modules:
      * `:erlang.term_to_binary/1`
      * `:erlang.binary_to_term/1`
      * `:file.format_error/1` —[thanks @pragdave][programming-elixir]

  1. Atoms
    + personally, I prefer the definition from [Programming Elixir 1.3][programming-elixir]

      > Atoms are constants that represent something’s name. […]  
      > An atom’s name is its value. Two atoms with the same name will always compare as being equal, even if they were created by different applications on two computers separated by an ocean.

  1. Unused variables
    + Elixir provides a friendly warning at compile time
    + Solution: underscore them: `_` or `_reason`

  1. The Pipe operator
    + [Joe Armstrong's explanation of the pipe operator][a-week-with-elixir] made the most sense for me:  

      > This is the recessive monadic gene of Prolog. The gene was dominant in Prolog, recessive in Erlang (son-of-prolog) but re-emerged in Elixir (son-of-son-of-prolog).
      > 
      > `x |> y*` means call `x` then take the output of `x` and add it as an extra argument to `y` in the first argument position.
      > 
      > So
      > ```elixir
      > x(1,2) |> y(a,b,c) 
      > ```
      > 
      > Means
      > ```elixir 
      > newvar = x(1,2); 
      > y(newvar,a,b,c);
      > ```

    + the key is to write functions that take consistent first arguments
      * the return of the previous function gets applied as the first argument in the subsequent function

  1. Documentation
    + [ExDoc][ex_doc]
      * `@moduledoc` for module documentation
      * `@doc` for function documentation
      * `mix docs` to generate


  [a-week-with-elixir]: http://joearms.github.io/2013/05/31/a-week-with-elixir.html#head_7
  [docs-list]: http://elixir-lang.org/docs/stable/elixir/List.html
  [docs-tuple]: http://elixir-lang.org/docs/stable/elixir/Tuple.html
  [elixir-functions]: https://elixirforum.com/t/there-are-no-methods-in-elixir-just-functions/2451
  [ex_doc]: https://github.com/elixir-lang/ex_doc
  [list-comprehension]: https://en.wikipedia.org/wiki/List_comprehension
  [on-udemy]: https://www.udemy.com/the-complete-elixir-and-phoenix-bootcamp-and-tutorial
  [programming-elixir]: https://pragprog.com/book/elixir13/programming-elixir-1-3
  [reference-repo]: https://github.com/StephenGrider/ElixirCode
