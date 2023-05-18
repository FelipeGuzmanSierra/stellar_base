defmodule StellarBase.XDR.ClaimableBalanceEntryExtensionV1 do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `ClaimableBalanceEntryExtensionV1` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    ClaimableBalanceEntryExtensionV1Ext,
    Uint32
  }

  @struct_spec XDR.Struct.new(
    ext: ClaimableBalanceEntryExtensionV1Ext,
    flags: Uint32
  )

  @type ext_type :: ClaimableBalanceEntryExtensionV1Ext.t()
  @type flags_type :: Uint32.t()

  @type t :: %__MODULE__{ext: ext_type(), flags: flags_type()}

  defstruct [:ext, :flags]

  @spec new(ext :: ext_type(), flags :: flags_type()) :: t()
  def new(
    %ClaimableBalanceEntryExtensionV1Ext{} = ext,
    %Uint32{} = flags
  ),
  do: %__MODULE__{ext: ext, flags: flags}

  @impl true
  def encode_xdr(%__MODULE__{ext: ext, flags: flags}) do
    [ext: ext, flags: flags]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{ext: ext, flags: flags}) do
    [ext: ext, flags: flags]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [ext: ext, flags: flags]}, rest}} ->
        {:ok, {new(ext, flags), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [ext: ext, flags: flags]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(ext, flags), rest}
  end
end
