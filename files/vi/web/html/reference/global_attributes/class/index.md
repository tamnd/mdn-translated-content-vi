---
title: Thuộc tính toàn cục HTML class
short-title: class
slug: Web/HTML/Reference/Global_attributes/class
page-type: html-attribute
browser-compat: html.global_attributes.class
sidebar: htmlsidebar
---

Thuộc tính toàn cục **`class`** [global attribute](/en-US/docs/Web/HTML/Reference/Global_attributes) là danh sách các lớp của phần tử, được phân tách bằng [khoảng trắng ASCII](/en-US/docs/Glossary/Whitespace#in_html).

{{InteractiveExample("HTML Demo: class", "tabbed-standard")}}

```html interactive-example
<p>Narrator: This is the beginning of the play.</p>

<p class="note editorial">Above point sounds a bit obvious. Remove/rewrite?</p>

<p>Narrator: I must warn you now folks that this beginning is very exciting.</p>

<p class="note">[Lights go up and wind blows; Caspian enters stage right]</p>
```

```css interactive-example
.note {
  font-style: italic;
  font-weight: bold;
}

.editorial {
  background: rgb(255 0 0 / 0.25);
  padding: 10px;
}

.editorial::before {
  content: "Editor: ";
}
```

## Cú pháp

Thuộc tính `class` là danh sách các giá trị lớp được phân tách bằng [khoảng trắng ASCII](/en-US/docs/Glossary/Whitespace#in_html).

Mỗi giá trị lớp có thể chứa bất kỳ ký tự Unicode nào (ngoại trừ, tất nhiên, khoảng trắng ASCII). Tuy nhiên, khi được dùng trong bộ chọn CSS, từ JavaScript bằng API như {{domxref("Document.querySelector()")}} hoặc trong stylesheet CSS, các giá trị thuộc tính class phải là [CSS identifiers](/en-US/docs/Web/CSS/Reference/Values/ident) hợp lệ. Điều này có nghĩa là nếu giá trị thuộc tính class không phải là CSS identifier hợp lệ (ví dụ, `my?class` hoặc `1234`) thì nó phải được thoát trước khi dùng trong bộ chọn, bằng phương thức {{domxref("CSS.escape_static", "CSS.escape()")}} hoặc [thủ công](/en-US/docs/Web/CSS/Reference/Values/ident#escaping_characters).

Vì lý do này, khuyến nghị các nhà phát triển chọn các giá trị cho thuộc tính class là CSS identifiers hợp lệ không cần thoát.

## Mô tả

Các lớp cho phép CSS và JavaScript chọn và truy cập các phần tử cụ thể qua [bộ chọn lớp](/en-US/docs/Web/CSS/Reference/Selectors/Class_selectors) hoặc các hàm như {{domxref("document.getElementsByClassName()")}}.

Mặc dù đặc tả không đặt yêu cầu về tên của các lớp, các nhà phát triển web được khuyến khích dùng các tên mô tả mục đích ngữ nghĩa của phần tử, thay vì việc trình bày của phần tử. Ví dụ, _attribute_ để mô tả một thuộc tính thay vì _italics_, mặc dù phần tử của lớp này có thể được trình bày bằng _chữ nghiêng_. Tên ngữ nghĩa vẫn có logic ngay cả khi việc trình bày của trang thay đổi.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Tất cả [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).
- {{domxref('element.className')}}
- {{domxref('element.classList')}}
- [Introduction to CSS](/en-US/docs/Learn_web_development/Core/Styling_basics)
