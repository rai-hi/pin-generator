# Bank Card PIN generator
I created this as part of a coding challenge for a job interview. It uses Ruby. A (slightly modified, for privacy) description of the task follows:

> We are opening a new bank called InterviewBank and require you to write a piece of software to generate new PINs for customer cards. When generating a PIN, you will be provided with the customer's personal details (eg name, date of birth), and the details of the bank account (eg sort code, account number). The generated PIN must satisfy the following rules:
> - It should be 4 digits long
> - It must not contain more than two consecutive numbers (eg 1112, 1111 are not allowed; 1211 is allowed)
> - It must not contain a complete consecutive number sequence (eg 1234, 3456 are not allowed)
> - It is distinct from the user's past three PINs (you may assume that a sufficient history is provided alongside the bank account details)
> - It cannot be contained in the user's bank account number or sort code (eg for an account with sort code 71-13-13 and account number 13561342, the PINs 1356, 1342 and 7113 are all not allowed)
> Additional rules will be added in future. However, once the generator is in active use, any modification to the code will require a complete code review of any modified compilation unit (eg file) for the purpose of security auditing; as such, you should ensure that the addition of a new rule requires minimal modification of existing code.
> Once the specified rules have been implemented, suggest and implement an additional rule to demonstrate the ease with which the generator can be extended.

I added the CurrentYearValidator, which checks the PIN isn't the same as the current year. The only existing compilation unit that would need re-auditing would be `code/pin_validators/pin_validators.rb`, and that more or less is just an array, so simple to review.

## Running
- Install ruby. I used v2.6.3.
- Install bundler: `gem install bundler`
- Run bundler: `bundle`
- Run the code, and print out 15 random PINs using the following command:

`ruby -Icode -I code/pin_validators code/challenge_runner.rb`

## Tests
- There is a test suite in the `test/` directory. You can use `guard` to run all of the tests.
