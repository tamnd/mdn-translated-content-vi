---
title: "<thead>: Phần tử Đầu Bảng"
slug: Web/HTML/Reference/Elements/thead
page-type: html-element
browser-compat: html.elements.thead
sidebar: htmlsidebar
---

Phần tử **`<thead>`** trong [HTML](/vi/docs/Web/HTML) bao gồm một tập hợp các hàng bảng (phần tử {{HTMLElement("tr")}}), cho biết chúng tạo thành đầu của bảng với thông tin về các cột của bảng. Điều này thường ở dạng tiêu đề cột (phần tử {{HTMLElement("th")}}).

{{InteractiveExample("HTML Demo: &lt;thead&gt;", "tabbed-taller")}}

```html interactive-example
<table>
  <caption>
    Council budget (in £) 2018
  </caption>
  <thead>
    <tr>
      <th scope="col">Items</th>
      <th scope="col">Expenditure</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">Donuts</th>
      <td>3,000</td>
    </tr>
    <tr>
      <th scope="row">Stationery</th>
      <td>18,000</td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <th scope="row">Totals</th>
      <td>21,000</td>
    </tr>
  </tfoot>
</table>
```

```css interactive-example
thead,
tfoot {
  background-color: #2c5e77;
  color: white;
}

tbody {
  background-color: #e4f0f5;
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

th,
td {
  border: 1px solid rgb(160 160 160);
  padding: 8px 10px;
}

td {
  text-align: center;
}
```

## Thuộc tính

Phần tử này bao gồm các [thuộc tính toàn cục](/vi/docs/Web/HTML/Reference/Global_attributes).

### Thuộc tính không còn dùng

Các thuộc tính sau đây đã không còn được dùng và không nên sử dụng. Chúng được ghi lại dưới đây để tham khảo khi cập nhật code hiện có và chỉ vì lý do lịch sử.

- `align` {{deprecated_inline}}
  - : Xác định căn chỉnh ngang của mỗi ô đầu. Các giá trị {{Glossary("enumerated")}} có thể là `left`, `center`, `right`, `justify` và `char`. Khi được hỗ trợ, giá trị `char` căn chỉnh nội dung văn bản theo ký tự được định nghĩa trong thuộc tính [`char`](#char) và độ lệch được định nghĩa bởi thuộc tính [`charoff`](#charoff). Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("text-align")}}, vì thuộc tính này đã không còn được dùng.

- `bgcolor` {{deprecated_inline}}
  - : Xác định màu nền của mỗi ô đầu. Giá trị là màu HTML; có thể là [mã RGB thập lục phân 6 chữ số](/vi/docs/Web/CSS/Reference/Values/hex-color), có tiền tố `#`, hoặc một [từ khóa màu](/vi/docs/Web/CSS/Reference/Values/named-color). Các giá trị CSS {{cssxref("&lt;color&gt;")}} khác không được hỗ trợ. Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("background-color")}}, vì thuộc tính này đã không còn được dùng.

- `char` {{deprecated_inline}}
  - : Không có tác dụng. Ban đầu được dùng để xác định căn chỉnh nội dung theo một ký tự của mỗi ô đầu. Nếu [`align`](#align) không được đặt thành `char`, thuộc tính này bị bỏ qua.

- `charoff` {{deprecated_inline}}
  - : Không có tác dụng. Ban đầu được dùng để xác định số ký tự để bù đầu nội dung ô đầu từ ký tự căn chỉnh được xác định bởi thuộc tính [`char`](#char).

- `valign` {{deprecated_inline}}
  - : Xác định căn chỉnh dọc của mỗi ô đầu. Các giá trị {{Glossary("enumerated")}} có thể là `baseline`, `bottom`, `middle` và `top`. Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("vertical-align")}}, vì thuộc tính này đã không còn được dùng.

## Ghi chú sử dụng

