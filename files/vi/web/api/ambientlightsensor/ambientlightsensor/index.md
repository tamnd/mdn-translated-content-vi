---
title: "AmbientLightSensor: bộ khởi tạo AmbientLightSensor()"
short-title: AmbientLightSensor()
slug: Web/API/AmbientLightSensor/AmbientLightSensor
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.AmbientLightSensor.AmbientLightSensor
---

{{securecontext_header}}{{APIRef("Sensor API")}}{{SeeCompatTable}}

Bộ khởi tạo **`AmbientLightSensor()`** tạo một đối tượng {{domxref("AmbientLightSensor")}} mới, đối tượng này trả về mức sáng hiện tại, hay độ rọi, của ánh sáng xung quanh thiết bị đang lưu trữ.

## Cú pháp

```js-nolint
new AmbientLightSensor()
new AmbientLightSensor(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Hiện chỉ hỗ trợ một tùy chọn:
    - `frequency` {{optional_inline}}
      - : Số lần mong muốn mỗi giây mà mẫu được lấy, tức số lần sự kiện {{domxref('sensor.reading_event', 'reading')}} sẽ được gọi mỗi giây. Có thể dùng số nguyên hoặc số thập phân, với số thập phân cho tần suất nhỏ hơn một giây. Tần suất đọc thực tế phụ thuộc vào phần cứng của thiết bị và vì thế có thể thấp hơn mức yêu cầu.

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : Việc sử dụng tính năng này đã bị chặn bởi một [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref('sensor.reading_event', 'reading')}}
