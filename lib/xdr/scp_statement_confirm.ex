defmodule StellarBase.XDR.SCPStatementConfirm do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `SCPStatementConfirm` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    SCPBallot,
    Uint32,
    Hash
  }

  @struct_spec XDR.Struct.new(
    ballot: SCPBallot,
    n_prepared: Uint32,
    n_commit: Uint32,
    n_h: Uint32,
    quorum_set_hash: Hash
  )

  @type ballot_type :: SCPBallot.t()
  @type n_prepared_type :: Uint32.t()
  @type n_commit_type :: Uint32.t()
  @type n_h_type :: Uint32.t()
  @type quorum_set_hash_type :: Hash.t()

  @type t :: %__MODULE__{ballot: ballot_type(), n_prepared: n_prepared_type(), n_commit: n_commit_type(), n_h: n_h_type(), quorum_set_hash: quorum_set_hash_type()}

  defstruct [:ballot, :n_prepared, :n_commit, :n_h, :quorum_set_hash]

  @spec new(ballot :: ballot_type(), n_prepared :: n_prepared_type(), n_commit :: n_commit_type(), n_h :: n_h_type(), quorum_set_hash :: quorum_set_hash_type()) :: t()
  def new(
    %SCPBallot{} = ballot,
    %Uint32{} = n_prepared,
    %Uint32{} = n_commit,
    %Uint32{} = n_h,
    %Hash{} = quorum_set_hash
  ),
  do: %__MODULE__{ballot: ballot, n_prepared: n_prepared, n_commit: n_commit, n_h: n_h, quorum_set_hash: quorum_set_hash}

  @impl true
  def encode_xdr(%__MODULE__{ballot: ballot, n_prepared: n_prepared, n_commit: n_commit, n_h: n_h, quorum_set_hash: quorum_set_hash}) do
    [ballot: ballot, n_prepared: n_prepared, n_commit: n_commit, n_h: n_h, quorum_set_hash: quorum_set_hash]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{ballot: ballot, n_prepared: n_prepared, n_commit: n_commit, n_h: n_h, quorum_set_hash: quorum_set_hash}) do
    [ballot: ballot, n_prepared: n_prepared, n_commit: n_commit, n_h: n_h, quorum_set_hash: quorum_set_hash]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [ballot: ballot, n_prepared: n_prepared, n_commit: n_commit, n_h: n_h, quorum_set_hash: quorum_set_hash]}, rest}} ->
        {:ok, {new(ballot, n_prepared, n_commit, n_h, quorum_set_hash), rest}}
      error -> error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [ballot: ballot, n_prepared: n_prepared, n_commit: n_commit, n_h: n_h, quorum_set_hash: quorum_set_hash]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)
    {new(ballot, n_prepared, n_commit, n_h, quorum_set_hash), rest}
  end
end
