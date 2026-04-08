---
title: "<tfoot>: Phần tử Chân Bảng"
slug: Web/HTML/Reference/Elements/tfoot
page-type: html-element
browser-compat: html.elements.tfoot
sidebar: htmlsidebar
---

Phần tử **`<tfoot>`** trong [HTML](/vi/docs/Web/HTML) bao gồm một tập hợp các hàng bảng (phần tử {{HTMLElement("tr")}}), cho biết chúng tạo thành chân của bảng với thông tin về các cột của bảng. Điều này thường là tóm tắt của các cột, ví dụ: tổng của các số trong một cột.

{{InteractiveExample("HTML Demo: &lt;tfoot&gt;", "tabbed-taller")}}

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
  - : Xác định căn chỉnh ngang của mỗi ô chân. Các giá trị {{Glossary("enumerated")}} có thể là `left`, `center`, `right`, `justify` và `char`. Khi được hỗ trợ, giá trị `char` căn chỉnh nội dung văn bản theo ký tự được định nghĩa trong thuộc tính [`char`](#char) và độ lệch được định nghĩa bởi thuộc tính [`charoff`](#charoff). Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("text-align")}}, vì thuộc tính này đã không còn được dùng.

- `bgcolor` {{deprecated_inline}}
  - : Xác định màu nền của mỗi ô chân. Giá trị là màu HTML; có thể là [mã RGB thập lục phân 6 chữ số](/vi/docs/Web/CSS/Reference/Values/hex-color), có tiền tố `#`, hoặc một [từ khóa màu](/vi/docs/Web/CSS/Reference/Values/named-color). Các giá trị CSS {{cssxref("&lt;color&gt;")}} khác không được hỗ trợ. Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("background-color")}}, vì thuộc tính này đã không còn được dùng.

- `char` {{deprecated_inline}}
  - : Không có tác dụng. Ban đầu được dùng để xác định căn chỉnh nội dung theo một ký tự của mỗi ô chân. Các giá trị điển hình bao gồm dấu chấm (`.`) khi muốn căn chỉnh số hoặc giá trị tiền tệ. Nếu [`align`](#align) không được đặt thành `char`, thuộc tính này bị bỏ qua.

- `charoff` {{deprecated_inline}}
  - : Không có tác dụng. Ban đầu được dùng để xác định số ký tự để bù đầu nội dung ô chân từ ký tự căn chỉnh được xác định bởi thuộc tính [`char`](#char).

- `valign` {{deprecated_inline}}
  - : Xác định căn chỉnh dọc của mỗi ô chân. Các giá trị {{Glossary("enumerated")}} có thể là `baseline`, `bottom`, `middle` và `top`. Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("vertical-align")}}, vì thuộc tính này đã không còn được dùng.

## Ghi chú sử dụng

- `<tfoot>` được đặt sau bất kỳ phần tử {{HTMLElement("caption")}}, {{HTMLElement("colgroup")}}, {{HTMLElement("thead")}}, {{HTMLElement("tbody")}} và {{HTMLElement("tr")}} nào.
- Cùng với các phần tử {{HTMLElement("thead")}} và {{HTMLElement("tbody")}} liên quan, phần tử `<tfoot>` cung cấp thông tin {{Glossary("semantics", "ngữ nghĩa")}} hữu ích và có thể được sử dụng khi hiển thị cho màn hình hoặc in ấn. Việc chỉ định các nhóm nội dung bảng như vậy cũng cung cấp thông tin ngữ cảnh có giá trị cho công nghệ hỗ trợ, bao gồm trình đọc màn hình và công cụ tìm kiếm.
- Khi in tài liệu, trong trường hợp bảng nhiều trang, chân bảng thường xác định thông tin được xuất ra như tóm tắt trung gian trên mỗi trang.

## Ví dụ

Xem {{HTMLElement("table")}} để biết ví dụ bảng đầy đủ giới thiệu các chuẩn và thực hành phổ biến.

### Bảng có chân

Ví dụ này minh họa một bảng được chia thành phần đầu với tiêu đề cột, phần thân với dữ liệu chính của bảng, và phần chân tóm tắt dữ liệu của một cột.

