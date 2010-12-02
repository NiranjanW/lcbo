Version 0.9.7

  * Refactored `TitleCaseHelper` to use the UnicodeUtils library.

Version 0.9.6

  * Removed instances of `Enumerable#reduce` in favour of `Hash[]` for
    constructing hashes.
  * Added `price_per_liter_in_cents` and `price_per_liter_of_alcohol_in_cents`
    to ProductPage.

Version 0.9.5

  * Fixed an encoding bug.

Version 0.9.4

  * Set default value for `ProductListsCrawler`'s `:page` param to zero.

Version 0.9.3

  * 4x speed boost to `InventoryPage.parse` courtesy of Justin Giancola.

Version 0.9.2

 * Fixed potential bug in some versions of Ruby where Object#send semantics
   cause a failure when calling private or protected methods.

Version 0.9.1

 * Removed dependency on Addressable.
 * Refactored tests to use MiniTest::Spec instead of RSpec, removing another
   dependency.

Version 0.9.0

 * Initial public release
