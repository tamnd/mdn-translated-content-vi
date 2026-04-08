---
title: Equality (==)
slug: Web/JavaScript/Reference/Operators/Equality
page-type: javascript-operator
browser-compat: javascript.operators.equality
sidebar: jssidebar
---

Operator **bằng (`==`)** kiểm tra xem hai toán hạng của nó có bằng nhau không, trả về kết quả Boolean. Không giống như operator [strict equality](/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality), nó cố gắng chuyển đổi và so sánh các toán hạng có kiểu khác nhau.

{{InteractiveExample("JavaScript Demo: Expressions - Equality operator")}}

```js interactive-example
console.log(1 == 1);
// Expected output: true

console.log("hello" == "hello");
// Expected output: true

console.log("1" == 1);
// Expected output: true

console.log(0 == false);
// Expected output: true
```

## Cú pháp

```js-nolint
x == y
```

## Mô tả

Các operator bằng (`==` và `!=`) cung cấp ngữ nghĩa [IsLooselyEqual](/en-US/docs/Web/JavaScript/Guide/Equality_comparisons_and_sameness#loose_equality_using). Điều này có thể được tóm tắt đại khái như sau:

1. Nếu các toán hạng có cùng kiểu, chúng được so sánh như sau:
   - Object: trả về `true` chỉ khi cả hai toán hạng tham chiếu đến cùng một object.
   - String: trả về `true` chỉ khi cả hai toán hạng có cùng ký tự theo cùng thứ tự.
   - Number: trả về `true` chỉ khi cả hai toán hạng có cùng giá trị. `+0` và `-0` được coi là cùng giá trị. Nếu một trong các toán hạng là `NaN`, trả về `false`; vì vậy, `NaN` không bao giờ bằng `NaN`.
   - Boolean: trả về `true` chỉ khi các toán hạng đều là `true` hoặc đều là `false`.
   - BigInt: trả về `true` chỉ khi cả hai toán hạng có cùng giá trị.
   - Symbol: trả về `true` chỉ khi cả hai toán hạng tham chiếu đến cùng một symbol.
2. Nếu một trong các toán hạng là `null` hoặc `undefined`, toán hạng còn lại cũng phải là `null` hoặc `undefined` để trả về `true`. Nếu không trả về `false`.
3. Nếu một trong các toán hạng là object và toán hạng còn lại là một giá trị nguyên thủy, [chuyển đổi object thành giá trị nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion).
4. Tại bước này, cả hai toán hạng được chuyển đổi thành các giá trị nguyên thủy (một trong String, Number, Boolean, Symbol, và BigInt). Phần còn lại của quá trình chuyển đổi được thực hiện theo từng trường hợp.
   - Nếu chúng cùng kiểu, so sánh chúng sử dụng bước 1.
   - Nếu một trong các toán hạng là Symbol nhưng toán hạng kia không phải, trả về `false`.
   - Nếu một trong các toán hạng là Boolean nhưng toán hạng kia không phải, [chuyển đổi boolean thành số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion): `true` được chuyển đổi thành 1, và `false` được chuyển đổi thành 0. Sau đó so sánh lỏng lẻo hai toán hạng.
   - Number so với String: [chuyển đổi string thành số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion). Việc chuyển đổi thất bại dẫn đến `NaN`, điều này sẽ đảm bảo kết quả bằng nhau là `false`.
   - Number so với BigInt: so sánh theo giá trị toán học của chúng. Nếu số là ±Infinity hoặc `NaN`, trả về `false`.
   - String so với BigInt: chuyển đổi string thành BigInt bằng thuật toán tương tự như hàm khởi tạo [`BigInt()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt/BigInt). Nếu chuyển đổi thất bại, trả về `false`.

Loose equality có tính _đối xứng_: `A == B` luôn có ngữ nghĩa giống hệt `B == A` cho mọi giá trị của `A` và `B` (ngoại trừ thứ tự của các chuyển đổi được áp dụng).

Sự khác biệt đáng chú ý nhất giữa operator này và operator [strict equality](/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality) (`===`) là operator strict equality không cố gắng chuyển đổi kiểu. Thay vào đó, operator strict equality luôn coi các toán hạng có kiểu khác nhau là khác nhau. Operator strict equality về cơ bản chỉ thực hiện bước 1, sau đó trả về `false` cho tất cả các trường hợp khác.

Có một "vi phạm có chủ ý" đối với thuật toán trên: nếu một trong các toán hạng là [`document.all`](/en-US/docs/Web/API/Document/all), nó được coi như là `undefined`. Điều này có nghĩa là `document.all == null` là `true`, nhưng `document.all === undefined && document.all === null` là `false`.

## Ví dụ

### So sánh không có chuyển đổi kiểu

```js
1 == 1; // true
"hello" == "hello"; // true
```

### So sánh có chuyển đổi kiểu

```js
"1" == 1; // true
1 == "1"; // true
0 == false; // true
0 == null; // false
0 == undefined; // false
0 == !!null; // true, look at Logical NOT operator
0 == !!undefined; // true, look at Logical NOT operator
null == undefined; // true

const number1 = new Number(3);
const number2 = new Number(3);
number1 == 3; // true
number1 == number2; // false
```

### So sánh các object

```js
const object1 = {
  key: "value",
};

const object2 = {
  key: "value",
};

console.log(object1 == object2); // false
console.log(object1 == object1); // true
```

### So sánh các string và String object

Lưu ý rằng các string được xây dựng bằng `new String()` là các object. Nếu bạn so sánh một trong số chúng với một string literal, `String` object sẽ được chuyển đổi thành string literal và nội dung sẽ được so sánh. Tuy nhiên, nếu cả hai toán hạng đều là `String` object, thì chúng được so sánh như object và phải tham chiếu đến cùng một object thì việc so sánh mới thành công:

```js
const string1 = "hello";
const string2 = String("hello");
const string3 = new String("hello");
const string4 = new String("hello");

console.log(string1 == string2); // true
console.log(string1 == string3); // true
console.log(string2 == string3); // true
console.log(string3 == string4); // false
console.log(string4 == string4); // true
```

### So sánh Date và string

```js
const d = new Date("1995-12-17T03:24:00");
const s = d.toString(); // for example: "Sun Dec 17 1995 03:24:00 GMT-0800 (Pacific Standard Time)"
console.log(d == s); // true
```

### So sánh mảng và string

```js
const a = [1, 2, 3];
const b = "1,2,3";
a == b; // true, `a` converts to string

const c = [true, 0.5, "hey"];
const d = c.toString(); // "true,0.5,hey"
c == d; // true
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Inequality (`!=`)](/en-US/docs/Web/JavaScript/Reference/Operators/Inequality)
- [Strict equality (`===`)](/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality)
- [Strict inequality (`!==`)](/en-US/docs/Web/JavaScript/Reference/Operators/Strict_inequality)
