---
title: "PressureObserver: phương thức unobserve()"
short-title: unobserve()
slug: Web/API/PressureObserver/unobserve
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.PressureObserver.unobserve
---

{{APIRef("Compute Pressure API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_service")}}{{securecontext_header}}

Phương thức **`unobserve()`** của giao diện {{domxref('PressureObserver')}} dừng hàm callback của pressure observer nhận bản ghi áp lực từ nguồn được chỉ định.

## Cú pháp

```js-nolint
unobserve(source)
```

### Tham số

- `source`
  - : Một chuỗi chỉ định {{domxref("PressureRecord.source", "source")}} nào cần dừng quan sát.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Dừng quan sát một nguồn cụ thể

Ví dụ sau cho thấy cách dừng quan sát nguồn "gpu" sau khi observer trước đó đã quan sát cả hai nguồn "cpu" và "gpu".

```js
const observer = new PressureObserver(callback);

observer.observe("cpu");
observer.observe("gpu");

// Callback now gets called whenever the pressure state changes for 'cpu' or 'gpu'.

observer.unobserve("gpu");

// Callback now only gets called whenever the pressure state changes for 'cpu'.
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
