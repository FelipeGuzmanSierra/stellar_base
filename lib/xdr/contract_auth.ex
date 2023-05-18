defmodule StellarBase.XDR.ContractAuth do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `ContractAuth` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    OptionalAddressWithNonce,
    AuthorizedInvocation,
    SCVec
  }

  @struct_spec XDR.Struct.new(
    address_with_nonce: OptionalAddressWithNonce,
    root_invocation: AuthorizedInvocation,
    signature_args: SCVec
  )

  @type address_with_nonce_type :: OptionalAddressWithNonce.t()
  @type root_invocation_type :: AuthorizedInvocation.t()
  @type signature_args_type :: SCVec.t()

  @type t :: %__MODULE__{address_with_nonce: address_with_nonce_type(), root_invocation: root_invocation_type(), signature_args: signature_args_type()}

  defstruct [:address_with_nonce, :root_invocation, :signature_args]

  @spec new(address_with_nonce :: address_with_nonce_type(), root_invocation :: root_invocation_type(), signature_args :: signature_args_type()) :: t()
  def new(
    %OptionalAddressWithNonce{} = address_with_nonce,
    %AuthorizedInvocation{} = root_invocation,
    %SCVec{} = signature_args
  ),
  do: %__MODULE__{address_with_nonce: address_with_nonce, root_invocation: root_invocation, signature_args: signature_args}

  @impl true
  def encode_xdr(%__MODULE__{address_with_nonce: address_with_nonce, root_invocation: root_invocation, signature_args: signature_args}) do
    [address_with_nonce: address_with_nonce, root_invocation: root_invocation, signature_args: signature_args]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{address_with_nonce: address_with_nonce, root_invocation: root_invocation, signature_args: signature_args}) do
    [address_with_nonce: address_with_nonce, root_invocation: root_invocation, signature_args: signature_args]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [address_with_nonce: address_with_nonce, root_invocation: root_invocation, signature_args: signature_args]}, rest}} ->
        {:ok, {new(address_with_nonce, root_invocation, signature_args), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [address_with_nonce: address_with_nonce, root_invocation: root_invocation, signature_args: signature_args]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(address_with_nonce, root_invocation, signature_args), rest}
  end
end
