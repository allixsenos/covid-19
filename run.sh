#!/bin/bash
cp support/header.csv data/croatia.csv
curl "https://www.koronavirus.hr/json/?action=podaci" > data/raw
cat data/raw | jq -r '. | map([(.Datum|split(" ")[0]), (.SlucajeviHrvatska|tostring), (.IzlijeceniHrvatska|tostring), (.UmrliHrvatska|tostring)] | join(",")) | join("\n")' | tac | awk '{print ++a "," $0}' | tac >> data/croatia.csv
