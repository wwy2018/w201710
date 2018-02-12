package main
import "fmt"
func main(){
	var countryCapitalMap map[string]string
	countryCapitalMap = make(map[string]string)
	countryCapitalMap["france"]="paris"
	for country := range countryCapitalMap{
		fmt.Println("Capital of ",country," is ", countryCapitalMap[country])
	}
	capital, ok := countryCapitalMap["france"]
	if (ok) {
		fmt.Println("capital is ", capital)
	} else {
		fmt.Println("no capital")
	}
}