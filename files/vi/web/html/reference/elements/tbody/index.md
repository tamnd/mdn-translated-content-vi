---
title: "<tbody>: Phần tử Thân Bảng"
slug: Web/HTML/Reference/Elements/tbody
page-type: html-element
browser-compat: html.elements.tbody
sidebar: htmlsidebar
---

Phần tử **`<tbody>`** trong [HTML](/vi/docs/Web/HTML) bao gồm một tập hợp các hàng bảng (phần tử {{HTMLElement("tr")}}), cho biết chúng tạo thành thân của dữ liệu (chính) trong bảng.

{{InteractiveExample("HTML Demo: &lt;tbody&gt;", "tabbed-taller")}}

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
  - : Xác định căn chỉnh ngang của mỗi ô thân. Các giá trị {{Glossary("enumerated")}} có thể là `left`, `center`, `right`, `justify` và `char`. Khi được hỗ trợ, giá trị `char` căn chỉnh nội dung văn bản theo ký tự được định nghĩa trong thuộc tính [`char`](#char) và độ lệch được định nghĩa bởi thuộc tính [`charoff`](#charoff). Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("text-align")}}, vì thuộc tính này đã không còn được dùng.

- `bgcolor` {{deprecated_inline}}
  - : Xác định màu nền của mỗi ô thân. Giá trị là màu HTML; có thể là [mã RGB thập lục phân 6 chữ số](/vi/docs/Web/CSS/Reference/Values/hex-color), có tiền tố `#`, hoặc một [từ khóa màu](/vi/docs/Web/CSS/Reference/Values/named-color). Các giá trị CSS {{cssxref("&lt;color&gt;")}} khác không được hỗ trợ. Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("background-color")}}, vì thuộc tính này đã không còn được dùng.

- `char` {{deprecated_inline}}
  - : Xác định căn chỉnh nội dung theo một ký tự của mỗi ô thân. Các giá trị điển hình bao gồm dấu chấm (`.`) khi muốn căn chỉnh số hoặc giá trị tiền tệ. Nếu [`align`](#align) không được đặt thành `char`, thuộc tính này bị bỏ qua.

- `charoff` {{deprecated_inline}}
  - : Xác định số ký tự để bù đầu nội dung ô thân từ ký tự căn chỉnh được xác định bởi thuộc tính [`char`](#char).

- `valign` {{deprecated_inline}}
  - : Xác định căn chỉnh dọc của mỗi ô thân. Các giá trị {{Glossary("enumerated")}} có thể là `baseline`, `bottom`, `middle` và `top`. Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("vertical-align")}}, vì thuộc tính này đã không còn được dùng.

## Ghi chú sử dụng

