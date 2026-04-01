---
title: String.prototype.charCodeAt()
short-title: charCodeAt()
slug: Web/JavaScript/Reference/Global_Objects/String/charCodeAt
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.charCodeAt
sidebar: jsref
---

Phương thức **`charCodeAt()`** của các giá trị {{jsxref("String")}} trả về một số nguyên từ `0` đến `65535` biểu diễn đơn vị code UTF-16 tại chỉ mục đã cho.

`charCodeAt()` luôn indexing string như một chuỗi [đơn vị code UTF-16](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#utf-16_characters_unicode_code_points_and_grapheme_clusters), vì vậy nó có thể trả về các surrogate đơn lẻ. Để lấy toàn bộ code point Unicode tại chỉ mục đã cho, hãy sử dụng {{jsxref("String.prototype.codePointAt()")}}.

{{InteractiveExample("JavaScript Demo: String.prototype.charCodeAt()", "shorter")}}

```js interactive-example
const sentence = "The quick brown fox jumps over the lazy dog.";

const index = 4;

console.log(
  `Character code ${sentence.charCodeAt(index)} is equal to ${sentence.charAt(
    index,
  )}`,
);
// Expected output: "Character code 113 is equal to q"
```

## Cú pháp

```js-nolint
charCodeAt(index)
```

### Tham số

- `index`
  - : Chỉ mục bắt đầu từ 0 của ký tự cần trả về. [Được chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion) — `undefined` được chuyển đổi thành 0.

### Giá trị trả về

Một số nguyên từ `0` đến `65535` biểu diễn giá trị đơn vị code UTF-16 của ký tự tại `index` được chỉ định. Nếu `index` nằm ngoài phạm vi `0` – `str.length - 1`, `charCodeAt()` trả về {{jsxref("NaN")}}.

## Mô tả

Các ký tự trong một string được đánh chỉ mục từ trái sang phải. Chỉ mục của ký tự đầu tiên là `0`, và chỉ mục của ký tự cuối cùng trong một string có tên `str` là `str.length - 1`.

Các code point Unicode có phạm vi từ `0` đến `1114111` (`0x10FFFF`). `charCodeAt()` luôn trả về một giá trị nhỏ hơn `65536`, bởi vì các code point cao hơn được biểu diễn bởi _một cặp_ pseudo-character surrogate 16-bit. Do đó, để lấy một ký tự đầy đủ có giá trị lớn hơn `65535`, cần lấy không chỉ `charCodeAt(i)`, mà còn `charCodeAt(i + 1)` (như thể đang xử lý một string có hai ký tự), hoặc sử dụng {{jsxref("String/codePointAt", "codePointAt(i)")}} thay thế. Để biết thông tin về Unicode, xem [UTF-16 characters, Unicode code points, and grapheme clusters](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#utf-16_characters_unicode_code_points_and_grapheme_clusters).

## Ví dụ

### Sử dụng charCodeAt()

Ví dụ sau trả về `65`, giá trị Unicode cho A.

```js
"ABC".charCodeAt(0); // returns 65
```

`charCodeAt()` có thể trả về các surrogate đơn lẻ, không phải là các ký tự Unicode hợp lệ.

```js
const str = "𠮷𠮾";
console.log(str.charCodeAt(0)); // 55362, or d842, which is not a valid Unicode character
console.log(str.charCodeAt(1)); // 57271, or dfb7, which is not a valid Unicode character
```

Để lấy toàn bộ code point Unicode tại chỉ mục đã cho, hãy sử dụng {{jsxref("String.prototype.codePointAt()")}}.

```js
const str = "𠮷𠮾";
console.log(str.codePointAt(0)); // 134071
```

> [!NOTE]
> Tránh tái triển khai `codePointAt()` bằng cách sử dụng `charCodeAt()`. Việc dịch từ surrogate UTF-16 sang code point Unicode rất phức tạp, và `codePointAt()` có thể hiệu quả hơn vì nó trực tiếp sử dụng biểu diễn nội bộ của string. Cài đặt polyfill cho `codePointAt()` nếu cần thiết.

Dưới đây là một thuật toán có thể để chuyển đổi một cặp đơn vị code UTF-16 thành một code point Unicode, được điều chỉnh từ [Unicode FAQ](https://unicode.org/faq/utf_bom.html#utf16-3):

```js
// constants
const LEAD_OFFSET = 0xd800 - (0x10000 >> 10);
const SURROGATE_OFFSET = 0x10000 - (0xd800 << 10) - 0xdc00;

function utf16ToUnicode(lead, trail) {
  return (lead << 10) + trail + SURROGATE_OFFSET;
}
function unicodeToUTF16(codePoint) {
  const lead = LEAD_OFFSET + (codePoint >> 10);
  const trail = 0xdc00 + (codePoint & 0x3ff);
  return [lead, trail];
}

const str = "𠮷";
console.log(utf16ToUnicode(str.charCodeAt(0), str.charCodeAt(1))); // 134071
console.log(str.codePointAt(0)); // 134071
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("String.fromCharCode()")}}
- {{jsxref("String.prototype.charAt()")}}
- {{jsxref("String.fromCodePoint()")}}
- {{jsxref("String.prototype.codePointAt()")}}
