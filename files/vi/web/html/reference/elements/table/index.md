---
title: "<table>: Phần tử Bảng"
slug: Web/HTML/Reference/Elements/table
page-type: html-element
browser-compat: html.elements.table
sidebar: htmlsidebar
---

Phần tử **`<table>`** trong [HTML](/vi/docs/Web/HTML) biểu diễn dữ liệu dạng bảng—tức là thông tin được trình bày trong một bảng hai chiều gồm các hàng và cột chứa dữ liệu.

{{InteractiveExample("HTML Demo: &lt;table&gt;", "tabbed-taller")}}

```html interactive-example
<table>
  <caption>
    Front-end web developer course 2021
  </caption>
  <thead>
    <tr>
      <th scope="col">Person</th>
      <th scope="col">Most interest in</th>
      <th scope="col">Age</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">Chris</th>
      <td>HTML tables</td>
      <td>22</td>
    </tr>
    <tr>
      <th scope="row">Dennis</th>
      <td>Web accessibility</td>
      <td>45</td>
    </tr>
    <tr>
      <th scope="row">Sarah</th>
      <td>JavaScript frameworks</td>
      <td>29</td>
    </tr>
    <tr>
      <th scope="row">Karen</th>
      <td>Web performance</td>
      <td>36</td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <th scope="row" colspan="2">Average age</th>
      <td>33</td>
    </tr>
  </tfoot>
</table>
```

```css interactive-example
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
  font-weight: bold;
}

thead,
tfoot {
  background-color: rgb(228 240 245);
}

th,
td {
  border: 1px solid rgb(160 160 160);
  padding: 8px 10px;
}

td:last-of-type {
  text-align: center;
}

tbody > tr:nth-of-type(even) {
  background-color: rgb(237 238 242);
}

tfoot th {
  text-align: right;
}

tfoot td {
  font-weight: bold;
}
```

## Thuộc tính

Phần tử này bao gồm các [thuộc tính toàn cục](/vi/docs/Web/HTML/Reference/Global_attributes).

### Thuộc tính không còn dùng

Các thuộc tính sau đây đã không còn được dùng và không nên sử dụng. Chúng được ghi lại dưới đây để tham khảo khi cập nhật code hiện có và chỉ vì lý do lịch sử.

- `align` {{deprecated_inline}}
  - : Xác định căn chỉnh ngang của bảng trong phần tử cha của nó. Các giá trị {{Glossary("enumerated")}} có thể là `left`, `center` và `right`. Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("margin-inline-start")}} và {{cssxref("margin-inline-end")}}, vì thuộc tính này đã không còn được dùng.

- `bgcolor` {{deprecated_inline}}
  - : Xác định màu nền của bảng. Giá trị là màu HTML; có thể là [mã RGB thập lục phân 6 chữ số](/vi/docs/Web/CSS/Reference/Values/hex-color), có tiền tố `#`, hoặc một [từ khóa màu](/vi/docs/Web/CSS/Reference/Values/named-color). Các giá trị CSS {{cssxref("&lt;color&gt;")}} khác không được hỗ trợ. Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("background-color")}}, vì thuộc tính này đã không còn được dùng.

- `border` {{deprecated_inline}}
  - : Xác định, dưới dạng giá trị số nguyên không âm (tính bằng pixel), kích thước của khung xung quanh bảng. Nếu đặt thành `0`, thuộc tính [`frame`](#frame) được đặt thành void. Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("border")}}, vì thuộc tính này đã không còn được dùng.

- `cellpadding` {{deprecated_inline}}
  - : Xác định khoảng cách giữa nội dung của ô và đường viền của nó. Thuộc tính này đã lỗi thời: thay vào đó hãy áp dụng thuộc tính CSS {{cssxref("padding")}} cho các phần tử {{HTMLElement("th")}} và {{HTMLElement("td")}}.

- `cellspacing` {{deprecated_inline}}
  - : Xác định kích thước khoảng cách giữa hai ô. Thuộc tính này đã lỗi thời: thay vào đó hãy đặt thuộc tính CSS {{cssxref("border-spacing")}} trên phần tử `<table>`. Lưu ý rằng điều này không có tác dụng nếu thuộc tính CSS {{cssxref("border-collapse")}} của phần tử `<table>` được đặt thành `collapse`.

- `frame` {{deprecated_inline}}
  - : Xác định phía nào của khung xung quanh bảng phải được hiển thị. Các giá trị {{Glossary("enumerated")}} có thể là `void`, `above`, `below`, `hsides`, `vsides`, `lhs`, `rhs`, `box` và `border`. Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("border-style")}} và {{cssxref("border-width")}}, vì thuộc tính này đã không còn được dùng.

- `rules` {{deprecated_inline}}
  - : Xác định nơi hiển thị các quy tắc (đường viền) trong bảng. Các giá trị {{Glossary("enumerated")}} có thể là `none` (giá trị mặc định), `groups` (các phần tử {{HTMLElement("thead")}}, {{HTMLElement("tbody")}} và {{HTMLElement("tfoot")}}), `rows` (đường ngang), `cols` (đường dọc) và `all` (đường viền quanh mỗi ô). Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("border")}} trên các phần tử liên quan đến bảng phù hợp, cũng như trên chính `<table>`, vì thuộc tính này đã không còn được dùng.

- `summary` {{deprecated_inline}}
  - : Xác định văn bản thay thế tóm tắt nội dung của bảng. Thay vào đó hãy sử dụng phần tử {{htmlelement("caption")}}, vì thuộc tính này đã không còn được dùng.

- `width` {{deprecated_inline}}
  - : Xác định chiều rộng của bảng. Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("width")}}, vì thuộc tính này đã không còn được dùng.

    > [!NOTE]
    > Mặc dù không có đặc tả HTML nào bao gồm `height` là thuộc tính của `<table>`, một số trình duyệt hỗ trợ cách diễn giải phi tiêu chuẩn của `height`. Giá trị không có đơn vị đặt chiều cao tuyệt đối tối thiểu tính bằng pixel. Nếu được đặt dưới dạng giá trị phần trăm, chiều cao bảng tối thiểu sẽ tương đối với chiều cao của container cha. Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("min-height")}}, vì thuộc tính này đã không còn được dùng.

## Bố cục trực quan của nội dung bảng

