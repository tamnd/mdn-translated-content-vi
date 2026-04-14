---
title: "<dir>: Phần tử thư mục"
slug: Web/HTML/Reference/Elements/dir
page-type: html-element
status:
  - deprecated
browser-compat: html.elements.dir
sidebar: htmlsidebar
---

{{Deprecated_Header}}

Phần tử **`<dir>`** trong [HTML](/en-US/docs/Web/HTML) được dùng làm container cho thư mục tệp và/hoặc thư mục, có thể với kiểu dáng và biểu tượng được {{Glossary("user agent","tác nhân người dùng")}} áp dụng. Không dùng phần tử lỗi thời này; thay vào đó, hãy dùng phần tử {{HTMLElement("ul")}} cho danh sách, kể cả danh sách tệp.

> [!WARNING]
> Không dùng phần tử này. Mặc dù có trong các đặc tả HTML ban đầu, nó đã bị deprecated trong HTML 4, và kể từ đó đã bị xóa hoàn toàn.

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("HTMLDirectoryElement")}}.

## Thuộc tính

Giống như tất cả các phần tử HTML khác, phần tử này hỗ trợ [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `compact` {{Deprecated_Inline}}
  - : Thuộc tính Boolean này gợi ý rằng danh sách nên được hiển thị theo kiểu thu gọn. Việc giải thích thuộc tính này phụ thuộc vào tác nhân người dùng và nó không hoạt động trong tất cả các trình duyệt.

<!-- ## Technical summary -->

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử HTML liên quan đến danh sách khác: {{HTMLElement("ol")}}, {{HTMLElement("ul")}}, {{HTMLElement("li")}}, và {{HTMLElement("menu")}};
- Các thuộc tính CSS có thể đặc biệt hữu ích để tạo kiểu cho phần tử `<dir>`:
  - Thuộc tính {{cssxref('list-style')}}, hữu ích để chọn cách hiển thị thứ tự.
  - [Bộ đếm CSS](/en-US/docs/Web/CSS/Guides/Counter_styles/Using_counters), hữu ích để xử lý các danh sách lồng nhau phức tạp.
  - Thuộc tính {{Cssxref('line-height')}}, hữu ích để mô phỏng thuộc tính [`compact`](#compact) đã deprecated.
  - Thuộc tính {{cssxref('margin')}}, hữu ích để kiểm soát thụt lề của danh sách.
