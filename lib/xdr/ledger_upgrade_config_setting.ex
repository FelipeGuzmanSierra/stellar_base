defmodule StellarBase.XDR.LedgerUpgradeConfigSetting do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `LedgerUpgradeConfigSetting` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    ConfigSettingID,
    ConfigSetting
  }

  @struct_spec XDR.Struct.new(
    id: ConfigSettingID,
    setting: ConfigSetting
  )

  @type id_type :: ConfigSettingID.t()
  @type setting_type :: ConfigSetting.t()

  @type t :: %__MODULE__{id: id_type(), setting: setting_type()}

  defstruct [:id, :setting]

  @spec new(id :: id_type(), setting :: setting_type()) :: t()
  def new(
    %ConfigSettingID{} = id,
    %ConfigSetting{} = setting
  ),
  do: %__MODULE__{id: id, setting: setting}

  @impl true
  def encode_xdr(%__MODULE__{id: id, setting: setting}) do
    [id: id, setting: setting]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{id: id, setting: setting}) do
    [id: id, setting: setting]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [id: id, setting: setting]}, rest}} ->
        {:ok, {new(id, setting), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [id: id, setting: setting]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(id, setting), rest}
  end
end
