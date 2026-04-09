---
title: "<th>: Phần tử Tiêu đề Bảng"
slug: Web/HTML/Reference/Elements/th
page-type: html-element
browser-compat: html.elements.th
sidebar: htmlsidebar
---

Phần tử **`<th>`** trong [HTML](/vi/docs/Web/HTML) xác định một ô là tiêu đề của một nhóm ô bảng và có thể được sử dụng làm con của phần tử {{HTMLElement("tr")}}. Bản chất chính xác của nhóm này được xác định bởi các thuộc tính [`scope`](#scope) và [`headers`](#headers).

{{InteractiveExample("HTML Demo: &lt;th&gt;", "tabbed-taller")}}

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

- `abbr`
  - : Mô tả ngắn gọn về nội dung của ô tiêu đề được cung cấp như nhãn thay thế để sử dụng cho ô tiêu đề khi tham chiếu ô trong các ngữ cảnh khác. Một số tác nhân người dùng, như trình đọc màn hình, có thể trình bày mô tả này trước nội dung chính.
- `colspan`
  - : Giá trị số nguyên không âm cho biết ô tiêu đề trải rộng hoặc mở rộng qua bao nhiêu cột. Giá trị mặc định là `1`. Tác nhân người dùng bỏ qua các giá trị cao hơn 1000 là không chính xác, mặc định là `1`.
- `headers`
  - : Danh sách các chuỗi phân tách bằng dấu cách tương ứng với các thuộc tính `id` của các phần tử `<th>` cung cấp tiêu đề cho ô tiêu đề này.
- `rowspan`
  - : Giá trị số nguyên không âm cho biết ô tiêu đề trải rộng hoặc mở rộng qua bao nhiêu hàng. Giá trị mặc định là `1`; nếu giá trị được đặt thành `0`, ô tiêu đề sẽ mở rộng đến cuối phần nhóm bảng ({{HTMLElement("thead")}}, {{HTMLElement("tbody")}}, {{HTMLElement("tfoot")}}, kể cả khi được định nghĩa ngầm), mà `<th>` thuộc về. Các giá trị cao hơn `65534` bị cắt xuống `65534`.
- `scope`
  - : Xác định các ô mà phần tử tiêu đề (được xác định trong `<th>`) liên quan đến. Các giá trị {{Glossary("enumerated", "liệt kê")}} có thể là:
    - `row`: tiêu đề liên quan đến tất cả các ô của hàng nó thuộc về;
    - `col`: tiêu đề liên quan đến tất cả các ô của cột nó thuộc về;
    - `rowgroup`: tiêu đề thuộc về một rowgroup và liên quan đến tất cả các ô của nó;
    - `colgroup`: tiêu đề thuộc về một colgroup và liên quan đến tất cả các ô của nó.

    Nếu thuộc tính `scope` không được chỉ định, hoặc giá trị của nó không phải là `row`, `col`, `rowgroup` hoặc `colgroup`, thì trình duyệt tự động chọn tập hợp các ô mà ô tiêu đề áp dụng cho.

### Thuộc tính không còn dùng

Các thuộc tính sau đây đã không còn được dùng và không nên sử dụng. Chúng được ghi lại dưới đây để tham khảo khi cập nhật code hiện có và chỉ vì lý do lịch sử.

- `align` {{deprecated_inline}}
  - : Xác định căn chỉnh ngang của ô tiêu đề. Các giá trị {{Glossary("enumerated")}} có thể là `left`, `center`, `right`, `justify` và `char`. Khi được hỗ trợ, giá trị `char` căn chỉnh nội dung văn bản theo ký tự được định nghĩa trong thuộc tính [`char`](#char) và độ lệch được định nghĩa bởi thuộc tính [`charoff`](#charoff). Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("text-align")}}, vì thuộc tính này đã không còn được dùng.

- `axis` {{deprecated_inline}}
  - : Chứa danh sách các chuỗi phân tách bằng dấu cách, mỗi chuỗi tương ứng với thuộc tính `id` của một nhóm ô mà ô tiêu đề áp dụng cho. Thay vào đó hãy sử dụng thuộc tính [`scope`](#scope), vì thuộc tính này đã không còn được dùng.

- `bgcolor` {{deprecated_inline}}
  - : Xác định màu nền của ô tiêu đề. Giá trị là màu HTML; có thể là [mã RGB thập lục phân 6 chữ số](/vi/docs/Web/CSS/Reference/Values/hex-color), có tiền tố `#`, hoặc một [từ khóa màu](/vi/docs/Web/CSS/Reference/Values/named-color). Các giá trị CSS {{cssxref("&lt;color&gt;")}} khác không được hỗ trợ. Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("background-color")}}, vì thuộc tính này đã không còn được dùng.

- `char` {{deprecated_inline}}
  - : Không có tác dụng. Ban đầu được dùng để xác định căn chỉnh nội dung theo một ký tự của ô tiêu đề. Các giá trị điển hình bao gồm dấu chấm (`.`) khi muốn căn chỉnh số hoặc giá trị tiền tệ. Nếu [`align`](#align) không được đặt thành `char`, thuộc tính này bị bỏ qua.

- `charoff` {{deprecated_inline}}
  - : Không có tác dụng. Ban đầu được dùng để xác định số ký tự để bù đầu nội dung ô tiêu đề từ ký tự căn chỉnh được xác định bởi thuộc tính [`char`](#char).

- `height` {{deprecated_inline}}
  - : Xác định chiều cao ô tiêu đề được khuyến nghị. Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("height")}}, vì thuộc tính này đã không còn được dùng.

- `valign` {{deprecated_inline}}
  - : Xác định căn chỉnh dọc của ô tiêu đề. Các giá trị {{Glossary("enumerated")}} có thể là `baseline`, `bottom`, `middle` và `top`. Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("vertical-align")}}, vì thuộc tính này đã không còn được dùng.

