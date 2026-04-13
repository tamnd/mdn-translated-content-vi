---
title: "History: phương thức forward()"
short-title: forward()
slug: Web/API/History/forward
page-type: web-api-instance-method
browser-compat: api.History.forward
---

{{APIRef("History API")}}

Phương thức **`forward()`** của giao diện {{domxref("History")}} khiến trình duyệt chuyển tới một trang phía trước trong lịch sử phiên. Nó có cùng hiệu ứng với việc gọi {{domxref("History.go", "history.go(1)")}}.

Phương thức này là {{glossary("asynchronous", "bất đồng bộ")}}. Hãy thêm trình nghe cho sự kiện {{domxref("Window/popstate_event", "popstate")}} để xác định khi nào quá trình điều hướng đã hoàn tất.

## Cú pháp

```js-nolint
forward()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : Được ném ra nếu tài liệu liên kết chưa hoàn toàn hoạt động. Trình duyệt cũng giới hạn tần suất điều hướng và có thể ném lỗi này, tạo cảnh báo hoặc bỏ qua lời gọi nếu nó được gọi quá thường xuyên.

## Ví dụ

Các ví dụ sau tạo một nút để tiến thêm một bước trong lịch sử phiên.

### HTML

```html
<button id="go-forward">Go Forward!</button>
```

### JavaScript

```js
document.getElementById("go-forward").addEventListener("click", (e) => {
  history.forward();
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("History")}}
- {{domxref("Window/popstate_event", "popstate")}}
- [Làm việc với History API](/en-US/docs/Web/API/History_API/Working_with_the_History_API)
