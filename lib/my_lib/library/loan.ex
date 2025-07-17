defmodule MyLib.Library.Loan do
  use Ecto.Schema
  import Ecto.Changeset

  #add alias to refer to the other table
  alias MyLib.Library.Book
  alias MyLib.Accounts.User


  schema "loans" do
    field :borrowed_at, :naive_datetime
    field :due_at, :naive_datetime
    field :returned_at, :naive_datetime
    #field :user_id, :id
    #field :book_id, :id

    #add this to sort of link the table with other table
    belongs_to :user, User
    belongs_to :book, Book

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(loan, attrs) do
    loan
    #add :user_id and :book_id, remove returned_at from validate
    |> cast(attrs, [:user_id, :book_id, :borrowed_at, :due_at, :returned_at])
    |> validate_required([:user_id, :book_id, :borrowed_at, :due_at])
    |> cast_assoc(:user)
    |> cast_assoc(:book)
  end
end
