---
title: "<tr>: Phần tử Hàng Bảng"
slug: Web/HTML/Reference/Elements/tr
page-type: html-element
browser-compat: html.elements.tr
sidebar: htmlsidebar
---

Phần tử **`<tr>`** trong [HTML](/vi/docs/Web/HTML) xác định một hàng ô trong bảng. Các ô của hàng sau đó có thể được thiết lập bằng sự kết hợp của các phần tử {{HTMLElement("td")}} (ô dữ liệu) và {{HTMLElement("th")}} (ô tiêu đề).

{{InteractiveExample("HTML Demo: &lt;tr&gt;", "tabbed-taller")}}

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

Phần tử này bao gồm các [thuộc tính toàn cục](/vi/docs/Web/HTML/Reference/Global_attributes).

### Thuộc tính không còn dùng

Các thuộc tính sau đây đã không còn được dùng và không nên sử dụng. Chúng được ghi lại dưới đây để tham khảo khi cập nhật code hiện có và chỉ vì lý do lịch sử.

- `align` {{deprecated_inline}}
  - : Xác định căn chỉnh ngang của mỗi ô hàng. Các giá trị {{Glossary("enumerated")}} có thể là `left`, `center`, `right`, `justify` và `char`. Khi được hỗ trợ, giá trị `char` căn chỉnh nội dung văn bản theo ký tự được định nghĩa trong thuộc tính [`char`](#char) và độ lệch được định nghĩa bởi thuộc tính [`charoff`](#charoff). Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("text-align")}}, vì thuộc tính này đã không còn được dùng.

- `bgcolor` {{deprecated_inline}}
  - : Xác định màu nền của mỗi ô hàng. Giá trị là màu HTML; có thể là [mã RGB thập lục phân 6 chữ số](/vi/docs/Web/CSS/Reference/Values/hex-color), có tiền tố `#`, hoặc một [từ khóa màu](/vi/docs/Web/CSS/Reference/Values/named-color). Các giá trị CSS {{cssxref("&lt;color&gt;")}} khác không được hỗ trợ. Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("background-color")}}, vì thuộc tính này đã không còn được dùng.

- `char` {{deprecated_inline}}
  - : Xác định căn chỉnh nội dung theo một ký tự của mỗi ô hàng. Các giá trị điển hình bao gồm dấu chấm (`.`) khi muốn căn chỉnh số hoặc giá trị tiền tệ. Nếu [`align`](#align) không được đặt thành `char`, thuộc tính này bị bỏ qua.

- `charoff` {{deprecated_inline}}
  - : Xác định số ký tự để bù đầu nội dung ô hàng từ ký tự căn chỉnh được xác định bởi thuộc tính [`char`](#char).

- `valign` {{deprecated_inline}}
  - : Xác định căn chỉnh dọc của mỗi ô hàng. Các giá trị {{Glossary("enumerated")}} có thể là `baseline`, `bottom`, `middle` và `top`. Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("vertical-align")}}, vì thuộc tính này đã không còn được dùng.

## Ghi chú sử dụng

- Phần tử `<tr>` chỉ hợp lệ khi là con của phần tử {{HTMLElement("thead")}}, {{HTMLElement("tbody")}} hoặc {{HTMLElement("tfoot")}}.
- Nếu `<tr>` được đặt là con trực tiếp của phần tử {{HTMLElement("table")}} cha, thì phần tử cha `<tbody>` được suy ra và trình duyệt sẽ thêm `<tbody>` vào markup.
- Phần tử cha `<tbody>` được suy ra chỉ được hỗ trợ nếu `<table>` không có phần tử con `<tbody>` nào, và chỉ khi `<tr>` được bao gồm sau bất kỳ phần tử {{HTMLElement("caption")}}, {{HTMLElement("colgroup")}} và `<thead>` nào.
- Các pseudo-class CSS {{cssxref(":nth-of-type")}}, {{cssxref(":first-of-type")}} và {{cssxref(":last-of-type")}} thường hữu ích để chọn tập hợp hàng mong muốn và các ô dữ liệu và tiêu đề của chúng (các phần tử {{HTMLElement("td")}} và {{HTMLElement("th")}}).
- Khi `<tr>` được bao gồm là con trực tiếp của `<table>`, vì trình duyệt thêm `<tbody>` vào markup, các selector CSS như `table > tr` có thể không hoạt động như mong đợi hoặc không hoạt động.

