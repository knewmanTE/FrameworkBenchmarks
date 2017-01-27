#!/bin/bash

fw_depends go

go get -u github.com/kataras/iris/iris
#go get github.com/go-sql-driver/mysql

go run src/app.go &
