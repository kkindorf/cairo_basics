// enumerations are data types that consist of a fixed set of named values called variants
// enums represent a collection of related values where each value is distinct and has a specific meaning
use debug::PrintTrait;
#[derive(Drop)]
enum Message {
    Quit,
    Echo: felt252, 
    Move: (u128, u128)
}
trait Processing {
    fn process(self: Message);
}

impl ProcessingImpl of Processing {
    fn process(self: Message) {
        match self {
            Message::Quit => { 'quitting'.print()},
            Message::Echo(value) => { value.print() },
            Message::Move((x, y)) => {'moving'.print()}
        }
     }
}

fn main() {
    let msg: Message = Message::Quit;
    msg.process(); // prints quitting
    let echoMessage = Message::Echo('value to print');
    echoMessage.process(); // prints value to print
    let messageCoordinants = Message::Move((30, 20));
    messageCoordinants.process(); // prints moving

}