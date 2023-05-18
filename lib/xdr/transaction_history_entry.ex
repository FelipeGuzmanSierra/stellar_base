defmodule StellarBase.XDR.TransactionHistoryEntry do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `TransactionHistoryEntry` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    Uint32,
    TransactionSet,
    TransactionHistoryEntryExt
  }

  @struct_spec XDR.Struct.new(
    ledger_seq: Uint32,
    tx_set: TransactionSet,
    ext: TransactionHistoryEntryExt
  )

  @type ledger_seq_type :: Uint32.t()
  @type tx_set_type :: TransactionSet.t()
  @type ext_type :: TransactionHistoryEntryExt.t()

  @type t :: %__MODULE__{ledger_seq: ledger_seq_type(), tx_set: tx_set_type(), ext: ext_type()}

  defstruct [:ledger_seq, :tx_set, :ext]

  @spec new(ledger_seq :: ledger_seq_type(), tx_set :: tx_set_type(), ext :: ext_type()) :: t()
  def new(
    %Uint32{} = ledger_seq,
    %TransactionSet{} = tx_set,
    %TransactionHistoryEntryExt{} = ext
  ),
  do: %__MODULE__{ledger_seq: ledger_seq, tx_set: tx_set, ext: ext}

  @impl true
  def encode_xdr(%__MODULE__{ledger_seq: ledger_seq, tx_set: tx_set, ext: ext}) do
    [ledger_seq: ledger_seq, tx_set: tx_set, ext: ext]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{ledger_seq: ledger_seq, tx_set: tx_set, ext: ext}) do
    [ledger_seq: ledger_seq, tx_set: tx_set, ext: ext]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [ledger_seq: ledger_seq, tx_set: tx_set, ext: ext]}, rest}} ->
        {:ok, {new(ledger_seq, tx_set, ext), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [ledger_seq: ledger_seq, tx_set: tx_set, ext: ext]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(ledger_seq, tx_set, ext), rest}
  end
end
