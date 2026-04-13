---
title: "PerformanceObserver: phương thức disconnect()"
short-title: disconnect()
slug: Web/API/PerformanceObserver/disconnect
page-type: web-api-instance-method
browser-compat: api.PerformanceObserver.disconnect
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Phương thức **`disconnect()`** của giao diện {{domxref('PerformanceObserver')}} được dùng để ngừng performance observer nhận bất kỳ sự kiện {{domxref("PerformanceEntry","performance entry", '', 'true')}} nào.

## Cú pháp

```js-nolint
disconnect()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Ngừng một performance observer

Ví dụ sau ngắt kết nối performance observer để vô hiệu hóa việc nhận thêm bất kỳ sự kiện performance entry nào.

```js
const observer = new PerformanceObserver((list, obj) => {
  list.getEntries().forEach((entry) => {
    // Xử lý các sự kiện "measure"
    // …
    // Vô hiệu hóa các sự kiện performance bổ sung
    observer.disconnect();
  });
});
observer.observe({ entryTypes: ["mark", "measure"] });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
