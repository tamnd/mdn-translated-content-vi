---
title: "RelativeOrientationSensor: hàm khởi tạo RelativeOrientationSensor()"
short-title: RelativeOrientationSensor()
slug: Web/API/RelativeOrientationSensor/RelativeOrientationSensor
page-type: web-api-constructor
browser-compat: api.RelativeOrientationSensor.RelativeOrientationSensor
---

{{securecontext_header}}{{APIRef("Sensor API")}}

Hàm khởi tạo **`RelativeOrientationSensor()`** tạo một đối tượng {{domxref("RelativeOrientationSensor")}} mới mô tả hướng vật lý của thiết bị.

## Cú pháp

```js-nolint
new RelativeOrientationSensor()
new RelativeOrientationSensor(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Các tùy chọn như sau:
    - `frequency` {{optional_inline}}
      - : Số lần mong muốn mỗi giây mà một mẫu nên được lấy, tức là số lần mỗi giây mà sự kiện {{domxref('sensor.reading_event', 'reading')}} sẽ được gọi. Có thể sử dụng số nguyên hoặc số thập phân, số thập phân dành cho các tần số nhỏ hơn một giây. Tần số đọc thực tế phụ thuộc vào phần cứng thiết bị và do đó có thể ít hơn yêu cầu.
    - `referenceFrame` {{optional_inline}}
      - : Hoặc là `'device'` hoặc `'screen'`. Mặc định là `'device'`.

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : Việc sử dụng tính năng này bị chặn bởi [Chính sách Quyền](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref('sensor.reading_event', 'reading')}}