Các phần tử sau là một phần của cấu trúc bảng:

- {{HTMLElement("caption")}}
- {{HTMLElement("thead")}}
- {{HTMLElement("colgroup")}}
- {{HTMLElement("col")}}
- {{HTMLElement("th")}}
- {{HTMLElement("tbody")}}
- {{HTMLElement("tr")}}
- {{HTMLElement("td")}}
- {{HTMLElement("tfoot")}}

Hộp `<table>` thiết lập ngữ cảnh định dạng bảng. Các phần tử bên trong `<table>` tạo ra các hộp hình chữ nhật. Mỗi hộp chiếm một số ô bảng theo các quy tắc sau:

1. Các hộp hàng lấp đầy bảng theo thứ tự mã nguồn từ trên xuống dưới. Mỗi hộp hàng chiếm một hàng ô.
2. Một hộp nhóm hàng chiếm một hoặc nhiều hộp hàng.
3. Các hộp cột được đặt cạnh nhau theo thứ tự mã nguồn. Tùy thuộc vào giá trị của thuộc tính [`dir`](/vi/docs/Web/HTML/Reference/Global_attributes/dir), các cột được bố trí theo hướng trái sang phải hoặc phải sang trái. Một hộp cột chiếm một hoặc nhiều cột ô bảng.
4. Một hộp nhóm cột chiếm một hoặc nhiều hộp cột.
5. Một hộp ô có thể trải rộng nhiều hàng và cột. Tác nhân người dùng cắt ô để phù hợp với số hàng và cột có sẵn.

Các ô bảng có phần đệm. Các hộp tạo nên bảng không có lề.

### Các lớp bảng và độ trong suốt

Để tạo kiểu, các phần tử bảng có thể được coi như đang được đặt trên sáu lớp chồng lên nhau:

![Table element layers](table_element_layers.png)

Nền được đặt trên một phần tử trong một lớp sẽ chỉ hiển thị nếu các lớp phía trên nó có nền trong suốt. Một ô bị thiếu được hiển thị như thể một hộp ô bảng ẩn danh chiếm vị trí đó.

## Khả năng tiếp cận

### Chú thích

Bằng cách cung cấp phần tử {{HTMLElement("caption")}} có giá trị mô tả rõ ràng và ngắn gọn mục đích của bảng, nó giúp mọi người quyết định xem họ có cần kiểm tra phần còn lại của nội dung bảng hay bỏ qua không.

Điều này giúp ích cho những người điều hướng bằng công nghệ hỗ trợ như trình đọc màn hình, những người bị khiếm thị và những người có vấn đề về nhận thức.

