defmodule StellarBase.XDR.TransactionResultMeta do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `TransactionResultMeta` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    TransactionResultPair,
    LedgerEntryChanges,
    TransactionMeta
  }

  @struct_spec XDR.Struct.new(
    result: TransactionResultPair,
    fee_processing: LedgerEntryChanges,
    tx_apply_processing: TransactionMeta
  )

  @type result_type :: TransactionResultPair.t()
  @type fee_processing_type :: LedgerEntryChanges.t()
  @type tx_apply_processing_type :: TransactionMeta.t()

  @type t :: %__MODULE__{result: result_type(), fee_processing: fee_processing_type(), tx_apply_processing: tx_apply_processing_type()}

  defstruct [:result, :fee_processing, :tx_apply_processing]

  @spec new(result :: result_type(), fee_processing :: fee_processing_type(), tx_apply_processing :: tx_apply_processing_type()) :: t()
  def new(
    %TransactionResultPair{} = result,
    %LedgerEntryChanges{} = fee_processing,
    %TransactionMeta{} = tx_apply_processing
  ),
  do: %__MODULE__{result: result, fee_processing: fee_processing, tx_apply_processing: tx_apply_processing}

  @impl true
  def encode_xdr(%__MODULE__{result: result, fee_processing: fee_processing, tx_apply_processing: tx_apply_processing}) do
    [result: result, fee_processing: fee_processing, tx_apply_processing: tx_apply_processing]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{result: result, fee_processing: fee_processing, tx_apply_processing: tx_apply_processing}) do
    [result: result, fee_processing: fee_processing, tx_apply_processing: tx_apply_processing]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [result: result, fee_processing: fee_processing, tx_apply_processing: tx_apply_processing]}, rest}} ->
        {:ok, {new(result, fee_processing, tx_apply_processing), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [result: result, fee_processing: fee_processing, tx_apply_processing: tx_apply_processing]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(result, fee_processing, tx_apply_processing), rest}
  end
end
