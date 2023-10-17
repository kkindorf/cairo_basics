// database of users
struct UserDatabase<T> {
    // the number of users in the db
    users_amount: u64,
    // contains name key and balance of name
    balances: Felt252Dict<T>
}

// database core functionality
trait UserDatabaseTrait<T> {
    fn new() -> UserDatabase<T>;
    fn add_user<impl TDrop: Drop<T>>(ref self: UserDatabase<T>, name: felt252, balance: T);
    fn get_balance<impl TCopy: Copy<T>>(ref self: UserDatabase<T>, name: felt252) -> T;
}

impl UserDatabaseImpl<T, impl TDefault: Felt252DictValue<T>> of UserDatabaseTrait<T> {
    fn new() -> UserDatabase<T> {
        UserDatabase {
            users_amount: 0, 
            balances: Default::default()
        }
    }

    fn get_balance<impl TCopy: Copy<T>>(ref self: UserDatabase<T>, name: felt252) -> T { self.balances.get(name)
    }

    fn add_user<impl TDrop: Drop<T>>(ref self: UserDatabase<T>, name: felt252, balance: T) {
        self.balances.insert(name, balance);
        self.users_amount += 1;
    }

}

impl UserDatabaseDestruct<T, impl TDrop: Drop<T>, impl TDefault: Felt252DictValue<T>> of Destruct<UserDatabase<T>> {
    fn destruct(self: UserDatabase<T>) nopanic {
        // squash forces compiler
        // to only use the last
        // key value pair entered
        // if duplicates exist
        self.balances.squash();
    }
}

fn main() {
    let mut db = UserDatabaseTrait::new();
    db.add_user('kevin', 100);
    db.add_user('alice', 200);

    // second inserts of same key are 
    // found instead of first
    db.add_user('kevin', 200);
    db.add_user('alice', 300);

    let kevin_balance = db.get_balance('kevin');
    let alice_balance = db.get_balance('alice');
    assert(kevin_balance == 200, 'kevins balance is not 200');
    assert(alice_balance == 300, 'alices balance is not 300');
    


}