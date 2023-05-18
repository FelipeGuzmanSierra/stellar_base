defmodule StellarBase.XDR.HashIDPreimageFromAsset do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `HashIDPreimageFromAsset` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    Hash,
    Asset
  }

  @struct_spec XDR.Struct.new(
    network_id: Hash,
    asset: Asset
  )

  @type network_id_type :: Hash.t()
  @type asset_type :: Asset.t()

  @type t :: %__MODULE__{network_id: network_id_type(), asset: asset_type()}

  defstruct [:network_id, :asset]

  @spec new(network_id :: network_id_type(), asset :: asset_type()) :: t()
  def new(
    %Hash{} = network_id,
    %Asset{} = asset
  ),
  do: %__MODULE__{network_id: network_id, asset: asset}

  @impl true
  def encode_xdr(%__MODULE__{network_id: network_id, asset: asset}) do
    [network_id: network_id, asset: asset]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{network_id: network_id, asset: asset}) do
    [network_id: network_id, asset: asset]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [network_id: network_id, asset: asset]}, rest}} ->
        {:ok, {new(network_id, asset), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [network_id: network_id, asset: asset]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(network_id, asset), rest}
  end
end
