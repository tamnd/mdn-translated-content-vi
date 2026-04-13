---
title: "SensorErrorEvent: hàm tạo SensorErrorEvent()"
short-title: SensorErrorEvent()
slug: Web/API/SensorErrorEvent/SensorErrorEvent
page-type: web-api-constructor
browser-compat: api.SensorErrorEvent.SensorErrorEvent
---

{{securecontext_header}}{{APIRef("Sensor API")}}

Hàm tạo **`SensorErrorEvent()`** tạo một đối tượng {{domxref("SensorErrorEvent")}} mới cung cấp thông tin về các lỗi được ném ra bởi bất kỳ giao diện nào dựa trên {{domxref('Sensor')}}.

## Cú pháp

```js-nolint
new SensorErrorEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của sự kiện.
    Phân biệt chữ hoa chữ thường và các trình duyệt luôn đặt nó thành `error`.
- `options`
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `error`
      - : Một đối tượng {{domxref('DOMException')}} mô tả lỗi.

### Giá trị trả về

Một đối tượng {{domxref("SensorErrorEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
