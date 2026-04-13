---
title: "Sensor: sự kiện reading"
short-title: reading
slug: Web/API/Sensor/reading_event
page-type: web-api-event
browser-compat: api.Sensor.reading_event
---

{{securecontext_header}}{{APIRef("Sensor API")}}

Sự kiện **`reading`** được kích hoạt khi có dữ liệu đọc mới trên cảm biến.

Giao diện {{domxref('Sensor')}} là lớp cơ sở, `onreading` và sự kiện `reading` chỉ có thể được sử dụng trên một trong các [lớp dẫn xuất](/en-US/docs/Web/API/Sensor#interfaces_based_on_sensor).

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("reading", (event) => { })

onreading = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung không có thuộc tính bổ sung.

## Ví dụ

### Đọc gia tốc

Ví dụ này thêm trình lắng nghe sự kiện để đọc các giá trị gia tốc của {{domxref("Accelerometer")}}. Nó đọc sáu mươi lần mỗi giây.

```js
const acl = new Accelerometer({ frequency: 60 });
acl.addEventListener("reading", () => {
  console.log(`Acceleration along the X-axis ${acl.x}`);
  console.log(`Acceleration along the Y-axis ${acl.y}`);
  console.log(`Acceleration along the Z-axis ${acl.z}`);
});
acl.start();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref('Sensor.activate_event', 'activate')}} của Sensor
- Sự kiện {{domxref('Sensor.error_event', 'error')}} của Sensor
