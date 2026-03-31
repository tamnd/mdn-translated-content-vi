---
title: BigInt
slug: Web/JavaScript/Reference/Global_Objects/BigInt
page-type: javascript-class
browser-compat: javascript.builtins.BigInt
sidebar: jsref
---

Giá trị **`BigInt`** đại diện cho các giá trị số nguyên [quá lớn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_SAFE_INTEGER) hoặc [quá nhỏ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MIN_SAFE_INTEGER) để có thể biểu diễn bằng kiểu {{Glossary("Primitive", "primitive")}} `number`.

## Mô tả

Một **giá trị BigInt**, đôi khi còn được gọi đơn giản là **BigInt**, là một {{Glossary("Primitive", "primitive")}} `bigint`, được tạo bằng cách thêm `n` vào cuối một số nguyên literal, hoặc bằng cách gọi hàm {{jsxref("BigInt/BigInt", "BigInt()")}} (không có toán tử `new`) và truyền cho nó một giá trị số nguyên hoặc giá trị chuỗi.

```js
const previouslyMaxSafeInteger = 9007199254740991n;

const alsoHuge = BigInt(9007199254740991);
// 9007199254740991n

const hugeString = BigInt("9007199254740991");
// 9007199254740991n

const hugeHex = BigInt("0x1fffffffffffff");
// 9007199254740991n

const hugeOctal = BigInt("0o377777777777777777");
// 9007199254740991n

const hugeBin = BigInt(
  "0b11111111111111111111111111111111111111111111111111111",
);
// 9007199254740991n
```

Các giá trị BigInt tương tự như các giá trị Number theo một số cách, nhưng cũng khác nhau ở một vài điểm quan trọng: Giá trị BigInt không thể được dùng với các phương thức trong đối tượng [`Math`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math) tích hợp sẵn và không thể trộn lẫn với giá trị Number trong các phép tính; chúng phải được ép kiểu về cùng một kiểu. Tuy nhiên, hãy cẩn thận khi ép kiểu qua lại, vì độ chính xác của giá trị BigInt có thể bị mất khi nó được ép kiểu thành giá trị Number.

### Thông tin kiểu

Khi kiểm tra với `typeof`, một giá trị BigInt (primitive `bigint`) sẽ cho kết quả `"bigint"`:

```js
typeof 1n === "bigint"; // true
typeof BigInt("1") === "bigint"; // true
```

Một giá trị BigInt cũng có thể được bao bọc trong một `Object`:

```js
typeof Object(1n) === "object"; // true
```

### Toán tử

Hầu hết các toán tử đều hỗ trợ BigInt, tuy nhiên hầu hết không cho phép các toán hạng có kiểu hỗn hợp — cả hai toán hạng phải là BigInt hoặc không cái nào:

