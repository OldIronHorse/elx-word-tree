defmodule WordTreeTest do
  use ExUnit.Case
  import WordTree

  setup_all do
    {:ok,dict: word_tree(["cat","dog","dot","pig","quit","deque"])}
  end

  test "word_tree from list", context do
    assert context[:dict] == %{"c" => %{"a" => %{"t" => %{nil => nil}}},
                               "p" => %{"i" => %{"g" => %{nil => nil}}},
                               "d" => %{"e" => %{"q" => %{"u" => %{"e" => %{nil => nil}}}},
                                        "o" => %{"g" => %{nil => nil},
                                                 "t" => %{nil => nil}}},
                               "q" => %{"u" => %{"i" => %{"t" => %{nil => nil}}}}}
  end

  test "next_char: no next", context do
    assert next_char(context[:dict],"dog") == [nil]
  end

  test "next_char: multiple nexts", context do
    assert next_char(context[:dict],"do") == ["g","t"]
  end
  
  test "next_char: not a word", context do
    assert next_char(context[:dict],"date") == []
  end
end
