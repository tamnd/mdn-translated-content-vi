---
title: Bộ chọn (CSS)
slug: Glossary/CSS_Selector
page-type: glossary-definition
sidebar: glossarysidebar
---

**Bộ chọn CSS** (CSS selector) là phần của quy tắc CSS mô tả các phần tử nào trong tài liệu sẽ được quy tắc đó áp dụng. Các phần tử khớp sẽ có kiểu được chỉ định của quy tắc áp dụng cho chúng.

## Ví dụ

Xem xét CSS sau:

```css
p {
  color: green;
}

div.warning {
  width: 100%;
  border: 2px solid yellow;
  color: white;
  background-color: darkred;
  padding: 0.8em 0.8em 0.6em;
}

#customized {
  font:
    16px "Lucida Grande",
    "Helvetica",
    "Arial",
    sans-serif;
}
```

Các bộ chọn ở đây là `"p"` (áp dụng màu xanh lá cho văn bản trong bất kỳ phần tử {{HTMLElement("p")}} nào), `"div.warning"` (làm cho bất kỳ phần tử {{HTMLElement("div")}} nào có [lớp](/en-US/docs/Web/HTML/Reference/Global_attributes/class) `"warning"` trông như hộp cảnh báo), và `"#customized"`, đặt phông chữ cơ sở của phần tử có ID `"customized"` là Lucida Grande 16 pixel hoặc một trong các phông chữ dự phòng.

## Xem thêm

- [Tìm hiểu thêm về bộ chọn CSS](/en-US/docs/Learn_web_development/Core/Styling_basics/Basic_selectors) trong phần giới thiệu CSS của chúng tôi.
- Các thuật ngữ liên quan:
  - {{Glossary("CSS")}}
  - {{Glossary("Pseudo-class")}}
  - {{Glossary("Pseudo-element")}}
