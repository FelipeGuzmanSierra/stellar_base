defmodule StellarBase.XDR.CreateClaimableBalanceResult do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `CreateClaimableBalanceResult` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    CreateClaimableBalanceResultCode,
    ClaimableBalanceID,
    Void
  }

  @arms [
    CREATE_CLAIMABLE_BALANCE_SUCCESS: ClaimableBalanceID,
    CREATE_CLAIMABLE_BALANCE_MALFORMED: Void,
    CREATE_CLAIMABLE_BALANCE_LOW_RESERVE: Void,
    CREATE_CLAIMABLE_BALANCE_NO_TRUST: Void,
    CREATE_CLAIMABLE_BALANCE_NOT_AUTHORIZED: Void,
    CREATE_CLAIMABLE_BALANCE_UNDERFUNDED: Void
  ]

  @type value ::
          ClaimableBalanceID.t()
          | Void.t()

  @type t :: %__MODULE__{value: value(), type: CreateClaimableBalanceResultCode.t()}

  defstruct [:value, :type]

  @spec new(value :: value(), type :: CreateClaimableBalanceResultCode.t()) :: t()
  def new(value, %CreateClaimableBalanceResultCode{} = type),
    do: %__MODULE__{value: value, type: type}

  @impl true
  def encode_xdr(%__MODULE__{value: value, type: type}) do
    type
    |> XDR.Union.new(@arms, value)
    |> XDR.Union.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{value: value, type: type}) do
    type
    |> XDR.Union.new(@arms, value)
    |> XDR.Union.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, spec \\ union_spec())

  def decode_xdr(bytes, spec) do
    case XDR.Union.decode_xdr(bytes, spec) do
      {:ok, {{type, value}, rest}} -> {:ok, {new(value, type), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, spec \\ union_spec())

  def decode_xdr!(bytes, spec) do
    {{type, value}, rest} = XDR.Union.decode_xdr!(bytes, spec)
    {new(value, type), rest}
  end

  @spec union_spec() :: XDR.Union.t()
  defp union_spec do
    nil
    |> CreateClaimableBalanceResultCode.new()
    |> XDR.Union.new(@arms)
  end
end
