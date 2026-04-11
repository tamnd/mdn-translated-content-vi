---
title: "Performance: eventCounts property"
short-title: eventCounts
slug: Web/API/Performance/eventCounts
page-type: web-api-instance-property
browser-compat: api.Performance.eventCounts
---

{{APIRef("Performance API")}}

Thuộc tính chỉ đọc `performance.eventCounts` là một bản đồ {{domxref("EventCounts")}} chứa số lượng sự kiện đã được phát theo từng loại sự kiện kể từ khi trang được tải.

Không phải tất cả loại sự kiện đều được hiển thị. Bạn chỉ có thể lấy số đếm cho các loại sự kiện được {{domxref("PerformanceEventTiming")}} hỗ trợ.

## Giá trị

Một bản đồ {{domxref("EventCounts")}}.
(Một {{jsxref("Map")}} chỉ đọc, không có các phương thức `clear()`, `delete()`, và `set()`.)

## Ví dụ

### Báo cáo loại sự kiện và số lượng của chúng

Nếu bạn muốn gửi số lượng sự kiện tới hệ thống analytics, bạn có thể triển khai một hàm như `sendToEventAnalytics`, nhận số lượng sự kiện từ bản đồ `performance.eventCounts` rồi dùng [Fetch API](/en-US/docs/Web/API/Fetch_API) để gửi dữ liệu đến endpoint của bạn.

```js
// Báo cáo tất cả sự kiện được hiển thị
for (entry of performance.eventCounts.entries()) {
  const type = entry[0];
  const count = entry[1];
  // sendToEventAnalytics(type, count);
}

// Báo cáo một sự kiện cụ thể
const clickCount = performance.eventCounts.get("click");
// sendToEventAnalytics("click", clickCount);

// Kiểm tra xem số đếm của một loại sự kiện có được hiển thị hay không
const isExposed = performance.eventCounts.has("mousemove"); // false
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("EventCounts")}}
- {{domxref("PerformanceEventTiming")}}
- {{jsxref("Map")}}
