---
title: Segments.prototype.containing()
short-title: containing()
slug: Web/JavaScript/Reference/Global_Objects/Intl/Segmenter/segment/Segments/containing
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.Segments.containing
sidebar: jsref
---

Phương thức **`containing()`** của các instance [`Segments`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Segmenter/segment/Segments) trả về một đối tượng mô tả phân đoạn trong chuỗi chứa code unit tại chỉ số được chỉ định.

{{InteractiveExample("JavaScript Demo: Segments.prototype.containing()")}}

```js interactive-example
const segmenterFr = new Intl.Segmenter("fr", { granularity: "word" });
const string = "Que ma joie demeure";

const segments = segmenterFr.segment(string);

console.log(segments.containing(5));
// Expected output:
// Object {segment: 'ma', index: 4, input: 'Que ma joie demeure', isWordLike: true}
```

## Cú pháp

```js-nolint
containing(codeUnitIndex)
```

### Tham số

- `codeUnitIndex` {{optional_inline}}
  - : Số chỉ định chỉ số của code unit trong chuỗi đầu vào gốc. Nếu giá trị bị bỏ qua, mặc định là `0`.

### Giá trị trả về

Một đối tượng mô tả phân đoạn của chuỗi gốc với các thuộc tính sau, hoặc `undefined` nếu giá trị chỉ số được cung cấp nằm ngoài phạm vi.

- `segment`
  - : Chuỗi chứa phân đoạn được trích xuất từ chuỗi đầu vào gốc.
- `index`
  - : Chỉ số code unit trong chuỗi đầu vào gốc tại đó phân đoạn bắt đầu.
- `input`
  - : Chuỗi đầu vào hoàn chỉnh đã được phân đoạn.
- `isWordLike`
  - : Giá trị boolean chỉ khi `granularity` là `"word"`; nếu không, là `undefined`. Nếu `granularity` là `"word"`, thì `isWordLike` là `true` khi phân đoạn giống từ (tức là gồm các chữ cái/số/chữ tượng hình/v.v.); nếu không, là `false`.

## Ví dụ

```js
// ┃0 1 2 3 4 5┃6┃7┃8┃9  ← chỉ số code unit
// ┃A l l o n s┃-┃y┃!┃   ← code unit
const input = "Allons-y!";

const segmenter = new Intl.Segmenter("fr", { granularity: "word" });
const segments = segmenter.segment(input);

let current = segments.containing();
// { index: 0, segment: "Allons", isWordLike: true }

current = segments.containing(4);
// { index: 0, segment: "Allons", isWordLike: true }

current = segments.containing(6);
// { index: 6, segment: "-", isWordLike: false }

current = segments.containing(current.index + current.segment.length);
// { index: 7, segment: "y", isWordLike: true }

current = segments.containing(current.index + current.segment.length);
// { index: 8, segment: "!", isWordLike: false }

current = segments.containing(current.index + current.segment.length);
// undefined
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`Intl.Segmenter`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Segmenter)
- [`Intl.Segmenter.prototype.segment()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Segmenter/segment)
