defmodule WordTree do
  @moduledoc """
  Documentation for WordTree.
  """

  def word_tree(words) do
    Enum.reduce(words,%{},fn(w,dict) -> add(dict,String.graphemes(w)) end)
  end

  def add(dict,[]) do
    Map.put(dict,nil,nil)
  end
  def add(dict,[c|word]) do
    Map.update(dict,c,add(%{},word),&(add(&1,word)))
  end

  def next_char(tree,[]) do
    Map.keys(tree)
  end
  def next_char(tree,[c|word]) do
    case Map.fetch(tree,c) do
      {:ok,next_tree} -> next_char(next_tree,word)
      _ -> []
    end
  end
  def next_char(tree,word) do
    next_char(tree,String.graphemes(word))
  end
end
