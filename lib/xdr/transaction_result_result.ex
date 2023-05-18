defmodule StellarBase.XDR.TransactionResultResult do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `TransactionResultResult` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    TransactionResultCode,
    InnerTransactionResultPair,
    OperationResultList,
    Void
  }

  @arms [
    txFEE_BUMP_INNER_SUCCESS: InnerTransactionResultPair,
    txFEE_BUMP_INNER_FAILED: InnerTransactionResultPair,
    txSUCCESS: OperationResultList,
    txFAILED: OperationResultList,
    txTOO_EARLY: Void,
    txTOO_LATE: Void,
    txMISSING_OPERATION: Void,
    txBAD_SEQ: Void,
    txBAD_AUTH: Void,
    txINSUFFICIENT_BALANCE: Void,
    txNO_ACCOUNT: Void,
    txINSUFFICIENT_FEE: Void,
    txBAD_AUTH_EXTRA: Void,
    txINTERNAL_ERROR: Void,
    txNOT_SUPPORTED: Void,
    txBAD_SPONSORSHIP: Void,
    txBAD_MIN_SEQ_AGE_OR_GAP: Void,
    txMALFORMED: Void
  ]

  @type value ::
          InnerTransactionResultPair.t()
          | OperationResultList.t()
          | Void.t()

  @type t :: %__MODULE__{value: value(), type: TransactionResultCode.t()}

  defstruct [:value, :type]

  @spec new(value :: value(), type :: TransactionResultCode.t()) :: t()
  def new(value, %TransactionResultCode{} = type), do: %__MODULE__{value: value, type: type}

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
    |> TransactionResultCode.new()
    |> XDR.Union.new(@arms)
  end
end
