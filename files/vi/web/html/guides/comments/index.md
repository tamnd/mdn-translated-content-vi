---
title: Sử dụng chú thích HTML <!-- … -->
short-title: Chú thích
slug: Web/HTML/Guides/Comments
page-type: guide
spec-urls: https://html.spec.whatwg.org/multipage/syntax.html#comments
sidebar: htmlsidebar
---

Một **chú thích** HTML được sử dụng để thêm các ghi chú giải thích vào markup hoặc để ngăn trình duyệt diễn giải các phần cụ thể của tài liệu.

Chú thích bắt đầu bằng chuỗi `<!--` và kết thúc bằng chuỗi `-->`, thường có văn bản ở giữa. Văn bản này không được bắt đầu bằng chuỗi `>` hoặc `->`, không được chứa các chuỗi `-->` hoặc `--!>`, cũng không được kết thúc bằng chuỗi `<!-`, mặc dù `<!` được phép.

Trình duyệt bỏ qua các chú thích khi hiển thị code. Nói cách khác, chúng không hiển thị trên trang — chỉ có trong code. Chú thích HTML là một cách để bạn viết các ghi chú hữu ích về code hoặc logic của mình.

Điều trên cũng đúng với chú thích [XML](/en-US/docs/Web/XML). Ngoài ra, trong XML, chẳng hạn như trong markup [SVG](/en-US/docs/Web/SVG) hoặc [MathML](/en-US/docs/Web/MathML), một chú thích không được chứa chuỗi ký tự `--`.

Chú thích có thể được sử dụng trên một dòng duy nhất, hoặc kéo dài nhiều dòng. Chúng có thể được sử dụng ở những nơi sau:

- Trước và sau {{Glossary("Doctype")}}
- Trước và sau phần tử {{HTMLElement("html")}}
- Là nội dung của hầu hết các phần tử ngoại trừ: {{HTMLElement("script")}}, {{HTMLElement("style")}}, {{HTMLElement("title")}}, {{HTMLElement("textarea")}}, vì các phần tử này diễn giải nội dung của chúng như văn bản thô

> [!NOTE]
> Mặc dù các phần tử `<script>` không nên có chú thích HTML và nên sử dụng [chú thích JavaScript](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#comments) thay thế, đã có một thực hành cũ là bọc toàn bộ nội dung script trong một chú thích HTML để các trình duyệt cổ không hỗ trợ JavaScript không hiển thị nó như văn bản. Đây hiện là một [tính năng cũ của chính JavaScript](/en-US/docs/Web/JavaScript/Reference/Deprecated_and_obsolete_features#html_comments) và bạn không nên dựa vào nó.

## Cú pháp

```html
<!-- Chú thích -->
```

## Ví dụ

```html
<!-- Một chú thích trên một dòng -->

<!--
Một chú thích
kéo dài
nhiều
dòng
-->

<!-- Chú thích bên dưới vô hiệu hóa
   HTML được chứa bên trong -->
<!--
<p>
   Nội dung này sẽ không được hiển thị.
</p>
-->
```

## Ghi chú

Chú thích HTML chỉ được phép làm nội dung. Bạn không thể sử dụng nó trong một thẻ, chẳng hạn như trước một [thuộc tính](/en-US/docs/Glossary/Attribute) HTML.

Cũng như hầu hết các ngôn ngữ lập trình sử dụng cú pháp chú thích `<!-- -->`, các chú thích không thể được lồng nhau. Nói cách khác, trường hợp đầu tiên của `-->` xuất hiện sau một trường hợp của `<!--` sẽ đóng chú thích.

Mặc dù chú thích bắt đầu bằng `<` và kết thúc bằng `>`, một chú thích không phải là một phần tử HTML.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [Chú thích trong JavaScript](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#comments)
- [Chú thích trong CSS](/en-US/docs/Web/CSS/Guides/Syntax/Comments)
- API {{domxref("Comment")}} (`Comment` kế thừa từ {{domxref("Node")}})
