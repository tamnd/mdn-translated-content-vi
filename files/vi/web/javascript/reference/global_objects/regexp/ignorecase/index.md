---
title: RegExp.prototype.ignoreCase
short-title: ignoreCase
slug: Web/JavaScript/Reference/Global_Objects/RegExp/ignoreCase
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.RegExp.ignoreCase
sidebar: jsref
---

Thuộc tính accessor **`ignoreCase`** của các instance {{jsxref("RegExp")}} trả về liệu cờ `i` có được sử dụng với biểu thức chính quy này hay không.

{{InteractiveExample("JavaScript Demo: RegExp.prototype.ignoreCase")}}

```js interactive-example
const regex1 = /foo/;
const regex2 = /foo/i;

console.log(regex1.test("Football"));
// Expected output: false

console.log(regex2.ignoreCase);
// Expected output: true

console.log(regex2.test("Football"));
// Expected output: true
```

## Mô tả

`RegExp.prototype.ignoreCase` có giá trị `true` nếu cờ `i` được sử dụng; ngược lại là `false`. Cờ `i` chỉ ra rằng hoa/thường nên được bỏ qua khi cố gắng khớp trong một chuỗi. Khớp không phân biệt hoa/thường được thực hiện bằng cách ánh xạ cả bộ ký tự mong đợi lẫn chuỗi được khớp về cùng một cách viết hoa.

Nếu regex [nhận biết Unicode](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode), việc ánh xạ hoa/thường xảy ra thông qua _simple case folding_ được chỉ định trong [`CaseFolding.txt`](https://unicode.org/Public/UCD/latest/ucd/CaseFolding.txt). Việc ánh xạ luôn ánh xạ về một điểm mã đơn, vì vậy nó không ánh xạ, ví dụ: `ß` (U+00DF LATIN SMALL LETTER SHARP S) sang `ss` (đây là _full case folding_, không phải _simple case folding_). Tuy nhiên, nó có thể ánh xạ các điểm mã bên ngoài khối Latin Cơ bản sang các điểm mã bên trong nó — ví dụ: `ſ` (U+017F LATIN SMALL LETTER LONG S) được case-fold về `s` (U+0073 LATIN SMALL LETTER S) và `K` (U+212A KELVIN SIGN) được case-fold về `k` (U+006B LATIN SMALL LETTER K). Do đó, `ſ` và `K` có thể được khớp bởi `/[a-z]/ui`.

Nếu regex không nhận biết Unicode, việc ánh xạ hoa/thường sử dụng [Unicode Default Case Conversion](https://unicode-org.github.io/icu/userguide/transforms/casemappings.html) — cùng thuật toán được sử dụng trong {{jsxref("String.prototype.toUpperCase()")}}. Thuật toán này ngăn các điểm mã bên ngoài khối Latin Cơ bản được ánh xạ sang các điểm mã bên trong nó, vì vậy `ſ` và `K` đã đề cập trước đó không được khớp bởi `/[a-z]/i`.

Unicode-aware case folding thường fold về chữ thường, trong khi Unicode-unaware case folding fold về chữ hoa. Hai cái này không phải là các thao tác đảo ngược hoàn hảo, vì vậy có một số sự khác biệt hành vi tinh tế. Ví dụ: `Ω` (U+2126 OHM SIGN) và `Ω` (U+03A9 GREEK CAPITAL LETTER OMEGA) đều được ánh xạ bởi simple case folding sang `ω` (U+03C9 GREEK SMALL LETTER OMEGA), vì vậy `"\u2126"` được khớp bởi `/[\u03c9]/ui` và `/[\u03a9]/ui`; mặt khác, U+2126 được ánh xạ bởi Default Case Conversion về chính nó, trong khi hai cái kia đều ánh xạ sang U+03A9, vì vậy `"\u2126"` không được khớp bởi cả `/[\u03c9]/i` lẫn `/[\u03a9]/i`.

Accessor set của `ignoreCase` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp.

## Ví dụ

### Sử dụng ignoreCase

```js
const regex = /foo/i;

console.log(regex.ignoreCase); // true
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("RegExp.prototype.lastIndex")}}
- {{jsxref("RegExp.prototype.dotAll")}}
- {{jsxref("RegExp.prototype.global")}}
- {{jsxref("RegExp.prototype.hasIndices")}}
- {{jsxref("RegExp.prototype.multiline")}}
- {{jsxref("RegExp.prototype.source")}}
- {{jsxref("RegExp.prototype.sticky")}}
- {{jsxref("RegExp.prototype.unicode")}}
