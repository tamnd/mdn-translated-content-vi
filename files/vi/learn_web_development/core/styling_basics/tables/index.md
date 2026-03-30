---
title: Tạo kiểu bảng
slug: Learn_web_development/Core/Styling_basics/Tables
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Test_your_skills/Images", "Learn_web_development/Core/Styling_basics/Home_color_scheme_search", "Learn_web_development/Core/Styling_basics")}}

Tạo kiểu một bảng HTML không phải là công việc hào nhoáng nhất trên thế giới, nhưng đôi khi tất cả chúng ta phải làm điều đó. Bài viết này giải thích cách làm cho bảng HTML trông đẹp, với một số kỹ thuật tạo kiểu bảng cụ thể được làm nổi bật.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Basic_HTML_syntax"
          >Cú pháp HTML cơ bản</a
        > và <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_table_basics"
          >Bảng HTML</a
        >, CSS <a href="/en-US/docs/Learn_web_development/Core/Styling_basics/Values_and_units">Giá trị và đơn vị</a> và <a href="/en-US/docs/Learn_web_development/Core/Styling_basics/Sizing">Kích thước</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Xử lý khoảng cách trong bảng, bao gồm thu gọn đường viền.</li>
          <li>Làm nổi bật rõ ràng các vùng bảng khác nhau bao gồm tiêu đề, chú thích, header, body, và footer.</li>
          <li>Cách triển khai vằn ngựa vằn, và lý do tại sao nó hữu ích.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Bảng HTML điển hình

Hãy bắt đầu bằng cách xem một bảng HTML điển hình. Tôi nói điển hình — hầu hết các ví dụ bảng HTML là về giày dép, thời tiết, hoặc nhân viên; chúng ta quyết định làm mọi thứ thú vị hơn bằng cách làm về các ban nhạc punk nổi tiếng từ Vương quốc Anh. Markup trông như thế này:

```html live-sample___unstyled live-sample___punk-style live-sample___best-practice-style
<table>
  <caption>
    A summary of the UK's most famous punk bands
  </caption>
  <thead>
    <tr>
      <th scope="col">Band</th>
      <th scope="col">Year formed</th>
      <th scope="col">No. of Albums</th>
      <th scope="col">Most famous song</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">Buzzcocks</th>
      <td>1976</td>
      <td>9</td>
      <td>Ever fallen in love (with someone you shouldn't've)</td>
    </tr>
    <tr>
      <th scope="row">The Clash</th>
      <td>1976</td>
      <td>6</td>
      <td>London Calling</td>
    </tr>
    <tr>
      <th scope="row">The Damned</th>
      <td>1976</td>
      <td>10</td>
      <td>Smash it up</td>
    </tr>
    <tr>
      <th scope="row">Sex Pistols</th>
      <td>1975</td>
      <td>1</td>
      <td>Anarchy in the UK</td>
    </tr>
    <tr>
      <th scope="row">Sham 69</th>
      <td>1976</td>
      <td>13</td>
      <td>If The Kids Are United</td>
    </tr>
    <tr>
      <th scope="row">Siouxsie and the Banshees</th>
      <td>1976</td>
      <td>11</td>
      <td>Hong Kong Garden</td>
    </tr>
    <tr>
      <th scope="row">Stiff Little Fingers</th>
      <td>1977</td>
      <td>10</td>
      <td>Suspect Device</td>
    </tr>
    <tr>
      <th scope="row">The Stranglers</th>
      <td>1974</td>
      <td>17</td>
      <td>No More Heroes</td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <th scope="row" colspan="2">Total albums</th>
      <td colspan="2">77</td>
    </tr>
  </tfoot>
</table>
```

