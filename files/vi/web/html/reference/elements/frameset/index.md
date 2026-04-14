---
title: <frameset>
slug: Web/HTML/Reference/Elements/frameset
page-type: html-element
status:
  - deprecated
browser-compat: html.elements.frameset
sidebar: htmlsidebar
---

{{Deprecated_header}}

Phần tử **`<frameset>`** trong [HTML](/vi/docs/Web/HTML) được sử dụng để chứa các phần tử {{HTMLElement("frame")}}.

> [!NOTE]
> Vì việc sử dụng các khung hiện nay không còn được khuyến khích, thay vào đó nên dùng {{HTMLElement("iframe")}}, phần tử này thường không được các trang web hiện đại sử dụng.

## Thuộc tính

Cũng như tất cả các phần tử HTML khác, phần tử này hỗ trợ [các thuộc tính toàn cục](/vi/docs/Web/HTML/Reference/Global_attributes).

- `cols` {{Deprecated_Inline}}
  - : Thuộc tính này chỉ định số lượng và kích thước của các khoảng trống theo chiều ngang trong một frameset.
- `rows` {{Deprecated_Inline}}
  - : Thuộc tính này chỉ định số lượng và kích thước của các khoảng trống theo chiều dọc trong một frameset.

## Ví dụ

### Tài liệu frameset

Một tài liệu frameset có phần tử `<frameset>` thay vì phần tử {{HTMLElement("body")}}. Các phần tử {{HTMLElement("frame")}} được đặt trong `<frameset>`.

```html
<!doctype html>
<html lang="en-US">
  <head>
    <!-- Document metadata goes here -->
  </head>
  <frameset cols="50%, 50%">
    <frame
      src="https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/iframe" />
    <frame
      src="https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/frame" />
  </frameset>
</html>
```

Nếu bạn muốn nhúng một trang HTML khác vào {{HTMLElement("body")}} của tài liệu, hãy sử dụng phần tử {{HTMLElement("iframe")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("frame")}}
- {{HTMLElement("iframe")}}
