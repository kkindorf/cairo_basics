// match is a control flow construct that allows you to compare a value against a series of patterns and then execute code based on which pattern matches. the cairo compiler confirms that all possible cases are handled
use debug::PrintTrait;

#[derive(Drop)]
enum UsState {
    Alabama,
    Alaska
}
impl UsStatePrintImpl of PrintTrait<UsState> {
    fn print(self: UsState) {
        match self {
            UsState::Alabama => 'Alabama'.print(),
            UsState::Alaska => ('Alaska').print()
        }
    }
}

enum Coin {
    Penny,
    Nickel,
    Dime,
    Quarter: UsState
}

fn value_in_cents(coin: Coin) -> felt252 {
    match coin {
        Coin::Penny => {
            'lucky penny'.print();
            return 1;
        },
        Coin::Nickel => 5,
        Coin::Dime => 10,
        Coin::Quarter(state) => {
            state.print(); 
            return 25;
        }
    }
}

fn main() {
    let coinValue = value_in_cents(Coin::Quarter(UsState::Alaska)); // prints Alaska and returns 25
    coinValue.print();

}