defmodule Localvore.Check.DebugComment do
  @moduledoc """
  Checks for commented debugging statements
  """

  @default_params [
    regex: ~r/#\s*((require)?\s*Logger|IO)/,
  ]

  @explanation [
    check: @moduledoc,
    params: [
      regex: "All lines matching this Regex will yield an issue.",
    ]
  ]

  @message "There should be no commented debugging statements."

  use Credo.Check,
    base_priority: :high,
    category: :custom,
    exit_status: 1

  @doc false
  def run(source_file, params \\ []) do
    lines = SourceFile.lines(source_file)
    issue_meta = IssueMeta.for(source_file, params)
    line_regex = Params.get(params, :regex, @default_params)

    Enum.reduce(lines, [], &process_line(&1, &2, line_regex, issue_meta))
  end

  defp process_line({line_no, line}, issues, line_regex, issue_meta) do
    case Regex.run(line_regex, line) do
      nil -> issues
      matches ->
        trigger = matches |> List.last
        new_issue = issue_for(issue_meta, line_no, trigger)
        [new_issue] ++ issues
    end
  end

  defp issue_for(issue_meta, line_no, trigger) do
    format_issue issue_meta,
      message: @message,
      line_no: line_no,
      trigger: trigger
  end
end
