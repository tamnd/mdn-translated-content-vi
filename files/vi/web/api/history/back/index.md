---
title: "History: phương thức back()"
short-title: back()
slug: Web/API/History/back
page-type: web-api-instance-method
browser-compat: api.History.back
---

{{APIRef("History API")}}

Phương thức **`back()`** của giao diện {{domxref("History")}} khiến trình duyệt quay lại một trang trong lịch sử phiên.

Nó có cùng hiệu ứng với việc gọi {{domxref("History.go", "history.go(-1)")}}. Nếu không có trang trước đó, lời gọi phương thức này sẽ không làm gì cả.

Phương thức này là {{glossary("asynchronous", "bất đồng bộ")}}. Hãy thêm trình nghe cho sự kiện {{domxref("Window/popstate_event", "popstate")}} để xác định khi nào quá trình điều hướng đã hoàn tất.

## Cú pháp

```js-nolint
back()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : Được ném ra nếu tài liệu liên kết chưa hoàn toàn hoạt động. Trình duyệt cũng giới hạn tần suất điều hướng và có thể ném lỗi này, tạo cảnh báo hoặc bỏ qua lời gọi nếu nó được gọi quá thường xuyên.

## Ví dụ

Ví dụ ngắn sau tạo một nút trên trang để điều hướng lùi một mục trong lịch sử phiên.

### HTML

```html
<button id="go-back">Go back!</button>
```

### JavaScript

```js
document.getElementById("go-back").addEventListener("click", () => {
  history.back();
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("History")}}
- [Làm việc với History API](/en-US/docs/Web/API/History_API/Working_with_the_History_API)
