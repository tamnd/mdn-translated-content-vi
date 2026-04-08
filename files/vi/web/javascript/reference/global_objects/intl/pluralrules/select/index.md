---
title: Intl.PluralRules.prototype.select()
short-title: select()
slug: Web/JavaScript/Reference/Global_Objects/Intl/PluralRules/select
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.PluralRules.select
sidebar: jsref
---

Phương thức **`select()`** của các instance {{jsxref("Intl.PluralRules")}} trả về chuỗi chỉ ra quy tắc số nhiều nào cần dùng cho định dạng số theo locale.

{{InteractiveExample("JavaScript Demo: Intl.PluralRules.prototype.select()")}}

```js interactive-example
console.log(new Intl.PluralRules("ar-EG").select(0));
// Expected output: "zero"

console.log(new Intl.PluralRules("ar-EG").select(5));
// Expected output: "few"

console.log(new Intl.PluralRules("ar-EG").select(55));
// Expected output: "many"

console.log(new Intl.PluralRules("en").select(0));
// Expected output: "other"
```

## Cú pháp

```js-nolint
select(number)
```

### Tham số

- `number`
  - : Số cần lấy quy tắc số nhiều.

### Giá trị trả về

Chuỗi đại diện cho danh mục số nhiều của `number`. Có thể là một trong `zero`, `one`, `two`, `few`, `many` hoặc `other`.

## Mô tả

Hàm này chọn danh mục số nhiều theo locale và tùy chọn định dạng của đối tượng {{jsxref("Intl.PluralRules")}}. Các tùy chọn này được đặt trong hàm khởi tạo [`Intl.PluralRules()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/PluralRules/PluralRules).

## Ví dụ

### Sử dụng select()

Đầu tiên, tạo đối tượng `Intl.PluralRules`, truyền các tham số `locales` và `options` phù hợp. Ở đây chúng ta tạo đối tượng quy tắc số nhiều cho tiếng Ả Rập theo phương ngữ Ai Cập. Vì `type` không được chỉ định, đối tượng quy tắc sẽ cung cấp định dạng cho số đếm (mặc định).

```js
const pr = new Intl.PluralRules("ar-EG");
```

Sau đó gọi `select()` trên đối tượng quy tắc, chỉ định số cần tìm dạng số nhiều. Lưu ý rằng tiếng Ả Rập có 5 dạng cho số đếm, như được hiển thị.

```js
pr.select(0); // 'zero'
pr.select(1); // 'one'
pr.select(2); // 'two'
pr.select(6); // 'few'
pr.select(18); // 'many'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.PluralRules")}}
