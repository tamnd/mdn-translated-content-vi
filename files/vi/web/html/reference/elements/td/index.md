---
title: "<td>: The Table Data Cell element"
slug: Web/HTML/Reference/Elements/td
page-type: html-element
browser-compat: html.elements.td
sidebar: htmlsidebar
---

Phần tử **`<td>`** trong [HTML](/en-US/docs/Web/HTML) xác định một ô của bảng chứa dữ liệu và có thể được sử dụng làm con của phần tử {{HTMLElement("tr")}}.

{{InteractiveExample("HTML Demo: &lt;td&gt;", "tabbed-taller")}}

```html interactive-example
<table>
  <caption>
    Alien football stars
  </caption>
  <thead>
    <tr>
      <th scope="col">Player</th>
      <th scope="col">Gloobles</th>
      <th scope="col">Za'taak</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">TR-7</th>
      <td>7</td>
      <td>4,569</td>
    </tr>
    <tr>
      <th scope="row">Khiresh Odo</th>
      <td>7</td>
      <td>7,223</td>
    </tr>
    <tr>
      <th scope="row">Mia Oolong</th>
      <td>9</td>
      <td>6,219</td>
    </tr>
  </tbody>
</table>
```

```css interactive-example
th,
td {
  border: 1px solid rgb(160 160 160);
  padding: 8px 10px;
}

th[scope="col"] {
  background-color: #505050;
  color: white;
}

th[scope="row"] {
  background-color: #d6ecd4;
}

td {
  text-align: center;
}

tr:nth-of-type(even) {
  background-color: #eeeeee;
}

table {
  border-collapse: collapse;
  border: 2px solid rgb(140 140 140);
  font-family: sans-serif;
  font-size: 0.8rem;
  letter-spacing: 1px;
}

caption {
  caption-side: bottom;
  padding: 10px;
}
```

## Thuộc tính

Phần tử này bao gồm [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `colspan`
  - : Chứa giá trị số nguyên không âm cho biết ô dữ liệu trải rộng hoặc mở rộng qua bao nhiêu cột. Giá trị mặc định là `1`. Tác nhân người dùng bỏ qua các giá trị cao hơn 1000 là không chính xác, đặt lại về giá trị mặc định (`1`).
- `headers`
  - : Chứa danh sách các chuỗi cách nhau bằng dấu cách, mỗi chuỗi tương ứng với thuộc tính `id` của các phần tử {{HTMLElement("th")}} cung cấp tiêu đề cho ô bảng này.
- `rowspan`
  - : Chứa giá trị số nguyên không âm cho biết ô dữ liệu trải rộng hoặc mở rộng qua bao nhiêu hàng. Giá trị mặc định là `1`; nếu giá trị được đặt thành `0`, nó mở rộng đến cuối phần nhóm bảng ({{HTMLElement("thead")}}, {{HTMLElement("tbody")}}, {{HTMLElement("tfoot")}}, kể cả khi được định nghĩa ngầm), mà ô thuộc về. Các giá trị cao hơn `65534` bị cắt xuống `65534`.

### Thuộc tính không còn dùng

Các thuộc tính sau đây đã không còn được dùng và không nên sử dụng. Chúng được ghi lại dưới đây để tham khảo khi cập nhật code hiện có và chỉ vì lý do lịch sử.

- `abbr` {{deprecated_inline}}
  - : Chứa mô tả viết tắt ngắn về nội dung của ô dữ liệu. Một số tác nhân người dùng, như trình đọc giọng nói, có thể trình bày mô tả này trước nội dung chính. Hãy đặt nội dung viết tắt trong ô và đặt mô tả (dài hơn) trong thuộc tính [`title`](/en-US/docs/Web/HTML/Reference/Global_attributes/title), vì thuộc tính này đã không còn được dùng. Hoặc tốt hơn, hãy bao gồm nội dung trong ô dữ liệu và sử dụng CSS để [cắt ngắn văn bản bị tràn theo chiều nhìn](/en-US/docs/Web/CSS/Reference/Properties/text-overflow).

- `align` {{deprecated_inline}}
  - : Xác định căn chỉnh ngang của ô dữ liệu. Các giá trị {{Glossary("enumerated")}} có thể là `left`, `center`, `right`, `justify` và `char`. Khi được hỗ trợ, giá trị `char` căn chỉnh nội dung văn bản theo ký tự được định nghĩa trong thuộc tính [`char`](#char) và độ lệch được định nghĩa bởi thuộc tính [`charoff`](#charoff). Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("text-align")}}, vì thuộc tính này đã không còn được dùng.

- `axis` {{deprecated_inline}}
  - : Chứa danh sách các chuỗi cách nhau bằng dấu cách, mỗi chuỗi tương ứng với thuộc tính `id` của nhóm ô mà ô dữ liệu áp dụng cho.

- `bgcolor` {{deprecated_inline}}
  - : Xác định màu nền của ô dữ liệu. Giá trị là màu HTML; có thể là [mã RGB thập lục phân 6 chữ số](/en-US/docs/Web/CSS/Reference/Values/hex-color), có tiền tố `#`, hoặc một [từ khóa màu](/en-US/docs/Web/CSS/Reference/Values/named-color). Các giá trị CSS {{cssxref("&lt;color&gt;")}} khác không được hỗ trợ. Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("background-color")}}, vì thuộc tính này đã không còn được dùng.

