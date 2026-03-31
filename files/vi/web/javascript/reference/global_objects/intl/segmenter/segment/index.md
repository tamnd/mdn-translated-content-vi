---
title: Intl.Segmenter.prototype.segment()
short-title: segment()
slug: Web/JavaScript/Reference/Global_Objects/Intl/Segmenter/segment
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.Segmenter.segment
sidebar: jsref
---

Phương thức **`segment()`** của các instance {{jsxref("Intl.Segmenter")}} phân đoạn một chuỗi theo locale và độ chi tiết của đối tượng `Intl.Segmenter` này.

{{InteractiveExample("JavaScript Demo: Intl.Segmenter.prototype.segment()")}}

```js interactive-example
const string1 = "Que ma joie demeure";

const segmenterFrGrapheme = new Intl.Segmenter("fr", {
  granularity: "grapheme",
});
const graphemeSegments = segmenterFrGrapheme.segment(string1);

console.log(Array.from(graphemeSegments)[0]);
// Expected output:
// Object {segment: 'Q', index: 0, input: 'Que ma joie demeure'}
```

## Cú pháp

```js-nolint
segment(input)
```

### Tham số

- `input`
  - : Văn bản cần phân đoạn dưới dạng chuỗi.

### Giá trị trả về

Một đối tượng [`Segments`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Segmenter/segment/Segments) có thể lặp mới chứa các phân đoạn của chuỗi đầu vào, sử dụng locale và độ chi tiết của segmenter.

## Ví dụ

```js
// Tạo một segmenter từ theo locale
const segmenter = new Intl.Segmenter("fr", { granularity: "word" });

// Dùng nó để lấy iterator qua các phân đoạn của chuỗi
const input = "Moi ? N'est-ce pas ?";
const segments = segmenter.segment(input);

// Dùng để phân đoạn
for (const { segment, index, isWordLike } of segments) {
  console.log(
    "segment at code units [%d, %d]: «%s»%s",
    index,
    index + segment.length,
    segment,
    isWordLike ? " (word-like)" : "",
  );
}
// segment at code units [0, 3]: «Moi» (word-like)
// segment at code units [3, 4]: « »
// segment at code units [4, 5]: «?»
// segment at code units [5, 6]: « »
// segment at code units [6, 11]: «N'est» (word-like)
// segment at code units [11, 12]: «-»
// segment at code units [12, 14]: «ce» (word-like)
// segment at code units [14, 15]: « »
// segment at code units [15, 18]: «pas» (word-like)
// segment at code units [18, 19]: « »
// segment at code units [19, 20]: «?»
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
