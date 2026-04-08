---
title: Addition (+)
slug: Web/JavaScript/Reference/Operators/Addition
page-type: javascript-operator
browser-compat: javascript.operators.addition
sidebar: jssidebar
---

Operator **cộng (`+`)** tạo ra tổng của các toán hạng số hoặc nối chuỗi.

{{InteractiveExample("JavaScript Demo: Addition (+) operator")}}

```js interactive-example
console.log(2 + 2);
// Expected output: 4

console.log(2 + true);
// Expected output: 3

console.log("hello " + "everyone");
// Expected output: "hello everyone"

console.log(2001 + ": A Space Odyssey");
// Expected output: "2001: A Space Odyssey"
```

## Cú pháp

```js-nolint
x + y
```

## Mô tả

Operator `+` được nạp chồng cho hai thao tác riêng biệt: cộng số và nối chuỗi. Khi ước lượng, đầu tiên nó [ép buộc cả hai toán hạng thành các giá trị nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion). Sau đó, kiểu của hai toán hạng được kiểm tra:

- Nếu một vế là string, toán hạng còn lại cũng [được chuyển đổi thành string](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion) và chúng được nối lại với nhau.
- Nếu cả hai đều là [BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt), phép cộng BigInt được thực hiện. Nếu một vế là BigInt nhưng vế kia không phải, một {{jsxref("TypeError")}} được ném ra.
- Nếu không, cả hai vế đều [được chuyển đổi thành số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion), và phép cộng số được thực hiện.

Nối chuỗi thường được cho là tương đương với [template literals](/en-US/docs/Web/JavaScript/Reference/Template_literals) hoặc [`String.prototype.concat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/concat), nhưng chúng không phải vậy. Phép cộng ép buộc expression thành một _giá trị nguyên thủy_, gọi [`valueOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/valueOf) ưu tiên; mặt khác, template literals và `concat()` ép buộc expression thành một _string_, gọi [`toString()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/toString) ưu tiên. Nếu expression có phương thức [`[Symbol.toPrimitive]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toPrimitive), nối chuỗi gọi nó với `"default"` làm gợi ý, trong khi template literals sử dụng `"string"`. Điều này quan trọng đối với các object có các biểu diễn string và nguyên thủy khác nhau — chẳng hạn như {{jsxref("Temporal")}}, có các phương thức `valueOf()` đều ném ra lỗi.

```js
const t = Temporal.Now.instant();
"" + t; // Throws TypeError
`${t}`; // '2022-07-31T04:48:56.113918308Z'
"".concat(t); // '2022-07-31T04:48:56.113918308Z'
```

Bạn không nên dùng `"" + x` để thực hiện [ép buộc chuỗi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion).

## Ví dụ

### Cộng dùng số

```js
1 + 2; // 3
```

Các giá trị không phải string, không phải BigInt khác được ép buộc thành số:

```js
true + 1; // 2
false + false; // 0
```

### Cộng dùng BigInt

```js
1n + 2n; // 3n
```

Bạn không thể trộn lẫn các toán hạng BigInt và số trong phép cộng.

```js example-bad
1n + 2; // TypeError: Cannot mix BigInt and other types, use explicit conversions
2 + 1n; // TypeError: Cannot mix BigInt and other types, use explicit conversions
"1" + 2n; // TypeError: Cannot mix BigInt and other types, use explicit conversions
```

Để thực hiện phép cộng với BigInt và một giá trị không phải BigInt, hãy chuyển đổi một trong hai toán hạng:

```js
1n + BigInt(2); // 3n
Number(1n) + 2; // 3
```

### Cộng dùng string

Nếu một trong các toán hạng là string, toán hạng còn lại được chuyển đổi thành string và chúng được nối lại:

```js
"foo" + "bar"; // "foobar"
5 + "foo"; // "5foo"
"foo" + false; // "foofalse"
"2" + 2; // "22"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Subtraction (`-`)](/en-US/docs/Web/JavaScript/Reference/Operators/Subtraction)
- [Division (`/`)](/en-US/docs/Web/JavaScript/Reference/Operators/Division)
- [Multiplication (`*`)](/en-US/docs/Web/JavaScript/Reference/Operators/Multiplication)
- [Remainder (`%`)](/en-US/docs/Web/JavaScript/Reference/Operators/Remainder)
- [Exponentiation (`**`)](/en-US/docs/Web/JavaScript/Reference/Operators/Exponentiation)
- [Increment (`++`)](/en-US/docs/Web/JavaScript/Reference/Operators/Increment)
- [Decrement (`--`)](/en-US/docs/Web/JavaScript/Reference/Operators/Decrement)
- [Unary negation (`-`)](/en-US/docs/Web/JavaScript/Reference/Operators/Unary_negation)
- [Unary plus (`+`)](/en-US/docs/Web/JavaScript/Reference/Operators/Unary_plus)
