---
title: "TextEvent: initTextEvent() method"
short-title: initTextEvent()
slug: Web/API/TextEvent/initTextEvent
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.TextEvent.initTextEvent
---

{{APIRef("UI Events")}}{{deprecated_header}}

Phương thức **`initTextEventEvent()`** của giao diện {{domxref("TextEvent")}} khởi tạo giá trị của `TextEvent` sau khi nó được tạo.

Phương thức này phải được gọi để đặt sự kiện trước khi nó được gửi đi, bằng cách sử dụng {{ domxref("EventTarget.dispatchEvent()") }}.

> [!NOTE]
> Nhìn chung, bạn sẽ không tự tạo các sự kiện này; chúng được tạo bởi trình duyệt.

## Cú pháp

```js-nolint
initTextEvent(type)
initTextEvent(type, bubbles)
initTextEvent(type, bubbles, cancelable)
initTextEvent(type, bubbles, cancelable, view)
initTextEvent(type, bubbles, cancelable, view, data)
```

### Tham số

- `type`
  - : Một chuỗi để đặt {{domxref("Event.type", "type")}} của sự kiện. Chỉ có một loại sự kiện cho {{domxref("TextEvent")}}: `textInput`.
- `bubbles` {{optional_inline}}
  - : Giá trị boolean cho biết sự kiện có thể nổi bọt hay không. Mặc định là `false`. Đặt giá trị của {{domxref("Event.bubbles")}}.
- `cancelable` {{optional_inline}}
  - : Giá trị boolean cho biết hành động mặc định của sự kiện có thể bị ngăn chặn hay không. Mặc định là `false`. Đặt giá trị của {{domxref("Event.cancelable")}}.
- `view` {{optional_inline}}
  - : Đối tượng {{glossary("WindowProxy")}} mà sự kiện được tạo ra từ đó. Mặc định là `null`.
- `data` {{optional_inline}}
  - : Một chuỗi để đặt thuộc tính dữ liệu của sự kiện.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
