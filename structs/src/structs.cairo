use debug::PrintTrait;
#[derive(Copy, Drop)]
struct User {
    active: bool,
    username: felt252,
    email: felt252,
    sign_in_count: u64
}

fn main() {
    // use mut keyword to make user1 mutable
    let mut user1 = User {
        active: true,
        username: 'username124',
        email: 'anemail@gmail.com',
        sign_in_count: 1
    };
    user1.email = 'adifferentemail@gmail.com';

    let mut user2 = build_user('foobar@gmail.com', 'username2');

    user2.email.print();
    user2.username.print();




}

fn build_user(email: felt252, username: felt252) -> User {
    // return a new user instance. notice no semicolon
    User { active: true, username: username, email: email, sign_in_count: 1 }
} 


// since the param names are the same as the User attribute names, you can shorthand email and username values for the User instance
fn build_user_shorthand(email: felt252, username: felt252) -> User {
    User { active: true, email, username, sign_in_count: 1 }
}