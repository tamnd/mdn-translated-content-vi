---
title: "LinearAccelerationSensor: hàm khởi tạo LinearAccelerationSensor()"
short-title: LinearAccelerationSensor()
slug: Web/API/LinearAccelerationSensor/LinearAccelerationSensor
page-type: web-api-constructor
browser-compat: api.LinearAccelerationSensor.LinearAccelerationSensor
---

{{securecontext_header}}{{APIRef("Sensor API")}}

Hàm khởi tạo **`LinearAccelerationSensor()`** tạo một đối tượng {{domxref("LinearAccelerationSensor")}} mới cung cấp trong mỗi lần đọc gia tốc được áp dụng lên thiết bị theo cả ba trục, nhưng không bao gồm đóng góp của trọng lực.

## Cú pháp

```js-nolint
new LinearAccelerationSensor()
new LinearAccelerationSensor(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Các tùy chọn như sau:
    - `frequency` {{optional_inline}}
      - : Số lần mong muốn lấy mẫu mỗi giây, tức là số lần sự kiện {{domxref('sensor.reading_event', 'reading')}} sẽ được gọi mỗi giây. Có thể sử dụng số nguyên hoặc số thập phân, cái sau dành cho tần số nhỏ hơn một giây. Tần số đọc thực tế phụ thuộc vào phần cứng của thiết bị và do đó có thể nhỏ hơn yêu cầu.
    - `referenceFrame` {{optional_inline}}
      - : Một trong `'device'` hoặc `'screen'`. Mặc định là `'device'`.

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : Việc sử dụng tính năng này bị chặn bởi [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref('sensor.reading_event', 'reading')}}
