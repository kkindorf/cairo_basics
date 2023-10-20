use debug::PrintTrait;
fn main() {
    let mut arr1 = ArrayTrait::<u128>::new();
    let first_snapshot = @arr1; // @ takes a snapshot of arr1 at this point in time
    arr1.append(1);
    let first_length = calculate_length(first_snapshot);
    let second_length = calculate_length(@arr1);
    first_length.print(); // length is 0
    second_length.print(); // length is 1


}

// @Array<u128> indicates its a snapshot of the array passed to the function. which is an immutable view of a value and the actual array will not be dropped
fn calculate_length(array_snapshot: @Array<u128>) -> usize {
    array_snapshot.len() // array_snapshot is dropped here but the actual array value is still available.
    
    //no semicolon here means arr.len() is returned
}