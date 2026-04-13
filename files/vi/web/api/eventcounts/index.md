---
title: EventCounts
slug: Web/API/EventCounts
page-type: web-api-interface
browser-compat: api.EventCounts
---

{{APIRef("Performance API")}}

Giao diện **`EventCounts`** của [Performance API](/en-US/docs/Web/API/Performance_API) cung cấp số lượng sự kiện đã được gửi cho mỗi loại sự kiện.

Instance `EventCounts` là [đối tượng giống `Map`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map#map-like_browser_apis) chỉ đọc, trong đó mỗi khóa là chuỗi tên cho một loại sự kiện, và giá trị tương ứng là số nguyên cho biết số lượng sự kiện đã được gửi cho loại sự kiện đó.

## Hàm khởi tạo

Giao diện này không có hàm khởi tạo. Thông thường bạn nhận được instance của đối tượng này thông qua thuộc tính {{domxref("performance.eventCounts")}}.

## Thuộc tính phiên bản

- `size`
  - : Xem {{jsxref("Map.prototype.size")}} để biết chi tiết.

## Phương thức phiên bản

- `entries()`
  - : Xem {{jsxref("Map.prototype.entries()")}} để biết chi tiết.
- `forEach()`
  - : Xem {{jsxref("Map.prototype.forEach()")}} để biết chi tiết.
- `get()`
  - : Xem {{jsxref("Map.prototype.get()")}} để biết chi tiết.
- `has()`
  - : Xem {{jsxref("Map.prototype.has()")}} để biết chi tiết.
- `keys()`
  - : Xem {{jsxref("Map.prototype.keys()")}} để biết chi tiết.
- `values()`
  - : Xem {{jsxref("Map.prototype.values()")}} để biết chi tiết.

## Ví dụ

### Làm việc với EventCount maps

Dưới đây là một số ví dụ để lấy thông tin từ map `EventCounts`. Lưu ý rằng map là chỉ đọc và các phương thức `clear()`, `delete()` và `set()` không có sẵn.

```js
for (entry of performance.eventCounts.entries()) {
  const type = entry[0];
  const count = entry[1];
}

const clickCount = performance.eventCounts.get("click");

const isExposed = performance.eventCounts.has("mousemove");
const exposedEventsCount = performance.eventCounts.size;
const exposedEventsList = [...performance.eventCounts.keys()];
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("performance.eventCounts")}}
