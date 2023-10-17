
use debug::PrintTrait;
fn main() {
    let mut balances: Felt252Dict<u64> = Default::default();
    balances.insert('kevin', 100);
    balances.insert('tom', 20);
    balances.insert('alice', 30);

    let kevin_balance = balances.get('kevin');
    let alice_balance = balances.get('alice');

    kevin_balance.print();
    alice_balance.print();
    assert(kevin_balance == 100, 'kevins balance is not 100');
    assert(alice_balance == 40, 'alices balance is not 40');
}