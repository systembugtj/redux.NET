#!/usr/bin/env bash

nuget restore src/Redux.sln -verbosity detailed
msbuild src/Redux.sln /p:Configuration=Release
nunit-console src/Redux.Tests/bin/Release/Redux.Tests.dll
nuget pack src/Redux/Redux.csproj -Prop Configuration=Release
nuget add Redux.Net.3.0.0.nupkg -source ~/.nuget/packages

# nuget restore examples/todomvc/Redux.TodoMvc.sln -verbosity detailed
# msbuild examples/todomvc/Redux.TodoMvc.sln /p:Configuration=Release