defmodule Clusterizer do
  def clusterize do
    url = "passagens-aguas-mornas"
    array_tags = cluster_arrays()
    for cluster <- array_tags, do:
      for tags <- cluster["tag_array"], do: Enum.all?(tags, &String.contains?(url, &1))
  end

  def cluster_arrays do
    response = HTTPotion.get "boostbox.com.br/api/v3/clusters?tag_array=true", [timeout: 10_000]
    Poison.decode!(response.body)
  end
end