- [MDN Thêm chú thích cho bảng bằng \<caption>](/vi/docs/Learn_web_development/Core/Structuring_content/Table_accessibility#adding_a_caption_to_your_table_with_caption)
- [Caption & Summary • Tables • W3C WAI Web Accessibility Tutorials](https://www.w3.org/WAI/tutorials/tables/caption-summary/)

### Xác định phạm vi hàng và cột

Thuộc tính [`scope`](/vi/docs/Web/HTML/Reference/Elements/th#scope) trên các ô tiêu đề (phần tử {{HTMLElement("th")}}) là dư thừa trong các ngữ cảnh đơn giản, vì phạm vi được suy ra. Tuy nhiên, một số công nghệ hỗ trợ có thể không suy ra chính xác, vì vậy việc chỉ định phạm vi tiêu đề có thể cải thiện trải nghiệm người dùng. Trong các bảng phức tạp, [`scope`](/vi/docs/Web/HTML/Reference/Elements/th#scope) có thể được chỉ định để cung cấp thông tin cần thiết về các ô liên quan đến tiêu đề.

- [Hướng dẫn khả năng tiếp cận bảng MDN](/vi/docs/Learn_web_development/Core/Structuring_content/Table_accessibility)
- [Tables with two headers • Tables • W3C WAI Web Accessibility Tutorials](https://www.w3.org/WAI/tutorials/tables/two-headers/)
- [Tables with irregular headers • Tables • W3C WAI Web Accessibility Tutorials](https://www.w3.org/WAI/tutorials/tables/irregular/)
- [H63: Using the scope attribute to associate header cells and data cells in data tables | W3C Techniques for WCAG 2.0](https://www.w3.org/TR/WCAG20-TECHS/H63.html)

### Bảng phức tạp

Công nghệ hỗ trợ như trình đọc màn hình có thể gặp khó khăn khi phân tích các bảng quá phức tạp đến mức các ô tiêu đề không thể liên kết theo hướng ngang hoặc dọc nghiêm ngặt. Điều này thường được biểu hiện qua sự hiện diện của các thuộc tính [`colspan`](/vi/docs/Web/HTML/Reference/Elements/td#colspan) và [`rowspan`](/vi/docs/Web/HTML/Reference/Elements/td#rowspan).

Nếu có thể, hãy xem xét các cách trình bày nội dung bảng thay thế, bao gồm chia nó thành một tập hợp các bảng nhỏ hơn có liên quan mà không cần dựa vào các thuộc tính [`colspan`](/vi/docs/Web/HTML/Reference/Elements/td#colspan) và [`rowspan`](/vi/docs/Web/HTML/Reference/Elements/td#rowspan). Ngoài việc giúp những người sử dụng công nghệ hỗ trợ hiểu nội dung bảng, điều này cũng có thể có lợi cho những người có vấn đề về nhận thức có thể gặp khó khăn khi hiểu các liên kết mà bố cục bảng đang mô tả.

Nếu bảng không thể chia nhỏ, hãy sử dụng kết hợp thuộc tính [`id`](/vi/docs/Web/HTML/Reference/Global_attributes/id) và [`headers`](/vi/docs/Web/HTML/Reference/Elements/td#headers) để liên kết theo chương trình mỗi ô bảng với tiêu đề (các phần tử {{HTMLElement("th")}}) mà ô đó liên kết với.

- [Hướng dẫn khả năng tiếp cận bảng MDN](/vi/docs/Learn_web_development/Core/Structuring_content/Table_accessibility)
- [Tables with multi-level headers • Tables • W3C WAI Web Accessibility Tutorials](https://www.w3.org/WAI/tutorials/tables/multi-level/)
- [H43: Using id and headers attributes to associate data cells with header cells in data tables | Techniques for W3C WCAG 2.0](https://www.w3.org/TR/WCAG20-TECHS/H43.html)

## Ví dụ

Các ví dụ dưới đây bao gồm các bảng với độ phức tạp tăng dần. Xem thêm hướng dẫn dành cho người mới bắt đầu [Tạo kiểu bảng](/vi/docs/Learn_web_development/Core/Styling_basics/Tables) để biết thông tin về tạo kiểu bảng bao gồm các kỹ thuật phổ biến, hữu ích.

Vì cấu trúc của `<table>` liên quan đến việc sử dụng nhiều phần tử HTML liên quan đến bảng cùng với các thuộc tính liên quan, các ví dụ sau đây nhằm cung cấp giải thích đơn giản bao gồm những điều cơ bản và tiêu chuẩn phổ biến. Thông tin bổ sung và chi tiết hơn có thể được tìm thấy trên các trang được liên kết tương ứng.

Các ví dụ bảng này minh họa cách tạo bảng {{Glossary("accessibility", "dễ tiếp cận")}} được cấu trúc bằng HTML và tạo kiểu bằng [CSS](/vi/docs/Web/CSS).

Vì cách cấu trúc bảng HTML, {{Glossary("markup", "markup")}} có thể nhanh chóng phát triển. Vì lý do này, điều quan trọng là phải xác định rõ ràng mục đích và giao diện cuối cùng của bảng để tạo ra cấu trúc phù hợp. Cấu trúc logic được phát triển với {{Glossary("semantics", "markup ngữ nghĩa")}} không chỉ dễ tạo kiểu hơn mà còn cho phép tạo các bảng hữu ích và dễ tiếp cận mà mọi người đều có thể hiểu và điều hướng, bao gồm cả công cụ tìm kiếm và người dùng công nghệ hỗ trợ.

Ví dụ đầu tiên là cơ bản, với các ví dụ tiếp theo tăng dần độ phức tạp. Đầu tiên, chúng ta sẽ phát triển một cấu trúc bảng HTML rất cơ bản. Hai ví dụ đầu tiên không chứa nhóm phần bảng như đầu, thân hoặc chân được xác định, và không có ô trải rộng hoặc mối quan hệ ô được xác định rõ ràng. Không có chú thích nào được cung cấp. Khi chúng ta làm việc qua các ví dụ, chúng sẽ được cải thiện dần để bao gồm tất cả các tính năng bảng mà một bảng dữ liệu phức tạp nên có.

### Bảng cơ bản

Ví dụ này bao gồm một bảng _rất_ cơ bản với ba hàng và hai cột. Để minh họa kiểu bảng trình duyệt mặc định, không có CSS nào được bao gồm trong ví dụ này.

#### HTML

Các hàng bảng được xác định bằng các phần tử {{HTMLElement("tr")}}, và các cột được xác định bằng các ô tiêu đề và dữ liệu bảng trong đó. Hàng đầu tiên chứa các ô tiêu đề (phần tử {{HTMLElement("th")}}) đóng vai trò là tiêu đề cột cho các ô dữ liệu (phần tử {{HTMLElement("td")}}). Mỗi phần tử ({{HTMLElement("th")}} hoặc {{HTMLElement("td")}}) trên mỗi hàng ở trong cột tương ứng của nó—tức là phần tử đầu tiên của một hàng ở trong cột đầu tiên, và phần tử thứ hai của hàng đó ở trong cột thứ hai.

```html
<table>
  <tr>
    <th>Name</th>
    <th>Age</th>
  </tr>
  <tr>
    <td>Maria Sanchez</td>
    <td>28</td>
  </tr>
  <tr>
    <td>Michael Johnson</td>
    <td>34</td>
  </tr>
</table>
```

#### Kết quả

Không có [CSS](/vi/docs/Web/CSS) tùy chỉnh hay [stylesheet người dùng](/vi/docs/Web/CSS/Guides/Cascade/Introduction#author_stylesheets) nào được áp dụng cho bảng này. Kết quả tạo kiểu hoàn toàn đến từ [stylesheet của tác nhân người dùng](/vi/docs/Web/CSS/Guides/Cascade/Introduction#user-agent_stylesheets).

{{EmbedLiveSample('Basic_table', 650, 80)}}

### Bảng mở rộng với các ô tiêu đề

Ví dụ này mở rộng [bảng cơ bản](#basic_table), mở rộng nội dung và thêm các kiểu CSS cơ bản.

#### HTML

Bảng bây giờ gồm bốn hàng (phần tử {{HTMLElement("tr")}}), mỗi hàng có bốn cột. Hàng đầu tiên là hàng các ô tiêu đề (hàng đầu tiên chỉ chứa các phần tử {{HTMLElement("th")}}). Các hàng tiếp theo bao gồm một cột tiêu đề (phần tử {{HTMLElement("th")}} là phần tử con đầu tiên của mỗi hàng) và ba cột dữ liệu (phần tử {{HTMLElement("td")}}). Vì các phần tử phân mục bảng không được sử dụng, trình duyệt tự động xác định cấu trúc nhóm nội dung, tức là tất cả các hàng được bọc trong phần thân bảng của một phần tử {{HTMLElement("tbody")}} ngầm định.

```html
<table>
  <tr>
    <th>Name</th>
    <th>ID</th>
    <th>Member Since</th>
    <th>Balance</th>
  </tr>
  <tr>
    <th>Margaret Nguyen</th>
    <td>427311</td>
    <td><time datetime="2010-06-03">June 3, 2010</time></td>
    <td>0.00</td>
  </tr>
  <tr>
    <th>Edvard Galinski</th>
    <td>533175</td>
    <td><time datetime="2011-01-13">January 13, 2011</time></td>
    <td>37.00</td>
  </tr>
  <tr>
    <th>Hoshi Nakamura</th>
    <td>601942</td>
    <td><time datetime="2012-07-23">July 23, 2012</time></td>
    <td>15.00</td>
  </tr>
</table>
```

#### CSS

Với CSS, chúng ta cung cấp kiểu cơ bản để tạo đường kẻ xung quanh các thành phần của bảng để làm rõ hơn cấu trúc dữ liệu. CSS thêm đường viền đặc xung quanh `<table>` và quanh mỗi ô bảng, bao gồm cả những ô được chỉ định bằng các phần tử {{HTMLElement("th")}} và {{HTMLElement("td")}}, phân định mỗi ô tiêu đề và dữ liệu.

```css
table {
  border: 2px solid rgb(140 140 140);
}

th,
td {
  border: 1px solid rgb(160 160 160);
}
```

#### Kết quả

{{EmbedLiveSample("Expanded_table_with_header_cells", 650, 110)}}

### Xác định mối quan hệ ô bảng

Trước khi tiến đến mở rộng bảng theo những cách nâng cao hơn, nên cải thiện {{Glossary("accessibility", "khả năng tiếp cận")}} bằng cách xác định mối quan hệ giữa các ô tiêu đề và dữ liệu (phần tử {{HTMLElement("th")}} và {{HTMLElement("td")}}).

#### HTML

Điều này được thực hiện bằng cách giới thiệu thuộc tính [`scope`](/vi/docs/Web/HTML/Reference/Elements/th#scope) trên các phần tử {{HTMLElement("th")}} và đặt giá trị tương ứng là `col` (cột) hoặc `row` (hàng).

```html
<table>
  <tr>
    <th scope="col">Name</th>
    <th scope="col">ID</th>
    <th scope="col">Member Since</th>
    <th scope="col">Balance</th>
  </tr>
  <tr>
    <th scope="row">Margaret Nguyen</th>
    <td>427311</td>
    <td><time datetime="2010-06-03">June 3, 2010</time></td>
    <td>0.00</td>
  </tr>
  <tr>
    <th scope="row">Edvard Galinski</th>
    <td>533175</td>
    <td><time datetime="2011-01-13">January 13, 2011</time></td>
    <td>37.00</td>
  </tr>
  <tr>
    <th scope="row">Hoshi Nakamura</th>
    <td>601942</td>
    <td><time datetime="2012-07-23">July 23, 2012</time></td>
    <td>15.00</td>
  </tr>
</table>
```

CSS và kết quả trực quan không thay đổi—sự điều chỉnh cung cấp thông tin ngữ cảnh có giá trị cho công nghệ hỗ trợ như trình đọc màn hình để giúp xác định các ô liên quan đến tiêu đề.

> [!NOTE]
> Nếu cấu trúc bảng thậm chí còn phức tạp hơn, việc (bổ sung) sử dụng thuộc tính [`headers`](/vi/docs/Web/HTML/Reference/Elements/th#headers) trên các phần tử {{HTMLElement("th")}} và {{HTMLElement("td")}} có thể cải thiện khả năng tiếp cận và giúp công nghệ hỗ trợ xác định mối quan hệ giữa các ô; xem [Bảng phức tạp](#complicated_tables).

### Chỉ định rõ ràng nhóm phần bảng

Ngoài việc cải thiện khả năng tiếp cận bằng cách [xác định mối quan hệ ô](#specifying_table_cell_relations), {{Glossary("semantics", "ngữ nghĩa")}} của bảng có thể được cải thiện bằng cách giới thiệu các nhóm phần bảng.

#### HTML

Vì hàng đầu tiên (phần tử {{HTMLElement("tr")}}) chỉ chứa các ô tiêu đề cột và cung cấp tiêu đề cho phần còn lại của nội dung bảng, nó có thể được bọc trong phần tử {{HTMLElement("thead")}} để chỉ định rõ ràng hàng đó là phần đầu của bảng. Hơn nữa, những gì trình duyệt tự động thực hiện cũng có thể được xác định rõ ràng—phần thân của bảng, chứa dữ liệu chính của bảng, được xác định bằng cách bọc các hàng tương ứng trong phần tử {{HTMLElement("tbody")}}. Việc sử dụng rõ ràng phần tử {{HTMLElement("tbody")}} giúp trình duyệt tạo ra cấu trúc bảng đúng như ý định, tránh các kết quả không mong muốn.

```html
<table>
  <thead>
    <tr>
      <th scope="col">Name</th>
      <th scope="col">ID</th>
      <th scope="col">Member Since</th>
      <th scope="col">Balance</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">Margaret Nguyen</th>
      <td>427311</td>
      <td><time datetime="2010-06-03">June 3, 2010</time></td>
      <td>0.00</td>
    </tr>
    <tr>
      <th scope="row">Edvard Galinski</th>
      <td>533175</td>
      <td><time datetime="2011-01-13">January 13, 2011</time></td>
      <td>37.00</td>
    </tr>
    <tr>
      <th scope="row">Hoshi Nakamura</th>
      <td>601942</td>
      <td><time datetime="2012-07-23">July 23, 2012</time></td>
      <td>15.00</td>
    </tr>
  </tbody>
</table>
```

Một lần nữa, CSS và kết quả trực quan không thay đổi—việc chỉ định các nhóm phần bảng như vậy cung cấp thông tin ngữ cảnh có giá trị cho công nghệ hỗ trợ, bao gồm trình đọc màn hình và công cụ tìm kiếm, cũng như để tạo kiểu trong CSS, sẽ được trình bày trong ví dụ sau.

### Trải rộng cột và hàng

Trong ví dụ này, chúng ta mở rộng bảng hơn nữa bằng cách thêm một cột và giới thiệu phần đầu nhiều hàng.

#### HTML

Dựa trên bảng được tạo cho đến nay, một cột mới cho "Ngày kết thúc Thành viên" được thêm vào mỗi hàng thân bằng phần tử {{HTMLElement("td")}}. Một hàng bổ sung (phần tử {{HTMLElement("tr")}}) cũng được thêm vào trong phần đầu (phần tử {{HTMLElement("thead")}}) để giới thiệu tiêu đề "Ngày Thành viên" như một tiêu đề cho các cột "Tham gia" và "Hủy".

Việc tạo hàng tiêu đề thứ hai liên quan đến việc thêm thuộc tính [`colspan`](/vi/docs/Web/HTML/Reference/Elements/th#colspan) và [`rowspan`](/vi/docs/Web/HTML/Reference/Elements/th#rowspan) vào các phần tử {{HTMLElement("th")}} để phân bổ các ô tiêu đề vào đúng cột và hàng.

```html
<table>
  <thead>
    <tr>
      <th scope="col" rowspan="2">Name</th>
      <th scope="col" rowspan="2">ID</th>
      <th scope="col" colspan="2">Membership Dates</th>
      <th scope="col" rowspan="2">Balance</th>
    </tr>
    <tr>
      <th scope="col">Joined</th>
      <th scope="col">Canceled</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">Margaret Nguyen</th>
      <td>427311</td>
      <td><time datetime="2010-06-03">June 3, 2010</time></td>
      <td>n/a</td>
      <td>0.00</td>
    </tr>
    <tr>
      <th scope="row">Edvard Galinski</th>
      <td>533175</td>
      <td><time datetime="2011-01-13">January 13, 2011</time></td>
      <td><time datetime="2017-04-08">April 8, 2017</time></td>
      <td>37.00</td>
    </tr>
    <tr>
      <th scope="row">Hoshi Nakamura</th>
      <td>601942</td>
      <td><time datetime="2012-07-23">July 23, 2012</time></td>
      <td>n/a</td>
      <td>15.00</td>
    </tr>
  </tbody>
</table>
```

```css hidden
table {
  border: 2px solid rgb(140 140 140);
}

th,
td {
  border: 1px solid rgb(160 160 160);
}
```

#### Kết quả

{{EmbedLiveSample("Column_and_row_spanning", 650, 130)}}

Phần đầu bây giờ có hai hàng, một hàng với các tiêu đề (phần tử {{HTMLElement("th")}}) "Name", "ID", "Membership Dates" và "Balance", và một tiêu đề "Membership Dates" với hai tiêu đề con trong hàng thứ hai: "Joined" và "Canceled". Điều này được thực hiện bằng:

- Các ô tiêu đề "Name", "ID" và "Balance" của hàng đầu tiên trải rộng cả hai hàng tiêu đề bảng bằng cách sử dụng thuộc tính [`rowspan`](/vi/docs/Web/HTML/Reference/Elements/th#rowspan), làm cho mỗi ô cao hai hàng.
- Ô tiêu đề "Membership Dates" của hàng đầu tiên trải rộng hai cột bằng cách sử dụng thuộc tính [`colspan`](/vi/docs/Web/HTML/Reference/Elements/th#colspan), khiến nó rộng hai cột.
- Hàng thứ hai chỉ chứa hai ô tiêu đề "Joined" và "Canceled" vì ba cột còn lại được hợp nhất với các ô ở hàng đầu tiên trải rộng hai hàng. Hai ô tiêu đề được định vị đúng dưới tiêu đề "Membership Dates".

### Chú thích bảng và tóm tắt cột

Đây là thực hành phổ biến và đáng khuyến khích khi cung cấp tóm tắt cho nội dung bảng, cho phép người dùng nhanh chóng xác định mức độ liên quan của bảng. Hơn nữa, cột "Balance" được tóm tắt bằng cách hiển thị tổng số dư của từng thành viên.

#### HTML

Tóm tắt bảng được thêm bằng cách sử dụng [chú thích](#captions) bảng (phần tử {{HTMLElement("caption")}}) làm phần tử con đầu tiên của `<table>`. Chú thích cung cấp {{glossary("accessible name")}} hoặc {{glossary("accessible description")}} cho bảng.

Cuối cùng, phần chân bảng (phần tử {{HTMLElement("tfoot")}}) được thêm vào bên dưới phần thân, với một hàng tóm tắt cột "Balance" bằng cách hiển thị tổng. Các phần tử và thuộc tính được giới thiệu trước đó được áp dụng.

```html
<table>
  <caption>
    Status of the club members 2021
  </caption>
  <thead>
    <tr>
      <th scope="col" rowspan="2">Name</th>
      <th scope="col" rowspan="2">ID</th>
      <th scope="col" colspan="2">Membership Dates</th>
      <th scope="col" rowspan="2">Balance</th>
    </tr>
    <tr>
      <th scope="col">Joined</th>
      <th scope="col">Canceled</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">Margaret Nguyen</th>
      <td>427311</td>
      <td><time datetime="2010-06-03">June 3, 2010</time></td>
      <td>n/a</td>
      <td>0.00</td>
    </tr>
    <tr>
      <th scope="row">Edvard Galinski</th>
      <td>533175</td>
      <td><time datetime="2011-01-13">January 13, 2011</time></td>
      <td><time datetime="2017-04-08">April 8, 2017</time></td>
      <td>37.00</td>
    </tr>
    <tr>
      <th scope="row">Hoshi Nakamura</th>
      <td>601942</td>
      <td><time datetime="2012-07-23">July 23, 2012</time></td>
      <td>n/a</td>
      <td>15.00</td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <th scope="row" colspan="4">Total balance</th>
      <td>52.00</td>
    </tr>
  </tfoot>
</table>
```

```css hidden
table {
  border: 2px solid rgb(140 140 140);
}

th,
td {
  border: 1px solid rgb(160 160 160);
}
```

#### Kết quả

{{EmbedLiveSample("Table_caption_and_column_summary", 650, 180)}}

### Tạo kiểu bảng cơ bản

Hãy áp dụng kiểu cơ bản cho bảng để điều chỉnh font chữ và thêm {{cssxref("background-color")}} cho các hàng đầu và chân. HTML lần này không thay đổi, vì vậy hãy đi thẳng vào CSS.

```html hidden
<table>
  <caption>
    Status of the club members 2021
  </caption>
  <thead>
    <tr>
      <th scope="col" rowspan="2">Name</th>
      <th scope="col" rowspan="2">ID</th>
      <th scope="col" colspan="2">Membership Dates</th>
      <th scope="col" rowspan="2">Balance</th>
    </tr>
    <tr>
      <th scope="col">Joined</th>
      <th scope="col">Canceled</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">Margaret Nguyen</th>
      <td>427311</td>
      <td><time datetime="2010-06-03">June 3, 2010</time></td>
      <td>n/a</td>
      <td>0.00</td>
    </tr>
    <tr>
      <th scope="row">Edvard Galinski</th>
      <td>533175</td>
      <td><time datetime="2011-01-13">January 13, 2011</time></td>
      <td><time datetime="2017-04-08">April 8, 2017</time></td>
      <td>37.00</td>
    </tr>
    <tr>
      <th scope="row">Hoshi Nakamura</th>
      <td>601942</td>
      <td><time datetime="2012-07-23">July 23, 2012</time></td>
      <td>n/a</td>
      <td>15.00</td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <th scope="row" colspan="4">Total balance</th>
      <td>52.00</td>
    </tr>
  </tfoot>
</table>
```

#### CSS

Trong khi thuộc tính {{cssxref("font")}} được thêm vào phần tử `<table>` ở đây để đặt font chữ hấp dẫn hơn, phần thú vị là kiểu thứ hai, trong đó các phần tử {{HTMLElement("tr")}} nằm trong {{HTMLElement("thead")}} và {{HTMLElement("tfoot")}} được tạo kiểu thêm màu nền xanh nhạt {{cssxref("background-color")}}. Đây là cách nhanh chóng để áp dụng màu nền cho tất cả các ô trong các phần cụ thể cùng một lúc.

```css
table {
  border: 2px solid rgb(140 140 140);
  font:
    16px "Open Sans",
    "Helvetica",
    "Arial",
    sans-serif;
}

thead > tr,
tfoot > tr {
  background-color: rgb(228 240 245);
}

th,
td {
  border: 1px solid rgb(160 160 160);
}
```

#### Kết quả

{{EmbedLiveSample("Basic_table_styling", 650, 180)}}

### Tạo kiểu bảng nâng cao

Bây giờ chúng ta sẽ đi hết, với kiểu trên các hàng trong vùng đầu và thân, bao gồm màu hàng xen kẽ, các ô có màu khác nhau tùy thuộc vào vị trí trong hàng, v.v. Hãy xem kết quả trước lần này.

#### Kết quả

Đây là giao diện bảng cuối cùng sẽ trông như thế nào:

{{EmbedLiveSample("Advanced_table_styling", 650, 210)}}

Không có thay đổi nào đối với HTML. Hãy xem những gì chuẩn bị HTML cấu trúc đúng có thể làm?

```html hidden
<table>
  <caption>
    Status of the club members 2021
  </caption>
  <thead>
    <tr>
      <th scope="col" rowspan="2">Name</th>
      <th scope="col" rowspan="2">ID</th>
      <th scope="col" colspan="2">Membership Dates</th>
      <th scope="col" rowspan="2">Balance</th>
    </tr>
    <tr>
      <th scope="col">Joined</th>
      <th scope="col">Canceled</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">Margaret Nguyen</th>
      <td>427311</td>
      <td><time datetime="2010-06-03">June 3, 2010</time></td>
      <td>n/a</td>
      <td>0.00</td>
    </tr>
    <tr>
      <th scope="row">Edvard Galinski</th>
      <td>533175</td>
      <td><time datetime="2011-01-13">January 13, 2011</time></td>
      <td><time datetime="2017-04-08">April 8, 2017</time></td>
      <td>37.00</td>
    </tr>
    <tr>
      <th scope="row">Hoshi Nakamura</th>
      <td>601942</td>
      <td><time datetime="2012-07-23">July 23, 2012</time></td>
      <td>n/a</td>
      <td>15.00</td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <th scope="row" colspan="4">Total balance</th>
      <td>52.00</td>
    </tr>
  </tfoot>
</table>
```

#### CSS

CSS lần này phức tạp hơn nhiều. Không phức tạp, nhưng có nhiều thứ đang xảy ra. Hãy phân tích nó.

Ở đây các thuộc tính {{CSSxRef("border-collapse")}} và {{CSSxRef("border-spacing")}} được thêm vào để loại bỏ khoảng cách giữa các ô và thu gọn các đường viền tiếp xúc với nhau thành một đường viền duy nhất thay vì kết thúc với đường viền đôi. Ngoài ra, {{HTMLElement("caption")}} được đặt ở `bottom` của bảng bằng thuộc tính {{CSSxRef("caption-side")}}:

```css
table {
  border-collapse: collapse;
  border-spacing: 0;
  border: 2px solid rgb(140 140 140);
  font:
    16px "Open Sans",
    "Helvetica",
    "Arial",
    sans-serif;
}

caption {
  caption-side: bottom;
  padding: 10px;
  font-weight: bold;
}
```

Tiếp theo, thuộc tính {{CSSxRef("padding")}} được sử dụng để cung cấp cho tất cả các ô bảng khoảng trống xung quanh nội dung của chúng. Thuộc tính {{CSSxRef("vertical-align")}} căn chỉnh nội dung của các ô tiêu đề xuống `bottom` của ô, có thể thấy ở các ô trong đầu trải rộng hai hàng:

```css
th,
td {
  border: 1px solid rgb(160 160 160);
  padding: 4px 6px;
}

th {
  vertical-align: bottom;
}
```

Quy tắc CSS tiếp theo đặt {{cssxref("background-color")}} của tất cả các phần tử {{HTMLElement("tr")}} trong đầu bảng (được chỉ định bằng {{HTMLElement("thead")}}). Sau đó đường viền dưới cùng của đầu được đặt là một đường rộng hai pixel. Tuy nhiên, lưu ý rằng chúng ta đang sử dụng selector {{CSSxRef(":nth-of-type")}} để áp dụng thuộc tính {{CSSxRef("border-bottom")}} cho hàng _thứ hai_ trong đầu. Tại sao? Vì đầu được tạo từ hai hàng mà một số ô trải rộng. Điều đó có nghĩa là thực sự có hai hàng ở đó; áp dụng kiểu cho hàng đầu tiên sẽ không cho chúng ta kết quả như mong đợi:

```css
thead > tr {
  background-color: rgb(228 240 245);
}

thead > tr:nth-of-type(2) {
  border-bottom: 2px solid rgb(140 140 140);
}
```

Hãy tạo kiểu hai ô tiêu đề "Joined" và "Canceled" với màu xanh lá cây và đỏ để biểu thị "tốt" của thành viên mới và "đáng tiếc" của thành viên hủy. Ở đây chúng ta đào vào hàng cuối cùng của phần đầu bảng bằng selector {{CSSxRef(":last-of-type")}} và cho ô tiêu đề đầu tiên trong đó (tiêu đề "Joined") màu xanh lá cây, và ô tiêu đề thứ hai trong đó (tiêu đề "Canceled") màu đỏ:

```css
thead > tr:last-of-type > th:nth-of-type(1) {
  background-color: rgb(225 255 225);
}

thead > tr:last-of-type > th:nth-of-type(2) {
  background-color: rgb(255 225 225);
}
```

Vì cột đầu tiên cũng cần nổi bật, một số kiểu tùy chỉnh cũng được thêm vào đây. Quy tắc CSS này tạo kiểu ô tiêu đề đầu tiên trong mỗi hàng của phần thân bảng bằng thuộc tính {{CSSxRef("text-align")}} để căn trái tên thành viên, và bằng {{cssxref("background-color")}} hơi khác:

```css
tbody > tr > th:first-of-type {
  text-align: left;
  background-color: rgb(225 229 244);
}
```

Thường thường, người ta cải thiện khả năng đọc của dữ liệu bảng bằng cách xen kẽ màu hàng—đôi khi được gọi là "sọc ngựa vằn". Hãy thêm một chút {{cssxref("background-color")}} cho mỗi hàng chẵn:

```css
tbody > tr:nth-of-type(even) {
  background-color: rgb(237 238 242);
}
```

Vì là thực hành tiêu chuẩn khi căn phải các giá trị tiền tệ trong bảng, hãy làm điều đó ở đây. Điều này chỉ đặt thuộc tính {{CSSxRef("text-align")}} cho {{HTMLElement("td")}} cuối cùng trong mỗi hàng thân thành `right`:

```css
tbody > tr > td:last-of-type {
  text-align: right;
}
```

Cuối cùng, một số kiểu tương tự như đầu được áp dụng cho phần chân bảng để làm nó nổi bật:

```css
tfoot > tr {
  border-top: 2px dashed rgb(140 140 140);
  background-color: rgb(228 240 245);
}

tfoot th,
tfoot td {
  text-align: right;
  font-weight: bold;
}
```

### Hiển thị bảng lớn trong không gian nhỏ

Một vấn đề phổ biến với bảng trên web là chúng không hoạt động tốt trên màn hình nhỏ khi lượng nội dung lớn, và cách làm cho chúng có thể cuộn không rõ ràng, đặc biệt khi markup có thể đến từ CMS và không thể sửa đổi để có wrapper.

Ví dụ này cung cấp một cách hiển thị bảng trong không gian nhỏ. Chúng ta đã ẩn nội dung HTML vì nó rất lớn và không có gì đáng chú ý về nó. CSS hữu ích hơn để kiểm tra trong ví dụ này.

```html hidden
<table>
  <thead>
    <tr>
      <th>1<sup>3</sup> equals:</th>
      <th>2<sup>3</sup> equals:</th>
      <th>3<sup>3</sup> equals:</th>
      <th>4<sup>3</sup> equals:</th>
      <th>5<sup>3</sup> equals:</th>
      <th>6<sup>3</sup> equals:</th>
      <th>7<sup>3</sup> equals:</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>row 1: 1</td>
      <td>row 1: 8</td>
      <td>row 1: 27</td>
      <td>row 1: 64</td>
      <td>row 1: 125</td>
      <td>row 1: 216</td>
      <td>row 1: 343</td>
    </tr>
    <tr>
      <td>row 2: 1</td>
      <td>row 2: 8</td>
      <td>row 2: 27</td>
      <td>row 2: 64</td>
      <td>row 2: 125</td>
      <td>row 2: 216</td>
      <td>row 2: 343</td>
    </tr>
    <tr>
      <td>row 3: 1</td>
      <td>row 3: 8</td>
      <td>row 3: 27</td>
      <td>row 3: 64</td>
      <td>row 3: 125</td>
      <td>row 3: 216</td>
      <td>row 3: 343</td>
    </tr>
    <tr>
      <td>row 4: 1</td>
      <td>row 4: 8</td>
      <td>row 4: 27</td>
      <td>row 4: 64</td>
      <td>row 4: 125</td>
      <td>row 4: 216</td>
      <td>row 4: 343</td>
    </tr>
    <tr>
      <td>row 5: 1</td>
      <td>row 5: 8</td>
      <td>row 5: 27</td>
      <td>row 5: 64</td>
      <td>row 5: 125</td>
      <td>row 5: 216</td>
      <td>row 5: 343</td>
    </tr>
    <tr>
      <td>row 6: 1</td>
      <td>row 6: 8</td>
      <td>row 6: 27</td>
      <td>row 6: 64</td>
      <td>row 6: 125</td>
      <td>row 6: 216</td>
      <td>row 6: 343</td>
    </tr>
    <tr>
      <td>row 7: 1</td>
      <td>row 7: 8</td>
      <td>row 7: 27</td>
      <td>row 7: 64</td>
      <td>row 7: 125</td>
      <td>row 7: 216</td>
      <td>row 7: 343</td>
    </tr>
    <tr>
      <td>row 8: 1</td>
      <td>row 8: 8</td>
      <td>row 8: 27</td>
      <td>row 8: 64</td>
      <td>row 8: 125</td>
      <td>row 8: 216</td>
      <td>row 8: 343</td>
    </tr>
    <tr>
      <td>row 9: 1</td>
      <td>row 9: 8</td>
      <td>row 9: 27</td>
      <td>row 9: 64</td>
      <td>row 9: 125</td>
      <td>row 9: 216</td>
      <td>row 9: 343</td>
    </tr>
    <tr>
      <td>row 10: 1</td>
      <td>row 10: 8</td>
      <td>row 10: 27</td>
      <td>row 10: 64</td>
      <td>row 10: 125</td>
      <td>row 10: 216</td>
      <td>row 10: 343</td>
    </tr>
    <tr>
      <td>row 11: 1</td>
      <td>row 11: 8</td>
      <td>row 11: 27</td>
      <td>row 11: 64</td>
      <td>row 11: 125</td>
      <td>row 11: 216</td>
      <td>row 11: 343</td>
    </tr>
    <tr>
      <td>row 12: 1</td>
      <td>row 12: 8</td>
      <td>row 12: 27</td>
      <td>row 12: 64</td>
      <td>row 12: 125</td>
      <td>row 12: 216</td>
      <td>row 12: 343</td>
    </tr>
    <tr>
      <td>row 13: 1</td>
      <td>row 13: 8</td>
      <td>row 13: 27</td>
      <td>row 13: 64</td>
      <td>row 13: 125</td>
      <td>row 13: 216</td>
      <td>row 13: 343</td>
    </tr>
    <tr>
      <td>row 14: 1</td>
      <td>row 14: 8</td>
      <td>row 14: 27</td>
      <td>row 14: 64</td>
      <td>row 14: 125</td>
      <td>row 14: 216</td>
      <td>row 14: 343</td>
    </tr>
    <tr>
      <td>row 15: 1</td>
      <td>row 15: 8</td>
      <td>row 15: 27</td>
      <td>row 15: 64</td>
      <td>row 15: 125</td>
      <td>row 15: 216</td>
      <td>row 15: 343</td>
    </tr>
    <tr>
      <td>row 16: 1</td>
      <td>row 16: 8</td>
      <td>row 16: 27</td>
      <td>row 16: 64</td>
      <td>row 16: 125</td>
      <td>row 16: 216</td>
      <td>row 16: 343</td>
    </tr>
    <tr>
      <td>row 17: 1</td>
      <td>row 17: 8</td>
      <td>row 17: 27</td>
      <td>row 17: 64</td>
      <td>row 17: 125</td>
      <td>row 17: 216</td>
      <td>row 17: 343</td>
    </tr>
    <tr>
      <td>row 18: 1</td>
      <td>row 18: 8</td>
      <td>row 18: 27</td>
      <td>row 18: 64</td>
      <td>row 18: 125</td>
      <td>row 18: 216</td>
      <td>row 18: 343</td>
    </tr>
    <tr>
      <td>row 19: 1</td>
      <td>row 19: 8</td>
      <td>row 19: 27</td>
      <td>row 19: 64</td>
      <td>row 19: 125</td>
      <td>row 19: 216</td>
      <td>row 19: 343</td>
    </tr>
    <tr>
      <td>row 20: 1</td>
      <td>row 20: 8</td>
      <td>row 20: 27</td>
      <td>row 20: 64</td>
      <td>row 20: 125</td>
      <td>row 20: 216</td>
      <td>row 20: 343</td>
    </tr>
  </tbody>
</table>
```

#### CSS

Khi nhìn vào các kiểu này, bạn sẽ nhận thấy thuộc tính {{cssxref("display")}} của bảng đã được đặt thành `block`. Mặc dù điều này cho phép cuộn, bảng mất đi một phần tính toàn vẹn, và các ô bảng cố gắng trở nên nhỏ nhất có thể. Để giảm thiểu vấn đề này, chúng ta đã đặt {{cssxref("white-space")}} thành `nowrap` trên {{HTMLElement("tbody")}}. Tuy nhiên, chúng ta không làm điều này cho {{HTMLElement("thead")}} để tránh các tiêu đề dài buộc các cột rộng hơn cần thiết để hiển thị dữ liệu.

Để giữ các tiêu đề bảng trên trang trong khi cuộn xuống, chúng ta đã đặt {{cssxref("position")}} thành sticky trên các phần tử {{HTMLElement("th")}}. Lưu ý rằng chúng ta **không** đặt {{cssxref("border-collapse")}} thành `collapse`, vì nếu làm vậy, tiêu đề không thể được tách đúng cách khỏi phần còn lại của bảng.

Vì `<table>` có kích thước cố định, {{cssxref("overflow")}} đặt thành `auto` là phần quan trọng ở đây, vì nó làm cho bảng có thể cuộn.

```css
table,
th,
td {
  border: 1px solid black;
}

table {
  overflow: auto;
  width: 100%;
  max-width: 400px;
  height: 240px;
  display: block;
  margin: 0 auto;
  border-spacing: 0;
}

tbody {
  white-space: nowrap;
}

th,
td {
  padding: 5px 10px;
  border-top-width: 0;
  border-left-width: 0;
}

th {
  position: sticky;
  top: 0;
  background: white;
  vertical-align: bottom;
}

th:last-child,
td:last-child {
  border-right-width: 0;
}

tr:last-child td {
  border-bottom-width: 0;
}
```

#### Kết quả

{{EmbedLiveSample('Displaying_large_tables_in_small_spaces', '100%', 240)}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/vi/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>
        <a href="/vi/docs/Web/HTML/Guides/Content_categories#flow_content"
          >Nội dung luồng</a
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        Theo thứ tự này:
        <ol>
          <li>phần tử {{HTMLElement("caption")}} tùy chọn,</li>
          <li>không hoặc nhiều phần tử {{HTMLElement("colgroup")}},</li>
          <li>phần tử {{HTMLElement("thead")}} tùy chọn,</li>
          <li>
            một trong những thứ sau:
            <ul>
              <li>không hoặc nhiều phần tử {{HTMLElement("tbody")}}</li>
              <li>một hoặc nhiều phần tử {{HTMLElement("tr")}}</li>
            </ul>
          </li>
          <li>phần tử {{HTMLElement("tfoot")}} tùy chọn</li>
        </ol>
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Không được bỏ qua, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>Bất kỳ phần tử nào chấp nhận nội dung luồng</td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/table_role"
            >table</a
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
      <td>{{domxref("HTMLTableElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Học: Kiến thức cơ bản về bảng HTML](/vi/docs/Learn_web_development/Core/Structuring_content/HTML_table_basics)
- {{HTMLElement("caption")}}, {{HTMLElement("col")}}, {{HTMLElement("colgroup")}}, {{HTMLElement("tbody")}}, {{HTMLElement("td")}}, {{HTMLElement("tfoot")}}, {{HTMLElement("th")}}, {{HTMLElement("thead")}}, {{HTMLElement("tr")}}: Các phần tử liên quan đến bảng khác
- {{cssxref("background-color")}}: Thuộc tính CSS để đặt màu nền của bảng
- {{cssxref("border")}}, {{cssxref("border-collapse")}}, {{cssxref("border-spacing")}}: Thuộc tính CSS để kiểm soát giao diện đường viền ô, quy tắc và khung
- {{cssxref("margin")}}, {{cssxref("padding")}}: Thuộc tính CSS để căn chỉnh bảng và đặt khoảng cách trên nội dung ô
- {{cssxref("text-align")}}: Thuộc tính CSS để căn chỉnh ngang nội dung ô bảng
- {{cssxref("vertical-align")}}: Thuộc tính CSS để căn chỉnh dọc nội dung ô bảng
- {{cssxref("width")}}: Thuộc tính CSS để kiểm soát chiều rộng của bảng
