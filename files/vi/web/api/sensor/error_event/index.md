---
title: "Sensor: sự kiện error"
short-title: error
slug: Web/API/Sensor/error_event
page-type: web-api-event
browser-compat: api.Sensor.error_event
---

{{securecontext_header}}{{APIRef("Sensor API")}}

Sự kiện **`error`** được kích hoạt khi xảy ra ngoại lệ trên cảm biến.

Giao diện {{domxref('Sensor')}} là lớp cơ sở, `onerror` và sự kiện `error` chỉ có thể được sử dụng trên một trong các [lớp dẫn xuất](/en-US/docs/Web/API/Sensor#interfaces_based_on_sensor).

Sau khi sự kiện này xảy ra, đối tượng {{domxref('Sensor')}} trở về trạng thái rảnh. Nếu cảm biến đang đọc giá trị, nó sẽ dừng lại cho đến khi được khởi động lại.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("error", (event) => { })

onerror = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("SensorErrorEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("SensorErrorEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê dưới đây, các thuộc tính từ giao diện cha {{domxref("Event")}} cũng có sẵn._

- {{domxref('SensorErrorEvent.error', 'error')}} {{ReadOnlyInline}}
  - : Trả về {{domxref('DOMException')}} đã được ném ra.

## Ví dụ

### Ghi log ngoại lệ gia tốc kế

Ví dụ này thêm trình lắng nghe sự kiện để ghi log các lỗi xảy ra trên {{domxref("Accelerometer")}}.

```js
const acl = new Accelerometer({ frequency: 60 });
acl.addEventListener("error", (error) => console.log(`Error: ${error.name}`));
acl.start();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref('Sensor.activate_event', 'activate')}} của Sensor
- Sự kiện {{domxref('Sensor.reading_event', 'reading')}} của Sensor
