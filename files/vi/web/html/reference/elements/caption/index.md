---
title: "<caption>: Phần tử Chú thích Bảng"
slug: Web/HTML/Reference/Elements/caption
page-type: html-element
browser-compat: html.elements.caption
sidebar: htmlsidebar
---

Phần tử **`<caption>`** trong [HTML](/vi/docs/Web/HTML) xác định chú thích (hoặc tiêu đề) của một bảng, cung cấp cho bảng một {{glossary("accessible name")}} hoặc {{glossary("accessible description")}}.

{{InteractiveExample("HTML Demo: &lt;caption&gt;", "tabbed-taller")}}

```html interactive-example
<table>
  <caption>
    He-Man and Skeletor facts
  </caption>
  <tbody>
    <tr>
      <td></td>
      <th scope="col" class="heman">He-Man</th>
      <th scope="col" class="skeletor">Skeletor</th>
    </tr>
    <tr>
      <th scope="row">Role</th>
      <td>Hero</td>
      <td>Villain</td>
    </tr>
    <tr>
      <th scope="row">Weapon</th>
      <td>Power Sword</td>
      <td>Havoc Staff</td>
    </tr>
    <tr>
      <th scope="row">Dark secret</th>
      <td>Expert florist</td>
      <td>Cries at romcoms</td>
    </tr>
  </tbody>
</table>
```

```css interactive-example
caption {
  caption-side: bottom;
  padding: 10px;
  font-weight: bold;
}

table {
  border-collapse: collapse;
  border: 2px solid rgb(140 140 140);
  font-family: sans-serif;
  font-size: 0.8rem;
  letter-spacing: 1px;
}

th,
td {
  border: 1px solid rgb(160 160 160);
  padding: 8px 10px;
}

th {
  background-color: rgb(230 230 230);
}

td {
  text-align: center;
}

tr:nth-child(even) td {
  background-color: rgb(250 250 250);
}

tr:nth-child(odd) td {
  background-color: rgb(240 240 240);
}

.heman {
  font:
    1.4rem "molot",
    sans-serif;
  text-shadow:
    1px 1px 1px white,
    2px 2px 1px black;
}

.skeletor {
  font:
    1.7rem "rapscallion",
    fantasy;
  letter-spacing: 3px;
  text-shadow:
    1px 1px 0 white,
    0 0 9px black;
}
```

## Thuộc tính

Phần tử này bao gồm các [thuộc tính toàn cục](/vi/docs/Web/HTML/Reference/Global_attributes).

### Thuộc tính không còn dùng

Các thuộc tính sau đây đã không còn được dùng và không nên sử dụng. Chúng được ghi lại dưới đây để tham khảo khi cập nhật code hiện có và chỉ vì lý do lịch sử.

- `align` {{deprecated_inline}}
  - : Xác định phía nào của bảng mà chú thích sẽ được hiển thị. Các giá trị {{Glossary("enumerated", "liệt kê")}} có thể là `left`, `top`, `right` hoặc `bottom`. Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("caption-side")}} và {{cssxref("text-align")}}, vì thuộc tính này đã không còn được dùng.

## Ghi chú sử dụng

- Nếu được bao gồm, phần tử `<caption>` phải là con đầu tiên của phần tử {{htmlelement("table")}} cha của nó.
- Khi một `<table>` được lồng bên trong {{HTMLElement("figure")}} như nội dung duy nhất của figure, nó nên được chú thích qua {{HTMLElement("figcaption")}} cho `<figure>` thay vì như một `<caption>` lồng trong `<table>`.
- Bất kỳ {{cssxref("background-color")}} nào được áp dụng cho bảng sẽ không được áp dụng cho chú thích. Thêm `background-color` vào phần tử `<caption>` nếu bạn muốn cùng màu nền cho cả hai.

## Ví dụ

Xem {{HTMLElement("table")}} để biết ví dụ bảng đầy đủ giới thiệu các chuẩn và thực hành phổ biến.

### Bảng có chú thích

Ví dụ này minh họa một bảng cơ bản có chú thích mô tả dữ liệu được trình bày.

"Tiêu đề" như vậy rất hữu ích cho người dùng đang xem nhanh trang, và đặc biệt có lợi cho người dùng khiếm thị, cho phép họ xác định nhanh mức độ liên quan của bảng mà không cần trình đọc màn hình đọc nội dung của nhiều ô.

#### HTML

Phần tử `<caption>` được sử dụng như con đầu tiên của {{HTMLElement("table")}}, với nội dung văn bản tương tự tiêu đề để mô tả dữ liệu bảng. Ba hàng, hàng đầu là hàng tiêu đề, với hai cột được tạo bằng các phần tử {{HTMLElement("tr")}}, {{HTMLElement("th")}} và {{HTMLElement("td")}} sau `<caption>`.

```html
<table>
  <caption>
    User login email addresses
  </caption>
  <thead>
    <tr>
      <th>Login</th>
      <th>Email</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>user1</td>
      <td>user1@example.com</td>
    </tr>
    <tr>
      <td>user2</td>
      <td>user2@example.com</td>
    </tr>
  </tbody>
</table>
```

#### CSS

Một số CSS cơ bản được sử dụng để căn chỉnh và làm nổi bật `<caption>`.

```css
caption {
  caption-side: top;
  text-align: left;
  padding-bottom: 10px;
  font-weight: bold;
}
```

```css hidden
table {
  border-collapse: collapse;
  border: 2px solid rgb(140 140 140);
  font-family: sans-serif;
  font-size: 0.8rem;
  letter-spacing: 1px;
}

th,
td {
  border: 1px solid rgb(160 160 160);
  padding: 8px 10px;
}

th {
  background-color: rgb(230 230 230);
}

td {
  text-align: center;
}
```

#### Kết quả

{{EmbedLiveSample('Example', 650, 140)}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/vi/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>Không có.</td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a href="/vi/docs/Web/HTML/Guides/Content_categories#flow_content"
          >Nội dung luồng</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>
        Thẻ đóng có thể bị bỏ qua nếu phần tử không được theo sau ngay bởi
        khoảng trắng ASCII hoặc comment.
      </td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Phần tử {{HTMLElement("table")}}, là con đầu tiên của nó.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles#structural_roles_with_html_equivalents">caption</a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Không có <code>role</code> nào được phép</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLTableCaptionElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Học: Kiến thức cơ bản về bảng HTML](/vi/docs/Learn_web_development/Core/Structuring_content/HTML_table_basics)
- {{HTMLElement("col")}}, {{HTMLElement("colgroup")}}, {{HTMLElement("table")}}, {{HTMLElement("tbody")}}, {{HTMLElement("td")}}, {{HTMLElement("tfoot")}}, {{HTMLElement("th")}}, {{HTMLElement("thead")}}, {{HTMLElement("tr")}}: Các phần tử liên quan đến bảng khác
- {{cssxref("caption-side")}}: Thuộc tính CSS để định vị `<caption>` so với {{HTMLElement("table")}} cha của nó
- {{cssxref("text-align")}}: Thuộc tính CSS để căn chỉnh ngang nội dung văn bản của `<caption>`