- `char` {{deprecated_inline}}
  - : Không có tác dụng. Ban đầu được dùng để xác định căn chỉnh nội dung theo một ký tự của ô dữ liệu. Các giá trị điển hình bao gồm dấu chấm (`.`) khi muốn căn chỉnh số hoặc giá trị tiền tệ. Nếu [`align`](#align) không được đặt thành `char`, thuộc tính này bị bỏ qua.

- `charoff` {{deprecated_inline}}
  - : Không có tác dụng. Ban đầu được dùng để xác định số ký tự để bù đầu nội dung ô dữ liệu từ ký tự căn chỉnh được xác định bởi thuộc tính [`char`](#char).

- `height` {{deprecated_inline}}
  - : Xác định chiều cao ô dữ liệu được khuyến nghị. Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("height")}}, vì thuộc tính này đã không còn được dùng.

- `scope` {{deprecated_inline}}
  - : Xác định các ô mà phần tử tiêu đề (được xác định trong {{HTMLElement("th")}}) liên quan đến. Các giá trị {{Glossary("enumerated")}} có thể là `row`, `col`, `rowgroup` và `colgroup`. Chỉ sử dụng thuộc tính này với phần tử {{HTMLElement("th")}} để xác định hàng hoặc cột mà nó là tiêu đề, vì thuộc tính này đã không còn được dùng cho phần tử `<td>`.

- `valign` {{deprecated_inline}}
  - : Xác định căn chỉnh dọc của ô dữ liệu. Các giá trị {{Glossary("enumerated")}} có thể là `baseline`, `bottom`, `middle` và `top`. Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("vertical-align")}}, vì thuộc tính này đã không còn được dùng.

- `width` {{deprecated_inline}}
  - : Xác định chiều rộng ô dữ liệu được khuyến nghị. Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("width")}}, vì thuộc tính này đã không còn được dùng.

## Ghi chú sử dụng

