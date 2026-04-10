---
title: "History: phương thức go()"
short-title: go()
slug: Web/API/History/go
page-type: web-api-instance-method
browser-compat: api.History.go
---

{{APIRef("History API")}}

Phương thức **`go()`** của giao diện {{domxref("History")}} tải một trang cụ thể từ lịch sử phiên. Bạn có thể dùng nó để di chuyển tiến hoặc lùi trong lịch sử tùy theo giá trị của tham số.

Phương thức này là {{glossary("asynchronous", "bất đồng bộ")}}. Hãy thêm trình nghe cho sự kiện {{domxref("Window/popstate_event", "popstate")}} để xác định khi nào quá trình điều hướng đã hoàn tất.

## Cú pháp

```js-nolint
go()
go(delta)
```

### Tham số

- `delta` {{optional_inline}}
  - : Vị trí trong lịch sử mà bạn muốn di chuyển tới, tính tương đối so với trang hiện tại. Giá trị âm sẽ đi lùi, giá trị dương sẽ đi tới. Ví dụ, `history.go(2)` sẽ tiến hai trang và `history.go(-2)` sẽ lùi hai trang. Nếu không truyền giá trị hoặc nếu `delta` bằng `0`, kết quả sẽ giống như gọi `location.reload()`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : Được ném ra nếu tài liệu liên kết chưa hoàn toàn hoạt động. Trình duyệt cũng giới hạn tần suất điều hướng và có thể ném lỗi này, tạo cảnh báo hoặc bỏ qua lời gọi nếu nó được gọi quá thường xuyên.

## Ví dụ

Để lùi lại một trang (tương đương với việc gọi {{domxref("History.back", "back()")}}):

```js
history.go(-1);
```

Để chuyển tới một trang, giống như gọi {{domxref("History.forward", "forward()")}}:

```js
history.go(1);
```

Để tiến lên hai trang:

```js
history.go(2);
```

Để lùi lại hai trang:

```js
history.go(-2);
```

Cuối cùng, một trong hai câu lệnh sau sẽ tải lại trang hiện tại:

```js
history.go();
history.go(0);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("History")}}
- {{DOMxRef("History.back","back()")}}
- {{DOMxRef("History.forward","forward()")}}
- Sự kiện {{domxref("Window/popstate_event", "popstate")}}
- [Làm việc với History API](/en-US/docs/Web/API/History_API/Working_with_the_History_API)
