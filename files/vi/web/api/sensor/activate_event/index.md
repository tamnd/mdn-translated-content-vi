---
title: "Sensor: sự kiện activate"
short-title: activate
slug: Web/API/Sensor/activate_event
page-type: web-api-event
browser-compat: api.Sensor.activate_event
---

{{securecontext_header}}{{APIRef("Sensor API")}}

Sự kiện **`activate`** được kích hoạt khi cảm biến được kích hoạt, nghĩa là nó sẽ bắt đầu nhận dữ liệu đọc.

Giao diện {{domxref('Sensor')}} là lớp cơ sở, `onactivate` và sự kiện `activate` chỉ có thể được sử dụng trên một trong các [lớp dẫn xuất](/en-US/docs/Web/API/Sensor#interfaces_based_on_sensor).

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("activate", (event) => { })

onactivate = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung không có thuộc tính bổ sung.

## Ví dụ

### Ghi log khi gia tốc kế sẵn sàng đo

Ví dụ này thêm trình lắng nghe sự kiện để ghi log việc kích hoạt của {{domxref("Accelerometer")}}.

```js
const acl = new Accelerometer({ frequency: 60 });
acl.addEventListener("activate", () => console.log("Ready to measure."));
acl.start();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref('Sensor.error_event', 'error')}} của Sensor
- Sự kiện {{domxref('Sensor.reading_event', 'reading')}} của Sensor
