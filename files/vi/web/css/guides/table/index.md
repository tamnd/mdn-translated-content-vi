---
title: CSS table
short-title: Table
slug: Web/CSS/Guides/Table
page-type: css-module
spec-urls: https://www.w3.org/TR/CSS22/tables.html
sidebar: cssref
---

Module **CSS table** giúp bạn định nghĩa cách bố cục dữ liệu bảng.

Module CSS này định nghĩa các style áp dụng cho phần tử HTML {{htmlelement("table")}}, được dùng để hiển thị dữ liệu dạng bảng. Theo mặc định, các bảng được hiển thị như một lưới hai chiều với các ô xếp thành các hàng và cột liên tiếp. Bố cục này được tạo ra từ cấu trúc của bảng và được định kích thước theo nội dung của các ô. Module này cũng cho phép định nghĩa vị trí của {{htmlelement("caption")}} trong bảng (nếu có).

Các thuộc tính được giới thiệu trong module này không giới hạn ở các phần tử `<table>`; chúng có thể được áp dụng cho bất kỳ phần tử nào có giá trị CSS {{cssxref("display")}} liên quan đến bảng.

## Tham chiếu

### Thuộc tính

- {{cssxref("border-collapse")}}
- {{cssxref("border-spacing")}}
- {{cssxref("caption-side")}}
- {{cssxref("empty-cells")}}
- {{cssxref("table-layout")}}

## Hướng dẫn

- [Learn: Styling tables](/en-US/docs/Learn_web_development/Core/Styling_basics/Tables)
  - : Hướng dẫn cải thiện giao diện của các bảng HTML, bao gồm các kỹ thuật tạo kiểu cho bảng.

- [Learn: HTML table basics](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_table_basics)
  - : Giới thiệu về bảng HTML, bao gồm HTML để tạo các hàng và ô, tiêu đề, và làm cho các ô span qua nhiều cột và hàng.

- [Learn: HTML table accessibility](/en-US/docs/Learn_web_development/Core/Structuring_content/Table_accessibility)
  - : Xem xét các tính năng bảng HTML nâng cao, bao gồm caption và nhóm các hàng bảng vào các phần table head, body và footer — cũng như xem xét khả năng truy cập của bảng cho người dùng khiếm thị.

## Khái niệm liên quan

- Thuộc tính {{cssxref("display")}}
- Thuộc tính {{cssxref("vertical-align")}}
- Thuộc tính {{cssxref("text-align")}}

- Module [CSS box sizing](/en-US/docs/Web/CSS/Guides/Box_sizing)
  - {{cssxref("box-sizing")}}
  - {{cssxref("height")}}
  - {{cssxref("max-width")}}
  - {{cssxref("min-height")}}
  - {{cssxref("min-width")}}
  - {{cssxref("width")}}
  - Từ khóa {{cssxref("min-content")}}

- Module [CSS backgrounds and borders](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders)
  - Shorthand {{cssxref("border")}}
  - {{cssxref("border-width")}}
  - {{cssxref("border-style")}}
  - {{cssxref("border-color")}}

- Các phần tử HTML liên quan đến bảng:
  - {{htmlelement("table")}}
  - {{htmlelement("caption")}}
  - {{htmlelement("colgroup")}}
  - {{htmlelement("col")}}
  - {{htmlelement("thead")}}
  - {{htmlelement("tbody")}}
  - {{htmlelement("tfoot")}}
  - {{htmlelement("tr")}}
  - {{htmlelement("th")}}
  - {{htmlelement("td")}}

## Đặc tả

{{Specifications}}

> [!NOTE]
> Đặc tả CSS 2.2 định nghĩa các tiêu chuẩn ổn định cho việc tạo kiểu web, bao gồm các đặc tả chi tiết cho định dạng bảng. Đặc tả [CSS Table Module Level 3](https://drafts.csswg.org/css-tables-3/) tìm cách mở rộng các khả năng này với các tính năng nâng cao cho bố cục và hiển thị bảng. Tuy nhiên, đặc tả module table vẫn đang được phát triển và chưa sẵn sàng để triển khai.

## Xem thêm

- Module [CSS display](/en-US/docs/Web/CSS/Guides/Display)
- Module [CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout)
- Module [CSS flexible box layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout)
- Module [CSS fragmentation](/en-US/docs/Web/CSS/Guides/Fragmentation)