- `<thead>` được đặt sau bất kỳ phần tử {{HTMLElement("caption")}} và {{HTMLElement("colgroup")}} nào, nhưng trước bất kỳ phần tử {{HTMLElement("tbody")}}, {{HTMLElement("tfoot")}} và {{HTMLElement("tr")}} nào.
- Cùng với các phần tử {{HTMLElement("tbody")}} và {{HTMLElement("tfoot")}} liên quan, phần tử `<thead>` cung cấp thông tin {{Glossary("semantics", "ngữ nghĩa")}} hữu ích và có thể được sử dụng khi hiển thị cho màn hình hoặc in ấn. Việc chỉ định các nhóm nội dung bảng như vậy cũng cung cấp thông tin ngữ cảnh có giá trị cho công nghệ hỗ trợ, bao gồm trình đọc màn hình và công cụ tìm kiếm.
- Khi in tài liệu, trong trường hợp bảng nhiều trang, đầu bảng thường xác định thông tin vẫn giống nhau trên mỗi trang.

## Ví dụ

Xem {{HTMLElement("table")}} để biết ví dụ bảng đầy đủ giới thiệu các chuẩn và thực hành phổ biến.

### Cấu trúc đầu cơ bản

Ví dụ này minh họa một bảng được chia thành phần đầu với tiêu đề cột và phần thân với dữ liệu chính của bảng.

#### HTML

Các phần tử `<thead>` và {{HTMLElement("tbody")}} được sử dụng để cấu trúc các hàng bảng thành các phần {{Glossary("semantics", "ngữ nghĩa")}}. Phần tử `<thead>` biểu diễn phần đầu của bảng, chứa một hàng ({{HTMLElement("tr")}}) các ô tiêu đề cột ({{HTMLElement("th")}}).

```html
<table>
  <thead>
    <tr>
      <th>Student ID</th>
      <th>Name</th>
      <th>Major</th>
      <th>Credits</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>3741255</td>
      <td>Jones, Martha</td>
      <td>Computer Science</td>
      <td>240</td>
    </tr>
    <tr>
      <td>3971244</td>
      <td>Nim, Victor</td>
      <td>Russian Literature</td>
      <td>220</td>
    </tr>
    <tr>
      <td>4100332</td>
      <td>Petrov, Alexandra</td>
      <td>Astrophysics</td>
      <td>260</td>
    </tr>
  </tbody>
</table>
```

#### CSS

Một số CSS cơ bản được sử dụng để tạo kiểu và làm nổi bật đầu bảng để tiêu đề các cột nổi bật so với dữ liệu trong phần thân bảng.

```css
thead {
  border-bottom: 2px solid rgb(160 160 160);
  text-align: center;
  background-color: #2c5e77;
  color: white;
}

tbody {
  background-color: #e4f0f5;
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

tbody > tr > td:last-of-type {
  text-align: center;
}
```

#### Kết quả

{{EmbedLiveSample("Basic_head_structure", 650, 140)}}

### Nhiều hàng đầu

Ví dụ này minh họa một phần đầu bảng với hai hàng.

#### HTML

