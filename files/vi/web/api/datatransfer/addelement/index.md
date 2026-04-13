---
title: "DataTransfer: phương thức addElement()"
short-title: addElement()
slug: Web/API/DataTransfer/addElement
page-type: web-api-instance-method
status:
  - experimental
  - non-standard
browser-compat: api.DataTransfer.addElement
---

{{APIRef("HTML Drag and Drop API")}}{{SeeCompatTable}}{{Non-standard_header}}

Phương thức **`DataTransfer.addElement()`** đặt nguồn kéo thành phần tử đã cho. Phần tử này sẽ là phần tử mà các sự kiện {{domxref("HTMLElement/drag_event", "drag")}} và {{domxref("HTMLElement/dragend_event", "dragend")}} được kích hoạt, chứ không phải đích mặc định (nút đã được kéo).

> [!NOTE]
> Phương thức này dành riêng cho Firefox.

## Cú pháp

```js-nolint
addElement(element)
```

### Tham số

- `element`
  - : {{domxref("Element")}} cần đặt làm nguồn kéo.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ này cho thấy cách sử dụng phương thức `addElement()`.

```js
function changeDragNode(event, node) {
  const dt = event.dataTransfer;
  dt.addElement(node);
}
```

## Thông số kỹ thuật

Phương thức này không được định nghĩa trong bất kỳ tiêu chuẩn Web nào.
