---
title: "String: length"
short-title: length
slug: Web/JavaScript/Reference/Global_Objects/String/length
page-type: javascript-instance-data-property
browser-compat: javascript.builtins.String.length
sidebar: jsref
---

Thuộc tính dữ liệu **`length`** của một giá trị {{jsxref("String")}} chứa độ dài của string tính bằng đơn vị code UTF-16.

{{InteractiveExample("JavaScript Demo: String: length", "shorter")}}

```js interactive-example
const str = "Life, the universe and everything. Answer:";

console.log(`${str} ${str.length}`);
// Expected output: "Life, the universe and everything. Answer: 42"
```

## Giá trị

Một số nguyên không âm.

{{js_property_attributes(0, 0, 0)}}

## Mô tả

Thuộc tính này trả về số đơn vị code trong string. JavaScript sử dụng mã hóa [UTF-16](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#utf-16_characters_unicode_code_points_and_grapheme_clusters), trong đó mỗi ký tự Unicode có thể được mã hóa thành một hoặc hai đơn vị code, vì vậy có thể giá trị trả về bởi `length` không khớp với số ký tự Unicode thực tế trong string. Đối với các bảng chữ cái phổ biến như Latin, Cyrillic, các ký tự CJK nổi tiếng, v.v., điều này không phải là vấn đề, nhưng nếu bạn đang làm việc với một số bảng chữ cái nhất định, như emoji, [ký hiệu toán học](https://en.wikipedia.org/wiki/Mathematical_Alphanumeric_Symbols), hoặc các ký tự Trung Quốc ít phổ biến, bạn có thể cần tính đến sự khác biệt giữa đơn vị code và ký tự.

Đặc tả ngôn ngữ yêu cầu các string có độ dài tối đa là 2<sup>53</sup> - 1 phần tử, đây là giới hạn trên cho [số nguyên chính xác](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_SAFE_INTEGER). Tuy nhiên, một string với độ dài này cần 16384TiB bộ nhớ, không thể chứa trong bộ nhớ của bất kỳ thiết bị hợp lý nào, vì vậy các triển khai có xu hướng giảm ngưỡng, cho phép độ dài string được lưu trữ thuận tiện trong một số nguyên 32-bit.

- Trong V8 (được sử dụng bởi Chrome và Node), độ dài tối đa là 2<sup>29</sup> - 24 (\~1GiB). Trên các hệ thống 32-bit, độ dài tối đa là 2<sup>28</sup> - 16 (\~512MiB).
- Trong Firefox, độ dài tối đa là 2<sup>30</sup> - 2 (\~2GiB). Trước Firefox 65, độ dài tối đa là 2<sup>28</sup> - 1 (\~512MiB).
- Trong Safari, độ dài tối đa là 2<sup>31</sup> - 1 (\~4GiB).

Nếu bạn đang làm việc với các string lớn trong các mã hóa khác (như tệp UTF-8 hoặc blobs), lưu ý rằng khi bạn tải dữ liệu vào một string JS, mã hóa luôn trở thành UTF-16. Kích thước của string có thể khác với kích thước của tệp nguồn.

```js
const str1 = "a".repeat(2 ** 29 - 24); // Success
const str2 = "a".repeat(2 ** 29 - 23); // RangeError: Invalid string length

const buffer = new Uint8Array(2 ** 29 - 24).fill("a".codePointAt(0)); // This buffer is 512MiB in size
const str = new TextDecoder().decode(buffer); // This string is 1GiB in size
```

Đối với string rỗng, `length` là 0.

Thuộc tính static `String.length` không liên quan đến độ dài của string. Đó là [arity](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/length) của hàm `String` (một cách không chính xác, số tham số hình thức của nó), là 1.

Vì `length` đếm đơn vị code thay vì ký tự, nếu bạn muốn lấy số ký tự, trước tiên bạn có thể tách string với [iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Symbol.iterator) của nó, lặp theo ký tự:

```js
function getCharacterLength(str) {
  // The string iterator that is used here iterates over characters,
  // not mere code units
  return [...str].length;
}

console.log(getCharacterLength("A\uD87E\uDC04Z")); // 3
```

Nếu bạn muốn đếm ký tự theo _cụm grapheme_, hãy sử dụng [`Intl.Segmenter`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Segmenter). Trước tiên bạn có thể truyền string bạn muốn tách vào phương thức [`segment()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Segmenter/segment), sau đó lặp qua đối tượng `Segments` được trả về để lấy độ dài:

```js
function getGraphemeCount(str) {
  const segmenter = new Intl.Segmenter("en-US", { granularity: "grapheme" });
  // The Segments object iterator that is used here iterates over characters in grapheme clusters,
  // which may consist of multiple Unicode characters
  return [...segmenter.segment(str)].length;
}

console.log(getGraphemeCount("👨‍👩‍👧‍👧")); // 1
```

## Ví dụ

### Sử dụng cơ bản

```js
const x = "Mozilla";
const empty = "";

console.log(`${x} is ${x.length} code units long`);
// Mozilla is 7 code units long

console.log(`The empty string has a length of ${empty.length}`);
// The empty string has a length of 0
```

### String có độ dài không bằng số ký tự

```js
const emoji = "😄";
console.log(emoji.length); // 2
console.log([...emoji].length); // 1
const adlam = "𞤲𞥋𞤣𞤫";
console.log(adlam.length); // 8
console.log([...adlam].length); // 4
const formula = "∀𝑥∈ℝ,𝑥²≥0";
console.log(formula.length); // 11
console.log([...formula].length); // 9
```

### Gán giá trị cho length

Vì string là primitive, việc cố gắng gán giá trị cho thuộc tính `length` của string không có hiệu lực quan sát được, và sẽ ném lỗi trong [chế độ strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode).

```js
const myString = "bluebells";

myString.length = 4;
console.log(myString); // "bluebells"
console.log(myString.length); // 9
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`Array`: `length`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/length)
