---
title: Intl.NumberFormat.prototype.format()
short-title: format()
slug: Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/format
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.NumberFormat.format
sidebar: jsref
---

Phương thức **`format()`** của các instance {{jsxref("Intl.NumberFormat")}} định dạng một số theo [locale và tùy chọn định dạng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat#parameters) của đối tượng `Intl.NumberFormat` này.

{{InteractiveExample("JavaScript Demo: Intl.NumberFormat.prototype.format()", "taller")}}

```js interactive-example
const amount = 654321.987;

const options1 = { style: "currency", currency: "RUB" };
const numberFormat1 = new Intl.NumberFormat("ru-RU", options1);

console.log(numberFormat1.format(amount));
// Expected output: "654 321,99 ₽"

const options2 = { style: "currency", currency: "USD" };
const numberFormat2 = new Intl.NumberFormat("en-US", options2);

console.log(numberFormat2.format(amount));
// Expected output: "$654,321.99"
```

## Cú pháp

```js-nolint
format(number)
```

### Tham số

- `number`
  - : Một {{jsxref("Number")}}, {{jsxref("BigInt")}}, hoặc chuỗi để định dạng. Chuỗi được phân tích cú pháp theo cách tương tự như trong [chuyển đổi số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion), ngoại trừ `format()` sẽ dùng giá trị chính xác mà chuỗi đại diện, tránh mất độ chính xác trong quá trình chuyển đổi ngầm định thành số.

> [!NOTE]
> Các phiên bản cũ của đặc tả đã phân tích cú pháp chuỗi như {{jsxref("Number")}}.
> Kiểm tra bảng tương thích cho trình duyệt của bạn.

### Giá trị trả về

Chuỗi đại diện cho `number` đã cho được định dạng theo locale và tùy chọn định dạng của đối tượng {{jsxref("Intl.NumberFormat")}} này.

> [!NOTE]
> Hầu hết thời gian, định dạng được trả về bởi `format()` là nhất quán. Tuy nhiên, đầu ra có thể thay đổi giữa các triển khai, ngay cả trong cùng một locale — các biến thể trong đầu ra là có chủ đích và được phép bởi đặc tả. Nó cũng có thể không phải những gì bạn mong đợi. Ví dụ, chuỗi có thể sử dụng dấu cách không ngắt dòng hoặc được bao quanh bởi các ký tự kiểm soát hướng hai chiều. Bạn không nên so sánh kết quả của `format()` với các hằng số được mã hóa cứng.

## Mô tả

Giá trị {{jsxref("Number")}} trong JavaScript bị mất độ chính xác nếu chúng quá lớn hoặc quá nhỏ, khiến biểu diễn văn bản không chính xác. Nếu bạn đang thực hiện các phép tính với số nguyên lớn hơn {{jsxref("Number.MAX_SAFE_INTEGER")}}, bạn nên sử dụng {{jsxref("BigInt")}} thay thế, sẽ được định dạng đúng:

```js
new Intl.NumberFormat("en-US").format(1234567891234567891); // 1,234,567,891,234,568,000
new Intl.NumberFormat("en-US").format(1234567891234567891n); // 1,234,567,891,234,567,891
```

Bạn cũng có thể truyền qua các chuỗi rất lớn để được định dạng như chuỗi thập phân độ chính xác tùy ý (nếu bạn đang thực hiện tính toán trên dữ liệu, bạn vẫn cần làm việc với `BigInt`):

```js
new Intl.NumberFormat("en-US").format("1234567891234567891"); // 1,234,567,891,234,567,891
```

## Ví dụ

### Sử dụng format

Dùng hàm getter `format` để định dạng một giá trị tiền tệ đơn lẻ. Mã dưới đây cho thấy cách định dạng tiền tệ ruble cho locale Nga:

```js
const options = { style: "currency", currency: "RUB" };
const numberFormat = new Intl.NumberFormat("ru-RU", options);
console.log(numberFormat.format(654321.987));
// "654 321,99 ₽"
```

### Sử dụng format với map

Dùng hàm getter `format` để định dạng tất cả các số trong một mảng. Lưu ý rằng hàm được liên kết với {{jsxref("Intl.NumberFormat")}} mà nó được lấy từ đó, vì vậy nó có thể được truyền trực tiếp đến {{jsxref("Array.prototype.map")}}. Đây được coi là một tàn tích lịch sử, là một phần của quy ước không còn được tuân theo cho các tính năng mới, nhưng được giữ nguyên để duy trì khả năng tương thích với các chương trình hiện có.

```js
const a = [123456.789, 987654.321, 456789.123];
const numberFormat = new Intl.NumberFormat("es-ES");
const formatted = a.map((n) => numberFormat.format(n));
console.log(formatted.join("; "));
// "123.456,789; 987.654,321; 456.789,123"
```

### Sử dụng format với chuỗi

Sử dụng chuỗi, chúng ta có thể chỉ định các số lớn hơn {{jsxref("Number.MAX_SAFE_INTEGER")}} mà không mất độ chính xác.

```js
const numberFormat = new Intl.NumberFormat("en-US");

// Here the value is converted to a Number
console.log(numberFormat.format(987654321987654321));
// 987,654,321,987,654,300

// Here we use a string and don't lose precision
console.log(numberFormat.format("987654321987654321"));
// 987,654,321,987,654,321
```

Chúng ta cũng có thể sử dụng cú pháp số mũ "E" chung cho chuỗi thập phân: `#.#E#`. Mã dưới đây tạo một {{jsxref("BigInt")}}, ép kiểu thành chuỗi với hậu tố `E-6`, rồi định dạng nó.

```js
const numberFormat = new Intl.NumberFormat("en-US");
const bigNum = 1000000000000000110000n;
console.log(numberFormat.format(bigNum));
// "1,000,000,000,000,000,110,000"

// Format as a string using the `E` syntax:
console.log(numberFormat.format(`${bigNum}E-6`));
// "1,000,000,000,000,000.11"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.NumberFormat")}}
- {{jsxref("Number.prototype.toLocaleString()")}}