- `<td>` chỉ có thể được sử dụng trong phần tử {{HTMLElement("tr")}}.
- Khi sử dụng các thuộc tính [`colspan`](#colspan) và [`rowspan`](#rowspan) để trải rộng các ô dữ liệu qua nhiều cột và hàng, các ô không có các thuộc tính này được xác định (với giá trị mặc định là `1`) được tự động khớp vào các khoảng trống có sẵn trong cấu trúc bảng trải rộng các ô 1x1, như được minh họa trong hình sau:

  ![Illustration demonstrating column and row spanning of table cells: cells 1, 3, and 4 spanning two rows; cell 2 spanning two columns; cells 5 and 6 fitting into the available cells that are the second and third columns in the second row](/shared-assets/images/diagrams/html/table/column-row-span.png)

  > [!NOTE]
  > Các thuộc tính này không được sử dụng để chồng lên các ô.

## Ví dụ

Xem {{HTMLElement("table")}} để biết ví dụ bảng đầy đủ giới thiệu các chuẩn và thực hành phổ biến.

### Các ô dữ liệu cơ bản

Ví dụ này sử dụng các phần tử `<td>` cùng với các phần tử liên quan đến bảng khác để giới thiệu bảng cơ bản với dữ liệu về bảng chữ cái ngữ âm.

#### HTML

Một số hàng bảng (phần tử {{HTMLElement("tr")}}) chứa cả ô tiêu đề (phần tử {{HTMLElement("th")}}) và ô dữ liệu `<td>`. Phần tử {{HTMLElement("th")}} là con đầu tiên của mỗi hàng tạo thành cột đầu tiên của bảng, với mỗi `<th>` cung cấp tiêu đề hàng cho các ô dữ liệu trong hàng đó. Mỗi phần tử `<td>` tương ứng chứa dữ liệu được căn chỉnh với tiêu đề cột và ô tiêu đề hàng tương ứng.

> [!NOTE]
> Thông thường, một nhóm đầu bảng với các tiêu đề cột sẽ được triển khai để dễ hiểu thông tin trong các cột hơn. Các phần tử {{HTMLElement("thead")}} và {{HTMLElement("tbody")}} sẽ được sử dụng để nhóm các hàng tiêu đề và dữ liệu vào các phần đầu và thân tương ứng của bảng. Điều này không được triển khai trong ví dụ này để tập trung vào các ô dữ liệu và giảm độ phức tạp của ví dụ.

```html
<table>
  <tr>
    <th scope="row">A</th>
    <td>Alfa</td>
    <td>AL fah</td>
  </tr>
  <tr>
    <th scope="row">B</th>
    <td>Bravo</td>
    <td>BRAH voh</td>
  </tr>
  <tr>
    <th scope="row">C</th>
    <td>Charlie</td>
    <td>CHAR lee</td>
  </tr>
  <tr>
    <th scope="row">D</th>
    <td>Delta</td>
    <td>DELL tah</td>
  </tr>
</table>
```

#### CSS

Một số CSS cơ bản được sử dụng để tạo kiểu bảng và các ô của nó. [Bộ chọn thuộc tính](/en-US/docs/Web/CSS/Reference/Selectors/Attribute_selectors) CSS và pseudo-class {{cssxref(":nth-of-type")}} được sử dụng để xen kẽ giao diện của các ô để làm cho thông tin trong bảng dễ hiểu và nhận biết hơn.

```css
td,
th {
  border: 1px solid rgb(160 160 160);
  padding: 8px 10px;
}

tr:nth-of-type(odd) td {
  background-color: #eeeeee;
}

tr th[scope="row"] {
  background-color: #d6ecd4;
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
```

#### Kết quả

{{EmbedLiveSample("Basic_data_cells", 650, 140)}}

### Trải rộng cột và hàng

Ví dụ này mở rộng và nâng cao bảng cơ bản từ [ví dụ trước](#basic_data_cells) bằng cách thêm ô "ABC" bổ sung.

#### HTML

Một ô dữ liệu bổ sung (phần tử `<td>`) được giới thiệu trong hàng đầu tiên (phần tử {{HTMLElement("tr")}}). Điều này tạo ra cột thứ tư trong bảng.

Sử dụng thuộc tính [`rowspan`](#rowspan), ô "ABC" được trải rộng qua ba hàng đầu tiên của bảng. Các ô dữ liệu cuối cùng của các hàng tiếp theo mỗi ô trải rộng hai cột. Điều này được thực hiện bằng thuộc tính [`colspan`](#colspan), căn chỉnh chúng đúng trong cấu trúc bảng. Lưu ý rằng một hàng bổ sung (phần tử {{HTMLElement("tr")}}) được thêm vào bảng để minh họa điều này.

```html
<table>
  <tr>
    <th scope="row">A</th>
    <td>Alfa</td>
    <td>AL fah</td>
    <td rowspan="3">ABC</td>
  </tr>
  <tr>
    <th scope="row">B</th>
    <td>Bravo</td>
    <td>BRAH voh</td>
  </tr>
  <tr>
    <th scope="row">C</th>
    <td>Charlie</td>
    <td>CHAR lee</td>
  </tr>
  <tr>
    <th scope="row">D</th>
    <td>Delta</td>
    <td colspan="2">DELL tah</td>
  </tr>
  <tr>
    <th scope="row">E</th>
    <td>Echo</td>
    <td colspan="2">ECK oh</td>
  </tr>
</table>
```

#### CSS

Các pseudo-class {{cssxref(":first-of-type")}} và {{cssxref(":last-of-type")}} được sử dụng trong CSS để chọn và tạo kiểu ô dữ liệu "ABC" đã thêm.

```css
tr:first-of-type td:last-of-type {
  width: 60px;
  background-color: #505050;
  color: white;
  font-weight: bold;
  text-align: center;
}

td,
th {
  border: 1px solid rgb(160 160 160);
  padding: 8px 10px;
}

tr:nth-of-type(odd) td {
  background-color: #eeeeee;
}

tr th[scope="row"] {
  background-color: #d6ecd4;
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
```

#### Kết quả

{{EmbedLiveSample("Column_and_row_spanning", 650, 170)}}

### Liên kết các ô dữ liệu với các ô tiêu đề

Đối với các mối quan hệ phức tạp hơn giữa các ô dữ liệu (phần tử `<td>`) và các ô tiêu đề (phần tử {{HTMLElement("th")}}), việc chỉ sử dụng các phần tử {{HTMLElement("th")}} với thuộc tính [`scope`](/en-US/docs/Web/HTML/Reference/Elements/th#scope) có thể không đủ cho công nghệ hỗ trợ, đặc biệt là trình đọc màn hình.

#### HTML

Để cải thiện {{Glossary("accessibility", "khả năng tiếp cận")}} của [ví dụ trước](#column_and_row_spanning) và cho phép trình đọc màn hình, ví dụ, đọc các tiêu đề liên kết với mỗi ô dữ liệu, thuộc tính [`headers`](#headers) có thể được giới thiệu cùng với các thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id). Mỗi ô tiêu đề hàng (phần tử {{HTMLElement("th")}}) liên kết với ô dữ liệu "ABC", tức là các chữ "A", "B" và "C", được cung cấp định danh duy nhất bằng thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id). Ô dữ liệu "ABC" (phần tử `<td>`) sau đó sử dụng các giá trị `id` này trong danh sách cách nhau bằng dấu cách cho thuộc tính [`headers`](#headers).

> [!NOTE]
> Nên sử dụng các giá trị mô tả và hữu ích hơn cho thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id). Mỗi `id` trong tài liệu phải là duy nhất trong tài liệu đó. Trong ví dụ này, các giá trị `id` là các ký tự đơn để duy trì tập trung vào khái niệm thuộc tính [`headers`](#headers).

```html
<table>
  <tr>
    <th id="a" scope="row">A</th>
    <td>Alfa</td>
    <td>AL fah</td>
    <td headers="a b c" rowspan="3">ABC</td>
  </tr>
  <tr>
    <th id="b" scope="row">B</th>
    <td>Bravo</td>
    <td>BRAH voh</td>
  </tr>
  <tr>
    <th id="c" scope="row">C</th>
    <td>Charlie</td>
    <td>CHAR lee</td>
  </tr>
  <tr>
    <th scope="row">D</th>
    <td>Delta</td>
    <td colspan="2">DELL tah</td>
  </tr>
  <tr>
    <th scope="row">E</th>
    <td>Echo</td>
    <td colspan="2">ECK oh</td>
  </tr>
</table>
```

#### Kết quả

Trong khi [kết quả trực quan](#result_2) không thay đổi so với [bảng ví dụ trước](#column_and_row_spanning), mỗi ô dữ liệu (`<td>`) hiện được liên kết rõ ràng với ô tiêu đề hàng (`<th>`) của nó.

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>Gốc phân mục.</td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >Nội dung luồng</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>
        Thẻ mở là bắt buộc.<br />Thẻ đóng có thể bị bỏ qua nếu nó
        được theo sau ngay bởi phần tử {{HTMLElement("th")}} hoặc
        <code>&lt;td&gt;</code> hoặc nếu không còn dữ liệu nào trong phần tử cha.
      </td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>Phần tử {{HTMLElement("tr")}}.</td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/cell_role"
            >cell</a
          ></code
        >
        nếu là con của phần tử {{HTMLElement("table")}}, hoặc <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role"
            >gridcell</a
          ></code
        >
        nếu là con của phần tử có vai trò <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/grid_role"
            >grid</a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Bất kỳ</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLTableCellElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Học: Kiến thức cơ bản về bảng HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_table_basics)
- {{HTMLElement("caption")}}, {{HTMLElement("col")}}, {{HTMLElement("colgroup")}}, {{HTMLElement("table")}}, {{HTMLElement("tbody")}}, {{HTMLElement("tfoot")}}, {{HTMLElement("th")}}, {{HTMLElement("thead")}}, {{HTMLElement("tr")}}: Các phần tử liên quan đến bảng khác
- {{cssxref("background-color")}}: Thuộc tính CSS để đặt màu nền của mỗi ô dữ liệu
- {{cssxref("border")}}: Thuộc tính CSS để kiểm soát đường viền của các ô dữ liệu
- {{cssxref("height")}}: Thuộc tính CSS để kiểm soát chiều cao ô dữ liệu được khuyến nghị
- {{cssxref("text-align")}}: Thuộc tính CSS để căn chỉnh ngang nội dung mỗi ô dữ liệu
- {{cssxref("vertical-align")}}: Thuộc tính CSS để căn chỉnh dọc nội dung mỗi ô dữ liệu
- {{cssxref("width")}}: Thuộc tính CSS để kiểm soát chiều rộng ô dữ liệu được khuyến nghị
- {{cssxref(":nth-of-type")}}, {{cssxref(":first-of-type")}}, {{cssxref(":last-of-type")}}: Các pseudo-class CSS để chọn các ô dữ liệu mong muốn
