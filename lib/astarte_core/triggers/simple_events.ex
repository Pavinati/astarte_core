#
# This file is part of Astarte.
#
# Copyright 2017 Ispirata Srl
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

defmodule Astarte.Core.Triggers.SimpleEvents do
  @external_resource Path.expand("simple_events", __DIR__)

  use Protobuf, from: Path.wildcard(Path.expand("simple_events/*.proto", __DIR__))

  @doc """
  Utility macro, `use Astarte.Core.Triggers.SimpleEvents` injects aliases
  for all the structs defined in the `Astarte.Core.Triggers.SimpleEvents`
  namespace
  """
  defmacro __using__(_opts) do
    for {{:msg, msg_module}, _} <- __MODULE__.defs() do
      quote do
        alias unquote(msg_module)
      end
    end
  end
end