## Ví dụ

Xem {{HTMLElement("table")}} để biết ví dụ bảng đầy đủ giới thiệu các chuẩn và thực hành phổ biến.

### Thiết lập hàng cơ bản

Ví dụ này minh họa một bảng với bốn hàng và ba cột, trong đó cột đầu tiên chứa tiêu đề cho các ô dữ liệu hàng.

#### HTML

Bốn phần tử `<tr>` được sử dụng để tạo bốn hàng bảng. Mỗi hàng chứa ba ô—một ô tiêu đề ({{HTMLElement("th")}}) và hai ô dữ liệu ({{HTMLElement("td")}})—tạo ra ba cột. Thuộc tính [`scope`](/vi/docs/Web/HTML/Reference/Elements/th#scope) được đặt trên mỗi ô tiêu đề xác định các ô chúng liên quan đến, trong ví dụ này là tất cả các ô dữ liệu trong `row`.

```html
<table>
  <tbody>
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
  </tbody>
</table>
```

#### CSS

Pseudo-class CSS {{cssxref(":nth-of-type")}} được sử dụng để chọn mỗi hàng `odd` và đặt {{cssxref("background-color")}} của những hàng đó thành tông tối hơn một chút, tạo ra hiệu ứng "sọc ngựa vằn". Nền xen kẽ này làm cho các hàng dữ liệu trong bảng dễ phân tích và đọc hơn—hãy tưởng tượng có nhiều hàng và cột và cố gắng tìm một số dữ liệu trong một hàng cụ thể. Ngoài ra, các ô tiêu đề hàng (phần tử {{HTMLElement("th")}}) được làm nổi bật với {{cssxref("background-color")}} để phân biệt chúng với các ô dữ liệu (phần tử {{HTMLElement("td")}}).

```css
tr:nth-of-type(odd) {
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

th,
td {
  border: 1px solid rgb(160 160 160);
  padding: 8px 10px;
}
```

#### Kết quả

{{EmbedLiveSample("Basic_row_setup", 650, 140)}}

### Hàng tiêu đề

Ví dụ này mở rộng bảng cơ bản từ [ví dụ trước](#basic_row_setup) bằng cách thêm hàng tiêu đề là hàng đầu tiên của bảng.

#### HTML

Một hàng bảng bổ sung (`<tr>`) được thêm vào như hàng đầu tiên của bảng với các ô tiêu đề cột ({{HTMLElement("th")}}) cung cấp tiêu đề cho mỗi cột. Chúng ta đặt hàng này trong phần tử nhóm {{HTMLElement("thead")}} để chỉ ra đây là tiêu đề của bảng. Thuộc tính [`scope`](/vi/docs/Web/HTML/Reference/Elements/th#scope) được thêm vào mỗi ô tiêu đề (`<th>`) trong hàng đầu này để xác định rõ ràng rằng mỗi ô tiêu đề liên quan đến tất cả các ô trong cột riêng của nó, kể cả những ô trong {{HTMLElement("tbody")}}.

```html
<table>
  <thead>
    <tr>
      <th scope="col">Symbol</th>
      <th scope="col">Code word</th>
      <th scope="col">Pronunciation</th>
    </tr>
  </thead>
  <tbody>
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
  </tbody>
</table>
```

#### CSS

CSS gần như không thay đổi so với [ví dụ trước](#basic_row_setup), ngoại trừ một số kiểu bổ sung để làm nổi bật "hàng tiêu đề" để tiêu đề cột nổi bật so với các ô khác.

```css
tr:nth-of-type(odd) {
  background-color: #eeeeee;
}

tr th[scope="col"] {
  background-color: #505050;
  color: white;
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

th,
td {
  border: 1px solid rgb(160 160 160);
  padding: 8px 10px;
}
```

#### Kết quả

{{EmbedLiveSample("Header_row", 650, 170)}}

### Sắp xếp hàng

Không có phương thức gốc để sắp xếp các hàng (phần tử `<tr>`) của {{HTMLElement("table")}}. Nhưng sử dụng {{jsxref("Array.prototype.sort()")}}, {{domxref("Node.removeChild")}} và {{domxref("Node.appendChild")}}, một hàm `sort()` tùy chỉnh có thể được triển khai trong JavaScript để sắp xếp {{domxref("HTMLCollection")}} của các phần tử `<tr>`.

#### HTML

Phần tử {{HTMLElement("tbody")}} được sử dụng trong bảng cơ bản này để đánh dấu phần thân của bảng và bao gồm ba hàng (`<tr>` elements) với dữ liệu (phần tử {{HTMLElement("td")}}), tạo ra một cột với các số theo thứ tự giảm dần.

```html
<table>
  <tbody>
    <tr>
      <td>3</td>
    </tr>
    <tr>
      <td>2</td>
    </tr>
    <tr>
      <td>1</td>
    </tr>
  </tbody>
</table>
```

#### JavaScript

Trong code JavaScript bên dưới, hàm `sort()` được tạo ra được gắn vào phần tử {{HTMLElement("tbody")}} để nó sắp xếp các ô bảng theo thứ tự giá trị tăng dần và cập nhật màn hình tương ứng.

```js
HTMLTableSectionElement.prototype.sort = function (cb) {
  Array.from(this.rows)
    .sort(cb)
    .forEach((e) => this.appendChild(this.removeChild(e)));
};

document
  .querySelector("table")
  .tBodies[0].sort((a, b) => a.textContent.localeCompare(b.textContent));
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
  padding: 4px 8px;
}
```

#### Kết quả

{{EmbedLiveSample('Sorting_rows', '650', '80')}}

### Sắp xếp hàng bằng cách nhấp vào ô tiêu đề

Ví dụ này mở rộng bảng cơ bản từ [ví dụ trước](#sorting_rows) bằng cách làm cho việc sắp xếp tương tác và độc lập cho nhiều cột.

#### HTML

Một ô dữ liệu bổ sung (phần tử {{HTMLElement("td")}}) được thêm vào mỗi hàng (`<tr>` element) trong phần thân bảng ({{HTMLElement("tbody")}} element) để tạo ra cột thứ hai với các chữ cái theo thứ tự tăng dần. Sử dụng phần tử {{HTMLElement("thead")}}, một phần đầu được thêm trước phần thân để giới thiệu hàng đầu với các ô tiêu đề bảng (phần tử {{HTMLElement("th")}}). Các ô tiêu đề này được sử dụng trong code JavaScript bên dưới để làm cho chúng có thể nhấp được và sau đó thực hiện sắp xếp tương ứng khi được kích hoạt qua nhấp chuột.

```html
<table>
  <thead>
    <tr>
      <th>Numbers</th>
      <th>Letters</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>3</td>
      <td>A</td>
    </tr>
    <tr>
      <td>2</td>
      <td>B</td>
    </tr>
    <tr>
      <td>1</td>
      <td>C</td>
    </tr>
  </tbody>
</table>
```

#### JavaScript

Một trình xử lý sự kiện click được thêm vào mỗi tiêu đề bảng (phần tử {{HTMLElement("th")}}) của mỗi {{HTMLElement("table")}} trong {{domxref("HTMLDocument", "document")}}; nó sắp xếp tất cả các hàng (`<tr>` elements) của {{HTMLElement("tbody")}} dựa trên nội dung của các ô dữ liệu (phần tử {{HTMLElement("td")}}) chứa trong các hàng.

> [!NOTE]
> Giải pháp này giả định rằng các phần tử {{HTMLElement("td")}} được điền bởi văn bản thô không có phần tử con.

```js
const allTables = document.querySelectorAll("table");

for (const table of allTables) {
  const tBody = table.tBodies[0];
  const rows = Array.from(tBody.rows);
  const headerCells = table.tHead.rows[0].cells;

  for (const th of headerCells) {
    const cellIndex = th.cellIndex;

    th.addEventListener("click", () => {
      rows.sort((tr1, tr2) => {
        const tr1Text = tr1.cells[cellIndex].textContent;
        const tr2Text = tr2.cells[cellIndex].textContent;
        return tr1Text.localeCompare(tr2Text);
      });

      tBody.append(...rows);
    });
  }
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
  padding: 4px 8px;
}

th {
  background-color: #505050;
  color: white;
  cursor: pointer;
}
```

#### Kết quả

{{EmbedLiveSample('Sorting_rows_with_a_click_on_header_cells', '650', '100')}}

> [!NOTE]
> Để có thể sử dụng và dễ tiếp cận, ô tiêu đề của mỗi cột có thể sắp xếp phải được nhận biết là nút sắp xếp và mỗi nút phải xác định trực quan và bằng thuộc tính [`aria-sort`](/vi/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-sort) liệu cột hiện đang được sắp xếp theo thứ tự tăng dần hay giảm dần. Xem [ví dụ bảng có thể sắp xếp](https://www.w3.org/WAI/ARIA/apg/patterns/table/examples/sortable-table/) của [ARIA Authoring Practices Guide](https://www.w3.org/WAI/ARIA/apg/) để biết thêm thông tin.

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/vi/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>Không có</td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        Không hoặc nhiều phần tử {{HTMLElement("td")}} và/hoặc
        {{HTMLElement("th")}} elements;
        {{Glossary("script-supporting element", "các phần tử hỗ trợ script")}}
        ({{HTMLElement("script")}} và
        {{HTMLElement("template")}}) cũng được phép.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>
        Thẻ mở là bắt buộc. Thẻ đóng có thể bị bỏ qua nếu
        phần tử <code>&lt;tr&gt;</code> được theo sau ngay bởi
        phần tử <code>&lt;tr&gt;</code>, hoặc nếu hàng là phần tử cuối cùng
        trong nhóm bảng cha ({{HTMLElement("thead")}},
        {{HTMLElement("tbody")}} hoặc {{HTMLElement("tfoot")}})
        của nó.
      </td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        {{HTMLElement("table")}} (chỉ khi bảng không có phần tử con
        {{HTMLElement("tbody")}}, và ngay cả khi đó chỉ sau bất kỳ
        phần tử {{HTMLElement("caption")}},
        {{HTMLElement("colgroup")}} và
        {{HTMLElement("thead")}} nào); nếu không, phần tử cha phải
        là {{HTMLElement("thead")}}, {{HTMLElement("tbody")}} hoặc
        {{HTMLElement("tfoot")}}.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role"
            >row</a
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
      <td>{{DOMxRef("HTMLTableRowElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Học: Kiến thức cơ bản về bảng HTML](/vi/docs/Learn_web_development/Core/Structuring_content/HTML_table_basics)
- {{HTMLElement("caption")}}, {{HTMLElement("col")}}, {{HTMLElement("colgroup")}}, {{HTMLElement("table")}}, {{HTMLElement("tbody")}}, {{HTMLElement("td")}}, {{HTMLElement("tfoot")}}, {{HTMLElement("th")}}, {{HTMLElement("thead")}}: Các phần tử liên quan đến bảng khác
- {{cssxref("background-color")}}: Thuộc tính CSS để đặt màu nền của mỗi ô hàng
- {{cssxref("border")}}: Thuộc tính CSS để kiểm soát đường viền của các ô hàng
- {{cssxref("text-align")}}: Thuộc tính CSS để căn chỉnh ngang nội dung mỗi ô hàng
- {{cssxref("vertical-align")}}: Thuộc tính CSS để căn chỉnh dọc nội dung mỗi ô hàng
- {{cssxref(":nth-of-type")}}, {{cssxref(":first-of-type")}}, {{cssxref(":last-of-type")}}: Các pseudo-class CSS để chọn các ô hàng mong muốn
