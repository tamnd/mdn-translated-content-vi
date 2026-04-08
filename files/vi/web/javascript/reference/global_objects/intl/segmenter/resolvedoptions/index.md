---
title: Intl.Segmenter.prototype.resolvedOptions()
short-title: resolvedOptions()
slug: Web/JavaScript/Reference/Global_Objects/Intl/Segmenter/resolvedOptions
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.Segmenter.resolvedOptions
sidebar: jsref
---

Phương thức **`resolvedOptions()`** của các instance {{jsxref("Intl.Segmenter")}} trả về một đối tượng mới với các thuộc tính phản ánh các tùy chọn được tính toán trong quá trình khởi tạo đối tượng `Segmenter` này.

{{InteractiveExample("JavaScript Demo: Intl.Segmenter.prototype.resolvedOptions()")}}

```js interactive-example
const segmenter = new Intl.Segmenter("fr-FR");
const options = segmenter.resolvedOptions();

console.log(options.locale);
// Expected output: "fr-FR"

console.log(options.granularity);
// Expected output: "grapheme"
```

## Cú pháp

```js-nolint
resolvedOptions()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng mới với các thuộc tính phản ánh các tùy chọn được tính toán trong quá trình khởi tạo đối tượng `Segmenter` này. Đối tượng có các thuộc tính sau, theo thứ tự được liệt kê:

- `locale`
  - : {{glossary("BCP 47 language tag")}} cho locale thực sự được dùng, được xác định bởi quá trình [thương lượng locale](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locale_identification_and_negotiation). Không có khóa mở rộng Unicode nào được đưa vào đầu ra.
- `granularity`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, với giá trị mặc định được điền vào khi cần. Có thể là `"grapheme"`, `"word"`, hoặc `"sentence"`. Mặc định là `"grapheme"`.

## Ví dụ

### Sử dụng cơ bản

```js
const spanishSegmenter = new Intl.Segmenter("es", { granularity: "sentence" });
const options = spanishSegmenter.resolvedOptions();
console.log(options.locale); // "es"
console.log(options.granularity); // "sentence"
```

### Độ chi tiết mặc định

```js
const spanishSegmenter = new Intl.Segmenter("es");
const options = spanishSegmenter.resolvedOptions();
console.log(options.locale); // "es"
console.log(options.granularity); // "grapheme"
```

### Locale dự phòng

```js
const banSegmenter = new Intl.Segmenter("ban");
const options = banSegmenter.resolvedOptions();
console.log(options.locale);
// "fr" trên runtime mà locale Bali không được hỗ trợ
// và tiếng Pháp là locale mặc định
console.log(options.granularity); // "grapheme"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
