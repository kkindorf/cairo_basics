// the drop trait
// a value cannot go out of scope
// unless it has been previously moved
// when a value of a type that uses the Drop trait goes out of scope, the Drop implementation is called on the type
// which moves the value to the drop function, which allows the value to go out of scope

// declare struct A with Drop trait
#[derive(Drop)]
struct A {}

fn main() {
    A {}; // A is now dropped since it is no longer being used by anything else
}