---
title: "<colgroup>: Phần tử Nhóm Cột Bảng"
slug: Web/HTML/Reference/Elements/colgroup
page-type: html-element
browser-compat: html.elements.colgroup
sidebar: htmlsidebar
---

Phần tử **`<colgroup>`** trong [HTML](/vi/docs/Web/HTML) định nghĩa một nhóm cột trong một bảng.

{{InteractiveExample("HTML Demo: &lt;colgroup&gt;", "tabbed-taller")}}

```html interactive-example
<table>
  <caption>
    Superheros and sidekicks
  </caption>
  <colgroup>
    <col />
    <col span="2" class="batman" />
    <col span="2" class="flash" />
  </colgroup>
  <thead>
    <tr>
      <td></td>
      <th scope="col">Batman</th>
      <th scope="col">Robin</th>
      <th scope="col">The Flash</th>
      <th scope="col">Kid Flash</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">Skill</th>
      <td>Smarts, strong</td>
      <td>Dex, acrobat</td>
      <td>Super speed</td>
      <td>Super speed</td>
    </tr>
  </tbody>
</table>
```

```css interactive-example
.batman {
  background-color: #d7d9f2;
}

.flash {
  background-color: #ffe8d4;
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
  padding: 8px 6px;
}

td {
  text-align: center;
}
```

## Thuộc tính

Phần tử này bao gồm các [thuộc tính toàn cục](/vi/docs/Web/HTML/Reference/Global_attributes).

- `span`
  - : Xác định số cột liên tiếp mà phần tử `<colgroup>` trải rộng. Giá trị phải là một số nguyên dương lớn hơn không. Nếu không có, giá trị mặc định là `1`.

    > [!NOTE]
    > Thuộc tính `span` không được phép nếu có một hoặc nhiều phần tử {{HTMLElement("col")}} trong `<colgroup>`.

### Thuộc tính không còn dùng

Các thuộc tính sau đây đã không còn được dùng và không nên sử dụng. Chúng được ghi lại dưới đây để tham khảo khi cập nhật code hiện có và chỉ vì lý do lịch sử.

