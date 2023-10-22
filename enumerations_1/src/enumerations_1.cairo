// options enum is standard in cairo
//it has two variants. Some and None. 
// Some means a value is available to work with
// none essentially means null or undefined or just empty

fn find_value_recursive(arr: @Array<felt252>, value: felt252, index: usize) -> Option<usize> {
    if index >= arr.len() {
        return Option::None;
    }
    if *arr.at(index) == value {
        return Option::Some(index);
    }

    find_value_recursive(arr, value, index + 1)
 }
 fn main() {}

 #[cfg(test)]
 mod tests {
    use debug::PrintTrait;
    use super::find_value_recursive;
    #[test]
    #[available_gas(999999)]
    fn test_increase_amount() {
        let mut my_array = ArrayTrait::new();
        my_array.append(1);
        my_array.append(3);
        let value_to_find = 3;
        let result = find_value_recursive(@my_array, value_to_find, 0);
        match result {
            Option::Some(index) => {
                if index == 1 {
                    'it worked'.print();
                } 
            },
            Option::None => { 'not found'.print() }
        } // prints it works
    }
 }
 