#### HTML

Các phần tử {{HTMLElement("thead")}}, {{HTMLElement("tbody")}} và `<tfoot>` được sử dụng để cấu trúc một bảng cơ bản thành các phần {{Glossary("semantics", "ngữ nghĩa")}}. Phần tử `<tfoot>` biểu diễn phần chân của bảng, chứa một hàng ({{HTMLElement("tr")}}) biểu diễn điểm trung bình được tính của các giá trị trong cột "Credits".

Để phân bổ các ô trong chân vào đúng cột, thuộc tính [`colspan`](/vi/docs/Web/HTML/Reference/Elements/th#colspan) được sử dụng trên phần tử {{HTMLElement("th")}} để trải rộng ô tiêu đề hàng qua ba cột bảng đầu tiên. Ô dữ liệu đơn lẻ ({{HTMLElement("td")}}) trong chân được tự động đặt ở đúng vị trí, tức là cột thứ tư, với giá trị thuộc tính [`colspan`](/vi/docs/Web/HTML/Reference/Elements/td#colspan) bị bỏ qua mặc định là `1`. Ngoài ra, thuộc tính [`scope`](/vi/docs/Web/HTML/Reference/Elements/th#scope) được đặt thành `row` trên ô tiêu đề ({{HTMLElement("th")}}) trong chân để xác định rõ ràng rằng ô tiêu đề chân này liên quan đến các ô bảng trong cùng hàng, là ô dữ liệu đơn lẻ trong hàng chân chứa điểm trung bình được tính.

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
  <tfoot>
    <tr>
      <th colspan="3" scope="row">Average Credits</th>
      <td>240</td>
    </tr>
  </tfoot>
</table>
```

#### CSS

Một số CSS cơ bản được sử dụng để tạo kiểu và làm nổi bật chân bảng để các ô chân nổi bật so với dữ liệu trong phần thân bảng.

```css
tfoot {
  border-top: 3px dotted rgb(160 160 160);
  background-color: #2c5e77;
  color: white;
}

tfoot th {
  text-align: right;
}

tfoot td {
  font-weight: bold;
}

thead {
  border-bottom: 2px solid rgb(160 160 160);
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

tr > td:last-of-type {
  text-align: center;
}
```

#### Kết quả

{{EmbedLiveSample("Example", 650, 180)}}

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
        Thẻ mở là bắt buộc. Thẻ đóng có thể bị bỏ qua nếu không còn
        nội dung nào trong phần tử {{HTMLElement("table")}} cha.
      </td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Phần tử {{HTMLElement("table")}}. Phần tử
        <code>&lt;tfoot&gt;</code> phải xuất hiện sau bất kỳ
        phần tử {{HTMLElement("caption")}},
        {{HTMLElement("colgroup")}}, {{HTMLElement("thead")}},
        {{HTMLElement("tbody")}} và {{HTMLElement("tr")}} nào.
        Lưu ý đây là yêu cầu trong HTML.<br />Ban đầu, trong HTML4, điều ngược lại là đúng: phần tử <code>&lt;tfoot&gt;</code> không thể được đặt sau bất kỳ
        phần tử {{HTMLElement("tbody")}} và {{HTMLElement("tr")}} nào.
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
- {{HTMLElement("caption")}}, {{HTMLElement("col")}}, {{HTMLElement("colgroup")}}, {{HTMLElement("table")}}, {{HTMLElement("tbody")}}, {{HTMLElement("td")}}, {{HTMLElement("th")}}, {{HTMLElement("thead")}}, {{HTMLElement("tr")}}: Các phần tử liên quan đến bảng khác
- {{cssxref("background-color")}}: Thuộc tính CSS để đặt màu nền của mỗi ô chân
- {{cssxref("border")}}: Thuộc tính CSS để kiểm soát đường viền của các ô chân
- {{cssxref("text-align")}}: Thuộc tính CSS để căn chỉnh ngang nội dung mỗi ô chân
- {{cssxref("vertical-align")}}: Thuộc tính CSS để căn chỉnh dọc nội dung mỗi ô chân
