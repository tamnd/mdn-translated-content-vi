---
title: "<noembed>: Phần tử dự phòng nhúng"
slug: Web/HTML/Reference/Elements/noembed
page-type: html-element
status:
  - deprecated
browser-compat: html.elements.noembed
sidebar: htmlsidebar
---

{{deprecated_header}}

Phần tử **`<noembed>`** trong [HTML](/en-US/docs/Web/HTML) là một cách lỗi thời, không chuẩn để cung cấp nội dung thay thế hoặc "dự phòng" cho các trình duyệt không hỗ trợ phần tử {{HTMLElement("embed")}} hoặc không hỗ trợ loại [nội dung nhúng](/en-US/docs/Web/HTML/Guides/Content_categories#embedded_content) mà tác giả muốn sử dụng. Phần tử này đã bị deprecated trong HTML 4.01 trở lên để ủng hộ việc đặt nội dung dự phòng giữa các thẻ mở và đóng của phần tử {{HTMLElement("object")}}.

> [!NOTE]
> Mặc dù phần tử này hiện vẫn hoạt động trong nhiều trình duyệt, nhưng nó đã lỗi thời và không nên dùng. Hãy dùng {{HTMLElement("object")}} thay thế, với nội dung dự phòng giữa các thẻ mở và đóng của phần tử.

## Ví dụ

Thông báo bên trong thẻ `<noembed>` sẽ chỉ xuất hiện khi trình duyệt của bạn không hỗ trợ thẻ `<embed>`.

### Hiển thị nội dung thay thế

```html
<embed
  type="vide/webm"
  src="/media/examples/flower.mp4"
  width="200"
  height="200" />
<noembed>
  <h1>Alternative content</h1>
</noembed>
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
