---
title: "AbsoluteOrientationSensor: bộ khởi tạo AbsoluteOrientationSensor()"
short-title: AbsoluteOrientationSensor()
slug: Web/API/AbsoluteOrientationSensor/AbsoluteOrientationSensor
page-type: web-api-constructor
browser-compat: api.AbsoluteOrientationSensor.AbsoluteOrientationSensor
---

{{securecontext_header}}{{APIRef("Sensor API")}}

Bộ khởi tạo **`AbsoluteOrientationSensor()`** tạo một đối tượng {{domxref("AbsoluteOrientationSensor")}} mới, mô tả hướng vật lý của thiết bị so với hệ tọa độ tham chiếu của Trái Đất.

## Cú pháp

```js-nolint
new AbsoluteOrientationSensor()
new AbsoluteOrientationSensor(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Các tùy chọn gồm:
    - `frequency` {{optional_inline}}
      - : Số lần lấy mẫu mong muốn mỗi giây, tức số lần sự kiện {{domxref('sensor.reading_event', 'reading')}} sẽ được gọi mỗi giây. Có thể dùng số nguyên hoặc số thập phân, với số thập phân cho tần suất nhỏ hơn một giây. Tần suất đọc thực tế phụ thuộc vào phần cứng của thiết bị và vì thế có thể thấp hơn mức yêu cầu.
    - `referenceFrame` {{optional_inline}}
      - : Hoặc `'device'` hoặc `'screen'`. Mặc định là `'device'`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref('sensor.reading_event', 'reading')}}