Bảng được đánh dấu tốt, dễ tạo kiểu và dễ tiếp cận, nhờ các tính năng như [`scope`](/en-US/docs/Web/HTML/Reference/Elements/th#scope), {{htmlelement("caption")}}, {{htmlelement("thead")}}, {{htmlelement("tbody")}}, v.v. Tiếc là, nó không trông đẹp lắm. Chỉ với tạo kiểu trình duyệt mặc định, nó trông chật chội, khó đọc và hơi nhàm chán:

{{embedlivesample("unstyled", "", "200")}}

Chúng ta cần sử dụng một số CSS để khắc phục điều này. Bạn có thể tạo kiểu bảng theo bất kỳ cách nào bạn muốn bằng CSS. Ví dụ, chúng ta đã tạo ra thiết kế trông khá "punk" này:

```css hidden live-sample___punk-style
/* font import */
@import "https://fonts.googleapis.com/css2?family=Rock+Salt&display=swap";

/* spacing */
table {
  table-layout: fixed;
  width: 100%;
  border-collapse: collapse;
  border: 3px solid purple;
}

thead th {
  line-height: 1.5;
}

thead th:nth-child(1) {
  width: 30%;
}

thead th:nth-child(2) {
  width: 20%;
}

thead th:nth-child(3) {
  width: 15%;
}

thead th:nth-child(4) {
  width: 35%;
}

th,
td {
  padding: 20px;
}

/* typography */
html {
  font-family: "Helvetica Neue", "Helvetica", "Arial", sans-serif;
}

thead th,
tfoot th {
  font-family: "Rock Salt", cursive;
}

th {
  letter-spacing: 2px;
}

td {
  letter-spacing: 1px;
}

tbody td {
  text-align: center;
}

tfoot th {
  text-align: right;
}

/* graphics */
thead,
tfoot {
  background: url("https://mdn.github.io/learning-area/css/styling-boxes/styling-tables/leopardskin.jpg");
  color: white;
}

thead th,
tfoot th,
tfoot td {
  background: linear-gradient(to bottom, rgb(0 0 0 / 0.1), rgb(0 0 0 / 0.5));
  border: 3px solid purple;
  text-shadow: 1px 1px 1px black;
}

tbody tr:nth-child(odd) {
  background-color: #ff33cc;
}

tbody tr:nth-child(even) {
  background-color: #e495e4;
}

tbody tr {
  background-image: url("https://mdn.github.io/learning-area/css/styling-boxes/styling-tables/noise.png");
}

table {
  background-color: #ff33cc;
}

/* caption */
caption {
  font-family: "Rock Salt", cursive;
  padding: 20px;
  font-style: italic;
  caption-side: bottom;
  color: #666666;
  text-align: right;
  letter-spacing: 1px;
}
```

{{embedlivesample("punk-style", "", "500")}}

Tuy nhiên, thiết kế này khá lòe loẹt. Trong bài viết này, chúng ta sẽ làm cho bạn đánh dấu nó bằng một số thực hành tốt nhất cho thiết kế bảng — như được phác thảo trong [Web Typography: designing tables to be read not looked at](https://alistapart.com/article/web-typography-tables/).

## Bắt đầu tạo kiểu bảng

Hãy cùng nhau xem qua cách tạo kiểu ví dụ bảng của chúng ta.

1. Để bắt đầu, hãy tạo một bản sao cục bộ của markup mẫu [được hiển thị trước đó](#bảng_html_điển_hình) và lưu nó vào một thư mục làm việc ở đâu đó trên máy tính cục bộ của bạn.
2. Tiếp theo, tạo một tệp mới có tên `style.css` và lưu nó vào cùng thư mục với các tệp khác của bạn.
3. Liên kết CSS với HTML bằng cách đặt dòng HTML sau bên trong {{htmlelement("head")}} của bạn:

   ```html
   <link href="style.css" rel="stylesheet" />
   ```

Tải HTML của bạn vào trình duyệt để xem nó trông như thế nào theo mặc định.

## Cập nhật phông chữ

Đây là một điểm nhỏ, và không hoàn toàn liên quan đến tạo kiểu bảng, nhưng chúng ta nghĩ phông chữ mặc định trông hơi quá trang trọng cho bảng về các ban nhạc punk. Bắt đầu CSS của bạn bằng cách thêm quy tắc sau:

```css
html {
  font-family: "Helvetica", "Arial", sans-serif;
}
```

## Khoảng cách

Điều đầu tiên chúng ta cần làm với bảng của mình là sắp xếp khoảng cách — tạo kiểu bảng mặc định rất chật chội! Để làm điều này, thêm CSS sau vào cuối tệp `style.css` của bạn:

```css
table {
  table-layout: fixed;
  width: 90%;
  margin: 10px auto;
  border-collapse: collapse;
}

th,
td {
  padding: 0.6em;
}
```

Các phần quan trọng nhất cần lưu ý là:

- Giá trị {{cssxref("table-layout")}} là `fixed` thường là ý tưởng tốt để đặt trên bảng của bạn, vì nó làm cho bảng hoạt động dự đoán hơn theo mặc định. Thông thường, các cột bảng có xu hướng được kích thước theo lượng nội dung chúng chứa, tạo ra một số kết quả kỳ lạ. Với `table-layout: fixed`, bạn có thể kích thước các cột theo chiều rộng của tiêu đề của chúng, và sau đó xử lý nội dung của chúng một cách phù hợp. Chris Coyier thảo luận về kỹ thuật này chi tiết hơn trong [Fixed Table Layouts](https://css-tricks.com/fixing-tables-long-strings/).

- Chúng ta đã kết hợp bố cục cố định với {{cssxref("width")}} là `90%` và {{cssxref("margin")}} là `10px auto`. Các cài đặt này có nghĩa là bảng sẽ lấp đầy hầu hết viewport và được căn giữa theo chiều ngang.

- Giá trị {{cssxref("border-collapse")}} là `collapse` là thực hành tốt nhất tiêu chuẩn cho bất kỳ nỗ lực tạo kiểu bảng nào. Theo mặc định, khi bạn đặt đường viền trên các phần tử bảng, tất cả chúng sẽ có khoảng cách giữa chúng, như hình dưới đây minh họa: ![một bảng 2x2 với khoảng cách mặc định giữa các đường viền không thu gọn đường viền](no-border-collapse.png) Điều này không trông đẹp lắm (mặc dù có thể đó là giao diện bạn muốn, ai biết được?). Với `border-collapse: collapse;` được đặt, các đường viền thu gọn thành một, trông đẹp hơn nhiều: ![một bảng 2x2 với thuộc tính border-collapse được đặt thành collapse hiển thị đường viền thu gọn thành một](border-collapse.png)
- Chúng ta đã đặt một số {{cssxref("padding")}} trên các phần tử {{htmlelement("th")}} và {{htmlelement("td")}} — điều này tạo cho các mục dữ liệu một chút không gian để thở, làm cho bảng trông dễ đọc hơn nhiều.

Lưu mã của bạn và làm mới trình duyệt để xem kết quả.

## Căn chỉnh

Tiếp theo, chúng ta sẽ xử lý căn chỉnh của các loại dữ liệu khác nhau bên trong các ô của chúng. Thực hành tốt nhất quy định bạn nên căn chỉnh văn bản sang trái và số sang phải; CSS sau đây sẽ đạt được điều đó, vì vậy hãy thêm nó vào cuối tệp CSS của bạn ngay bây giờ.

```css
tr :nth-child(2),
tr :nth-child(3) {
  text-align: right;
  width: 15%;
}

tr :nth-child(1),
tr :nth-child(4) {
  text-align: left;
  width: 35%;
}

tfoot tr :nth-child(1) {
  text-align: right;
}

tfoot tr :nth-child(2) {
  text-align: left;
}
```

Chúng ta đã sử dụng lớp giả {{cssxref(":nth-child")}} ở đây; một bộ chọn hữu ích cho phép bạn chọn một phần tử con được đánh số cụ thể của một phần tử, hoặc một chuỗi cụ thể. Ở đây chúng ta đang sử dụng nó để chọn các phần tử `<td>` cụ thể bên trong các phần tử <th>.

Lưu ý chúng ta cũng đặt chiều rộng cụ thể trên các hàng bảng, với các hàng chứa văn bản được đặt rộng hơn nhiều so với các hàng chứa số. Đây là ý tưởng tốt — các hàng chứa nhiều nội dung hơn cần nhiều không gian hơn để cho chúng cơ hội tốt nhất có thể có nội dung trên một dòng. Các hàng chứa ít nội dung hơn không cần nhiều không gian để hiển thị dữ liệu của chúng, và trên thực tế nếu bạn cho chúng nhiều không gian, dữ liệu sẽ hơi bị mất trong không gian và do đó khó đọc hơn.

Chúng ta cũng nên đảm bảo rằng các mục dữ liệu của chúng ta được căn chỉnh lên đầu các ô của chúng, thay vì ở giữa. Để đạt được điều này, chúng ta có thể sử dụng thuộc tính {{cssxref("vertical-align")}}. Cập nhật quy tắc `th, td` hiện có của bạn thành:

```css
th,
td {
  vertical-align: top;
  padding: 0.3em;
}
```

Một lần nữa, lưu và làm mới để xem hiệu ứng của các cập nhật CSS mới nhất của bạn.

## Thêm đường viền

Bảng trông đã tốt hơn nhiều, nhưng chúng ta nên thêm một số đường viền để cung cấp sự phân tách trực quan giữa `<caption>` của bảng, dữ liệu và hàng tổng cộng ở dưới cùng. Để làm điều này, thêm các quy tắc sau vào CSS của bạn:

```css
tfoot {
  border-top: 1px solid #999999;
}
```

Tiếp theo, cập nhật quy tắc `table` hiện có của bạn thành:

```css
table {
  table-layout: fixed;
  width: 90%;
  margin: 10px auto;
  border-collapse: collapse;
  border-top: 1px solid #999999;
  border-bottom: 1px solid #999999;
}
```

Lưu và làm mới; bảng của bạn bây giờ nên bắt đầu trông khá dễ đọc!

## Kẻ vằn ngựa vằn

Chúng ta muốn dành một phần riêng để hướng dẫn bạn cách triển khai **kẻ vằn ngựa vằn** — các hàng màu xen kẽ làm cho các hàng dữ liệu khác nhau trong bảng dễ phân tích và đọc hơn. Thêm CSS sau vào cuối tệp `style.css` của bạn:

```css
tbody tr:nth-child(odd) {
  background-color: #eeeeee;
}
```

Trước đó bạn đã thấy bộ chọn {{cssxref(":nth-child")}} được sử dụng để chọn các phần tử con cụ thể. Nó cũng có thể được cung cấp một công thức như một tham số, vì vậy nó sẽ chọn một chuỗi các phần tử. Công thức `2n+1` sẽ chọn tất cả các phần tử con được đánh số lẻ (1, 3, 5, v.v.) và công thức `2n` sẽ chọn tất cả các phần tử con được đánh số chẵn (2, 4, 6, v.v.) Chúng ta đã sử dụng từ khóa `odd` trong mã của mình, đây là phím tắt cho công thức `2n+1` (`even` là viết tắt của `2n`).

Một lần nữa, đừng quên lưu và làm mới để xem kết quả.

## Tạo kiểu chú thích

Có một điều cuối cùng cần làm với bảng của chúng ta — tạo kiểu chú thích. Để làm điều này, thêm phần sau vào cuối tệp `style.css` của bạn:

```css
caption {
  padding: 1em;
  font-style: italic;
  caption-side: bottom;
  letter-spacing: 1px;
}
```

Không có gì đặc biệt ở đây, ngoại trừ thuộc tính {{cssxref("caption-side")}}, được cung cấp giá trị là `bottom`. Điều này khiến chú thích được đặt ở phía dưới bảng.

## Bảng đã hoàn thành

Thiết kế bảng đã hoàn thành của bạn sẽ trông như thế này:

```css hidden live-sample___best-practice-style
html {
  font-family: "Helvetica", "Arial", sans-serif;
}

table {
  table-layout: fixed;
  width: 90%;
  margin: 10px auto;
  border-collapse: collapse;
  border-top: 1px solid #999999;
  border-bottom: 1px solid #999999;
}

th,
td {
  vertical-align: top;
  padding: 0.6em;
}

tr :nth-child(2),
tr :nth-child(3) {
  text-align: right;
  width: 15%;
}

tr :nth-child(1),
tr :nth-child(4) {
  text-align: left;
  width: 35%;
}

tfoot tr :nth-child(1) {
  text-align: right;
}

tfoot tr :nth-child(2) {
  text-align: left;
}

tfoot {
  border-top: 1px solid #999999;
}

tbody tr:nth-child(odd) {
  background-color: #eeeeee;
}

caption {
  padding: 1em;
  font-style: italic;
  caption-side: bottom;
  letter-spacing: 1px;
}
```

{{embedlivesample("best-practice-style", "", "520")}}

## Mẹo tạo kiểu bảng nhanh

Trước khi tiếp tục, chúng ta nghĩ sẽ cung cấp cho bạn danh sách nhanh các điểm hữu ích nhất được minh họa ở trên:

- Làm cho markup bảng của bạn đơn giản nhất có thể, và giữ mọi thứ linh hoạt.
- Sử dụng {{cssxref("table-layout", "table-layout: fixed")}} để tạo bố cục bảng dự đoán hơn cho phép bạn dễ dàng đặt chiều rộng cột bằng cách đặt {{cssxref("width")}} trên các tiêu đề của chúng ({{htmlelement("th")}}).
- Sử dụng {{cssxref("border-collapse", "border-collapse: collapse")}} để làm cho đường viền các phần tử bảng thu gọn vào nhau, tạo ra giao diện gọn gàng hơn và dễ kiểm soát hơn.
- Sử dụng {{htmlelement("thead")}}, {{htmlelement("tbody")}}, và {{htmlelement("tfoot")}} để chia bảng của bạn thành các phần logic và cung cấp thêm nơi để áp dụng CSS, vì vậy sẽ dễ dàng hơn để xếp các kiểu lên trên nhau nếu cần.
- Sử dụng kẻ vằn ngựa vằn để làm cho các hàng xen kẽ dễ đọc hơn.
- Sử dụng {{cssxref("text-align")}} để căn chỉnh văn bản {{htmlelement("th")}} và {{htmlelement("td")}} của bạn, để làm mọi thứ gọn gàng hơn và dễ theo dõi hơn.

## Tóm tắt

Với tạo kiểu bảng nay đã hoàn thành, chúng ta cần thứ khác để chiếm thời gian của mình. Bài viết tiếp theo khám phá việc gỡ lỗi CSS — cách giải quyết các vấn đề như bố cục không trông như chúng nên, hoặc các thuộc tính không áp dụng khi bạn nghĩ chúng nên. Điều này bao gồm thông tin về việc sử dụng DevTools trình duyệt để tìm giải pháp cho các vấn đề của bạn.

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Test_your_skills/Images", "Learn_web_development/Core/Styling_basics/Home_color_scheme_search", "Learn_web_development/Core/Styling_basics")}}
