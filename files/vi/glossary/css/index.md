---
title: CSS
slug: Glossary/CSS
page-type: glossary-definition
sidebar: glossarysidebar
---

**CSS** (Cascading Style Sheets - Bảng định kiểu theo tầng) là ngôn ngữ khai báo kiểm soát giao diện của các trang web trong {{glossary("browser","trình duyệt")}}.

Trình duyệt áp dụng các khai báo kiểu CSS lên các phần tử được chọn để hiển thị chúng đúng cách. Một khai báo kiểu bao gồm các thuộc tính và giá trị của chúng, xác định giao diện của trang web.

CSS là một trong ba công nghệ cốt lõi của Web, cùng với {{Glossary("HTML")}} và {{Glossary("JavaScript")}}. CSS thường định kiểu cho các {{Glossary("Element","phần tử HTML")}}, nhưng cũng có thể được sử dụng với các ngôn ngữ đánh dấu khác như {{Glossary("SVG")}} hoặc {{Glossary("XML")}}.

Một quy tắc CSS là tập hợp các {{Glossary("property/CSS","thuộc tính")}} được liên kết với một {{Glossary("CSS selector","bộ chọn")}}. Đây là ví dụ làm cho mọi đoạn văn HTML có màu vàng trên nền đen:

```css
/* Bộ chọn "p" chỉ ra rằng tất cả đoạn văn trong tài liệu sẽ bị ảnh hưởng bởi quy tắc đó */
p {
  /* Thuộc tính "color" xác định màu chữ, trong trường hợp này là màu vàng. */
  color: yellow;

  /* Thuộc tính "background-color" xác định màu nền, trong trường hợp này là màu đen. */
  background-color: black;
}
```

"Cascading" (theo tầng) đề cập đến các quy tắc chi phối cách các bộ chọn được ưu tiên để thay đổi giao diện của trang. Đây là tính năng rất quan trọng, vì một trang web phức tạp có thể có hàng nghìn quy tắc CSS.

## Xem thêm

- [Tìm hiểu CSS](/en-US/docs/Learn_web_development/Core/Styling_basics)
- [Tài liệu CSS](/en-US/docs/Web/CSS)
- [CSS](https://en.wikipedia.org/wiki/CSS) trên Wikipedia
- [Công việc hiện tại của CSS Working Group](https://www.w3.org/Style/CSS/current-work)
