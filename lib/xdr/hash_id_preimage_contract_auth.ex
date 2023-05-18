defmodule StellarBase.XDR.HashIDPreimageContractAuth do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `HashIDPreimageContractAuth` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    Hash,
    Uint64,
    AuthorizedInvocation
  }

  @struct_spec XDR.Struct.new(
    network_id: Hash,
    nonce: Uint64,
    invocation: AuthorizedInvocation
  )

  @type network_id_type :: Hash.t()
  @type nonce_type :: Uint64.t()
  @type invocation_type :: AuthorizedInvocation.t()

  @type t :: %__MODULE__{network_id: network_id_type(), nonce: nonce_type(), invocation: invocation_type()}

  defstruct [:network_id, :nonce, :invocation]

  @spec new(network_id :: network_id_type(), nonce :: nonce_type(), invocation :: invocation_type()) :: t()
  def new(
    %Hash{} = network_id,
    %Uint64{} = nonce,
    %AuthorizedInvocation{} = invocation
  ),
  do: %__MODULE__{network_id: network_id, nonce: nonce, invocation: invocation}

  @impl true
  def encode_xdr(%__MODULE__{network_id: network_id, nonce: nonce, invocation: invocation}) do
    [network_id: network_id, nonce: nonce, invocation: invocation]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{network_id: network_id, nonce: nonce, invocation: invocation}) do
    [network_id: network_id, nonce: nonce, invocation: invocation]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [network_id: network_id, nonce: nonce, invocation: invocation]}, rest}} ->
        {:ok, {new(network_id, nonce, invocation), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [network_id: network_id, nonce: nonce, invocation: invocation]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(network_id, nonce, invocation), rest}
  end
end
