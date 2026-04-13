---
title: "PointerEvent: pointerType property"
short-title: pointerType
slug: Web/API/PointerEvent/pointerType
page-type: web-api-instance-property
browser-compat: api.PointerEvent.pointerType
---

{{ APIRef("Pointer Events") }}

Thuộc tính chỉ đọc **`pointerType`** của giao diện {{domxref("PointerEvent")}} cho biết loại thiết bị (chuột, bút, hoặc cảm ứng) đã gây ra một sự kiện con trỏ nhất định.

## Giá trị

Loại con trỏ của sự kiện. Các giá trị được hỗ trợ là các chuỗi sau:

- `"mouse"`
  - : Sự kiện được tạo ra bởi thiết bị chuột.
- `"pen"`
  - : Sự kiện được tạo ra bởi thiết bị bút hoặc bút stylus.
- `"touch"`
  - : Sự kiện được tạo ra bởi cảm ứng, chẳng hạn như ngón tay.

Nếu không thể phát hiện loại thiết bị bởi trình duyệt, giá trị có thể là một chuỗi rỗng (`""`). Nếu trình duyệt hỗ trợ các loại thiết bị con trỏ khác ngoài những loại được liệt kê ở trên, giá trị phải được _thêm tiền tố nhà cung cấp_ để tránh xung đột tên cho các loại thiết bị khác nhau.

## Ví dụ

Ví dụ này minh họa cách sử dụng giá trị của thuộc tính `pointerType` để gọi hàm xử lý loại con trỏ phù hợp.

```js
targetElement.addEventListener("pointerdown", (event) => {
  // Call the appropriate pointer type handler
  switch (event.pointerType) {
    case "mouse":
      process_pointer_mouse(event);
      break;
    case "pen":
      process_pointer_pen(event);
      break;
    case "touch":
      process_pointer_touch(event);
      break;
    default:
      console.log(`pointerType ${event.pointerType} is not supported`);
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
