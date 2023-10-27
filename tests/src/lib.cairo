
// use scarb cairo-test to run tests inside a package

#[derive(Copy, Drop)]
struct Guess {
    value: u64
}

trait GuessTrait {
    fn new_guess(value: u64) -> Guess;
}

impl GuessImpl of GuessTrait {
    fn new_guess(value: u64) -> Guess {
        if value < 1 || value > 100 {
            let mut data = ArrayTrait::new();
            data.append('Guess must be >= 1 and <= 100');
            panic(data);
        }
        return Guess { value };
    }
}

#[test]
fn exploration() {
    let result = 2 + 2;
    assert(result == 4, 'result is not 4');
}

// #[test]
// fn another() {
//     let result = 2 + 2;
//     assert(result == 6, 'make the test fail');
// }

// i believe cfg stands for configure
#[cfg(test)]
mod tests {
    use super::Guess;
    use super::GuessTrait;

    #[test]
    #[should_panic(expected: ('Guess must be >= 1 and <= 100',))]
    fn greater_than_100() {
        GuessTrait::new_guess(200);
    }
}
fn main() {}