- `align` {{deprecated_inline}}
  - : Xác định căn chỉnh ngang của mỗi ô nhóm cột. Các giá trị {{Glossary("enumerated")}} có thể là `left`, `center`, `right`, `justify` và `char`. Khi được hỗ trợ, giá trị `char` căn chỉnh nội dung văn bản theo ký tự được định nghĩa trong thuộc tính [`char`](#char) và độ lệch được định nghĩa bởi thuộc tính [`charoff`](#charoff). Lưu ý rằng các phần tử {{HTMLElement("col")}} con có thể ghi đè giá trị này bằng thuộc tính [`align`](/vi/docs/Web/HTML/Reference/Elements/col#align) của riêng chúng. Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("text-align")}} trên các phần tử {{htmlelement("td")}} và {{htmlelement("th")}}, vì thuộc tính này đã không còn được dùng.

    > [!NOTE]
    > Đặt `text-align` trên phần tử `<colgroup>` không có hiệu lực vì các phần tử {{HTMLElement("td")}} và {{HTMLElement("th")}} không phải con của phần tử `<colgroup>`, và do đó chúng không kế thừa từ nó.
    >
    > Nếu bảng không sử dụng thuộc tính [`colspan`](/vi/docs/Web/HTML/Reference/Elements/td#colspan), hãy dùng selector CSS `td:nth-of-type(an+b)` theo từng cột, trong đó `a` là tổng số cột trong bảng và `b` là vị trí thứ tự của cột trong bảng, ví dụ `td:nth-of-type(7n+2) { text-align: right; }` để căn phải các ô của cột thứ hai.
    >
    > Nếu bảng có sử dụng thuộc tính [`colspan`](/vi/docs/Web/HTML/Reference/Elements/td#colspan), hiệu ứng có thể đạt được bằng cách kết hợp các selector thuộc tính CSS phù hợp như `[colspan=n]`, mặc dù điều này không đơn giản.

- `bgcolor` {{deprecated_inline}}
  - : Xác định màu nền của mỗi ô nhóm cột. Giá trị là màu HTML; có thể là [mã RGB thập lục phân 6 chữ số](/vi/docs/Web/CSS/Reference/Values/hex-color), có tiền tố `#`, hoặc một [từ khóa màu](/vi/docs/Web/CSS/Reference/Values/named-color). Các giá trị CSS {{cssxref("&lt;color&gt;")}} khác không được hỗ trợ. Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("background-color")}}, vì thuộc tính này đã không còn được dùng.

- `char` {{deprecated_inline}}
  - : Không có tác dụng. Ban đầu được dùng để xác định căn chỉnh nội dung theo một ký tự của mỗi ô nhóm cột. Các giá trị điển hình bao gồm dấu chấm (`.`) khi muốn căn chỉnh số hoặc giá trị tiền tệ. Nếu [`align`](#align) không được đặt thành `char`, thuộc tính này bị bỏ qua, mặc dù nó vẫn được dùng làm giá trị mặc định cho [`align`](/vi/docs/Web/HTML/Reference/Elements/col#align) của các phần tử {{HTMLElement("col")}} trong nhóm cột này.

- `charoff` {{deprecated_inline}}
  - : Không có tác dụng. Ban đầu được dùng để xác định số ký tự để bù đầu nội dung ô nhóm cột từ ký tự căn chỉnh được xác định bởi thuộc tính [`char`](#char).

- `valign` {{deprecated_inline}}
  - : Xác định căn chỉnh dọc của mỗi ô nhóm cột. Các giá trị {{Glossary("enumerated")}} có thể là `baseline`, `bottom`, `middle` và `top`. Lưu ý rằng các phần tử {{HTMLElement("col")}} con có thể ghi đè giá trị này bằng thuộc tính [`valign`](/vi/docs/Web/HTML/Reference/Elements/col#valign) của riêng chúng. Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("vertical-align")}} trên các phần tử {{htmlelement("td")}} và {{htmlelement("th")}}, vì thuộc tính này đã không còn được dùng.

    > [!NOTE]
    > Đặt `vertical-align` trên phần tử `<colgroup>` không có hiệu lực vì các phần tử {{HTMLElement("td")}} và {{HTMLElement("th")}} không phải con của phần tử `<colgroup>`, và do đó chúng không kế thừa từ nó.
    >
    > Nếu bảng không sử dụng thuộc tính [`colspan`](/vi/docs/Web/HTML/Reference/Elements/td#colspan), hãy dùng selector CSS [`td:nth-of-type()`](/vi/docs/Web/CSS/Reference/Selectors/:nth-of-type) theo từng cột, ví dụ `td:nth-of-type(2) { vertical-align: middle; }` để căn giữa dọc các ô của cột thứ hai.
    >
    > Nếu bảng có sử dụng thuộc tính [`colspan`](/vi/docs/Web/HTML/Reference/Elements/td#colspan), hiệu ứng có thể đạt được bằng cách kết hợp các selector thuộc tính CSS phù hợp như `[colspan=n]`, mặc dù điều này không đơn giản.

- `width` {{deprecated_inline}}
  - : Xác định chiều rộng mặc định cho mỗi cột trong nhóm cột hiện tại. Ngoài các giá trị pixel và phần trăm tiêu chuẩn, thuộc tính này có thể nhận dạng đặc biệt `0*`, có nghĩa là chiều rộng của mỗi cột được trải rộng sẽ là chiều rộng tối thiểu cần thiết để chứa nội dung của cột. Chiều rộng tương đối như `5*` cũng có thể được sử dụng. Lưu ý rằng các phần tử {{HTMLElement("col")}} con có thể ghi đè giá trị này bằng thuộc tính [`width`](/vi/docs/Web/HTML/Reference/Elements/col#width) của riêng chúng. Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("width")}}, vì thuộc tính này đã không còn được dùng.

## Ghi chú sử dụng

- `<colgroup>` nên xuất hiện trong {{HTMLElement("table")}}, sau bất kỳ phần tử {{HTMLElement("caption")}} nào (nếu được sử dụng), nhưng trước bất kỳ phần tử {{HTMLElement("thead")}}, {{HTMLElement("tbody")}}, {{HTMLElement("tfoot")}} và {{HTMLElement("tr")}} nào.
- Chỉ một số lượng hạn chế các thuộc tính CSS ảnh hưởng đến `<colgroup>`:
  - {{cssxref("background")}}: Các thuộc tính `background` khác nhau sẽ đặt nền cho các ô trong nhóm cột. Vì màu nền nhóm cột được vẽ lên trên bảng, nhưng phía sau màu nền áp dụng cho các cột ({{HTMLElement("col")}}), nhóm hàng ({{htmlelement("thead")}}, {{htmlelement("tbody")}} và {{htmlelement("tfoot")}}), các hàng ({{htmlelement("tr")}}) và các ô riêng lẻ ({{htmlelement("th")}} và {{htmlelement("td")}}), nền áp dụng cho nhóm cột bảng chỉ hiển thị nếu mọi lớp vẽ lên trên chúng có nền trong suốt.
  - {{cssxref("border")}}: Các thuộc tính `border` khác nhau được áp dụng, nhưng chỉ khi `<table>` có {{cssxref("border-collapse", "border-collapse: collapse")}} được đặt.
  - {{cssxref("visibility")}}: Giá trị `collapse` cho một nhóm cột dẫn đến tất cả các ô của các cột trong nhóm cột đó không được hiển thị, và các ô trải sang các cột khác bị cắt. Không gian mà các cột trong nhóm cột này chiếm sẽ bị xóa. Tuy nhiên, kích thước của các cột khác vẫn được tính như thể các ô trong cột (các cột) bị thu gọn trong nhóm cột vẫn còn. Các giá trị khác cho `visibility` không có hiệu lực.
  - {{cssxref("width")}}: Thuộc tính `width` định nghĩa chiều rộng tối thiểu cho các cột trong nhóm cột, như thể {{cssxref("min-width")}} được đặt.

## Ví dụ

Xem {{HTMLElement("table")}} để biết ví dụ bảng đầy đủ giới thiệu các chuẩn và thực hành phổ biến.

Ví dụ này minh họa một bảng bảy cột được chia thành hai phần tử `<colgroup>` trải rộng nhiều cột.

### HTML

Hai phần tử `<colgroup>` được sử dụng để cấu trúc một bảng cơ bản bằng cách tạo nhóm cột. Số cột trong mỗi nhóm cột được xác định bởi thuộc tính [`span`](#span).

```html
<table>
  <caption>
    Personal weekly activities
  </caption>
  <colgroup span="5" class="weekdays"></colgroup>
  <colgroup span="2" class="weekend"></colgroup>
  <thead>
    <tr>
      <th>Mon</th>
      <th>Tue</th>
      <th>Wed</th>
      <th>Thu</th>
      <th>Fri</th>
      <th>Sat</th>
      <th>Sun</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Clean room</td>
      <td>Football training</td>
      <td>Dance Course</td>
      <td>History Class</td>
      <td>Buy drinks</td>
      <td>Study hour</td>
      <td>Free time</td>
    </tr>
    <tr>
      <td>Yoga</td>
      <td>Chess Club</td>
      <td>Meet friends</td>
      <td>Gymnastics</td>
      <td>Birthday party</td>
      <td>Fishing trip</td>
      <td>Free time</td>
    </tr>
  </tbody>
</table>
```

### CSS

Các cột được nhóm có thể được dùng để làm nổi bật cấu trúc trực quan bằng CSS:

```css
table {
  border-collapse: collapse;
  border: 2px solid rgb(140 140 140);
}

caption {
  caption-side: bottom;
  padding: 10px;
}

th,
td {
  border: 1px solid rgb(160 160 160);
  padding: 8px 6px;
  text-align: center;
}

.weekdays {
  background-color: #d7d9f2;
}

.weekend {
  background-color: #ffe8d4;
}
```

```css hidden
table {
  font-family: sans-serif;
  font-size: 0.8rem;
  letter-spacing: 1px;
}
```

#### Kết quả

{{EmbedLiveSample('Example', 650, 170)}}

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
        Nếu thuộc tính <a href="#span"><code>span</code></a> có: không có.<br />Nếu
        thuộc tính không có: không hoặc nhiều phần tử {{HTMLElement("col")}}
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>
        Thẻ mở có thể bị bỏ qua nếu con đầu tiên là phần tử {{HTMLElement("col")}}
        và nếu nó không được đứng trước bởi
        <code>&lt;colgroup&gt;</code> có thẻ đóng bị bỏ qua.<br />Thẻ
        đóng có thể bị bỏ qua nếu nó không được theo sau bởi khoảng trắng hoặc comment.
      </td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Phần tử {{HTMLElement("table")}}. Phần tử
        <code>&lt;colgroup&gt;</code> phải xuất hiện sau bất kỳ
        phần tử {{HTMLElement("caption")}} nào, nhưng trước bất kỳ
        phần tử {{HTMLElement("thead")}}, {{HTMLElement("tbody")}},
        {{HTMLElement("tfoot")}} và
        {{HTMLElement("tr")}} nào.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <a href="https://w3c.github.io/html-aria/#dfn-no-corresponding-role"
          >Không có vai trò tương ứng</a
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Không có <code>role</code> nào được phép</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLTableColElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Học: Kiến thức cơ bản về bảng HTML](/vi/docs/Learn_web_development/Core/Structuring_content/HTML_table_basics)
- {{HTMLElement("caption")}}, {{HTMLElement("col")}}, {{HTMLElement("table")}}, {{HTMLElement("tbody")}}, {{HTMLElement("td")}}, {{HTMLElement("tfoot")}}, {{HTMLElement("th")}}, {{HTMLElement("thead")}}, {{HTMLElement("tr")}}: Các phần tử liên quan đến bảng khác
- {{cssxref("background-color")}}: Thuộc tính CSS để đặt màu nền của mỗi ô nhóm cột
- {{cssxref("border")}}: Thuộc tính CSS để kiểm soát đường viền của các ô nhóm cột
- {{cssxref("text-align")}}: Thuộc tính CSS để căn chỉnh ngang nội dung mỗi ô nhóm cột
- {{cssxref("vertical-align")}}: Thuộc tính CSS để căn chỉnh dọc nội dung mỗi ô nhóm cột
- {{cssxref("visibility")}}: Thuộc tính CSS để ẩn (hoặc hiện) các ô của một nhóm cột
- {{cssxref("width")}}: Thuộc tính CSS để kiểm soát chiều rộng mặc định cho mỗi cột trong nhóm cột
- {{cssxref(":nth-of-type")}}, {{cssxref(":first-of-type")}}, {{cssxref(":last-of-type")}}: Các pseudo-class CSS để chọn các ô cột mong muốn
