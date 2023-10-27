
// structs can also use generic generic_data_types
use debug::PrintTrait;

#[derive(Drop)]
struct Wallet<T> {
    balance: T
}

trait WalletTrait<T> {
    fn balance(self: @Wallet<T>) -> T;
}

impl WalletImpl<T, impl TCopy: Copy<T>> of WalletTrait<T> {
    fn balance(self: @Wallet<T>) -> T {
        return *self.balance;
    }
}
fn main() {
    let wallet = Wallet { balance: 3 };
    wallet.balance(); // 3
    assert(wallet.balance() == 3, 0); // true
}
