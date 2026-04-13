---
title: "GravitySensor: hàm khởi tạo GravitySensor()"
short-title: GravitySensor()
slug: Web/API/GravitySensor/GravitySensor
page-type: web-api-constructor
browser-compat: api.GravitySensor.GravitySensor
---

{{securecontext_header}}{{APIRef("Sensor API")}}

Hàm khởi tạo **`GravitySensor()`** tạo đối tượng {{domxref("GravitySensor")}} mới cung cấp trong mỗi lần đọc trọng lực được áp dụng lên thiết bị theo cả ba trục.

## Cú pháp

```js-nolint
new GravitySensor()
new GravitySensor(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Các tùy chọn như sau:
    - `frequency` {{optional_inline}}
      - : Số lần mẫu được lấy mong muốn mỗi giây, nghĩa là số lần mỗi giây sự kiện {{domxref('sensor.reading_event', 'reading')}} sẽ được gọi. Có thể sử dụng số nguyên hoặc số thập phân, số thập phân cho tần số nhỏ hơn một giây. Tần số đọc thực tế phụ thuộc vào phần cứng thiết bị và do đó có thể nhỏ hơn yêu cầu. Tần số mặc định là tần số được xác định bởi nền tảng bên dưới.
    - `referenceFrame` {{optional_inline}}
      - : Hệ tọa độ cục bộ đại diện cho khung tham chiếu. Có thể là `'device'` hoặc `'screen'`. Mặc định là `'device'`.

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : Việc sử dụng tính năng này bị chặn bởi [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref('sensor.reading_event', 'reading')}}
