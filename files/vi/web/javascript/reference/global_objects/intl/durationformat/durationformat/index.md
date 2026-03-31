---
title: Intl.DurationFormat() constructor
short-title: Intl.DurationFormat()
slug: Web/JavaScript/Reference/Global_Objects/Intl/DurationFormat/DurationFormat
page-type: javascript-constructor
browser-compat: javascript.builtins.Intl.DurationFormat.DurationFormat
sidebar: jsref
---

Constructor **`Intl.DurationFormat()`** tạo các đối tượng {{jsxref("Intl.DurationFormat")}}.

## Cú pháp

```js-nolint
new Intl.DurationFormat()
new Intl.DurationFormat(locales)
new Intl.DurationFormat(locales, options)
```

> [!NOTE]
> `Intl.DurationFormat()` chỉ có thể được khởi tạo với [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó không có `new` sẽ ném ra một {{jsxref("TypeError")}}.

### Tham số

- `locales` {{optional_inline}}
  - : Một chuỗi với {{glossary("BCP 47 language tag")}} hoặc một instance {{jsxref("Intl.Locale")}}, hoặc một mảng các mã định danh ngôn ngữ như vậy. Ngôn ngữ mặc định của runtime được sử dụng khi `undefined` được truyền vào hoặc khi không có mã định danh ngôn ngữ nào được chỉ định được hỗ trợ. Để biết dạng chung và cách diễn giải đối số `locales`, xem [mô tả tham số trên trang chính `Intl`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locales_argument).

    Khóa mở rộng Unicode sau được phép:
    - `nu`
      - : Xem [`numberingSystem`](#numberingsystem).

    Khóa này cũng có thể được đặt với `options` (như liệt kê bên dưới). Khi cả hai được đặt, thuộc tính `options` sẽ được ưu tiên.

- `options` {{optional_inline}}
  - : Một đối tượng chứa các thuộc tính sau, theo thứ tự được lấy ra (tất cả đều tùy chọn):
    - `localeMatcher`
      - : Thuật toán khớp ngôn ngữ cần sử dụng. Các giá trị có thể là `"lookup"` và `"best fit"`; mặc định là `"best fit"`. Để biết thêm thông tin về tùy chọn này, xem [Xác định và thương lượng ngôn ngữ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locale_identification_and_negotiation).
    - `numberingSystem`
      - : Hệ thống đánh số cần dùng để định dạng số, chẳng hạn `"arab"`, `"hans"`, `"mathsans"`, v.v. Để biết danh sách các kiểu hệ thống đánh số được hỗ trợ, xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_numbering_system_types); mặc định phụ thuộc vào ngôn ngữ. Tùy chọn này cũng có thể được đặt thông qua khóa mở rộng Unicode `nu`; nếu cả hai được cung cấp, thuộc tính `options` này sẽ được ưu tiên.
    - `style`
      - : Kiểu của thời lượng được định dạng. Giá trị này được sử dụng làm mặc định cho tất cả các tùy chọn đơn vị khác, và cũng tương ứng với tùy chọn `style` của {{jsxref("Intl/ListFormat/ListFormat", "Intl.ListFormat()")}} khi nối danh sách các đơn vị thời lượng. Các giá trị có thể là:
        - `"long"`
          - : Ví dụ: 1 hour and 50 minutes
        - `"short"` (mặc định)
          - : Ví dụ: 1 hr, 50 min
        - `"narrow"`
          - : Ví dụ: 1h 50m
        - `"digital"`
          - : Ví dụ: 1:50:00
    - `years`
      - : Kiểu của số năm được định dạng. Các giá trị có thể là `"long"`, `"short"`, và `"narrow"`; mặc định là `options.style` nếu không phải `"digital"`, và `"short"` nếu không.
    - `yearsDisplay`
      - : Liệu có luôn hiển thị số năm, hay chỉ khi khác 0. Các giá trị có thể là `"always"` và `"auto"`; mặc định là `"auto"` nếu `years` không được chỉ định, và `"always"` nếu không.
    - `months`
      - : Kiểu của số tháng được định dạng. Các giá trị có thể là `"long"`, `"short"`, và `"narrow"`; mặc định là `options.style` nếu không phải `"digital"`, và `"short"` nếu không.
    - `monthsDisplay`
      - : Liệu có luôn hiển thị số tháng, hay chỉ khi khác 0. Các giá trị có thể là `"always"` và `"auto"`; mặc định là `"auto"` nếu `months` không được chỉ định, và `"always"` nếu không.
    - `weeks`
      - : Kiểu của số tuần được định dạng. Các giá trị có thể là `"long"`, `"short"`, và `"narrow"`; mặc định là `options.style` nếu không phải `"digital"`, và `"short"` nếu không.
    - `weeksDisplay`
      - : Liệu có luôn hiển thị số tuần, hay chỉ khi khác 0. Các giá trị có thể là `"always"` và `"auto"`; mặc định là `"auto"` nếu `weeks` không được chỉ định, và `"always"` nếu không.
    - `days`
      - : Kiểu của số ngày được định dạng. Các giá trị có thể là `"long"`, `"short"`, và `"narrow"`; mặc định là `options.style` nếu không phải `"digital"`, và `"short"` nếu không.
    - `daysDisplay`
      - : Liệu có luôn hiển thị số ngày, hay chỉ khi khác 0. Các giá trị có thể là `"always"` và `"auto"`; mặc định là `"auto"` nếu `days` không được chỉ định, và `"always"` nếu không.
    - `hours`
      - : Kiểu của số giờ được định dạng. Các giá trị có thể là `"long"`, `"short"`, `"narrow"`, `"numeric"`, và `"2-digit"`; mặc định là `options.style` nếu không phải `"digital"`, và `"numeric"` nếu không.
    - `hoursDisplay`
      - : Liệu có luôn hiển thị số giờ, hay chỉ khi khác 0. Các giá trị có thể là `"always"` và `"auto"`; mặc định là `"auto"` nếu `hours` không được chỉ định và `options.style` không phải `"digital"`, và `"always"` nếu không.
    - `minutes`
      - : Kiểu của số phút được định dạng.
        - Nếu `hours` là `"numeric"` hoặc `"2-digit"`, các giá trị có thể là `"numeric"` và `"2-digit"`, và `"numeric"` được chuẩn hóa thành `"2-digit"`; mặc định là `"numeric"`.
        - Nếu không, các giá trị có thể là `"long"`, `"short"`, `"narrow"`, `"numeric"`, và `"2-digit"`; mặc định là `options.style` nếu không phải `"digital"`, và `"numeric"` nếu không.
    - `minutesDisplay`
      - : Liệu có luôn hiển thị số phút, hay chỉ khi khác 0. Các giá trị có thể là `"always"` và `"auto"`; mặc định là `"auto"` nếu `minutes` không được chỉ định và `options.style` không phải `"digital"`, và `"always"` nếu không.
    - `seconds`
      - : Kiểu của số giây được định dạng.
        - Nếu `minutes` là `"numeric"` hoặc `"2-digit"`, các giá trị có thể là `"numeric"` và `"2-digit"`, và `"numeric"` được chuẩn hóa thành `"2-digit"`; mặc định là `"numeric"`.
        - Nếu không, các giá trị có thể là `"long"`, `"short"`, `"narrow"`, `"numeric"`, và `"2-digit"`; mặc định là `options.style` nếu không phải `"digital"`, và `"numeric"` nếu không.
    - `secondsDisplay`
      - : Liệu có luôn hiển thị số giây, hay chỉ khi khác 0. Các giá trị có thể là `"always"` và `"auto"`; mặc định là `"auto"` nếu `seconds` không được chỉ định và `options.style` không phải `"digital"`, và `"always"` nếu không.
    - `milliseconds`
      - : Kiểu của số mili giây được định dạng.
        - Nếu `seconds` là `"numeric"` hoặc `"2-digit"`, giá trị có thể duy nhất là `"numeric"`; mặc định là `"numeric"`.
        - Nếu không, các giá trị có thể là `"long"`, `"short"`, `"narrow"`, và `"numeric"`; mặc định là `options.style` nếu không phải `"digital"`, và `"numeric"` nếu không.
    - `millisecondsDisplay`
      - : Liệu có luôn hiển thị số mili giây, hay chỉ khi khác 0.
        - Nếu `seconds` là `"numeric"` hoặc `"2-digit"`, giá trị có thể duy nhất là `"auto"`; mặc định chỉ là `"auto"` khi `milliseconds` không được chỉ định.
        - Nếu không, các giá trị có thể là `"always"` và `"auto"`; mặc định là `"auto"` nếu `milliseconds` không được chỉ định, và `"always"` nếu không.
    - `microseconds`
      - : Kiểu của số micro giây được định dạng.
        - Nếu `milliseconds` là `"numeric"`, giá trị có thể duy nhất là `"numeric"`; mặc định là `"numeric"`.
        - Nếu không, các giá trị có thể là `"long"`, `"short"`, `"narrow"`, và `"numeric"`; mặc định là `options.style` nếu không phải `"digital"`, và `"numeric"` nếu không.
    - `microsecondsDisplay`
      - : Liệu có luôn hiển thị số micro giây, hay chỉ khi khác 0.
        - Nếu `milliseconds` là `"numeric"`, giá trị có thể duy nhất là `"auto"`; mặc định chỉ là `"auto"` khi `microseconds` không được chỉ định.
        - Nếu không, các giá trị có thể là `"always"` và `"auto"`; mặc định là `"auto"` nếu `microseconds` không được chỉ định, và `"always"` nếu không.
    - `nanoseconds`
      - : Kiểu của số nano giây được định dạng.
        - Nếu `microseconds` là `"numeric"`, giá trị có thể duy nhất là `"numeric"`; mặc định là `"numeric"`.
        - Nếu không, các giá trị có thể là `"long"`, `"short"`, `"narrow"`, và `"numeric"`; mặc định là `options.style` nếu không phải `"digital"`, và `"numeric"` nếu không.
    - `nanosecondsDisplay`
      - : Liệu có luôn hiển thị số nano giây, hay chỉ khi khác 0.
        - Nếu `microseconds` là `"numeric"`, giá trị có thể duy nhất là `"auto"`; mặc định chỉ là `"auto"` khi `nanoseconds` không được chỉ định.
        - Nếu không, các giá trị có thể là `"always"` và `"auto"`; mặc định là `"auto"` nếu `nanoseconds` không được chỉ định, và `"always"` nếu không.
    - `fractionalDigits`
      - : Số chữ số phần lẻ của giây cần hiển thị trong đầu ra. Các giá trị có thể là từ `0` đến `9`; mặc định là `undefined` (bao gồm nhiều chữ số phần lẻ khi cần thiết).

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu `locales` hoặc `options` chứa các giá trị không hợp lệ.

## Mô tả

Đối với mỗi phân đoạn thời gian, một đối tượng {{jsxref("Intl.NumberFormat")}} được xây dựng nội bộ. Nó sử dụng các tùy chọn sau (xem {{jsxref("Intl/NumberFormat/NumberFormat", "Intl.NumberFormat()")}} để biết chi tiết):

- `numberingSystem`: giá trị của `options.numberingSystem`

Khi `milliseconds`, `microseconds`, hoặc `nanoseconds` sử dụng kiểu `"numeric"`, các tùy chọn sau cũng được sử dụng:

- `minimumFractionDigits`: `0` khi `options.fractionalDigits` là `undefined`, `options.fractionalDigits` nếu không
- `maximumFractionDigits`: `9` khi `options.fractionalDigits` là `undefined`, `options.fractionalDigits` nếu không
- `roundingMode`: `"trunc"`

Khi phân đoạn thời gian sử dụng kiểu `"2-digit"`, các tùy chọn sau cũng được sử dụng:

- `minimumIntegerDigits`: `2`

Khi phân đoạn thời gian sử dụng kiểu `"long"`, `"short"`, hoặc `"narrow"`, các tùy chọn sau cũng được sử dụng:

- `style`: `"unit"` khi `"long"`, `"short"`, hoặc `"narrow"` được chỉ định, `undefined` nếu không
- `unit`: đơn vị đang được định dạng hiện tại (`"years"`, `"days"`, `"nanoseconds"`, v.v.)
- `unitDisplay`: giá trị của kiểu phân đoạn thời gian (`"long"`, `"short"`, hoặc `"narrow"`)

## Ví dụ

### Sử dụng constructor Intl.DurationFormat()

```js
const duration = {
  hours: 2,
  minutes: 20,
  seconds: 35,
};

console.log(new Intl.DurationFormat("pt", { style: "long" }).format(duration));
// "2 horas, 20 minutos e 35 segundos"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.DurationFormat")}}
- {{jsxref("Intl.supportedValuesOf()")}}
- {{jsxref("Intl")}}
