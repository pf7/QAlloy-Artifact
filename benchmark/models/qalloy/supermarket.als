sig Bag {
	int contains : set Product
}

one sig Oz {}
abstract sig Product {
	int weight : one Oz
}
one sig Tea , Coffee , Milk extends Product {}
int sig stock in Product {}

fact {
	// The number of products in each bag must be non-negative
	contains >= 0 ** (Bag -> Product)
	// Each product cannot be empty
	weight >= 1 ** (Product -> Oz)
	// There are, at most, 3 items in stock of each product
	stock >= 0 ** Product and stock <= 3** Product
	// Milk contains 10 Oz
	Milk ; weight = 10 ** Oz
	// Milk weighths more than Coffee
	Milk ; weight > Coffee ; weight
	// Coffee weights 3 times more than Tea
	Coffee ; weight = 3 **( Tea ; weight )
	// The contents of each bag depend on the number of products available
	Bag ; contains in stock
}

run{
	some Bag and all b : Bag, p : Product | p in b.contains
} for 3

// If a bag has more than 30 Oz then it contains milk
assert hasMilk {
	all b : Bag | b;contains;weight > 30 ** Oz implies b;contains >= 1 ** Milk
}

assert hasNoMilk{
	all b : Bag | b;contains;weight > 40 ** Oz implies b;contains >= 1 ** Milk
}

check hasMilk for 3 but 2 Bag
check hasNoMilk for 3 but 2 Bag




