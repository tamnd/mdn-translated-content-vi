---
title: "ClipboardEvent: hàm tạo ClipboardEvent()"
short-title: ClipboardEvent()
slug: Web/API/ClipboardEvent/ClipboardEvent
page-type: web-api-constructor
browser-compat: api.ClipboardEvent.ClipboardEvent
---

{{APIRef("Clipboard API")}}

Hàm tạo **`ClipboardEvent()`** trả về một đối tượng {{domxref("ClipboardEvent")}} mới, biểu diễn một sự kiện cung cấp thông tin liên quan đến việc sửa đổi clipboard, tức là các sự kiện {{domxref("Element/cut_event", "cut")}}, {{domxref("Element/copy_event", "copy")}} và {{domxref("Element/paste_event", "paste")}}.

## Cú pháp

```js-nolint
new ClipboardEvent(type)
new ClipboardEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi chứa tên kiểu của `ClipboardEvent`.
    Phân biệt chữ hoa chữ thường và trình duyệt đặt giá trị này là `copy`, `cut` hoặc `paste`.
- `options` {{optional_inline}}
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, còn có các thuộc tính sau:
    - `clipboardData` {{optional_inline}}
      - : Một đối tượng {{domxref("DataTransfer")}} chứa dữ liệu liên quan đến sự kiện clipboard. Mặc định là `null`.
    - `dataType` {{non-standard_inline}} {{optional_inline}}
      - : Một chuỗi chứa kiểu MIME của dữ liệu được chứa trong đối số `data`. Mặc định là `""`.
    - `data` {{non-standard_inline}} {{optional_inline}}
      - : Một chuỗi chứa dữ liệu liên quan đến sự kiện clipboard. Mặc định là `""`.

### Giá trị trả về

Một đối tượng {{domxref("ClipboardEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- Các sự kiện liên quan đến sao chép: {{domxref("Element/copy_event", "copy")}}, {{domxref("Element/cut_event", "cut")}}, {{domxref("Element/paste_event", "paste")}}
- Giao diện {{domxref("ClipboardEvent")}} mà hàm tạo này thuộc về.
- [Clipboard API](/en-US/docs/Web/API/Clipboard_API)
