---
title: Intl.RelativeTimeFormat() constructor
short-title: Intl.RelativeTimeFormat()
slug: Web/JavaScript/Reference/Global_Objects/Intl/RelativeTimeFormat/RelativeTimeFormat
page-type: javascript-constructor
browser-compat: javascript.builtins.Intl.RelativeTimeFormat.RelativeTimeFormat
sidebar: jsref
---

Hàm khởi tạo **`Intl.RelativeTimeFormat()`** tạo ra các đối tượng {{jsxref("Intl.RelativeTimeFormat")}}.

## Cú pháp

```js-nolint
new Intl.RelativeTimeFormat()
new Intl.RelativeTimeFormat(locales)
new Intl.RelativeTimeFormat(locales, options)
```

> [!NOTE]
> `Intl.RelativeTimeFormat()` chỉ có thể được khởi tạo với [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném ra {{jsxref("TypeError")}}.

### Tham số

- `locales` {{optional_inline}}
  - : Chuỗi với {{glossary("BCP 47 language tag")}} hoặc một instance {{jsxref("Intl.Locale")}}, hoặc một mảng các định danh locale như vậy. Locale mặc định của runtime được dùng khi `undefined` được truyền vào hoặc khi không có định danh locale nào được chỉ định được hỗ trợ. Để biết dạng chung và cách diễn giải đối số `locales`, xem [mô tả tham số trên trang chính `Intl`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locales_argument).

  Khóa mở rộng Unicode sau được phép:
  - `nu`
    - : Xem [`numberingSystem`](#numberingsystem).

  Khóa này cũng có thể được đặt bằng `options` (như liệt kê bên dưới). Khi cả hai được đặt, thuộc tính `options` có ưu tiên cao hơn.

- `options` {{optional_inline}}
  - : Đối tượng chứa các thuộc tính sau, theo thứ tự chúng được truy xuất (tất cả đều tùy chọn):
    - `localeMatcher`
      - : Thuật toán khớp locale để sử dụng. Các giá trị có thể là `"lookup"` và `"best fit"`; mặc định là `"best fit"`. Để biết thông tin về tùy chọn này, xem [Nhận diện và thương lượng locale](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locale_identification_and_negotiation).
    - `numberingSystem`
      - : Hệ thống đánh số để dùng trong định dạng số, chẳng hạn như `"arab"`, `"hans"`, `"mathsans"`, v.v. Để biết danh sách các loại hệ thống đánh số được hỗ trợ, xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_numbering_system_types); mặc định phụ thuộc vào locale. Tùy chọn này cũng có thể được đặt qua khóa mở rộng Unicode `nu`; nếu cả hai được cung cấp, thuộc tính `options` này có ưu tiên cao hơn.
    - `style`
      - : Kiểu của thời gian tương đối được định dạng. Các giá trị có thể là:
        - `"long"` (mặc định)
          - : Ví dụ: "in 1 month"
        - `"short"`
          - : Ví dụ: "in 1 mo."
        - `"narrow"`
          - : Ví dụ: "in 1 mo.". Kiểu narrow có thể tương tự kiểu short cho một số locale.
    - `numeric`
      - : Có sử dụng giá trị số trong đầu ra hay không. Các giá trị có thể là `"always"` và `"auto"`; mặc định là `"always"`. Khi đặt thành `"auto"`, đầu ra có thể sử dụng các cụm từ thành ngữ hơn như `"yesterday"` thay vì `"1 day ago"`.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu `locales` hoặc `options` chứa các giá trị không hợp lệ.

## Ví dụ

### Sử dụng format cơ bản

Ví dụ sau đây cho thấy cách tạo bộ định dạng thời gian tương đối sử dụng ngôn ngữ tiếng Anh.

```js
// Create a relative time formatter in your locale
// with default values explicitly passed in.
const rtf = new Intl.RelativeTimeFormat("en-US", {
  numeric: "always", // other values: "auto"
  style: "long", // other values: "short" or "narrow"
});

// Format relative time using negative value (-1).
rtf.format(-1, "day"); // "1 day ago"

// Format relative time using positive value (1).
rtf.format(1, "day"); // "in 1 day"
```

### Sử dụng tùy chọn auto

Nếu tùy chọn `numeric: "auto"` được truyền vào, nó sẽ tạo ra chuỗi `yesterday` hoặc `tomorrow` thay vì `1 day ago` hoặc `in 1 day`. Điều này hữu ích khi bạn không muốn sử dụng giá trị số trong đầu ra.

```js
// Create a relative time formatter in your locale
// with numeric: "auto" option value passed in.
const rtf = new Intl.RelativeTimeFormat("en-US", { numeric: "auto" });

// Format relative time using negative value (-1).
rtf.format(-1, "day"); // "yesterday"

// Format relative time using positive day unit (1).
rtf.format(1, "day"); // "tomorrow"
```

Khi giá trị là `0`, đầu ra có thể phụ thuộc vào đơn vị. "0 seconds" được đại diện bởi phiên bản bản địa hóa của "now".

```js
rtf.format(0, "second"); // "now"
rtf.format(0, "day"); // "today"
rtf.format(0, "minute"); // "this minute"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.RelativeTimeFormat")}}
- {{jsxref("Intl")}}
- [`Intl.RelativeTimeFormat`](https://v8.dev/features/intl-relativetimeformat) trên v8.dev (2018)
