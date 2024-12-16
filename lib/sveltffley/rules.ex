defmodule Sveltffley.Rules do
  def list_rules do
    [
      %{
        id: 1,
        title: "The first rule",
        text: "The first rule of Raffley is you do not talk about Raffley."
      },
      %{
        id: 2,
        title: "The second rule",
        text: "The second rule of Raffley is you DO NOT talk about Raffley."
      },
      %{
        id: 3,
        title: "The third rule",
        text: "If someone says 'stop' or goes limp, taps out the raffle is over."
      },
      %{
        id: 4,
        title: "The fourth rule",
        text: "Only two guys to a raffle."
      },
      %{
        id: 5,
        title: "The fifth rule",
        text: "One raffle at a time."
      },
      %{
        id: 6,
        title: "The sixth rule",
        text: "No shirts, no shoes."
      }
    ]
  end
end
