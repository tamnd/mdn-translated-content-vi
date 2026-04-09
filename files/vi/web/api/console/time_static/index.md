---
title: "console: phương thức tĩnh time()"
short-title: time()
slug: Web/API/console/time_static
page-type: web-api-static-method
browser-compat: api.console.time_static
---

{{APIRef("Console API")}} {{AvailableInWorkers}}

Phương thức tĩnh **`console.time()`** bắt đầu một bộ đếm thời gian mà bạn có thể dùng để theo dõi một thao tác mất bao lâu. Bạn đặt cho mỗi bộ đếm thời gian một tên duy nhất, và có thể có tối đa 10.000 bộ đếm thời gian đang chạy trên một trang. Khi bạn gọi {{domxref("console/timeEnd_static", "console.timeEnd()")}} với cùng tên đó, trình duyệt sẽ xuất thời gian đã trôi qua kể từ khi bộ đếm thời gian bắt đầu, tính bằng mili giây.

Xem [Bộ đếm thời gian](/en-US/docs/Web/API/console#timers) trong tài liệu của {{domxref("console")}} để biết chi tiết và ví dụ.

## Cú pháp

```js-nolint
console.time()
console.time(label)
```

### Tham số

- `label` {{optional_inline}}
  - : Một chuỗi biểu diễn tên dùng cho bộ đếm thời gian mới. Tên này sẽ nhận diện bộ đếm thời gian; hãy dùng cùng tên đó khi gọi {{domxref("console/timeEnd_static", "console.timeEnd()")}} để dừng bộ đếm và lấy thời gian xuất ra console. Nếu bị bỏ qua, nhãn `"default"` sẽ được dùng.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Xem {{domxref("console/timeLog_static", "console.timeLog()")}} và {{domxref("console/timeEnd_static", "console.timeEnd()")}} để biết ví dụ
- [Tài liệu của Microsoft Edge về `console.time()`](https://learn.microsoft.com/en-us/microsoft-edge/devtools/console/api#time)
- [Tài liệu của Node.js về `console.time()`](https://nodejs.org/docs/latest/api/console.html#consoletimelabel)
- [Tài liệu của Google Chrome về `console.time()`](https://developer.chrome.com/docs/devtools/console/api/#time)
