---
title: Intl.PluralRules() constructor
short-title: Intl.PluralRules()
slug: Web/JavaScript/Reference/Global_Objects/Intl/PluralRules/PluralRules
page-type: javascript-constructor
browser-compat: javascript.builtins.Intl.PluralRules.PluralRules
sidebar: jsref
---

Hàm khởi tạo **`Intl.PluralRules()`** tạo ra các đối tượng {{jsxref("Intl.PluralRules")}}.

## Cú pháp

```js-nolint
new Intl.PluralRules()
new Intl.PluralRules(locales)
new Intl.PluralRules(locales, options)
```

> [!NOTE]
> `Intl.PluralRules()` chỉ có thể được khởi tạo với [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném ra {{jsxref("TypeError")}}.

### Tham số

- `locales` {{optional_inline}}
  - : Chuỗi với {{glossary("BCP 47 language tag")}} hoặc một instance {{jsxref("Intl.Locale")}}, hoặc một mảng các định danh locale như vậy. Locale mặc định của runtime được dùng khi `undefined` được truyền vào hoặc khi không có định danh locale nào được chỉ định được hỗ trợ. Để biết dạng chung và cách diễn giải đối số `locales`, xem [mô tả tham số trên trang chính `Intl`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locales_argument).
- `options` {{optional_inline}}
  - : Đối tượng chứa các thuộc tính sau, theo thứ tự chúng được truy xuất (tất cả đều tùy chọn):
    - `localeMatcher`
      - : Thuật toán khớp locale để sử dụng. Các giá trị có thể là `"lookup"` và `"best fit"`; mặc định là `"best fit"`. Để biết thông tin về tùy chọn này, xem [Nhận diện và thương lượng locale](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locale_identification_and_negotiation).
    - `type`
      - : Loại để sử dụng. Các giá trị có thể là:
        - `"cardinal"` (mặc định)
          - : Cho số đếm (đề cập đến số lượng của sự vật).
        - `"ordinal"`
          - : Cho số thứ tự (đề cập đến thứ tự hoặc xếp hạng của sự vật, ví dụ: "1st", "2nd", "3rd" trong tiếng Anh).

  `Intl.PluralRules` cũng hỗ trợ [tùy chọn chữ số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat#digit_options) của `Intl.NumberFormat()` (xem `Intl.NumberFormat()` để biết chi tiết):
  - `minimumIntegerDigits`
  - `minimumFractionDigits`
  - `maximumFractionDigits`
  - `minimumSignificantDigits`
  - `maximumSignificantDigits`
  - `roundingPriority`
  - `roundingIncrement`
  - `roundingMode`

  Các tùy chọn này được diễn giải như thể tùy chọn `notation` từ `Intl.NumberFormat` là `"standard"` và `style` là `"decimal"`.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu `locales` hoặc `options` chứa các giá trị không hợp lệ.

## Ví dụ

### Sử dụng cơ bản

Khi dùng mà không chỉ định locale, trả về chuỗi được định dạng theo locale mặc định và tùy chọn mặc định. Điều này hữu ích để phân biệt dạng số ít và số nhiều, ví dụ: "dog" và "dogs".

```js
const pr = new Intl.PluralRules();

pr.select(0); // 'other' if in US English locale

pr.select(1); // 'one' if in US English locale

pr.select(2); // 'other' if in US English locale
```

### Sử dụng tùy chọn

Kết quả có thể được tùy chỉnh bằng đối số `options`, có một thuộc tính gọi là `type` mà bạn có thể đặt thành `ordinal`. Điều này hữu ích để tìm ra hậu tố số thứ tự, ví dụ: "1st", "2nd", "3rd", "4th", "42nd", v.v.

```js
const pr = new Intl.PluralRules("en-US", { type: "ordinal" });

const suffixes = new Map([
  ["one", "st"],
  ["two", "nd"],
  ["few", "rd"],
  ["other", "th"],
]);
const formatOrdinals = (n) => {
  const rule = pr.select(n);
  const suffix = suffixes.get(rule);
  return `${n}${suffix}`;
};

formatOrdinals(0); // '0th'
formatOrdinals(1); // '1st'
formatOrdinals(2); // '2nd'
formatOrdinals(3); // '3rd'
formatOrdinals(4); // '4th'
formatOrdinals(11); // '11th'
formatOrdinals(21); // '21st'
formatOrdinals(42); // '42nd'
formatOrdinals(103); // '103rd'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.PluralRules")}}
- {{jsxref("Intl")}}
