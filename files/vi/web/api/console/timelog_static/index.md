---
title: "console: phương thức tĩnh timeLog()"
short-title: timeLog()
slug: Web/API/console/timeLog_static
page-type: web-api-static-method
browser-compat: api.console.timeLog_static
---

{{APIRef("Console API")}}{{AvailableInWorkers}}

Phương thức tĩnh **`console.timeLog()`** ghi giá trị hiện tại của một bộ đếm thời gian đã được bắt đầu trước đó bằng cách gọi {{domxref("console/time_static", "console.time()")}}.

## Cú pháp

```js-nolint
console.timeLog()
console.timeLog(label)
console.timeLog(label, val1)
console.timeLog(label, val1, /* …, */ valN)
```

### Tham số

- `label` {{optional_inline}}
  - : Tên của bộ đếm thời gian cần ghi vào console. Nếu bị bỏ qua, nhãn `"default"` sẽ được dùng.
- `valN` {{optional_inline}}
  - : Các giá trị bổ sung sẽ được ghi vào console sau đầu ra của bộ đếm thời gian.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Mô tả

Phương thức `console.timeLog()` ghi giá trị hiện tại của một bộ đếm thời gian.

Phương thức có thể được truyền tên của một bộ đếm thời gian. Khi đó, nó sẽ cố gắng ghi giá trị của bộ đếm đã được tạo với tên đó trong một lần gọi trước tới {{domxref("console/time_static", "console.time()")}}:

```js
console.time("reticulating splines");
reticulateSplines();
console.timeLog("reticulating splines");
// reticulating splines: 650ms
```

Nếu tên bộ đếm thời gian bị bỏ qua, bộ đếm sẽ được đặt tên là `"default"`:

```js
console.time();
reticulateSplines();
console.timeLog();
// default: 780ms
```

```js
console.time("default");
reticulateSplines();
console.timeLog();
// default: 780ms
```

Nếu không có bộ đếm thời gian tương ứng, `console.timeLog()` sẽ ghi một cảnh báo như sau:

```plain
Timer "timer name" doesn't exist.
```

Bạn có thể ghi các giá trị bổ sung vào console sau đầu ra của bộ đếm thời gian:

```js
console.time();
reticulateSplines();
console.timeLog("default", "Hello", "world");
// default: 780ms Hello world
```

Xem [Bộ đếm thời gian](/en-US/docs/Web/API/console#timers) trong tài liệu để biết thêm chi tiết và ví dụ.

## Ví dụ

```js
console.time("answer time");
alert("Click to continue");
console.timeLog("answer time");
alert("Do a bunch of other stuff…");
console.timeEnd("answer time");
```

Đầu ra từ ví dụ trên cho thấy thời gian người dùng cần để đóng hộp thoại cảnh báo đầu tiên, sau đó là tổng thời gian người dùng cần để đóng cả hai hộp thoại cảnh báo:

```plain
answer time: 2542ms debugger eval code:3:9
answer time: 4161ms - timer ended
```

Lưu ý rằng tên của bộ đếm thời gian được hiển thị khi giá trị bộ đếm được ghi bằng `console.timeLog()` và một lần nữa khi nó bị dừng. Ngoài ra, lời gọi `console.timeEnd()` có thêm thông tin "timer ended" để cho thấy rõ rằng bộ đếm thời gian không còn tiếp tục đo thời gian nữa.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("console/time_static", "console.time()")}}
- Xem {{domxref("console/timeEnd_static", "console.timeEnd()")}} để biết thêm ví dụ
- [Tài liệu của Node.js về `console.timeLog()`](https://nodejs.org/docs/latest/api/console.html#consoletimeloglabel-data)
