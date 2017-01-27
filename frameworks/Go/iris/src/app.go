package main

import "github.com/kataras/iris"

func main() {
    // declare the routes
    iris.Get("/plaintext", plaintextResponse)
    iris.Get("/json", jsonResponse)

    // start the server
    iris.Listen(":8080")
}

func plaintextResponse(ctx *iris.Context) {
	ctx.SetContentType("text/plain")
	ctx.SetHeader("Server", "Iris")
    ctx.Writef("Hello, World!")
}
func jsonResponse(ctx *iris.Context) {
	ctx.SetHeader("Server", "Iris")
	ctx.SetContentType("application/json")
    ctx.JSON(iris.StatusOK, iris.Map{
    	"message": "Hello, World!",
    	})
}
