// Collatz Conjecture in Rust(Should I've renamed this to .rlib extension?)
use num_integer::div_floor;

fn collatz_sequence(number:  &mut i32) -> Vec<i32> {
	/*
	Generates the Collatz sequence for a given positive integer.

    Args:
        number: (mutable integer) The starting positive integer for the sequence.

    Returns:
        Vec<i32>: A vector containing the Collatz sequence(integers) from the starting number to 1.
	*/
	let mut sequence = Vec::new();
	if *number <= 0 {
		return sequence;
	}
    sequence.push(*number);
    while *number != 1 {
        if *number % 2 == 0 {
            *number = div_floor(*number, 2);
		} else {
            *number = (3 * *number) + 1;
		}
        sequence.push(*number);
	}
    return sequence;
}

fn main() {
	let mut start_number: i32 = 12;
	println!("Collatz sequence for {}:", start_number);
	let sequence = collatz_sequence(&mut start_number);
	println!("{:?}", sequence);
	// Output: 	[12, 6, 3, 10, 5, 16, 8, 4, 2, 1]

	let mut start_number_2 = 27;
	println!("Collatz sequence for {}:", start_number_2);
	let sequence_2 = collatz_sequence(&mut start_number_2);
	println!("{:?}", sequence_2);
	// Output: 	[27, 82, 41, 124, 62, 31, 94, 47...]
}