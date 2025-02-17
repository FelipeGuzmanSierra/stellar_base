defmodule StellarBase.XDR.ContractID do
  @moduledoc """
  Representation of Stellar `ContractID` type.
  """

  alias StellarBase.XDR.{Asset, ContractIDType, UInt256, FromEd25519PublicKey}

  @behaviour XDR.Declaration

  @arms [
    CONTRACT_ID_FROM_SOURCE_ACCOUNT: UInt256,
    CONTRACT_ID_FROM_ED25519_PUBLIC_KEY: FromEd25519PublicKey,
    CONTRACT_ID_FROM_ASSET: Asset
  ]

  @type contract_id :: UInt256.t() | Asset.t() | FromEd25519PublicKey.t()

  @type t :: %__MODULE__{contract_id: contract_id(), type: ContractIDType.t()}

  defstruct [:contract_id, :type]

  @spec new(contract_id :: contract_id(), type :: ContractIDType.t()) :: t()
  def new(contract_id, %ContractIDType{} = type),
    do: %__MODULE__{contract_id: contract_id, type: type}

  @impl true
  def encode_xdr(%__MODULE__{contract_id: contract_id, type: type}) do
    type
    |> XDR.Union.new(@arms, contract_id)
    |> XDR.Union.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{contract_id: contract_id, type: type}) do
    type
    |> XDR.Union.new(@arms, contract_id)
    |> XDR.Union.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, spec \\ union_spec())

  def decode_xdr(bytes, spec) do
    case XDR.Union.decode_xdr(bytes, spec) do
      {:ok, {{type, contract_id}, rest}} -> {:ok, {new(contract_id, type), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, spec \\ union_spec())

  def decode_xdr!(bytes, spec) do
    {{type, contract_id}, rest} = XDR.Union.decode_xdr!(bytes, spec)
    {new(contract_id, type), rest}
  end

  @spec union_spec() :: XDR.Union.t()
  defp union_spec do
    nil
    |> ContractIDType.new()
    |> XDR.Union.new(@arms)
  end
end
