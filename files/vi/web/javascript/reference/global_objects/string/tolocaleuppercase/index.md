---
title: String.prototype.toLocaleUpperCase()
short-title: toLocaleUpperCase()
slug: Web/JavaScript/Reference/Global_Objects/String/toLocaleUpperCase
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.toLocaleUpperCase
sidebar: jsref
---

Phương thức **`toLocaleUpperCase()`** của các giá trị {{jsxref("String")}} trả về chuỗi này được chuyển đổi sang chữ hoa, theo các ánh xạ chữ hoa/thường đặc thù của từng ngôn ngữ.

{{InteractiveExample("JavaScript Demo: String.prototype.toLocaleUpperCase()")}}

```js interactive-example
const city = "istanbul";

console.log(city.toLocaleUpperCase("en-US"));
// Expected output: "ISTANBUL"

console.log(city.toLocaleUpperCase("TR"));
// Expected output: "İSTANBUL"
```

## Cú pháp

```js-nolint
toLocaleUpperCase()
toLocaleUpperCase(locales)
```

### Tham số

- `locales` {{optional_inline}}
  - : Một chuỗi với {{glossary("BCP 47 language tag")}}, hoặc một mảng các chuỗi như vậy. Chỉ định ngôn ngữ được sử dụng để chuyển đổi sang chữ hoa theo các ánh xạ chữ hoa/thường đặc thù của ngôn ngữ đó. Để biết dạng chung và cách diễn giải tham số `locales`, xem [mô tả tham số trên trang chính của `Intl`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locales_argument).

    Khác với các phương thức khác sử dụng tham số `locales`, `toLocaleUpperCase()` không cho phép đối sánh ngôn ngữ. Do đó, sau khi kiểm tra tính hợp lệ của tham số `locales`, `toLocaleUpperCase()` luôn sử dụng ngôn ngữ đầu tiên trong danh sách (hoặc ngôn ngữ mặc định nếu danh sách rỗng), ngay cả khi ngôn ngữ đó không được hỗ trợ bởi trình thực thi.

### Giá trị trả về

Một chuỗi mới biểu diễn chuỗi gọi được chuyển đổi sang chữ hoa, theo các ánh xạ chữ hoa/thường đặc thù của từng ngôn ngữ.

## Mô tả

Phương thức `toLocaleUpperCase()` trả về giá trị của chuỗi được chuyển đổi sang chữ hoa theo các ánh xạ chữ hoa/thường đặc thù của từng ngôn ngữ. `toLocaleUpperCase()` không ảnh hưởng đến giá trị của bản thân chuỗi. Trong hầu hết các trường hợp, kết quả sẽ giống với {{jsxref("String/toUpperCase", "toUpperCase()")}}, nhưng với một số ngôn ngữ như tiếng Thổ Nhĩ Kỳ, có ánh xạ chữ hoa/thường không tuân theo ánh xạ mặc định trong Unicode, có thể có kết quả khác.

Ngoài ra, cần lưu ý rằng quá trình chuyển đổi không nhất thiết là ánh xạ 1:1 giữa các ký tự, vì một số ký tự có thể tạo ra hai (hoặc thậm chí nhiều hơn) ký tự khi được chuyển sang chữ hoa. Do đó, độ dài của chuỗi kết quả có thể khác với độ dài đầu vào. Điều này cũng có nghĩa là quá trình chuyển đổi không ổn định, ví dụ như biểu thức sau có thể trả về `false`:
`x.toLocaleLowerCase() === x.toLocaleUpperCase().toLocaleLowerCase()`

## Ví dụ

### Sử dụng toLocaleUpperCase()

```js
"alphabet".toLocaleUpperCase(); // 'ALPHABET'

"Gesäß".toLocaleUpperCase(); // 'GESÄSS'

"i\u0307".toLocaleUpperCase("lt-LT"); // 'I'

const locales = ["lt", "LT", "lt-LT", "lt-u-co-phonebk", "lt-x-lietuva"];
"i\u0307".toLocaleUpperCase(locales); // 'I'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("String.prototype.toLocaleLowerCase()")}}
- {{jsxref("String.prototype.toLowerCase()")}}
- {{jsxref("String.prototype.toUpperCase()")}}
