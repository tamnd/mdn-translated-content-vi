---
title: String.prototype.toLocaleLowerCase()
short-title: toLocaleLowerCase()
slug: Web/JavaScript/Reference/Global_Objects/String/toLocaleLowerCase
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.toLocaleLowerCase
sidebar: jsref
---

Phương thức **`toLocaleLowerCase()`** của các giá trị {{jsxref("String")}} trả về chuỗi này được chuyển đổi sang chữ thường, theo các ánh xạ chữ hoa/thường đặc thù của từng ngôn ngữ.

{{InteractiveExample("JavaScript Demo: String.prototype.toLocaleLowerCase()")}}

```js interactive-example
const dotted = "İstanbul";

console.log(`EN-US: ${dotted.toLocaleLowerCase("en-US")}`);
// Expected output: "i̇stanbul"

console.log(`TR: ${dotted.toLocaleLowerCase("tr")}`);
// Expected output: "istanbul"
```

## Cú pháp

```js-nolint
toLocaleLowerCase()
toLocaleLowerCase(locales)
```

### Tham số

- `locales` {{optional_inline}}
  - : Một chuỗi với {{glossary("BCP 47 language tag")}}, hoặc một mảng các chuỗi như vậy. Chỉ định ngôn ngữ được sử dụng để chuyển đổi sang chữ thường theo các ánh xạ chữ hoa/thường đặc thù của ngôn ngữ đó. Để biết dạng chung và cách diễn giải tham số `locales`, xem [mô tả tham số trên trang chính của `Intl`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locales_argument).

    Khác với các phương thức khác sử dụng tham số `locales`, `toLocaleLowerCase()` không cho phép đối sánh ngôn ngữ. Do đó, sau khi kiểm tra tính hợp lệ của tham số `locales`, `toLocaleLowerCase()` luôn sử dụng ngôn ngữ đầu tiên trong danh sách (hoặc ngôn ngữ mặc định nếu danh sách rỗng), ngay cả khi ngôn ngữ đó không được hỗ trợ bởi trình thực thi.

### Giá trị trả về

Một chuỗi mới biểu diễn chuỗi gọi được chuyển đổi sang chữ thường, theo các ánh xạ chữ hoa/thường đặc thù của từng ngôn ngữ.

## Mô tả

Phương thức `toLocaleLowerCase()` trả về giá trị của chuỗi được chuyển đổi sang chữ thường theo các ánh xạ chữ hoa/thường đặc thù của từng ngôn ngữ. `toLocaleLowerCase()` không ảnh hưởng đến giá trị của bản thân chuỗi. Trong hầu hết các trường hợp, kết quả sẽ giống với {{jsxref("String/toLowerCase", "toLowerCase()")}}, nhưng với một số ngôn ngữ như tiếng Thổ Nhĩ Kỳ, có ánh xạ chữ hoa/thường không tuân theo ánh xạ mặc định trong Unicode, có thể có kết quả khác.

## Ví dụ

### Sử dụng toLocaleLowerCase()

```js
"ALPHABET".toLocaleLowerCase(); // 'alphabet'

"\u0130".toLocaleLowerCase("tr") === "i"; // true
"\u0130".toLocaleLowerCase("en-US") === "i"; // false

const locales = ["tr", "TR", "tr-TR", "tr-u-co-search", "tr-x-turkish"];
"\u0130".toLocaleLowerCase(locales) === "i"; // true
```

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("String.prototype.toLocaleUpperCase()")}}
- {{jsxref("String.prototype.toLowerCase()")}}
- {{jsxref("String.prototype.toUpperCase()")}}
