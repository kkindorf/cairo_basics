use debug::PrintTrait;


fn main() {
    // when a panic occurs, program terminated immediatly
    // panic function takes an array as an argument
    // let mut data = ArrayTrait::new();
    // data.append(2);
    // if true == true {
    //     panic(data); // program terminated here
    // }
    // 'line not reached'.print(); // not printed

    // panic_with_felt252 is an alternative to panic. panic_with_felt252 takes in one value as an argument, without needing arrays. making it easier to read
    //panic_with_felt252(2);
    wrap_if_not_zero(0);
    wrap_not_zero(0);



}

// this function will never panic since its using the nopanic notation in the function definition
fn function_never_panic() -> felt252 nopanic {
    42
}

// panic with attribute 
#[panic_with('value is 0', wrap_not_zero)]
fn wrap_if_not_zero(value: u128) -> Option<u128> {
    if value == 0 {
        Option::None
    }
    else {
        Option::Some(value)
    }
}