- `width` {{deprecated_inline}}
  - : Xác định chiều rộng ô tiêu đề được khuyến nghị. Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("width")}}, vì thuộc tính này đã không còn được dùng.

## Ghi chú sử dụng

- `<th>` chỉ có thể được sử dụng trong phần tử {{HTMLElement("tr")}}.
- Trong các ngữ cảnh đơn giản, việc sử dụng thuộc tính [`scope`](#scope) trên các ô tiêu đề (phần tử `<th>`) là dư thừa vì [`scope`](#scope) được suy ra. Tuy nhiên, một số công nghệ hỗ trợ có thể suy ra không chính xác, vì vậy việc chỉ định phạm vi tiêu đề có thể cải thiện trải nghiệm người dùng.
- Khi sử dụng các thuộc tính [`colspan`](#colspan) và [`rowspan`](#rowspan) để trải rộng các ô tiêu đề qua nhiều cột và hàng, các ô không có các thuộc tính này được xác định (với giá trị mặc định là `1`) được tự động khớp vào các khoảng trống có sẵn trong cấu trúc bảng trải rộng các ô 1x1, như được minh họa trong hình sau:

  ![Illustration demonstrating column and row spanning of table cells: cells 1, 3, and 4 spanning two rows; cell 2 spanning two columns; cells 5 and 6 fitting into the available cells that are the second and third columns in the second row](/shared-assets/images/diagrams/html/table/column-row-span.png)

  > [!NOTE]
  > Các thuộc tính này không được sử dụng để chồng lên các ô.

## Ví dụ

Xem {{HTMLElement("table")}} để biết ví dụ bảng đầy đủ giới thiệu các chuẩn và thực hành phổ biến.

### Tiêu đề cột và hàng cơ bản

Ví dụ này sử dụng các phần tử `<th>` để giới thiệu tiêu đề cột và hàng trong cấu trúc bảng cơ bản.

#### HTML

Hàng đầu tiên (phần tử {{HTMLElement("tr")}}) chứa các tiêu đề cột (phần tử `<th>`), đóng vai trò là "tiêu đề" cho các cột để dễ hiểu thông tin trong các cột và xác định dữ liệu hơn. Để cho biết mỗi tiêu đề cột liên quan đến tất cả các ô trong cột tương ứng, thuộc tính [`scope`](#scope) được đặt thành `col` (cột).

Các hàng còn lại chứa dữ liệu chính của bảng. Mỗi hàng trong số này có tiêu đề hàng (phần tử `<th>`) được giới thiệu là ô đầu tiên. Điều này tạo ra một cột với tiêu đề hàng là cột đầu tiên của bảng. Tương tự như các tiêu đề cột, thuộc tính [`scope`](#scope) được đặt thành `row` để xác định các ô mà mỗi tiêu đề hàng liên quan đến, là tất cả các ô dữ liệu (phần tử {{HTMLElement("td")}}) trong mỗi `row`.

> [!NOTE]
> Thông thường, các phần tử nhóm {{HTMLElement("thead")}} và {{HTMLElement("tbody")}} được sử dụng để nhóm các hàng với tiêu đề vào các phần đầu và thân tương ứng của bảng. Các phần tử này bị bỏ qua trong ví dụ này để giảm độ phức tạp và tập trung vào việc sử dụng các ô tiêu đề.

```html
<table>
  <tr>
    <th scope="col">Symbol</th>
    <th scope="col">Code word</th>
    <th scope="col">Pronunciation</th>
  </tr>
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

Một số CSS cơ bản được sử dụng để tạo kiểu bảng và các ô của nó. Chúng ta sử dụng [bộ chọn thuộc tính](/vi/docs/Web/CSS/Reference/Selectors/Attribute_selectors) CSS để nhắm mục tiêu các ô tiêu đề dựa trên giá trị thuộc tính [`scope`](#scope) của chúng, làm nổi bật các tiêu đề cột và hàng (phần tử `<th>`) và phân biệt chúng với nhau và với các ô dữ liệu ({{HTMLElement("td")}}).

```css
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

tr:nth-of-type(odd) td {
  background-color: #eeeeee;
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

{{EmbedLiveSample("Basic_column_and_row_headers", 650, 170)}}

### Trải rộng cột và hàng

Ví dụ này mở rộng và nâng cao bảng cơ bản từ [ví dụ trước](#basic_column_and_row_headers) bằng cách thêm hàng thứ hai cho các tiêu đề cột bổ sung.

#### HTML

Một hàng bảng bổ sung (phần tử {{HTMLElement("tr")}}) được thêm vào làm hàng tiêu đề thứ hai của bảng với hai tiêu đề cột bổ sung (phần tử `<th>`). Theo cách này, cột "Pronunciation" được chia thành hai cột, một cho ký hiệu IPA (International Phonetic Alphabet) và một cho cách viết (cột phát âm gốc). Các ô dữ liệu tương ứng (phần tử {{HTMLElement("td")}}) được thêm vào mỗi hàng tiếp theo.

Như được trình bày trong [ghi chú sử dụng](#usage_notes), các thuộc tính [`colspan`](#colspan) và [`rowspan`](#rowspan) có thể được sử dụng cho các phần tử `<th>` để phân bổ các ô tiêu đề vào đúng cột và hàng. Để đạt được tiêu đề "hai hàng" trong cấu trúc bảng, hai ô tiêu đề đầu tiên trong phần tử {{HTMLElement("tr")}} đầu tiên được trải rộng qua hai hàng. Ô tiêu đề thứ ba được trải rộng hai cột (vẫn ở hàng đầu tiên). Thiết lập này để lại hai khu vực có sẵn trong cột thứ ba và thứ tư ở hàng thứ hai, trong đó hai tiêu đề trong phần tử {{HTMLElement("tr")}} thứ hai được tự động đặt, với giá trị mặc định là `1` cho các thuộc tính [`colspan`](#colspan) và [`rowspan`](#rowspan).

> [!NOTE]
> Thông thường, các phần tử {{HTMLElement("thead")}} và {{HTMLElement("tbody")}} được sử dụng để nhóm các hàng với tiêu đề vào các phần đầu và thân tương ứng của bảng. Điều này không được triển khai trong ví dụ này để tập trung vào các tiêu đề và trải rộng và giảm độ phức tạp của ví dụ.

```html
<table>
  <tr>
    <th scope="col" rowspan="2">Symbol</th>
    <th scope="col" rowspan="2">Code word</th>
    <th scope="col" colspan="2">Pronunciation</th>
  </tr>
  <tr>
    <th scope="col">IPA</th>
    <th scope="col">Respelling</th>
  </tr>
  <tr>
    <th scope="row">A</th>
    <td>Alfa</td>
    <td>ˈælfa</td>
    <td>AL fah</td>
  </tr>
  <tr>
    <th scope="row">B</th>
    <td>Bravo</td>
    <td>ˈbraːˈvo</td>
    <td>BRAH voh</td>
  </tr>
  <tr>
    <th scope="row">C</th>
    <td>Charlie</td>
    <td>ˈtʃɑːli</td>
    <td>CHAR lee</td>
  </tr>
  <tr>
    <th scope="row">D</th>
    <td>Delta</td>
    <td>ˈdeltɑ</td>
    <td>DELL tah</td>
  </tr>
</table>
```

#### CSS

CSS không thay đổi so với [ví dụ trước](#basic_column_and_row_headers).

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

th[scope="col"] {
  background-color: #505050;
  color: white;
}

th[scope="row"] {
  background-color: #d6ecd4;
}

tr:nth-of-type(odd) td {
  background-color: #eeeeee;
}
```

#### Kết quả

{{EmbedLiveSample("Column_and_row_spanning", 650, 200)}}

### Liên kết các ô tiêu đề với các ô tiêu đề khác

Đối với các mối quan hệ phức tạp hơn giữa các ô tiêu đề, việc sử dụng các phần tử `th` với thuộc tính [`scope`](#scope) một mình có thể không đủ cho công nghệ hỗ trợ, đặc biệt là trình đọc màn hình.

#### HTML

Để cải thiện {{Glossary("accessibility", "khả năng tiếp cận")}} của [ví dụ trước](#column_and_row_spanning) và cho phép trình đọc màn hình, ví dụ, đọc các tiêu đề liên kết với mỗi ô tiêu đề, thuộc tính [`headers`](#headers) có thể được giới thiệu cùng với các thuộc tính [`id`](/vi/docs/Web/HTML/Reference/Global_attributes/id). Vì cách cột "Pronunciation" được chia thành hai cột trong ví dụ, giới thiệu tiêu đề "hai hàng", công nghệ hỗ trợ như trình đọc màn hình có thể không thể xác định các ô tiêu đề bổ sung (phần tử `th`) nào mà ô tiêu đề "Pronunciation" liên quan đến và ngược lại. Do đó, thuộc tính [`headers`](#headers) được sử dụng trên các ô tiêu đề "Pronunciation", "IPA" và "Respelling" để liên kết các ô tiêu đề liên quan dựa trên các giá trị của các định danh duy nhất từ các thuộc tính [`id`](/vi/docs/Web/HTML/Reference/Global_attributes/id) được thêm ở dạng danh sách phân tách bằng dấu cách.

> [!NOTE]
> Nên sử dụng các giá trị mô tả và hữu ích hơn cho thuộc tính [`id`](/vi/docs/Web/HTML/Reference/Global_attributes/id). Mỗi `id` trong tài liệu phải là duy nhất trong tài liệu đó. Trong ví dụ này, các giá trị `id` là các ký tự đơn để duy trì tập trung vào khái niệm thuộc tính [`headers`](#headers).

```html
<table>
  <tr>
    <th scope="col" rowspan="2">Symbol</th>
    <th scope="col" rowspan="2">Code word</th>
    <th scope="col" colspan="2" id="p" headers="i r">Pronunciation</th>
  </tr>
  <tr>
    <th scope="col" id="i" headers="p">IPA</th>
    <th scope="col" id="r" headers="p">Respelling</th>
  </tr>
  <tr>
    <th scope="row">A</th>
    <td>Alfa</td>
    <td>ˈælfa</td>
    <td>AL fah</td>
  </tr>
  <tr>
    <th scope="row">B</th>
    <td>Bravo</td>
    <td>ˈbraːˈvo</td>
    <td>BRAH voh</td>
  </tr>
  <tr>
    <th scope="row">C</th>
    <td>Charlie</td>
    <td>ˈtʃɑːli</td>
    <td>CHAR lee</td>
  </tr>
  <tr>
    <th scope="row">D</th>
    <td>Delta</td>
    <td>ˈdeltɑ</td>
    <td>DELL tah</td>
  </tr>
</table>
```

#### Kết quả

[Kết quả trực quan](#result_2) không thay đổi so với [bảng ví dụ trước](#column_and_row_spanning).

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
        >, nhưng không có phần tử tiêu đề, chân trang, nội dung phân mục hoặc nội dung tiêu đề.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>
        Thẻ mở là bắt buộc.<br />Thẻ đóng có thể bị bỏ qua nếu nó
        được theo sau ngay bởi phần tử <code>&lt;th&gt;</code> hoặc
        {{HTMLElement("td")}} hoặc nếu không còn dữ liệu nào trong phần tử cha.
      </td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>Phần tử {{HTMLElement("tr")}}.</td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role"><code>columnheader</code></a> hoặc <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowheader_role"><code>rowheader</code></a>
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

- [Học: Kiến thức cơ bản về bảng HTML](/vi/docs/Learn_web_development/Core/Structuring_content/HTML_table_basics)
- {{HTMLElement("caption")}}, {{HTMLElement("col")}}, {{HTMLElement("colgroup")}}, {{HTMLElement("table")}}, {{HTMLElement("tbody")}}, {{HTMLElement("td")}}, {{HTMLElement("tfoot")}}, {{HTMLElement("thead")}}, {{HTMLElement("tr")}}: Các phần tử liên quan đến bảng khác
- {{cssxref("background-color")}}: Thuộc tính CSS để đặt màu nền của mỗi ô tiêu đề
- {{cssxref("border")}}: Thuộc tính CSS để kiểm soát đường viền của các ô tiêu đề
- {{cssxref("height")}}: Thuộc tính CSS để kiểm soát chiều cao ô tiêu đề được khuyến nghị
- {{cssxref("text-align")}}: Thuộc tính CSS để căn chỉnh ngang nội dung mỗi ô tiêu đề
- {{cssxref("vertical-align")}}: Thuộc tính CSS để căn chỉnh dọc nội dung mỗi ô tiêu đề
- {{cssxref("width")}}: Thuộc tính CSS để kiểm soát chiều rộng ô tiêu đề được khuyến nghị
- {{cssxref(":nth-of-type")}}, {{cssxref(":first-of-type")}}, {{cssxref(":last-of-type")}}: Các pseudo-class CSS để chọn các ô tiêu đề mong muốn
