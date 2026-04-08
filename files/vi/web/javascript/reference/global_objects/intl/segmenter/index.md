---
title: Intl.Segmenter
slug: Web/JavaScript/Reference/Global_Objects/Intl/Segmenter
page-type: javascript-class
browser-compat: javascript.builtins.Intl.Segmenter
sidebar: jsref
---

Đối tượng **`Intl.Segmenter`** cho phép phân đoạn văn bản theo locale, giúp bạn lấy các mục có ý nghĩa (grapheme, từ hoặc câu) từ một chuỗi.

{{InteractiveExample("JavaScript Demo: Intl.Segmenter")}}

```js interactive-example
const segmenterFr = new Intl.Segmenter("fr", { granularity: "word" });
const string = "Que ma joie demeure";

const iterator = segmenterFr.segment(string)[Symbol.iterator]();

console.log(iterator.next().value.segment);
// Expected output: 'Que'

console.log(iterator.next().value.segment);
// Expected output: ' '
```

## Hàm khởi tạo

- {{jsxref("Intl/Segmenter/Segmenter", "Intl.Segmenter()")}}
  - : Tạo một đối tượng `Intl.Segmenter` mới.

## Phương thức tĩnh

- {{jsxref("Intl/Segmenter/supportedLocalesOf", "Intl.Segmenter.supportedLocalesOf()")}}
  - : Trả về một mảng chứa các locale được cung cấp được hỗ trợ mà không phải dùng locale mặc định của runtime.

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `Intl.Segmenter.prototype` và dùng chung cho tất cả các instance `Intl.Segmenter`.

- {{jsxref("Object/constructor", "Intl.Segmenter.prototype.constructor")}}
  - : Hàm khởi tạo đã tạo ra đối tượng instance. Với các instance `Intl.Segmenter`, giá trị khởi tạo là hàm khởi tạo {{jsxref("Intl/Segmenter/Segmenter", "Intl.Segmenter")}}.
- `Intl.Segmenter.prototype[Symbol.toStringTag]`
  - : Giá trị khởi tạo của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"Intl.Segmenter"`. Thuộc tính này được dùng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức instance

- {{jsxref("Intl/Segmenter/resolvedOptions", "Intl.Segmenter.prototype.resolvedOptions()")}}
  - : Trả về một đối tượng mới với các thuộc tính phản ánh locale và tùy chọn độ chi tiết được tính toán trong quá trình khởi tạo đối tượng `Intl.Segmenter` này.
- {{jsxref("Intl/Segmenter/segment", "Intl.Segmenter.prototype.segment()")}}
  - : Trả về một instance [`Segments`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Segmenter/segment/Segments) có thể lặp mới đại diện cho các phân đoạn của một chuỗi theo locale và độ chi tiết của instance `Intl.Segmenter` này.

## Ví dụ

### Sử dụng cơ bản và sự khác biệt so với String.prototype.split()

Nếu chúng ta dùng [`String.prototype.split(" ")`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split) để phân đoạn văn bản thành từ, chúng ta sẽ không nhận được kết quả đúng nếu locale của văn bản không sử dụng khoảng trắng giữa các từ (như trường hợp của tiếng Nhật, tiếng Trung, tiếng Thái, tiếng Lào, tiếng Khmer, tiếng Myanmar, v.v.).

```js example-bad
const str = "吾輩は猫である。名前はたぬき。";
console.table(str.split(" "));
// ['吾輩は猫である。名前はたぬき。']
// Hai câu không được phân đoạn đúng.
```

```js example-good
const str = "吾輩は猫である。名前はたぬき。";
const segmenterJa = new Intl.Segmenter("ja-JP", { granularity: "word" });

const segments = segmenterJa.segment(str);
console.table(Array.from(segments));
// [{segment: '吾輩', index: 0, input: '吾輩は猫である。名前はたぬき。', isWordLike: true},
// v.v.
// ]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Intl.Segmenter` trong FormatJS](https://formatjs.github.io/docs/polyfills/intl-segmenter/)
- {{jsxref("Intl")}}
