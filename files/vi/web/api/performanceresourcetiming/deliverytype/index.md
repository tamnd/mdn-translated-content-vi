---
title: "PerformanceResourceTiming: deliveryType property"
short-title: deliveryType
slug: Web/API/PerformanceResourceTiming/deliveryType
page-type: web-api-instance-property
browser-compat: api.PerformanceResourceTiming.deliveryType
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`deliveryType`** là một chuỗi cho biết tài nguyên được phân phối như thế nào - ví dụ từ cache hoặc từ navigational prefetch.

## Giá trị

Một chuỗi, có thể là một trong các giá trị sau:

- `"cache"`
  - : Tài nguyên được lấy từ cache.
- `"navigational-prefetch"` {{experimental_inline}} {{non-standard_inline}}
  - : Tài nguyên được lấy từ một phản hồi đã được tải trước, lưu trong cache trong bộ nhớ thông qua [Speculation Rules API](/en-US/docs/Web/API/Speculation_Rules_API).
- `""` (chuỗi rỗng)
  - : Trả về nếu không có kiểu phân phối nào ở trên áp dụng.

## Ví dụ

### Lọc tài nguyên

Thuộc tính `deliveryType` có thể dùng để lấy chỉ các resource timing entry cụ thể; ví dụ chỉ những entry đã được cache.

Ví dụ sau dùng {{domxref("PerformanceObserver")}} để thông báo các performance entry `resource` mới khi chúng được ghi trong performance timeline của trình duyệt. Tùy chọn `buffered` được dùng để truy cập các entry từ trước khi observer được tạo.

```js
const observer = new PerformanceObserver((list) => {
  const cachedResources = list
    .getEntries()
    .filter((entry) => entry.deliveryType === "cache");
  console.log(cachedResources);
});

observer.observe({ type: "resource", buffered: true });
```

Ví dụ sau dùng {{domxref("Performance.getEntriesByType()")}}, chỉ hiển thị các performance entry `resource` đang có trong performance timeline tại thời điểm bạn gọi phương thức này.

```js
const scripts = performance
  .getEntriesByType("resource")
  .filter((entry) => entry.deliveryType === "cache");
console.log(scripts);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
