
// the copy trait

// arrays and dictionaries cannot be copied
// because they do not have the copy trait available in their type definition
// What is the copy trait: the copy trait does not move the ownership of the value to the function being called with the value.
// instead when a value has the copy trait available, it will pass a copy of the value to the function being called with the value.
// custom types that do not contain arrays or dictionaries can be annotated with the copy trait

#[derive(Copy, Drop)]
struct Point {
    x: u128,
    y: u128
}

fn foo(p: Point) {
}

fn main() {
    // ownership of p1 remains with main
    let p1 = Point {x: 5, y: 10};
    // passing p1 to foo is a copy of p1
    // so it can be used by multiple calls to foo without compilation errors
    foo(p1);
    foo(p1);

}