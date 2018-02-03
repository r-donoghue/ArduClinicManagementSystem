defmodule AgeCalc do
    @spec age(Ecto.Date.t, atom|{integer, integer, integer}) :: integer
    def age(%Ecto.Date{day: d, month: m, year: y}, as_of \\ :now) do
      do_age({y, m, d}, as_of)
    end
  
    ###########
    # Internals
    ###########
    @doc false
    def do_age(birthday, :now) do
      {today, _time} = :calendar.now_to_datetime(:erlang.now)
      calc_diff(birthday, today)
    end
    def do_age(birthday, date), do: calc_diff(birthday, date)
  
    @doc false
    def calc_diff({y1, m1, d1}, {y2, m2, d2}) when m2 > m1 or (m2 == m1 and d2 >= d1) do
      y2 - y1
    end
    def calc_diff({y1,_,_}, {y2,_,_}), do: (y2 - y1) - 1
  end