---
title: String.prototype.codePointAt()
short-title: codePointAt()
slug: Web/JavaScript/Reference/Global_Objects/String/codePointAt
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.codePointAt
sidebar: jsref
---

Phương thức **`codePointAt()`** của các giá trị {{jsxref("String")}} trả về một số nguyên không âm là giá trị code point Unicode của ký tự bắt đầu tại chỉ mục đã cho. Lưu ý rằng chỉ mục vẫn dựa trên đơn vị code UTF-16, không phải code point Unicode.

{{InteractiveExample("JavaScript Demo: String.prototype.codePointAt()", "shorter")}}

```js interactive-example
const icons = "☃★♲";

console.log(icons.codePointAt(1));
// Expected output: "9733"
```

## Cú pháp

```js-nolint
codePointAt(index)
```

### Tham số

- `index`
  - : Chỉ mục bắt đầu từ 0 của ký tự cần trả về. [Được chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion) — `undefined` được chuyển đổi thành 0.

### Giá trị trả về

Một số nguyên không âm biểu diễn giá trị code point của ký tự tại `index` đã cho.

- Nếu `index` nằm ngoài phạm vi `0` – `str.length - 1`, `codePointAt()` trả về {{jsxref("undefined")}}.
- Nếu phần tử tại `index` là leading surrogate UTF-16, trả về code point của _cặp_ surrogate.
- Nếu phần tử tại `index` là trailing surrogate UTF-16, trả về _chỉ_ đơn vị code trailing surrogate.

## Mô tả

Các ký tự trong một string được đánh chỉ mục từ trái sang phải. Chỉ mục của ký tự đầu tiên là `0`, và chỉ mục của ký tự cuối cùng trong một string có tên `str` là `str.length - 1`.

Các code point Unicode có phạm vi từ `0` đến `1114111` (`0x10FFFF`). Trong UTF-16, mỗi chỉ mục string là một đơn vị code có giá trị `0` – `65535`. Các code point cao hơn được biểu diễn bởi _một cặp_ pseudo-character surrogate 16-bit. Do đó, `codePointAt()` trả về một code point có thể trải dài hai chỉ mục string. Để biết thông tin về Unicode, xem [UTF-16 characters, Unicode code points, and grapheme clusters](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#utf-16_characters_unicode_code_points_and_grapheme_clusters).

## Ví dụ

### Sử dụng codePointAt()

```js
"ABC".codePointAt(0); // 65
"ABC".codePointAt(0).toString(16); // 41

"😍".codePointAt(0); // 128525
"\ud83d\ude0d".codePointAt(0); // 128525
"\ud83d\ude0d".codePointAt(0).toString(16); // 1f60d

"😍".codePointAt(1); // 56845
"\ud83d\ude0d".codePointAt(1); // 56845
"\ud83d\ude0d".codePointAt(1).toString(16); // de0d

"ABC".codePointAt(42); // undefined
```

### Lặp với codePointAt()

Vì sử dụng chỉ mục string để lặp khiến cùng một code point được truy cập hai lần (một lần cho leading surrogate, một lần cho trailing surrogate), và lần thứ hai `codePointAt()` trả về _chỉ_ trailing surrogate, nên tốt hơn là tránh lặp theo chỉ mục.

```js example-bad
const str = "\ud83d\udc0e\ud83d\udc71\u2764";

for (let i = 0; i < str.length; i++) {
  console.log(str.codePointAt(i).toString(16));
}
// '1f40e', 'dc0e', '1f471', 'dc71', '2764'
```

Thay vào đó, hãy sử dụng câu lệnh [`for...of`](/en-US/docs/Web/JavaScript/Guide/Loops_and_iteration#for...of_statement) hoặc [trải rộng string](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax), cả hai đều gọi [`[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Symbol.iterator) của string, lặp theo code point. Sau đó, sử dụng `codePointAt(0)` để lấy code point của mỗi phần tử.

```js
for (const codePoint of str) {
  console.log(codePoint.codePointAt(0).toString(16));
}
// '1f40e', '1f471', '2764'

[...str].map((cp) => cp.codePointAt(0).toString(16));
// ['1f40e', '1f471', '2764']
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `String.prototype.codePointAt` in `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- [es-shims polyfill of `String.prototype.codePointAt`](https://www.npmjs.com/package/string.prototype.codepointat)
- {{jsxref("String.fromCodePoint()")}}
- {{jsxref("String.fromCharCode()")}}
- {{jsxref("String.prototype.charCodeAt()")}}
- {{jsxref("String.prototype.charAt()")}}
