fn foo(arr: Array<u128>) {}
fn bar(arr: Array<u128>) {}

fn main () {
    // cairo ownership rules
    // 1. each value in cairo has an owner
    // 2. there can only be one owner at a time
    // 3. when the owner goes out of scope, the value will be dropped

    // s is not valid here

    { 
        let s = 'hello'; // s is valid within the scope of the brackets


    } // s is no longer valid

    let mut arr = ArrayTrait::<u128>::new();
    foo(arr);

    // passing arr to bar is not allowed
    // because the usage of arr has already been given to foo
    // passing arr to bar is attempting to write to the same memory as cell
    // which is not allowed
    // bar(arr);
    


    
    


}