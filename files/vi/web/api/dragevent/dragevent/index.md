---
title: "DragEvent: DragEvent() constructor"
short-title: DragEvent()
slug: Web/API/DragEvent/DragEvent
page-type: web-api-constructor
browser-compat: api.DragEvent.DragEvent
---

{{APIRef("HTML Drag and Drop API")}}

Hàm tạo này được dùng để tạo một đối tượng {{domxref("DragEvent")}} tổng hợp.

Mặc dù giao diện này có hàm tạo, không thể tạo một đối tượng {{domxref("DataTransfer")}} hữu ích từ script, vì các đối tượng {{domxref("DataTransfer")}} có mô hình xử lý và bảo mật được trình duyệt điều phối trong suốt quá trình kéo và thả.

Giao diện này kế thừa các thuộc tính từ {{domxref("MouseEvent")}} và {{domxref("Event")}}.

## Cú pháp

```js-nolint
new DragEvent(type)
new DragEvent(type, dragEventInit)
```

### Tham số

- `type`
  - : Một chuỗi biểu thị tên của sự kiện (xem [các kiểu sự kiện DragEvent](/en-US/docs/Web/API/DragEvent#event_types)).

- `eventInitDict` {{optional_inline}}
  - : Một đối tượng chứa các thuộc tính sau:
    - `dataTransfer` {{optional_inline}}
      - : Một {{domxref("DataTransfer")}}. Mặc định là `null`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
