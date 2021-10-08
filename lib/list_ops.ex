defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(l) do
    count(l, 0)
  end

  defp count([], idx), do: idx

  defp count([_ | l], idx) do
    count(l, idx + 1)
  end

  @spec reverse(list) :: list
  def reverse(l) do
    reverse(l, [])
  end

  defp reverse([], acc), do: acc

  defp reverse([h | t], acc) do
    reverse(t, [h | acc])
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    map(l, f, [])
  end

  defp map([], _, acc), do: acc

  defp map([h | t], f, acc) do
    [f.(h) | map(t, f, acc)]
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    filter(l, f, [])
  end

  defp filter([], _, acc), do: acc

  defp filter([h | t], f, acc) do
    if f.(h) == true do
      [h | filter(t, f, acc)]
    else
      filter(t, f, acc)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce([], acc, _), do: acc

  def reduce([h | t], acc, f) do
    reduce(t, f.(h, acc), f)
  end

  @spec append(list, list) :: list
  def append([], tail), do: tail

  def append([h | t], tail) do
    [h | append(t, tail)]
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    flatten(ll)
  end

  defp flatten([]), do: []

  defp flatten([[] | t]) do
    flatten(t)
  end

  defp flatten([[h | t] | t2]) do
    flatten([h | [t | t2]])
  end

  defp flatten([h | t]) do
    [h | flatten(t)]
  end
end
