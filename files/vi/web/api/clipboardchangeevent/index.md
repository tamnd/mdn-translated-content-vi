---
title: ClipboardChangeEvent
slug: Web/API/ClipboardChangeEvent
page-type: web-api-interface
status:
  - experimental
browser-compat: api.ClipboardChangeEvent
---

{{APIRef("Clipboard API")}}{{SeeCompatTable}}

Giao diện **`ClipboardChangeEvent`** của {{domxref("Clipboard API", "", "", "nocode")}} biểu diễn các sự kiện được kích hoạt bất cứ khi nào nội dung của bảng nhớ tạm hệ thống thay đổi.

{{InheritanceDiagram}}

## Constructor

- {{domxref("ClipboardChangeEvent.ClipboardChangeEvent", "ClipboardChangeEvent()")}} {{experimental_inline}}
  - : Tạo một sự kiện `ClipboardChangeEvent` mới với các tham số được cung cấp.

## Thuộc tính của thể hiện

_Cũng kế thừa các thuộc tính từ phần tử cha là {{domxref("Event")}}_.

- {{domxref("ClipboardChangeEvent.types")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Một mảng chuỗi biểu diễn các kiểu dữ liệu bắt buộc có sẵn trên bảng nhớ tạm hệ thống khi sự kiện được kích hoạt.
- {{domxref("ClipboardChangeEvent.changeId")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Một số nguyên 128 bit biểu diễn mã định danh duy nhất cho thao tác thay đổi bảng nhớ tạm cụ thể này.

## Phương thức của thể hiện

_Không có phương thức riêng; kế thừa các phương thức từ phần tử cha là {{domxref("Event")}}_.

## Ví dụ

Trong ví dụ này, khi nội dung của bảng nhớ tạm thay đổi, trình lắng nghe sự kiện sẽ ghi lại các kiểu dữ liệu, mã thay đổi và toàn bộ đối tượng sự kiện vào bảng điều khiển. Đây là một đối tượng `ClipboardChangeEvent` có kiểu là `clipboardchange`.

```js
navigator.clipboard.addEventListener("clipboardchange", (event) => {
  console.log(`MIME types: ${event.types}`);
  console.log(`ID: ${event.changeId}`);
  console.dir(event);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- Các sự kiện liên quan đến sao chép: {{domxref("Element/copy_event", "copy")}}, {{domxref("Element/cut_event", "cut")}}, {{domxref("Element/paste_event", "paste")}}
- {{domxref("ClipboardEvent")}}
- [Clipboard API](/en-US/docs/Web/API/Clipboard_API)