- [Toán tử số học](/en-US/docs/Web/JavaScript/Reference/Operators#arithmetic_operators): `+`, `-`, `*`, `/`, `%`, `**`
- [Toán tử bitwise](/en-US/docs/Web/JavaScript/Reference/Operators#bitwise_shift_operators): `>>`, `<<`, `&`, `|`, `^`, `~`
- [Phủ định đơn nguyên (`-`)](/en-US/docs/Web/JavaScript/Reference/Operators/Unary_negation)
- [Tăng/giảm](/en-US/docs/Web/JavaScript/Reference/Operators#increment_and_decrement): `++`, `--`

Các toán tử trả về boolean cho phép trộn số và BigInt làm toán hạng:

- [Toán tử quan hệ](/en-US/docs/Web/JavaScript/Reference/Operators#relational_operators) và [toán tử bằng nhau](/en-US/docs/Web/JavaScript/Reference/Operators#equality_operators): `>`, `<`, `>=`, `<=`, `==`, `!=`, `===`, `!==`
- [Toán tử logic](/en-US/docs/Web/JavaScript/Reference/Operators#binary_logical_operators) chỉ phụ thuộc vào [tính truthy](/en-US/docs/Glossary/Truthy) của các toán hạng

Một số toán tử không hỗ trợ BigInt:

- [Cộng đơn nguyên (`+`)](/en-US/docs/Web/JavaScript/Reference/Operators/Unary_plus) không thể được hỗ trợ do xung đột cách dùng trong asm.js, vì vậy nó đã bị bỏ qua [để không làm hỏng asm.js](https://github.com/tc39/proposal-bigint/blob/master/ADVANCED.md#dont-break-asmjs).
- [Dịch phải không dấu (`>>>`)](/en-US/docs/Web/JavaScript/Reference/Operators/Unsigned_right_shift) là toán tử bitwise duy nhất không được hỗ trợ, vì mọi giá trị BigInt đều có dấu.

Các trường hợp đặc biệt:

- Phép cộng (`+`) liên quan đến chuỗi và BigInt trả về chuỗi.
- Phép chia (`/`) cắt bỏ phần thập phân về phía không, vì BigInt không thể biểu diễn số thập phân.

```js
const previousMaxSafe = BigInt(Number.MAX_SAFE_INTEGER); // 9007199254740991n
const maxPlusOne = previousMaxSafe + 1n; // 9007199254740992n
const theFuture = previousMaxSafe + 2n; // 9007199254740993n, this works now!
const prod = previousMaxSafe * 2n; // 18014398509481982n
const diff = prod - 10n; // 18014398509481972n
const mod = prod % 10n; // 2n
const bigN = 2n ** 54n; // 18014398509481984n
bigN * -1n; // -18014398509481984n
const expected = 4n / 2n; // 2n
const truncated = 5n / 2n; // 2n, not 2.5n
```

### So sánh

Một giá trị BigInt không bằng nghiêm ngặt với giá trị Number, nhưng _bằng_ theo nghĩa lỏng lẻo:

```js
0n === 0; // false
0n == 0; // true
```

Giá trị Number và giá trị BigInt có thể được so sánh như bình thường:

```js
1n < 2; // true
2n > 1; // true
2 > 2; // false
2n > 2; // false
2n >= 2; // true
```

Các giá trị BigInt và Number có thể trộn lẫn trong mảng và sắp xếp:

```js
const mixed = [4n, 6, -12n, 10, 4, 0, 0n];
// [4n, 6, -12n, 10, 4, 0, 0n]

mixed.sort(); // default sorting behavior
// [ -12n, 0, 0n, 10, 4n, 4, 6 ]

mixed.sort((a, b) => a - b);
// won't work since subtraction will not work with mixed types
// TypeError: can't convert BigInt value to Number value

// sort with an appropriate numeric comparator
mixed.sort((a, b) => (a < b ? -1 : a > b ? 1 : 0));
// [ -12n, 0, 0n, 4n, 4, 6, 10 ]
```

Lưu ý rằng các so sánh với các giá trị BigInt được bao bọc trong `Object` hoạt động như với các đối tượng khác, chỉ chỉ ra sự bằng nhau khi cùng một instance đối tượng được so sánh:

```js
Object(0n) === 0n; // false
Object(0n) === Object(0n); // false

const o = Object(0n);
o === o; // true
```

Vì việc ép kiểu qua lại giữa giá trị Number và giá trị BigInt có thể dẫn đến mất độ chính xác, nên khuyến nghị như sau:

- Chỉ dùng giá trị BigInt khi các giá trị lớn hơn 2<sup>53</sup> được kỳ vọng một cách hợp lý.
- Không ép kiểu qua lại giữa giá trị BigInt và giá trị Number.

### Điều kiện

Một giá trị BigInt tuân theo các quy tắc chuyển đổi tương tự như Number khi:

- nó được chuyển đổi thành [`Boolean`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean): thông qua hàm [`Boolean`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean);
- khi được dùng với [toán tử logic](/en-US/docs/Web/JavaScript/Reference/Operators) `||`, `&&`, và `!`; hoặc
- trong một kiểm tra điều kiện như câu lệnh [`if`](/en-US/docs/Web/JavaScript/Reference/Statements/if...else).

Cụ thể, chỉ có `0n` là [falsy](/en-US/docs/Glossary/Falsy); mọi thứ khác đều là [truthy](/en-US/docs/Glossary/Truthy).

```js
if (0n) {
  console.log("Hello from the if!");
} else {
  console.log("Hello from the else!");
}
// "Hello from the else!"

0n || 12n; // 12n
0n && 12n; // 0n
Boolean(0n); // false
Boolean(12n); // true
!12n; // false
!0n; // true
```

### Mã hóa

Các phép tính được hỗ trợ trên giá trị BigInt không phải là constant-time và do đó dễ bị tấn công [timing attack](https://en.wikipedia.org/wiki/Timing_attack). Vì vậy, BigInt trong JavaScript có thể nguy hiểm khi dùng trong mã hóa mà không có các biện pháp giảm thiểu. Như một ví dụ rất chung, kẻ tấn công có thể đo sự chênh lệch thời gian giữa `101n ** 65537n` và `17n ** 9999n`, và suy ra độ lớn của các bí mật, chẳng hạn như khóa riêng tư, dựa trên thời gian trôi qua. Nếu bạn vẫn phải dùng BigInt, hãy xem [Timing attack FAQ](https://timing.attacks.cr.yp.to/programming.html) để biết lời khuyên chung về vấn đề này.

### Sử dụng trong JSON

Sử dụng [`JSON.stringify()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify) với bất kỳ giá trị BigInt nào sẽ gây ra `TypeError`, vì giá trị BigInt không được serialize trong JSON theo mặc định. Tuy nhiên, `JSON.stringify()` đặc biệt để lại một cửa hậu cho giá trị BigInt: nó sẽ thử gọi phương thức `toJSON()` của BigInt. (Nó không làm vậy với bất kỳ giá trị nguyên thủy nào khác.) Vì vậy, bạn có thể triển khai phương thức `toJSON()` của riêng mình (đây là một trong số ít trường hợp mà việc vá các đối tượng tích hợp sẵn không bị phản đối rõ ràng):

```js
BigInt.prototype.toJSON = function () {
  return { $bigint: this.toString() };
};
```

Thay vì ném lỗi, `JSON.stringify()` bây giờ tạo ra một chuỗi như thế này:

```js
console.log(JSON.stringify({ a: 1n }));
// {"a":{"$bigint":"1"}}
```

Nếu bạn không muốn vá `BigInt.prototype`, bạn có thể dùng tham số [`replacer`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify#the_replacer_parameter) của `JSON.stringify` để serialize giá trị BigInt:

```js
const replacer = (key, value) =>
  typeof value === "bigint" ? { $bigint: value.toString() } : value;

const data = {
  number: 1,
  big: 18014398509481982n,
};
const stringified = JSON.stringify(data, replacer);

console.log(stringified);
// {"number":1,"big":{"$bigint":"18014398509481982"}}
```

Sau đó bạn có thể dùng tham số [`reviver`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/parse#using_the_reviver_parameter) của `JSON.parse` để xử lý chúng:

```js
const reviver = (key, value) =>
  value !== null &&
  typeof value === "object" &&
  "$bigint" in value &&
  typeof value.$bigint === "string"
    ? BigInt(value.$bigint)
    : value;

const payload = '{"number":1,"big":{"$bigint":"18014398509481982"}}';
const parsed = JSON.parse(payload, reviver);

console.log(parsed);
// { number: 1, big: 18014398509481982n }
```

> [!NOTE]
> Mặc dù có thể làm cho replacer của `JSON.stringify()` trở nên chung chung và serialize đúng các giá trị BigInt cho tất cả các đối tượng như đã trình bày ở trên, reviver của `JSON.parse()` phải được dùng cẩn thận, vì serialization là _không thể đảo ngược_: không thể phân biệt giữa một đối tượng tình cờ có thuộc tính tên `$bigint` và một BigInt thực sự.
>
> Ngoài ra, ví dụ trên tạo ra toàn bộ đối tượng trong quá trình replacing và reviving, điều này có thể ảnh hưởng đến hiệu suất hoặc lưu trữ đối với các đối tượng lớn hơn chứa nhiều BigInt. Nếu bạn biết hình dạng của payload, tốt hơn là chỉ serialize chúng dưới dạng chuỗi và phục hồi chúng dựa trên tên key của thuộc tính.

Thực tế, JSON cho phép các số literal tùy ý dài; chúng chỉ không thể được phân tích với độ chính xác đầy đủ trong JavaScript. Nếu bạn đang giao tiếp với một chương trình khác bằng ngôn ngữ hỗ trợ số nguyên dài hơn (chẳng hạn như số nguyên 64-bit), và bạn muốn truyền BigInt dưới dạng số JSON thay vì chuỗi JSON, hãy xem [Serialization số không mất mát](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON#using_json_numbers).

### Ép kiểu BigInt

Nhiều thao tác tích hợp sẵn kỳ vọng BigInt trước tiên ép kiểu đối số của chúng thành BigInt. [Thao tác](https://tc39.es/ecma262/multipage/abstract-operations.html#sec-tobigint) có thể được tóm tắt như sau:

- BigInt được trả về nguyên vẹn.
- [`undefined`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined) và [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) ném ra {{jsxref("TypeError")}}.
- `true` chuyển thành `1n`; `false` chuyển thành `0n`.
- Chuỗi được chuyển đổi bằng cách phân tích chúng như thể chúng chứa một integer literal. Bất kỳ lỗi phân tích nào đều dẫn đến {{jsxref("SyntaxError")}}. Cú pháp là một tập con của [string numeric literals](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion), trong đó dấu thập phân hoặc chỉ số mũ không được phép.
- [Số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number) ném ra {{jsxref("TypeError")}} để ngăn việc ép kiểu ngầm định không có chủ ý gây mất độ chính xác.
- [Symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol) ném ra {{jsxref("TypeError")}}.
- Đối tượng trước tiên được [chuyển đổi thành primitive](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) bằng cách gọi các phương thức [`[Symbol.toPrimitive]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toPrimitive) (với `"number"` làm hint), `valueOf()`, và `toString()` theo thứ tự đó. Primitive kết quả sau đó được chuyển đổi thành BigInt.

Cách tốt nhất để đạt được gần như cùng hiệu ứng trong JavaScript là thông qua hàm [`BigInt()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt/BigInt): `BigInt(x)` dùng cùng thuật toán để chuyển đổi `x`, ngoại trừ [Number](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number) không ném ra {{jsxref("TypeError")}}, mà được chuyển đổi thành BigInt nếu chúng là số nguyên.

Lưu ý rằng các thao tác tích hợp sẵn kỳ vọng BigInt thường cắt bớt BigInt xuống độ rộng cố định sau khi ép kiểu. Điều này bao gồm {{jsxref("BigInt.asIntN()")}}, {{jsxref("BigInt.asUintN()")}}, và các phương thức của {{jsxref("BigInt64Array")}} và {{jsxref("BigUint64Array")}}.

## Constructor

- {{jsxref("BigInt/BigInt", "BigInt()")}}
  - : Trả về các giá trị nguyên thủy kiểu BigInt. Ném lỗi khi được gọi với `new`.

## Phương thức tĩnh

- {{jsxref("BigInt.asIntN()")}}
  - : Kẹp một giá trị BigInt vào một giá trị số nguyên có dấu, và trả về giá trị đó.
- {{jsxref("BigInt.asUintN()")}}
  - : Kẹp một giá trị BigInt vào một giá trị số nguyên không dấu, và trả về giá trị đó.

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `BigInt.prototype` và được chia sẻ bởi tất cả các instance `BigInt`.

- {{jsxref("Object/constructor", "BigInt.prototype.constructor")}}
  - : Hàm constructor đã tạo ra đối tượng instance. Đối với các instance `BigInt`, giá trị ban đầu là constructor {{jsxref("BigInt/BigInt", "BigInt")}}.
- `BigInt.prototype[Symbol.toStringTag]`
  - : Giá trị ban đầu của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"BigInt"`. Thuộc tính này được dùng trong {{jsxref("Object.prototype.toString()")}}. Tuy nhiên, vì `BigInt` cũng có phương thức [`toString()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt/toString) riêng, thuộc tính này không được dùng trừ khi bạn gọi [`Object.prototype.toString.call()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/call) với một BigInt làm `thisArg`.

## Phương thức instance

- {{jsxref("BigInt.prototype.toLocaleString()")}}
  - : Trả về một chuỗi biểu diễn giá trị BigInt này nhạy cảm với ngôn ngữ. Ghi đè phương thức [`Object.prototype.toLocaleString()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/toLocaleString).
- {{jsxref("BigInt.prototype.toString()")}}
  - : Trả về một chuỗi biểu diễn giá trị BigInt này theo cơ số (hệ) được chỉ định. Ghi đè phương thức [`Object.prototype.toString()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/toString).
- {{jsxref("BigInt.prototype.valueOf()")}}
  - : Trả về giá trị BigInt này. Ghi đè phương thức [`Object.prototype.valueOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/valueOf).

## Ví dụ

### Tính số nguyên tố

```js
function isPrime(n) {
  if (n < 2n) {
    return false;
  }
  if (n % 2n === 0n) {
    return n === 2n;
  }
  for (let factor = 3n; factor * factor <= n; factor += 2n) {
    if (n % factor === 0n) {
      return false;
    }
  }
  return true;
}

// Takes a BigInt value as an argument, returns nth prime number as a BigInt value
function nthPrime(nth) {
  let maybePrime = 2n;
  let prime = 0n;

  while (nth >= 0n) {
    if (isPrime(maybePrime)) {
      nth--;
      prime = maybePrime;
    }
    maybePrime++;
  }

  return prime;
}

nthPrime(20n);
// 73n
```

> [!NOTE]
> Triển khai `isPrime()` chỉ dành cho mục đích minh họa. Với ứng dụng thực tế, bạn nên dùng một thuật toán được memoize nhiều như [Sàng Eratosthenes](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes) để tránh tính toán lặp lại.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`Number`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number)
- [`Number.MAX_SAFE_INTEGER`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_SAFE_INTEGER)