- `<tbody>` được đặt sau bất kỳ phần tử {{HTMLElement("caption")}}, {{HTMLElement("colgroup")}} và {{HTMLElement("thead")}} nào.
- Nếu các phần tử {{HTMLElement("tr")}} được chỉ định là con trực tiếp của phần tử {{HTMLElement("table")}} (xem "bỏ qua thẻ" trong [tóm tắt kỹ thuật](#technical_summary) để biết mô tả khi nào điều này hợp lệ), thì markup được tạo bởi trình duyệt sẽ bao gồm phần tử `<tbody>` bao gồm chúng. Do đó, các selector CSS như `table > tr` sẽ không chọn các phần tử này. Xem thêm ví dụ [Không chỉ định thân](#not_specifying_a_body).
- Được phép sử dụng nhiều hơn một `<tbody>` trên mỗi bảng miễn là tất cả đều liên tiếp. Điều này cho phép chia các hàng (phần tử {{HTMLElement("tr")}}) trong bảng lớn thành các phần, mỗi phần có thể được định dạng riêng nếu muốn. Nếu không được đánh dấu là các phần tử liên tiếp, trình duyệt sẽ sửa lỗi này của tác giả, đảm bảo bất kỳ phần tử {{HTMLElement("thead")}} và {{HTMLElement("tfoot")}} nào được hiển thị là phần tử đầu tiên và cuối cùng của bảng tương ứng.
- Cùng với các phần tử {{HTMLElement("thead")}} và {{HTMLElement("tfoot")}} liên quan, phần tử `<tbody>` cung cấp thông tin {{Glossary("semantics", "ngữ nghĩa")}} hữu ích và có thể được sử dụng khi hiển thị cho màn hình hoặc in ấn. Việc chỉ định các nhóm nội dung bảng như vậy cũng cung cấp thông tin ngữ cảnh có giá trị cho công nghệ hỗ trợ, bao gồm trình đọc màn hình và công cụ tìm kiếm.
- Khi in tài liệu, trong trường hợp bảng nhiều trang, các phần tử {{HTMLElement("thead")}} và {{htmlelement("tfoot")}} thường xác định thông tin vẫn giống nhau—hoặc ít nhất rất giống—trên mỗi trang, trong khi nội dung của phần tử `<tbody>` thường sẽ khác nhau từ trang này sang trang khác.
- Khi bảng được trình bày trong ngữ cảnh màn hình (như cửa sổ) không đủ lớn để hiển thị toàn bộ bảng, {{Glossary("user agent")}} có thể cho phép người dùng cuộn nội dung của các khối {{HTMLElement("thead")}}, `<tbody>`, {{htmlelement("tfoot")}} và {{HTMLElement("caption")}} riêng biệt với nhau cho cùng một phần tử {{htmlelement("table")}} cha.

## Ví dụ

Xem {{HTMLElement("table")}} để biết ví dụ bảng đầy đủ giới thiệu các chuẩn và thực hành phổ biến.

### Không chỉ định thân

Ví dụ này minh họa rằng trình duyệt tự động bao gồm các phần tử {{HTMLElement("tr")}} trong phần tử `<tbody>` nếu các hàng không được lồng trong một phần tử nhóm bảng (`<tbody>`, `<tfoot>` hoặc `<thead>`) và là con trực tiếp của phần tử {{HTMLElement("table")}} như trong ví dụ này.

#### HTML

Ở đây, một bảng rất cơ bản với một số hàng bảng (phần tử {{HTMLElement("tr")}}) chứa dữ liệu (phần tử {{HTMLElement("td")}}) về sinh viên được tạo ra.

```html
<table>
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
</table>
```

#### CSS

Lưu ý CSS trong ví dụ, trong đó {{cssxref("background-color")}} được chỉ định cho phần tử `<tbody>` và `tbody` được sử dụng như một phần của {{Glossary("css_selector", "CSS selector")}} bổ sung. Ngoài ra, {{Glossary("developer_tools", "công cụ dành cho nhà phát triển trình duyệt")}} có thể được sử dụng để kiểm tra sự hiện diện của phần tử `<tbody>` trong {{Glossary("dom", "DOM")}}.

```css
tbody {
  background-color: #e4f0f5;
}

tbody > tr > td:last-of-type {
  width: 60px;
  text-align: center;
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

td {
  border: 1px solid rgb(160 160 160);
  padding: 8px 10px;
}
```

#### Kết quả

{{EmbedLiveSample("Not_specifying_a_body", 650, 100)}}

### Cấu trúc thân cơ bản

Ví dụ này mở rộng và nâng cao bảng cơ bản từ [ví dụ trước](#not_specifying_a_body).

#### HTML

Chúng ta giới thiệu đầu bảng (phần tử {{HTMLElement("thead")}}) và sử dụng rõ ràng phần tử `<tbody>` để cấu trúc bảng thành các phần {{Glossary("semantics", "ngữ nghĩa")}}. Đầu bảng chứa các tiêu đề cột (phần tử {{HTMLElement("th")}}). Phần tử `<tbody>` biểu diễn phần thân của bảng, chứa một số hàng (phần tử {{HTMLElement("tr")}}) với dữ liệu chính của bảng, là dữ liệu của từng sinh viên.

Việc sử dụng các nhóm nội dung bảng như vậy và {{Glossary("semantics", "markup ngữ nghĩa")}} không chỉ hữu ích cho trình bày trực quan (thông qua tạo kiểu CSS) và thông tin ngữ cảnh cho công nghệ hỗ trợ; hơn nữa, việc sử dụng rõ ràng phần tử `<tbody>` giúp trình duyệt tạo ra cấu trúc bảng đúng như ý định, tránh các kết quả không mong muốn.

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

CSS hầu như không thay đổi so với [ví dụ trước](#not_specifying_a_body), ngoại trừ một số kiểu cơ bản để làm nổi bật đầu bảng để tiêu đề cột nổi bật so với dữ liệu trong phần thân bảng. Như trong [ví dụ trên](#not_specifying_a_body), [bộ chọn kiểu](/vi/docs/Web/CSS/Reference/Selectors/Type_selectors) `tbody` được sử dụng để tạo kiểu các ô thân.

```css
tbody {
  background-color: #e4f0f5;
}

tbody > tr > td:last-of-type {
  text-align: center;
}

thead {
  border-bottom: 2px solid rgb(160 160 160);
  background-color: #2c5e77;
  color: white;
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
```

#### Kết quả

{{EmbedLiveSample("Basic_body_structure", 650, 140)}}

### Nhiều thân

Ví dụ này mở rộng và nâng cao bảng từ [ví dụ trên](#basic_body_structure) hơn nữa bằng cách giới thiệu nhiều phần thân.

Sử dụng nhiều phần tử `<tbody>` cho phép tạo nhóm hàng trong một bảng. Mỗi phần thân bảng có thể có hàng đầu hoặc nhiều hàng đầu riêng; tuy nhiên, _chỉ có thể có một phần tử {{HTMLElement("thead")}} trên mỗi bảng_! Vì vậy, {{HTMLElement("tr")}} với các phần tử {{HTMLElement("th")}} có thể được sử dụng để tạo tiêu đề trong mỗi `<tbody>`.

#### HTML

Dựa trên bảng trong [ví dụ cơ bản trước](#basic_body_structure), nhiều sinh viên được thêm vào và thay vì liệt kê chuyên ngành của mỗi sinh viên trên từng hàng, các sinh viên được nhóm theo chuyên ngành. Lưu ý rằng mỗi chuyên ngành được bao gồm trong khối `<tbody>` riêng của mình, với hàng đầu tiên (phần tử {{HTMLElement("tr")}}) đóng vai trò là đầu của khối, hiển thị tên chuyên ngành trong phần tử {{HTMLElement("th")}} sử dụng thuộc tính [`colspan`](/vi/docs/Web/HTML/Reference/Elements/th#colspan) để trải rộng tiêu đề qua ba cột của bảng. Mỗi hàng còn lại trong `<tbody>` của mỗi chuyên ngành đại diện cho một sinh viên.

```html
<table>
  <thead>
    <tr>
      <th>Student ID</th>
      <th>Name</th>
      <th>Credits</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th colspan="3">Computer Science</th>
    </tr>
    <tr>
      <td>3741255</td>
      <td>Jones, Martha</td>
      <td>240</td>
    </tr>
    <tr>
      <td>4077830</td>
      <td>Pierce, Benjamin</td>
      <td>200</td>
    </tr>
    <tr>
      <td>5151701</td>
      <td>Kirk, James</td>
      <td>230</td>
    </tr>
  </tbody>
  <tbody>
    <tr>
      <th colspan="3">Russian Literature</th>
    </tr>
    <tr>
      <td>3971244</td>
      <td>Nim, Victor</td>
      <td>220</td>
    </tr>
  </tbody>
  <tbody>
    <tr>
      <th colspan="3">Astrophysics</th>
    </tr>
    <tr>
      <td>4100332</td>
      <td>Petrov, Alexandra</td>
      <td>260</td>
    </tr>
    <tr>
      <td>8892377</td>
      <td>Toyota, Hiroko</td>
      <td>240</td>
    </tr>
  </tbody>
</table>
```

#### CSS

Hầu hết CSS không thay đổi. Tuy nhiên, một kiểu tinh tế hơn một chút được thêm vào cho các ô tiêu đề chứa trực tiếp trong `<tbody>` (trái với những ô nằm trong {{HTMLElement("thead")}}). Điều này được sử dụng cho các tiêu đề chỉ ra chuyên ngành tương ứng của mỗi phần bảng.

```css
tbody > tr > th {
  border-top: 2px solid rgb(160 160 160);
  border-bottom: 1px solid rgb(140 140 140);
  background-color: #e4f0f5;
  font-weight: normal;
}

tbody {
  background-color: whitesmoke;
}

thead {
  background-color: #2c5e77;
  color: white;
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
  padding: 6px 8px;
  text-align: left;
}

tbody > tr > td:last-of-type {
  text-align: center;
}
```

#### Kết quả

{{EmbedLiveSample("Multiple_bodies", 650, 300)}}

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
      <td>Không hoặc nhiều phần tử {{ HTMLElement("tr") }}.</td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>
        Thẻ mở của phần tử <code>&lt;tbody&gt;</code> có thể bị bỏ qua nếu điều đầu tiên bên trong phần tử <code>&lt;tbody&gt;</code> là phần tử {{HTMLElement("tr")}}, và nếu phần tử không được đứng trước ngay bởi phần tử <code>&lt;tbody&gt;</code>, {{HTMLElement("thead")}} hoặc {{HTMLElement("tfoot")}} có thẻ đóng bị bỏ qua. (Không thể bỏ qua nếu phần tử trống.)
        Thẻ đóng của phần tử <code>&lt;tbody&gt;</code> có thể bị bỏ qua nếu phần tử <code>&lt;tbody&gt;</code> được theo sau ngay bởi phần tử <code>&lt;tbody&gt;</code> hoặc {{HTMLElement("tfoot")}}, hoặc nếu không còn nội dung nào trong phần tử cha.
      </td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Trong phần tử {{ HTMLElement("table") }} bắt buộc,
        phần tử <code>&lt;tbody&gt;</code> có thể được thêm sau bất kỳ
        phần tử {{ HTMLElement("caption") }}, {{HTMLElement("colgroup") }},
        và {{ HTMLElement("thead") }} nào.
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
- {{HTMLElement("caption")}}, {{HTMLElement("col")}}, {{HTMLElement("colgroup")}}, {{HTMLElement("table")}}, {{HTMLElement("td")}}, {{HTMLElement("tfoot")}}, {{HTMLElement("th")}}, {{HTMLElement("thead")}}, {{HTMLElement("tr")}}: Các phần tử liên quan đến bảng khác
- {{cssxref("background-color")}}: Thuộc tính CSS để đặt màu nền của mỗi ô thân
- {{cssxref("border")}}: Thuộc tính CSS để kiểm soát đường viền của các ô thân
- {{cssxref("text-align")}}: Thuộc tính CSS để căn chỉnh ngang nội dung mỗi ô thân
- {{cssxref("vertical-align")}}: Thuộc tính CSS để căn chỉnh dọc nội dung mỗi ô thân
