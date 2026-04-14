---
title: "<noframes>: Phần tử dự phòng frame"
slug: Web/HTML/Reference/Elements/noframes
page-type: html-element
status:
  - deprecated
browser-compat: html.elements.noframes
sidebar: htmlsidebar
---

{{deprecated_header}}

Phần tử **`<noframes>`** trong [HTML](/en-US/docs/Web/HTML) cung cấp nội dung để trình bày trong các trình duyệt không hỗ trợ (hoặc đã tắt hỗ trợ) phần tử {{HTMLElement("frame")}}. Mặc dù hầu hết các trình duyệt thường dùng đều hỗ trợ frame, nhưng có những ngoại lệ, bao gồm một số trình duyệt dùng cho mục đích đặc biệt bao gồm một số trình duyệt di động, cũng như trình duyệt chế độ văn bản.

Một phần tử `<noframes>` có thể chứa bất kỳ phần tử HTML nào được cho phép trong phần thân của tài liệu HTML, ngoại trừ các phần tử {{HTMLElement("frameset")}} và {{HTMLElement("frame")}}, vì việc dùng frame khi chúng không được hỗ trợ là vô nghĩa.

`<noframes>` có thể được dùng để trình bày thông báo giải thích rằng trình duyệt của người dùng không hỗ trợ frame, nhưng tốt nhất nên được dùng để trình bày một biểu mẫu thay thế của trang web không dùng frame nhưng vẫn cung cấp chức năng giống hoặc tương tự.

> [!NOTE]
> Phần tử này đã lỗi thời và không nên dùng, vì các phần tử {{HTMLElement("frame")}} và {{HTMLElement("frameset")}} cũng đã lỗi thời. Khi cần frame, chúng nên được trình bày bằng phần tử {{HTMLElement("iframe")}}.

## Thuộc tính

Giống như tất cả các phần tử HTML khác, phần tử này hỗ trợ [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes). Nó không có thuộc tính nào khác.

## Ví dụ

Trong ví dụ này, chúng ta thấy một frameset với hai frame. Ngoài ra, `<noframes>` được dùng để trình bày thông báo giải thích nếu {{Glossary("user agent","tác nhân người dùng")}} không hỗ trợ frame.

```html
<!doctype html>
<html lang="en-US">
  <head>
    <!-- Document metadata goes here -->
  </head>
  <frameset rows="45%, 55%">
    <frame src="https://developer.mozilla.org/en/HTML/Element/frameset" />
    <frame src="https://developer.mozilla.org/en/HTML/Element/frame" />
    <noframes>
      <p>
        It seems your browser does not support frames or is configured to not
        allow them.
      </p>
    </noframes>
  </frameset>
</html>
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("frameset")}}
- {{HTMLElement("frame")}}
