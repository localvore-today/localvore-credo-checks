defmodule Localvore.Check.DebugCommentTest do
  use Credo.TestHelper

  @described_check Localvore.Check.DebugComment

  test "it should NOT report expected code" do
    source =
      """
      defmodule CredoSampleModule do
        def some_function(parameter1, parameter2) do
          parameter1 + parameter2
        end
      end
      """

    source
    |> to_source_file
    |> refute_issues(@described_check)
  end

  test "it should report a violation for Logger require" do
    source =
      """
      defmodule CredoSampleModule do
        # require Logger
        def some_function(parameter1, parameter2) do
          parameter1 + parameter2
        end
      end
      """

    source
    |> to_source_file
    |> assert_issue(@described_check)
  end

  test "it should report a violation for Logger function calls" do
    source =
      """
      defmodule CredoSampleModule do
        def some_function(parameter1, parameter2) do
          # Logger.info(parameter1)
          parameter1 + parameter2
        end
      end
      """

    source
    |> to_source_file
    |> assert_issue(@described_check)
  end

  test "it should report a violation for IO functions" do
    source =
      """
      defmodule CredoSampleModule do
        def some_function(parameter1, parameter2) do
          # IO.inspect(parameter1)
          parameter1 + parameter2
        end
      end
      """

    source
    |> to_source_file
    |> assert_issue(@described_check)
  end
end
