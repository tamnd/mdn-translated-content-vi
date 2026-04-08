---
title: Intl.Segmenter() constructor
short-title: Intl.Segmenter()
slug: Web/JavaScript/Reference/Global_Objects/Intl/Segmenter/Segmenter
page-type: javascript-constructor
browser-compat: javascript.builtins.Intl.Segmenter.Segmenter
sidebar: jsref
---

Hàm khởi tạo **`Intl.Segmenter()`** tạo ra các đối tượng {{jsxref("Intl.Segmenter")}}.

{{InteractiveExample("JavaScript Demo: Intl.Segmenter() constructor")}}

```js interactive-example
const segmenterFr = new Intl.Segmenter("fr", { granularity: "word" });
const string = "Que ma joie demeure";

const iterator = segmenterFr.segment(string)[Symbol.iterator]();

console.log(iterator.next().value.segment);
// Expected output: 'Que'

console.log(iterator.next().value.segment);
// Expected output: ' '
```

## Cú pháp

```js-nolint
new Intl.Segmenter()
new Intl.Segmenter(locales)
new Intl.Segmenter(locales, options)
```

> [!NOTE]
> `Intl.Segmenter()` chỉ có thể được khởi tạo với [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném ra {{jsxref("TypeError")}}.

### Tham số

- `locales` {{optional_inline}}
  - : Chuỗi với {{glossary("BCP 47 language tag")}} hoặc một instance {{jsxref("Intl.Locale")}}, hoặc một mảng các định danh locale như vậy. Locale mặc định của runtime được dùng khi `undefined` được truyền vào hoặc khi không có định danh locale nào được chỉ định được hỗ trợ. Để biết dạng chung và cách diễn giải đối số `locales`, xem [mô tả tham số trên trang chính `Intl`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locales_argument).
- `options` {{optional_inline}}
  - : Đối tượng chứa các thuộc tính sau, theo thứ tự chúng được truy xuất (tất cả đều tùy chọn):
    - `localeMatcher`
      - : Thuật toán khớp locale để sử dụng. Các giá trị có thể là `"lookup"` và `"best fit"`; mặc định là `"best fit"`. Để biết thông tin về tùy chọn này, xem [Nhận diện và thương lượng locale](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locale_identification_and_negotiation).
    - `granularity`
      - : Mức độ chi tiết khi phân chia đầu vào. Các giá trị có thể là:
        - `"grapheme"` (mặc định)
          - : Chia đầu vào thành các phân đoạn tại ranh giới cụm grapheme (ký tự do người dùng cảm nhận), được xác định bởi locale.
        - `"word"`
          - : Chia đầu vào thành các phân đoạn tại ranh giới từ, được xác định bởi locale.
        - `"sentence"`
          - : Chia đầu vào thành các phân đoạn tại ranh giới câu, được xác định bởi locale.

### Giá trị trả về

Một instance [`Intl.Segmenter`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Segmenter) mới.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu `locales` hoặc `options` chứa các giá trị không hợp lệ.

## Ví dụ

### Sử dụng cơ bản

Ví dụ sau đây cho thấy cách đếm từ trong một chuỗi sử dụng ngôn ngữ Nhật (trong đó việc chia chuỗi bằng các phương thức `String` sẽ cho kết quả sai).

```js
const text = "吾輩は猫である。名前はたぬき。";
const japaneseSegmenter = new Intl.Segmenter("ja-JP", { granularity: "word" });
console.log(
  [...japaneseSegmenter.segment(text)].filter((segment) => segment.isWordLike)
    .length,
);
// 8, vì văn bản được phân đoạn thành '吾輩'|'は'|'猫'|'で'|'ある'|'。'|'名前'|'は'|'たぬき'|'。'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
