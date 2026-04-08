---
title: Temporal.Duration.prototype.toLocaleString()
short-title: toLocaleString()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Duration/toLocaleString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.Duration.toLocaleString
sidebar: jsref
---

Phương thức **`toLocaleString()`** của các instance {{jsxref("Temporal.Duration")}} trả về một chuỗi biểu diễn duration này theo ngôn ngữ cụ thể. Trong các môi trường hỗ trợ [API `Intl.DurationFormat`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DurationFormat), phương thức này ủy quyền cho `Intl.DurationFormat`.

Mỗi lần `toLocaleString` được gọi, nó phải thực hiện tìm kiếm trong một cơ sở dữ liệu lớn về chuỗi bản địa hóa, điều này có thể không hiệu quả. Khi phương thức được gọi nhiều lần với cùng đối số, tốt hơn là tạo một đối tượng {{jsxref("Intl.DurationFormat")}} và sử dụng phương thức {{jsxref("Intl/DurationFormat/format", "format()")}} của nó, vì đối tượng `DurationFormat` ghi nhớ các đối số được truyền vào và có thể quyết định lưu vào bộ nhớ đệm một phần của cơ sở dữ liệu, do đó các lần gọi `format` trong tương lai có thể tìm kiếm chuỗi bản địa hóa trong một ngữ cảnh bị hạn chế hơn.

## Cú pháp

```js-nolint
toLocaleString()
toLocaleString(locales)
toLocaleString(locales, options)
```

### Tham số

Các tham số `locales` và `options` tùy chỉnh hành vi của hàm và cho phép ứng dụng chỉ định ngôn ngữ có quy ước định dạng cần sử dụng.

Trong các môi trường hỗ trợ [API `Intl.DurationFormat`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DurationFormat), các tham số này tương ứng chính xác với các tham số của hàm tạo [`Intl.DurationFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DurationFormat/DurationFormat). Các môi trường không hỗ trợ `Intl.DurationFormat` trả về chuỗi giống hệt với {{jsxref("Temporal/Duration/toString", "toString()")}}, bỏ qua cả hai tham số.

- `locales` {{optional_inline}}
  - : Một chuỗi với {{glossary("BCP 47 language tag")}}, hoặc một mảng các chuỗi như vậy. Tương ứng với tham số [`locales`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DurationFormat/DurationFormat#locales) của hàm tạo `Intl.DurationFormat()`.
- `options` {{optional_inline}}
  - : Một đối tượng điều chỉnh định dạng đầu ra. Tương ứng với tham số [`options`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DurationFormat/DurationFormat#options) của hàm tạo `Intl.DurationFormat()`.

Xem [hàm tạo `Intl.DurationFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DurationFormat/DurationFormat) để biết chi tiết về các tham số này và cách sử dụng chúng.

### Giá trị trả về

Một chuỗi biểu diễn duration đã cho theo quy ước ngôn ngữ cụ thể.

Trong các môi trường có `Intl.DurationFormat`, điều này tương đương với `new Intl.DurationFormat(locales, options).format(duration)`.

> [!NOTE]
> Hầu hết thời gian, định dạng được trả về bởi `toLocaleString()` là nhất quán. Tuy nhiên, đầu ra có thể khác nhau giữa các môi trường, ngay cả trong cùng một locale — sự biến đổi đầu ra là có chủ ý và được cho phép theo đặc tả. Nó cũng có thể không phải là những gì bạn mong đợi. Ví dụ, chuỗi có thể sử dụng dấu cách không ngắt hoặc được bao quanh bởi các ký tự kiểm soát hai chiều. Bạn không nên so sánh kết quả của `toLocaleString()` với các hằng số cố định.

## Ví dụ

### Sử dụng toLocaleString()

Cách sử dụng cơ bản của phương thức này mà không chỉ định `locale` trả về một chuỗi được định dạng theo locale mặc định và với các tùy chọn mặc định.

```js
const duration = Temporal.Duration.from({ hours: 1, minutes: 30, seconds: 15 });

console.log(duration.toLocaleString()); // 1 hr, 30 min, 15 sec
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Duration")}}
- {{jsxref("Intl.DurationFormat")}}
- {{jsxref("Temporal/Duration/toJSON", "Temporal.Duration.prototype.toJSON()")}}
- {{jsxref("Temporal/Duration/toString", "Temporal.Duration.prototype.toString()")}}
