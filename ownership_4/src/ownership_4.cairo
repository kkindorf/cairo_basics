// copying array data with clone

// arrays can be copied using the Array clone method

// execute program with scarb cairo-run --available-gas=2000000 since a loop is used under the hood to copy the array

// clone is expensive to do 

use clone::Clone;
use array::ArrayTCloneImpl;
use debug::PrintTrait;

fn main() {
    let mut arr1 = ArrayTrait::new();
    arr1.append(2);
    arr1.append(3);
    arr1.append(4);
    let arr2 = arr1.clone();
    let valFromarr2 = 
    match arr2.get(0) {
        Option::Some(x) => {
            let val = *x.unbox();
            val.print(); // prints 2
        },
        Option::None(_) => {
            let mut data = ArrayTrait::new();
            data.append('out of bounds');
            panic(data);

        }
    };

}