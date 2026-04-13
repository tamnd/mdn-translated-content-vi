---
title: "Magnetometer: hàm tạo Magnetometer()"
short-title: Magnetometer()
slug: Web/API/Magnetometer/Magnetometer
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.Magnetometer.Magnetometer
---

{{securecontext_header}}{{APIRef("Sensor API")}}{{SeeCompatTable}}

Hàm tạo **`Magnetometer()`** tạo một đối tượng {{domxref("Magnetometer")}} mới, trả về thông tin về từ trường do cảm biến từ kế chính của thiết bị phát hiện.

## Cú pháp

```js-nolint
new Magnetometer()
new Magnetometer(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Các tùy chọn như sau:
    - `frequency` {{optional_inline}}
      - : Số lần mỗi giây mong muốn để lấy một mẫu, tức là số lần mỗi giây sự kiện {{domxref('sensor.reading_event', 'reading')}} sẽ được gọi. Có thể dùng số nguyên hoặc số thập phân; số thập phân dành cho tần suất nhỏ hơn một giây. Tần suất thực tế phụ thuộc vào phần cứng thiết bị và có thể thấp hơn giá trị yêu cầu.
    - `referenceFrame` {{optional_inline}}
      - : `'device'` hoặc `'screen'`. Mặc định là `'device'`.

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : Việc dùng tính năng này bị chặn bởi [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref('sensor.reading_event', 'reading')}}
