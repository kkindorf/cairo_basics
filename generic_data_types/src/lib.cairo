// we can use generics when defining functions, structs,enums traits and methods

// we need to implement drop for the generic trait because the compiler does not have a way of knowing that the generic is droppable
fn largest_list<T, impl TDrop: Drop<T>>(l1: Array<T>, l2: Array<T>) -> Array<T> {
    if l1.len() > l2.len() {
        l1
    } else {
        l2
    }
}


// given a list of T get the smallest one
// The PartialOrd trait implements comparison operations for T
// by using the densap operator *, we need to add a Copy and Drop definition to the generic type 
fn smallest_element<T, impl TPartialOrd: PartialOrd<T>, impl TCopy: Copy<T>, impl TDrop: Drop<T>>(list: @Array<T>) -> T {
    let mut smallest = *list[0];
    let mut index = 1;
    loop {
        if index >= list.len() {
            break smallest;
        }
        if *list[index] < smallest {
            smallest = *list[index];
        }
        index = index + 1;
    }

}

fn main() {
    let mut l1 = ArrayTrait::new();
    let mut l2 = ArrayTrait::new();
    l1.append(1);
    l2.append(2);
    l1.append(2);
    l2.append(5);
    l2.append(6);
    
    let l3 = largest_list(l1, l2);

    let mut list: Array<u8> = ArrayTrait::new();
    list.append(5);
    list.append(3);
    list.append(10);
    let smallest = smallest_element(@list);
    assert(smallest == 3, 0);
}