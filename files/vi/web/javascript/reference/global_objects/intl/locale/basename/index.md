---
title: Intl.Locale.prototype.baseName
short-title: baseName
slug: Web/JavaScript/Reference/Global_Objects/Intl/Locale/baseName
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Intl.Locale.baseName
sidebar: jsref
---

Thuộc tính truy cập **`baseName`** của các instance {{jsxref("Intl.Locale")}} trả về một chuỗi con của biểu diễn chuỗi locale này, chứa thông tin cốt lõi về locale, bao gồm ngôn ngữ, chữ viết, vùng và biến thể nếu có.

## Mô tả

`baseName` trả về chuỗi con `language ["-" script] ["-" region] *("-" variant)` của [ngữ pháp unicode_language_id](https://www.unicode.org/reports/tr35/#Identifiers). Nó chỉ bao gồm thông tin được chỉ định rõ ràng trong hàm khởi tạo, thông qua chuỗi định danh locale hoặc đối tượng tùy chọn.

Set accessor của `baseName` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp.

## Ví dụ

### Ví dụ cơ bản

```js
const myLoc = new Intl.Locale("fr-Latn-CA"); // Sets locale to Canadian French
console.log(myLoc.toString()); // "fr-Latn-CA-u-ca-gregory"
console.log(myLoc.baseName); // "fr-Latn-CA"
```

### Ví dụ với thẻ mở rộng trong chuỗi đầu vào

```js
// Sets language to Japanese, region to Japan,
// calendar to Gregorian, hour cycle to 24 hours
const japan = new Intl.Locale("ja-JP-u-ca-gregory-hc-24");
console.log(japan.toString()); // "ja-JP-u-ca-gregory-hc-h24"
console.log(japan.baseName); // "ja-JP"
```

### Ví dụ với tùy chọn ghi đè chuỗi đầu vào

```js
// Input string indicates language as Dutch and region as Belgium,
// but options object overrides the region and sets it to the Netherlands
const dutch = new Intl.Locale("nl-Latn-BE", { region: "NL" });

console.log(dutch.baseName); // "nl-Latn-NL"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.Locale")}}
