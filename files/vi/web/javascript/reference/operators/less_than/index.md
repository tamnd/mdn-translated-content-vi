---
title: Less than (<)
slug: Web/JavaScript/Reference/Operators/Less_than
page-type: javascript-operator
browser-compat: javascript.operators.less_than
sidebar: jssidebar
---

Toán tử **less than (`<`)** trả về `true` nếu toán hạng bên trái nhỏ hơn toán hạng bên phải, và `false` trong các trường hợp còn lại.

{{InteractiveExample("JavaScript Demo: Less than (<) operator")}}

```js interactive-example
console.log(5 < 3);
// Expected output: false

console.log(3 < 3);
// Expected output: false

// Compare bigint to number
console.log(3n < 5);
// Expected output: true

console.log("aa" < "ab");
// Expected output: true
```

## Cú pháp

```js-nolint
x < y
```

## Mô tả

Các toán hạng được so sánh qua nhiều vòng ép kiểu, có thể tóm tắt như sau:

- Trước tiên, các object được [chuyển đổi sang kiểu primitive](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) bằng cách gọi các phương thức [`[Symbol.toPrimitive]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toPrimitive) (với gợi ý `"number"`), [`valueOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/valueOf), và [`toString()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/toString), theo thứ tự đó. Toán hạng bên trái luôn được ép kiểu trước toán hạng bên phải. Lưu ý rằng mặc dù `[Symbol.toPrimitive]()` được gọi với gợi ý `"number"` (nghĩa là có ưu tiên nhỏ để object trở thành số), giá trị trả về không được [chuyển đổi thành số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion), vì string vẫn được xử lý đặc biệt.
- Nếu cả hai giá trị đều là string, chúng được so sánh như string, dựa trên giá trị của các đơn vị code UTF-16 (không phải code point Unicode) mà chúng chứa.
- Nếu không, JavaScript cố gắng chuyển đổi các kiểu không phải số sang giá trị số:
  - Giá trị boolean `true` và `false` được chuyển đổi thành 1 và 0 tương ứng.
  - `null` được chuyển đổi thành 0.
  - `undefined` được chuyển đổi thành `NaN`.
  - String được chuyển đổi dựa trên các giá trị mà chúng chứa, và được chuyển đổi thành `NaN` nếu chúng không chứa giá trị số.
- Nếu một trong hai giá trị là [`NaN`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/NaN), toán tử trả về `false`.
- Nếu không, các giá trị được so sánh như giá trị số. Giá trị BigInt và number có thể được so sánh cùng nhau.

Các toán tử khác, bao gồm [`>`](/en-US/docs/Web/JavaScript/Reference/Operators/Greater_than), [`>=`](/en-US/docs/Web/JavaScript/Reference/Operators/Greater_than_or_equal), và [`<=`](/en-US/docs/Web/JavaScript/Reference/Operators/Less_than_or_equal), sử dụng cùng thuật toán như `<`. Có hai trường hợp mà tất cả bốn toán tử đều trả về `false`:

- Nếu một trong các toán hạng được chuyển đổi thành BigInt, trong khi toán hạng kia được chuyển đổi thành một string không thể chuyển đổi thành giá trị BigInt (nó ném ra [lỗi cú pháp](/en-US/docs/Web/JavaScript/Reference/Errors/Invalid_BigInt_syntax) khi truyền vào [`BigInt()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt/BigInt)).
- Nếu một trong các toán hạng được chuyển đổi thành `NaN`. (Ví dụ: string không thể chuyển đổi thành số, hoặc `undefined`.)

Đối với tất cả các trường hợp khác, bốn toán tử có các mối quan hệ sau:

```js
x < y === !(x >= y);
x <= y === !(x > y);
x > y === y < x;
x >= y === y <= x;
```

> [!NOTE]
> Một sự khác biệt có thể quan sát được giữa `<` và `>` là thứ tự ép kiểu, đặc biệt là nếu việc ép kiểu sang primitive có tác dụng phụ. Tất cả các toán tử so sánh đều ép kiểu toán hạng bên trái trước toán hạng bên phải.

## Ví dụ

### So sánh string với string

```js
"a" < "b"; // true
"a" < "a"; // false
"a" < "3"; // false

"\uD855\uDE51" < "\uFF3A"; // true
```

### So sánh string với number

```js
"5" < 3; // false
"3" < 3; // false
"3" < 5; // true

"hello" < 5; // false
5 < "hello"; // false

"5" < 3n; // false
"3" < 5n; // true
```

### So sánh number với number

```js
5 < 3; // false
3 < 3; // false
3 < 5; // true
```

### So sánh number với BigInt

```js
5n < 3; // false
3 < 5n; // true
```

### So sánh Boolean, null, undefined, NaN

```js
true < false; // false
false < true; // true

0 < true; // true
true < 1; // false

null < 0; // false
null < 1; // true

undefined < 3; // false
3 < undefined; // false

3 < NaN; // false
NaN < 3; // false
```

### So sánh với tác dụng phụ

So sánh luôn ép kiểu các toán hạng của chúng sang kiểu primitive. Điều này có nghĩa là cùng một object có thể kết thúc với các giá trị khác nhau trong một biểu thức so sánh. Ví dụ, bạn có thể có hai giá trị mà cả hai đều lớn hơn và nhỏ hơn giá trị kia.

```js
class Mystery {
  static #coercionCount = -1;
  valueOf() {
    Mystery.#coercionCount++;
    // The left operand is coerced first, so this will return 0
    // Then it returns 1 for the right operand
    return Mystery.#coercionCount % 2;
  }
}

const l = new Mystery();
const r = new Mystery();
console.log(l < r && r < l);
// true
```

> [!WARNING]
> Đây có thể là nguồn gây nhầm lẫn. Nếu object của bạn cung cấp logic chuyển đổi primitive tùy chỉnh, hãy đảm bảo rằng nó _idempotent_: nhiều lần ép kiểu nên trả về cùng một giá trị.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Greater than (`>`)](/en-US/docs/Web/JavaScript/Reference/Operators/Greater_than)
- [Greater than or equal (`>=`)](/en-US/docs/Web/JavaScript/Reference/Operators/Greater_than_or_equal)
- [Less than or equal (`<=`)](/en-US/docs/Web/JavaScript/Reference/Operators/Less_than_or_equal)
