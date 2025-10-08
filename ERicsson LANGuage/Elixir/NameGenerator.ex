# Name Generator in Elixir(meh, too easy)

first_names = [
    "Kevin",
    "Billy",
    "John",
    "Sam",
    "Jake",
    "Michael"
]
last_names = [
    "Lee",
    "Smith",
    "Adams",
    "Henderson",
    "Shakespeare",
    "Anderson",
    "Burns"
]

IO.puts("#{Enum.random(first_names)} #{Enum.random(last_names)}")