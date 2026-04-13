---
title: "ClipboardEvent: constructor ClipboardEvent()"
short-title: ClipboardEvent()
slug: Web/API/ClipboardEvent/ClipboardEvent
page-type: web-api-constructor
browser-compat: api.ClipboardEvent.ClipboardEvent
---

{{APIRef("Clipboard API")}}

Constructor **`ClipboardEvent()`** trả về một {{domxref("ClipboardEvent")}} mới, đại diện cho một sự kiện cung cấp thông tin liên quan đến việc sửa đổi clipboard, đó là các sự kiện {{domxref("Element/cut_event", "cut")}}, {{domxref("Element/copy_event", "copy")}}, và {{domxref("Element/paste_event", "paste")}}.

## Cú pháp

```js-nolint
new ClipboardEvent(type)
new ClipboardEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của loại sự kiện `ClipboardEvent`.
    Chuỗi này phân biệt chữ hoa chữ thường và trình duyệt đặt nó thành `copy`, `cut`, hoặc `paste`.
- `options` {{optional_inline}}
  - : Một đối tượng mà _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có các thuộc tính sau:
    - `clipboardData` {{optional_inline}}
      - : Một đối tượng {{domxref("DataTransfer")}} chứa dữ liệu liên quan đến sự kiện clipboard. Giá trị mặc định là `null`.
    - `dataType` {{non-standard_inline}} {{optional_inline}}
      - : Một chuỗi chứa kiểu MIME của dữ liệu contained trong đối số `data`. Giá trị mặc định là `""`.
    - `data` {{non-standard_inline}} {{optional_inline}}
      - : Một chuỗi chứa dữ liệu liên quan đến sự kiện clipboard. Giá trị mặc định là `""`.

### Giá trị trả về

Một đối tượng {{domxref("ClipboardEvent")}} mới.

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các sự kiện liên quan đến sao chép: {{domxref("Element/copy_event", "copy")}}, {{domxref("Element/cut_event", "cut")}}, {{domxref("Element/paste_event", "paste")}}
- Giao diện {{domxref("ClipboardEvent")}} mà nó thuộc về.
- [API Clipboard](/en-US/docs/Web/API/Clipboard_API)
