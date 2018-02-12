package main
import "fmt"
type Books struct {
	title string
	author string
	subject string
	book_id int
}
func main(){
	var Book1 Books
	var Book2 Books
	Book1.title = "go lang"
	Book2.title = "go go"
	fmt.Printf("%s\n", Book1.title)
}