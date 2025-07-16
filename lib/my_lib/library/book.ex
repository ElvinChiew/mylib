defmodule MyLib.Library.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :title, :string
    field :author, :string
    field :isbn, :string
    field :publish_at, :naive_datetime

    has_many :loan, MyLib.Library.Loan

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :author, :isbn, :publish_at])
    |> validate_required([:title, :author, :isbn, :publish_at])
  end
end
