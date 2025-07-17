defmodule MyLib.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  ############
  alias MyLib.Library.Loan

  schema "users" do
    field :name, :string
    field :age, :integer

    #adding loan to context
    has_many :loan, Loan

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :age])
    |> validate_required([:name, :age])
    |> cast_assoc(:loan)
  end
end
