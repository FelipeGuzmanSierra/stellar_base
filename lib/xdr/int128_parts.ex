defmodule StellarBase.XDR.Int128Parts do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `Int128Parts` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    Uint64
  }

  @struct_spec XDR.Struct.new(
    lo: Uint64,
    hi: Uint64
  )

  @type lo_type :: Uint64.t()
  @type hi_type :: Uint64.t()

  @type t :: %__MODULE__{lo: lo_type(), hi: hi_type()}

  defstruct [:lo, :hi]

  @spec new(lo :: lo_type(), hi :: hi_type()) :: t()
  def new(
    %Uint64{} = lo,
    %Uint64{} = hi
  ),
  do: %__MODULE__{lo: lo, hi: hi}

  @impl true
  def encode_xdr(%__MODULE__{lo: lo, hi: hi}) do
    [lo: lo, hi: hi]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{lo: lo, hi: hi}) do
    [lo: lo, hi: hi]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [lo: lo, hi: hi]}, rest}} ->
        {:ok, {new(lo, hi), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [lo: lo, hi: hi]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(lo, hi), rest}
  end
end
