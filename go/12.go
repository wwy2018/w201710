package main
import "fmt"
type Books struct {
	title string
	author string
	subject string
	book_id int
}
func main () {
	var Book1 Books
	var Book2 Books
	Book1.title = "ggg"
	Book2.title = "ooo"
	printBook(&Book1)
	printBook(&Book2) 
}
func printBook (book *Books) {
	fmt.Printf("book %s\n", book.title)
}