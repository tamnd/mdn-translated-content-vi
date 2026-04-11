---
title: "PerformanceNavigationTiming: domComplete property"
short-title: domComplete
slug: Web/API/PerformanceNavigationTiming/domComplete
page-type: web-api-instance-property
browser-compat: api.PerformanceNavigationTiming.domComplete
---

{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`domComplete`** trả về một {{domxref("DOMHighResTimeStamp")}} biểu thị thời điểm ngay trước khi tác nhân người dùng đặt [`readyState`](/en-US/docs/Web/API/Document/readyState) của tài liệu thành `"complete"`.

Xem thêm trạng thái `complete` của {{domxref("Document.readyState")}}, trạng thái này tương ứng với thuộc tính này và chỉ ra rằng tài liệu cùng tất cả tài nguyên con đã tải xong. Trạng thái này cũng cho biết sự kiện {{domxref("Window/load_event", "load")}} sắp được phát.

## Giá trị

Một {{domxref("DOMHighResTimeStamp")}} biểu thị thời điểm ngay trước khi tác nhân người dùng đặt [`readyState`](/en-US/docs/Web/API/Document/readyState) của tài liệu thành `"complete"`.

## Ví dụ

### Ghi lại thời gian hoàn tất DOM

Thuộc tính `domComplete` có thể được dùng để ghi lại thời điểm DOM hoàn tất.

Ví dụ dùng {{domxref("PerformanceObserver")}}, công cụ này thông báo các mục hiệu năng `navigation` mới khi chúng được ghi vào performance timeline của trình duyệt. Dùng tùy chọn `buffered` để truy cập các mục từ trước khi tạo observer.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    console.log(`${entry.name}: domComplete time: ${entry.domComplete}ms`);
  });
});

observer.observe({ type: "navigation", buffered: true });
```

Ví dụ dùng {{domxref("Performance.getEntriesByType()")}}, phương thức này chỉ hiển thị các mục hiệu năng `navigation` có mặt trong performance timeline của trình duyệt tại thời điểm bạn gọi nó:

```js
const entries = performance.getEntriesByType("navigation");
entries.forEach((entry) => {
  console.log(`${entry.name}: domComplete time: ${entry.domComplete}ms`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.readyState")}}
