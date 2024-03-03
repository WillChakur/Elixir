defmodule Membership do
  defstruct [:type, :price]
end

defmodule User do
  defstruct [:name, :membership]
end

defmodule Example do
  use Application

  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
    #Supervisor it`s a process that supervise other processes called child process
    #It`s has the power to restart any child process
    #The list in the parameters indicates the child process, in this case we don`t have none
  end

  def main do
    name = "William"
    status = Enum.random([:gold, :silver, :bronze, :"not a member"])


    #Using the structs
    gold_membership = %Membership{type: :gold, price: 25}
    silver_membership = %Membership{type: :silver, price: 15}

    users_struct_data = [
      %User{name: "William", membership: gold_membership},
      %User{name: "Jackieline", membership: gold_membership},
      %User{name: "Felipe", membership: silver_membership}
    ]

    if status === :gold do
      IO.puts("Welcome to the fancy lounge #{name}")
    else
      IO.puts("You are not allowed to be here")
    end

    #If we don`t want to use the if, we can use the case
    case status do
      :gold -> IO.puts("Welcome to the fancy lounge #{name}")
      :"not a member" -> IO.puts("Get Subscribe")
      _ -> IO.puts("You are not allowed to be here")
    end

    #Times
    time = Time.new!(19, 51, 0, 0)
    date = Date.new!(2024, 3, 2)
    date_time = DateTime.new!(date, time, "Etc/UTC")
    #We need to use the inspect because there is more than one parameter
    IO.inspect(date_time)

    #Tuples Immutable, to add an item we need to use append
    #We can mix types

    memberships = {:bronze, :silver}
    memberships_att = Tuple.append(memberships, :gold)
    IO.inspect(memberships_att)

    prices = {5, 10, 15}
    avg = Tuple.sum(prices) / tuple_size(prices)
    IO.puts(avg)

    user1 = {"William", :gold}

    IO.inspect(user1)

    #Indexing Tuples

    IO.puts("Available memberships: #{elem(memberships_att, 0)} #{elem(memberships_att, 1)} #{elem(memberships_att, 2)}")

    #Loop
    #We are using a list of tuples
    users = [
      {"William", :gold},
      {"Jackieline", :gold},
      {"Felipe", :silver}
    ]

    Enum.each(users, fn {name, memberships} ->
      IO.puts("#{name} has a #{memberships} membership")
    end)

    Enum.each(users_struct_data, fn %User{name: name, membership: %Membership{type: membership_type}} ->
      IO.puts("#{name} has a #{membership_type} membership")
    end)




  end

end
