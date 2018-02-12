package main
import "fmt"
func main(){
	var a int=20
	var ip *int
	ip=&a
	fmt.Printf("a: %x\n", &a)
	fmt.Printf("ip: %x\n", ip)
	fmt.Printf("*ip: %d", *ip)
}