#!/usr/bin/env bash
set -e -x

ls -las

echo "Starting nUnit Test Case Execution"

dotnet restore
dotnet test

echo "Finishing nUnit Test Case Execution"

ls -ltr
