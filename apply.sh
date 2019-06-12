#!/bin/bash

./tmpl.sh $1 | kubectl apply -f -

