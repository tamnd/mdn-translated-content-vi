---
title: "Accelerometer: bộ khởi tạo Accelerometer()"
short-title: Accelerometer()
slug: Web/API/Accelerometer/Accelerometer
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.Accelerometer.Accelerometer
---

{{securecontext_header}}{{APIRef("Sensor API")}}{{SeeCompatTable}}

Bộ khởi tạo **`Accelerometer()`** tạo một đối tượng {{domxref("Accelerometer")}} mới, đối tượng này trả về gia tốc của thiết bị dọc theo cả ba trục tại thời điểm được đọc.

## Cú pháp

```js-nolint
new Accelerometer()
new Accelerometer(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Các tùy chọn như sau:
    - `frequency` {{optional_inline}}
      - : Số lần mong muốn mỗi giây để lấy một mẫu, nghĩa là số lần mỗi giây sự kiện {{domxref('sensor.reading_event', 'reading')}} sẽ được gọi. Có thể dùng số nguyên hoặc số thập phân, trong đó số thập phân dùng cho tần suất nhỏ hơn một giây. Tần suất đọc thực tế phụ thuộc vào phần cứng của thiết bị và vì vậy có thể thấp hơn mức yêu cầu.
    - `referenceFrame` {{optional_inline}}
      - : Hoặc `'device'` hoặc `'screen'`. Mặc định là `'device'`.

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : Việc dùng tính năng này đã bị chặn bởi [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref('sensor.reading_event', 'reading')}}
