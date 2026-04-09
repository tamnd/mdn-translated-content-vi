---
title: "ClipboardChangeEvent: hàm tạo ClipboardChangeEvent()"
short-title: ClipboardChangeEvent()
slug: Web/API/ClipboardChangeEvent/ClipboardChangeEvent
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.ClipboardChangeEvent.ClipboardChangeEvent
---

{{securecontext_header}}{{APIRef("Clipboard API")}}{{SeeCompatTable}}

Hàm tạo **`ClipboardChangeEvent()`** tạo một thể hiện đối tượng {{domxref("ClipboardChangeEvent")}} mới khi sự kiện `clipboardchange` xảy ra. Sự kiện `clipboardchange` được kích hoạt bất cứ khi nào nội dung bảng nhớ tạm hệ thống thay đổi, dù do một ứng dụng web hay bất kỳ ứng dụng hệ thống nào khác.

> [!NOTE]
> Hàm tạo sự kiện này nhìn chung không cần thiết cho các website production. Công dụng chính của nó là cho các bài kiểm thử cần một thể hiện của sự kiện này.

## Cú pháp

```js-nolint
new ClipboardChangeEvent(type)
new ClipboardChangeEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi chứa tên sự kiện. Giá trị này phải luôn được đặt là `clipboardchange`.
- `options` {{Optional_Inline}}
  - : Một đối tượng, ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}, có thể có các thuộc tính sau:
    - `types`
      - : Một mảng chuỗi biểu diễn các kiểu dữ liệu có sẵn trên bảng nhớ tạm hệ thống.
    - `changeId`
      - : Một số nguyên biểu diễn mã định danh duy nhất cho thao tác thay đổi bảng nhớ tạm.

### Giá trị trả về

Một đối tượng {{domxref("ClipboardChangeEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
