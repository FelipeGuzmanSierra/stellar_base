defmodule StellarBase.XDR.LedgerEntry do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `LedgerEntry` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    Uint32,
    LedgerEntryData,
    LedgerEntryExt
  }

  @struct_spec XDR.Struct.new(
                 last_modified_ledger_seq: Uint32,
                 data: LedgerEntryData,
                 ext: LedgerEntryExt
               )

  @type last_modified_ledger_seq_type :: Uint32.t()
  @type data_type :: LedgerEntryData.t()
  @type ext_type :: LedgerEntryExt.t()

  @type t :: %__MODULE__{
          last_modified_ledger_seq: last_modified_ledger_seq_type(),
          data: data_type(),
          ext: ext_type()
        }

  defstruct [:last_modified_ledger_seq, :data, :ext]

  @spec new(
          last_modified_ledger_seq :: last_modified_ledger_seq_type(),
          data :: data_type(),
          ext :: ext_type()
        ) :: t()
  def new(
        %Uint32{} = last_modified_ledger_seq,
        %LedgerEntryData{} = data,
        %LedgerEntryExt{} = ext
      ),
      do: %__MODULE__{last_modified_ledger_seq: last_modified_ledger_seq, data: data, ext: ext}

  @impl true
  def encode_xdr(%__MODULE__{
        last_modified_ledger_seq: last_modified_ledger_seq,
        data: data,
        ext: ext
      }) do
    [last_modified_ledger_seq: last_modified_ledger_seq, data: data, ext: ext]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{
        last_modified_ledger_seq: last_modified_ledger_seq,
        data: data,
        ext: ext
      }) do
    [last_modified_ledger_seq: last_modified_ledger_seq, data: data, ext: ext]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok,
       {%XDR.Struct{
          components: [last_modified_ledger_seq: last_modified_ledger_seq, data: data, ext: ext]
        }, rest}} ->
        {:ok, {new(last_modified_ledger_seq, data, ext), rest}}

      error ->
        error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{
       components: [last_modified_ledger_seq: last_modified_ledger_seq, data: data, ext: ext]
     }, rest} = XDR.Struct.decode_xdr!(bytes, struct)

    {new(last_modified_ledger_seq, data, ext), rest}
  end
end