Chúng ta mở rộng markup bảng từ [ví dụ cơ bản](#basic_head_structure) trong ví dụ này bằng cách bao gồm hai hàng bảng ({{HTMLElement("tr")}}) trong phần tử `<thead>` tạo ra đầu bảng nhiều hàng. Chúng ta thêm một cột bổ sung, chia tên sinh viên thành tên và họ.

```html
<table>
  <thead>
    <tr>
      <th rowspan="2">Student ID</th>
      <th colspan="2">Student</th>
      <th rowspan="2">Major</th>
      <th rowspan="2">Credits</th>
    </tr>
    <tr>
      <th>First name</th>
      <th>Last name</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>3741255</td>
      <td>Martha</td>
      <td>Jones</td>
      <td>Computer Science</td>
      <td>240</td>
    </tr>
    <tr>
      <td>3971244</td>
      <td>Victor</td>
      <td>Nim</td>
      <td>Russian Literature</td>
      <td>220</td>
    </tr>
    <tr>
      <td>4100332</td>
      <td>Alexandra</td>
      <td>Petrov</td>
      <td>Astrophysics</td>
      <td>260</td>
    </tr>
  </tbody>
</table>
```

#### Trải rộng ô

Để liên kết và căn chỉnh các ô tiêu đề với đúng cột và hàng, các thuộc tính [`colspan`](/vi/docs/Web/HTML/Reference/Elements/th#colspan) và [`rowspan`](/vi/docs/Web/HTML/Reference/Elements/th#rowspan) được sử dụng trên các phần tử {{HTMLElement("th")}}. Các giá trị được đặt trong các thuộc tính này xác định số ô mà mỗi ô tiêu đề ({{HTMLElement("th")}}) trải rộng. Do cách các thuộc tính này được đặt, hai ô tiêu đề hàng thứ hai được căn chỉnh với các cột mà chúng đứng đầu. Mỗi ô trải rộng một hàng và một cột vì các giá trị mặc định cho các thuộc tính [`colspan`](/vi/docs/Web/HTML/Reference/Elements/th#colspan) và [`rowspan`](/vi/docs/Web/HTML/Reference/Elements/th#rowspan) đều là `1`.

Trải rộng cột và hàng được minh họa bởi ví dụ này được minh họa trong hình sau:

![Illustration demonstrating column and row spanning of table cells: cells 1, 3, and 4 spanning one column and two rows each; cell 2 spanning two columns and one row; cells 5 and 6 span a single row and column each, fitting into the available cells that are the second and third columns in the second row](/shared-assets/images/diagrams/html/table/column-row-span.png)

#### CSS

CSS không thay đổi so với [ví dụ trước](#basic_head_structure).

```css hidden
thead {
  border-bottom: 2px solid rgb(160 160 160);
  background-color: #2c5e77;
  color: white;
}

table {
  border-collapse: collapse;
  border: 2px solid rgb(140 140 140);
  font-family: sans-serif;
  font-size: 0.8rem;
  letter-spacing: 1px;
}

tbody {
  background-color: #e4f0f5;
}

th,
td {
  border: 1px solid rgb(160 160 160);
  padding: 8px 10px;
}

tbody > tr > td:last-of-type {
  text-align: center;
}
```

#### Kết quả

{{EmbedLiveSample("Multiple_head_rows", 650, 180)}}

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
      <td>Không hoặc nhiều phần tử {{HTMLElement("tr")}}.</td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>
        Thẻ mở là bắt buộc. Thẻ đóng có thể bị bỏ qua nếu
        phần tử <code>&lt;thead&gt;</code> được theo sau ngay bởi
        phần tử {{HTMLElement("tbody")}} hoặc {{HTMLElement("tfoot")}}.
      </td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Phần tử {{HTMLElement("table")}}. Phần tử
        <code>&lt;thead&gt;</code> phải xuất hiện sau bất kỳ
        phần tử {{HTMLElement("caption")}} và
        {{HTMLElement("colgroup")}} nào, kể cả khi được định nghĩa ngầm,
        nhưng trước bất kỳ phần tử {{HTMLElement("tbody")}},
        {{HTMLElement("tfoot")}} và {{HTMLElement("tr")}} nào.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowgroup_role"
            >rowgroup</a
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
      <td>{{domxref("HTMLTableSectionElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Học: Kiến thức cơ bản về bảng HTML](/vi/docs/Learn_web_development/Core/Structuring_content/HTML_table_basics)
- {{HTMLElement("caption")}}, {{HTMLElement("col")}}, {{HTMLElement("colgroup")}}, {{HTMLElement("table")}}, {{HTMLElement("tbody")}}, {{HTMLElement("td")}}, {{HTMLElement("tfoot")}}, {{HTMLElement("th")}}, {{HTMLElement("tr")}}: Các phần tử liên quan đến bảng khác
- {{cssxref("background-color")}}: Thuộc tính CSS để đặt màu nền của mỗi ô đầu
- {{cssxref("border")}}: Thuộc tính CSS để kiểm soát đường viền của các ô đầu
- {{cssxref("text-align")}}: Thuộc tính CSS để căn chỉnh ngang nội dung mỗi ô đầu
- {{cssxref("vertical-align")}}: Thuộc tính CSS để căn chỉnh dọc nội dung mỗi ô đầu
