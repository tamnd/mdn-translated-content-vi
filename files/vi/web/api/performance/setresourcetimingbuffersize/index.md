---
title: "Performance: setResourceTimingBufferSize() method"
short-title: setResourceTimingBufferSize()
slug: Web/API/Performance/setResourceTimingBufferSize
page-type: web-api-instance-method
browser-compat: api.Performance.setResourceTimingBufferSize
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Phương thức **`setResourceTimingBufferSize()`** đặt kích thước mong muốn của bộ đệm resource timing của trình duyệt, nơi lưu trữ các performance entry kiểu `"resource"`.

Đặc tả yêu cầu bộ đệm resource timing ban đầu phải là 250 hoặc lớn hơn.

Để xóa bộ đệm dữ liệu performance resource của trình duyệt, hãy dùng phương thức {{domxref("Performance.clearResourceTimings()")}}.

Để được thông báo khi bộ đệm resource timing của trình duyệt đầy, hãy lắng nghe sự kiện {{domxref("Performance.resourcetimingbufferfull_event", "resourcetimingbufferfull")}}.

## Cú pháp

```js-nolint
setResourceTimingBufferSize(maxSize)
```

### Tham số

- `maxSize`
  - : Một `number` biểu thị số lượng tối đa đối tượng {{domxref("PerformanceEntry")}} mà trình duyệt nên giữ trong bộ đệm performance entry của nó.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Đặt kích thước bộ đệm resource timing

Lệnh gọi sau cho phép 500 performance entry `"resource"` trong performance timeline của trình duyệt.

```js
performance.setResourceTimingBufferSize(500);
```

Nếu bạn đặt kích thước bộ đệm nhỏ hơn số entry hiện có trong bộ đệm, sẽ không có entry nào bị xóa. Thay vào đó, để xóa bộ đệm, hãy gọi {{domxref("Performance.clearResourceTimings()")}}.

```js
performance.getEntriesByType("resource").length; // 20
performance.setResourceTimingBufferSize(10);
performance.getEntriesByType("resource").length; // 20

performance.clearResourceTimings();
performance.getEntriesByType("resource").length; // 0
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Performance.clearResourceTimings()")}}
- {{domxref("Performance.resourcetimingbufferfull_event", "resourcetimingbufferfull")}}
