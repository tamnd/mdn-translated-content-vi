---
title: <string>
slug: Web/CSS/Reference/Values/string
page-type: css-type
browser-compat: css.types.string
sidebar: cssref
---

Kiểu dữ liệu **`<string>`** [CSS](/vi/docs/Web/CSS) [data type](/vi/docs/Web/CSS/Reference/Values/Data_types) biểu diễn một chuỗi ký tự. Chuỗi được sử dụng trong nhiều thuộc tính CSS, chẳng hạn như {{CSSxRef("content")}}, {{CSSxRef("font-family")}} và {{CSSxRef("quotes")}}.

## Cú pháp

Kiểu dữ liệu `<string>` bao gồm bất kỳ số lượng ký tự [Unicode](https://en.wikipedia.org/wiki/Unicode) nào được bao quanh bởi dấu nháy kép (`"`) hoặc dấu nháy đơn (`'`).

Hầu hết các ký tự có thể được biểu diễn trực tiếp. Tất cả các ký tự cũng có thể được biểu diễn bằng [điểm mã Unicode](https://en.wikipedia.org/wiki/Unicode#Code_point_planes_and_blocks) tương ứng dưới dạng thập lục phân, trong trường hợp đó chúng được đặt trước bởi dấu gạch chéo ngược (`\`). Ví dụ, `\22` biểu diễn dấu nháy kép, `\27` là dấu nháy đơn (`'`) và `\A9` là ký hiệu bản quyền (`©`).

Quan trọng là, một số ký tự vốn không hợp lệ có thể được thoát bằng dấu gạch chéo ngược. Bao gồm dấu nháy kép khi dùng bên trong chuỗi nháy kép, dấu nháy đơn khi dùng bên trong chuỗi nháy đơn, và bản thân dấu gạch chéo ngược. Ví dụ, `\\` sẽ tạo ra một dấu gạch chéo ngược đơn.

Để xuất ra dòng mới, bạn phải thoát chúng bằng ký tự xuống dòng như `\A` hoặc `\00000A`. Tuy nhiên trong code, chuỗi có thể trải dài nhiều dòng, trong đó mỗi dòng mới phải được thoát bằng `\` ở cuối dòng.

Tuy nhiên, để nhận được dòng mới, bạn cũng phải đặt thuộc tính {{cssxref("white-space")}} thành giá trị phù hợp.

> [!NOTE]
> {{glossary("character reference", "Tham chiếu ký tự")}} (chẳng hạn như `&nbsp;` hoặc `&#8212;`) không thể được dùng trong `<string>` CSS.

## Ví dụ

### Ví dụ về chuỗi hợp lệ

```css
/* Chuỗi cơ bản */
"This string is demarcated by double quotes."
'This string is demarcated by single quotes.'

/* Thoát ký tự */
"This is a string with \" an escaped double quote."
"This string also has \22 an escaped double quote."
'This is a string with \' an escaped single quote.'
'This string also has \27 an escaped single quote.'
"This is a string with \\ an escaped backslash."

/* Dòng mới trong chuỗi */
"This string has a \Aline break in it."

/* Chuỗi trải dài hai dòng code (hai chuỗi này sẽ có đầu ra giống hệt nhau) */
"A really long \
awesome string"
"A really long awesome string"
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [CSS values and units](/vi/docs/Web/CSS/Guides/Values_and_units) module
- [CSS basic data types](/vi/docs/Web/CSS/Reference/Values/Data_types)
- [Introduction to CSS: Values and units](/vi/docs/Learn_web_development/Core/Styling_basics/Values_and_units)
