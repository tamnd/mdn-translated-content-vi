---
title: "<col>: Phần tử Cột Bảng"
slug: Web/HTML/Reference/Elements/col
page-type: html-element
browser-compat: html.elements.col
sidebar: htmlsidebar
---

Phần tử **`<col>`** trong [HTML](/vi/docs/Web/HTML) định nghĩa một hoặc nhiều cột trong nhóm cột được biểu diễn bởi phần tử {{HTMLElement("colgroup")}} cha của nó. Phần tử `<col>` chỉ hợp lệ khi là con của phần tử {{HTMLElement("colgroup")}} không có thuộc tính [`span`](/vi/docs/Web/HTML/Reference/Elements/colgroup#span) được định nghĩa.

{{InteractiveExample("HTML Demo: &lt;col&gt;", "tabbed-taller")}}

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
  - : Xác định số cột liên tiếp mà phần tử `<col>` trải rộng. Giá trị phải là một số nguyên dương lớn hơn không. Nếu không có, giá trị mặc định là `1`.

### Thuộc tính không còn dùng

Các thuộc tính sau đây đã không còn được dùng và không nên sử dụng. Chúng được ghi lại dưới đây để tham khảo khi cập nhật code hiện có và chỉ vì lý do lịch sử.

- `align` {{deprecated_inline}}
  - : Xác định căn chỉnh ngang của mỗi ô cột. Các giá trị {{Glossary("enumerated")}} có thể là `left`, `center`, `right`, `justify` và `char`. Khi được hỗ trợ, giá trị `char` căn chỉnh nội dung văn bản theo ký tự được định nghĩa trong thuộc tính [`char`](#char) và độ lệch được định nghĩa bởi thuộc tính [`charoff`](#charoff). Lưu ý rằng thuộc tính này ghi đè [`align`](/vi/docs/Web/HTML/Reference/Elements/colgroup#align) được chỉ định của phần tử cha {{HTMLElement("colgroup")}}. Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("text-align")}} trên các phần tử {{htmlelement("td")}} và {{htmlelement("th")}}, vì thuộc tính này đã không còn được dùng.

    > [!NOTE]
    > Đặt `text-align` trên phần tử `<col>` không có hiệu lực vì `<col>` không có phần tử con, do đó không có phần tử nào kế thừa từ nó.
    >
    > Nếu bảng không sử dụng thuộc tính [`colspan`](/vi/docs/Web/HTML/Reference/Elements/td#colspan), hãy dùng selector CSS `td:nth-of-type(an+b)`. Đặt `a` bằng không và `b` bằng vị trí của cột trong bảng, ví dụ `td:nth-of-type(2) { text-align: right; }` để căn phải các ô của cột thứ hai.
    >
    > Nếu bảng có sử dụng thuộc tính [`colspan`](/vi/docs/Web/HTML/Reference/Elements/td#colspan), hiệu ứng có thể đạt được bằng cách kết hợp các selector thuộc tính CSS phù hợp như `[colspan=n]`, mặc dù điều này không đơn giản.

- `bgcolor` {{deprecated_inline}}
  - : Xác định màu nền của mỗi ô cột. Giá trị là màu HTML; có thể là [mã RGB thập lục phân 6 chữ số](/vi/docs/Web/CSS/Reference/Values/hex-color), có tiền tố `#`, hoặc một [từ khóa màu](/vi/docs/Web/CSS/Reference/Values/named-color). Các giá trị CSS {{cssxref("&lt;color&gt;")}} khác không được hỗ trợ. Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("background-color")}}, vì thuộc tính này đã không còn được dùng.

- `char` {{deprecated_inline}}
  - : Không có tác dụng. Ban đầu được dùng để xác định căn chỉnh nội dung theo một ký tự của mỗi ô cột. Các giá trị điển hình bao gồm dấu chấm (`.`) khi muốn căn chỉnh số hoặc giá trị tiền tệ. Nếu [`align`](#align) không được đặt thành `char`, thuộc tính này bị bỏ qua, mặc dù nó vẫn ghi đè [`char`](/vi/docs/Web/HTML/Reference/Elements/colgroup#char) được chỉ định của phần tử cha {{HTMLElement("colgroup")}}.

- `charoff` {{deprecated_inline}}
  - : Không có tác dụng. Ban đầu được dùng để xác định số ký tự để bù đầu nội dung ô cột từ ký tự căn chỉnh được xác định bởi thuộc tính [`char`](#char).

- `valign` {{deprecated_inline}}
  - : Xác định căn chỉnh dọc của mỗi ô cột. Các giá trị {{Glossary("enumerated")}} có thể là `baseline`, `bottom`, `middle` và `top`. Lưu ý rằng thuộc tính này ghi đè [`valign`](/vi/docs/Web/HTML/Reference/Elements/colgroup#valign) được chỉ định của phần tử cha {{HTMLElement("colgroup")}}. Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("vertical-align")}} trên các phần tử {{htmlelement("td")}} và {{htmlelement("th")}}, vì thuộc tính này đã không còn được dùng.

    > [!NOTE]
    > Đặt `vertical-align` trên phần tử `<col>` không có hiệu lực vì `<col>` không có phần tử con, do đó không có phần tử nào kế thừa từ nó.
    >
    > Nếu bảng không sử dụng thuộc tính [`colspan`](/vi/docs/Web/HTML/Reference/Elements/td#colspan), hãy dùng selector CSS `td:nth-of-type(an+b)`. Đặt `a` bằng không và `b` bằng vị trí của cột trong bảng, ví dụ `td:nth-of-type(2) { vertical-align: middle; }` để căn giữa dọc các ô của cột thứ hai.
    >
    > Nếu bảng có sử dụng thuộc tính [`colspan`](/vi/docs/Web/HTML/Reference/Elements/td#colspan), hiệu ứng có thể đạt được bằng cách kết hợp các selector thuộc tính CSS phù hợp như `[colspan=n]`, mặc dù điều này không đơn giản.

- `width` {{deprecated_inline}}
  - : Xác định chiều rộng mặc định cho mỗi cột. Ngoài các giá trị pixel và phần trăm tiêu chuẩn, thuộc tính này có thể nhận dạng đặc biệt `0*`, có nghĩa là chiều rộng của mỗi cột được trải rộng sẽ là chiều rộng tối thiểu cần thiết để chứa nội dung của cột. Chiều rộng tương đối như `5*` cũng có thể được sử dụng. Lưu ý rằng thuộc tính này ghi đè [`width`](/vi/docs/Web/HTML/Reference/Elements/colgroup#width) được chỉ định của phần tử cha {{HTMLElement("colgroup")}}. Thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("width")}}, vì thuộc tính này đã không còn được dùng.

## Ghi chú sử dụng

- Phần tử `<col>` được sử dụng trong phần tử {{HTMLElement("colgroup")}} không có thuộc tính `span`.
- Các phần tử `<col>` không nhóm cấu trúc các cột lại với nhau. Đây là vai trò của phần tử {{HTMLElement("colgroup")}}.
- Chỉ một số lượng hạn chế các thuộc tính CSS ảnh hưởng đến `<col>`:
  - {{cssxref("background")}}: Các thuộc tính `background` khác nhau sẽ đặt nền cho các ô trong cột. Vì màu nền cột được vẽ lên trên bảng và nhóm cột ({{HTMLElement("colgroup")}}), nhưng phía sau màu nền áp dụng cho nhóm hàng ({{htmlelement("thead")}}, {{htmlelement("tbody")}} và {{htmlelement("tfoot")}}), các hàng ({{htmlelement("tr")}}) và các ô riêng lẻ ({{htmlelement("th")}} và {{htmlelement("td")}}), nền áp dụng cho cột bảng chỉ hiển thị nếu mọi lớp vẽ lên trên chúng có nền trong suốt.
  - {{cssxref("border")}}: Các thuộc tính `border` khác nhau được áp dụng, nhưng chỉ khi `<table>` có {{cssxref("border-collapse", "border-collapse: collapse")}} được đặt.
  - {{cssxref("visibility")}}: Giá trị `collapse` cho một cột dẫn đến tất cả các ô của cột đó không được hiển thị, và các ô trải sang các cột khác bị cắt. Không gian mà các cột này chiếm sẽ bị xóa. Tuy nhiên, kích thước của các cột khác vẫn được tính như thể các ô trong cột (các cột) bị thu gọn vẫn còn. Các giá trị khác cho `visibility` không có hiệu lực.
  - {{cssxref("width")}}: Thuộc tính `width` định nghĩa chiều rộng tối thiểu cho cột, như thể {{cssxref("min-width")}} được đặt.

## Ví dụ

Xem {{HTMLElement("table")}} để biết ví dụ bảng đầy đủ giới thiệu các chuẩn và thực hành phổ biến.

Ví dụ này minh họa một bảng tám cột được chia thành ba phần tử `<col>`.

### HTML

Phần tử {{HTMLElement("colgroup")}} cung cấp cấu trúc cho một bảng cơ bản, tạo ra một nhóm cột ngầm định duy nhất. Ba phần tử `<col>` được bao gồm trong `<colgroup>`, tạo ra ba cột có thể tạo kiểu. Thuộc tính [`span`](#span) xác định số cột bảng mà mỗi `<col>` nên trải rộng (mặc định là `1` khi bị bỏ qua), cho phép các thuộc tính được chia sẻ trên các cột trong mỗi `<col>`.

```html
<table>
  <caption>
    Personal weekly activities
  </caption>
  <colgroup>
    <col />
    <col span="5" class="weekdays" />
    <col span="2" class="weekend" />
  </colgroup>
  <thead>
    <tr>
      <th>Period</th>
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
      <th>a.m.</th>
      <td>Clean room</td>
      <td>Football training</td>
      <td>Dance Course</td>
      <td>History Class</td>
      <td>Buy drinks</td>
      <td>Study hour</td>
      <td>Free time</td>
    </tr>
    <tr>
      <th>p.m.</th>
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

Chúng ta sử dụng CSS, thay vì các thuộc tính HTML không còn dùng, để cung cấp màu nền cho các cột và căn chỉnh nội dung ô:

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
      <td>Không có; đây là {{Glossary("void element")}}.</td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Phải có thẻ mở và không được có thẻ đóng.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Chỉ {{HTMLElement("colgroup")}}, mặc dù nó có thể được định nghĩa ngầm vì thẻ mở của nó không bắt buộc. {{HTMLElement("colgroup")}} không được có thuộc tính
        <a href="/vi/docs/Web/HTML/Reference/Elements/colgroup#span"><code>span</code></a>.
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

- {{HTMLElement("caption")}}, {{HTMLElement("colgroup")}}, {{HTMLElement("table")}}, {{HTMLElement("tbody")}}, {{HTMLElement("td")}}, {{HTMLElement("tfoot")}}, {{HTMLElement("th")}}, {{HTMLElement("thead")}}, {{HTMLElement("tr")}}: Các phần tử liên quan đến bảng khác
- {{cssxref("background-color")}}: Thuộc tính CSS để đặt màu nền của mỗi ô cột
- {{cssxref("border")}}: Thuộc tính CSS để kiểm soát đường viền của các ô cột
- {{cssxref("text-align")}}: Thuộc tính CSS để căn chỉnh ngang nội dung mỗi ô cột
- {{cssxref("vertical-align")}}: Thuộc tính CSS để căn chỉnh dọc nội dung mỗi ô cột
- {{cssxref("visibility")}}: Thuộc tính CSS để ẩn các ô của một cột
- {{cssxref("width")}}: Thuộc tính CSS để kiểm soát chiều rộng mặc định cho mỗi cột
- {{cssxref(":nth-of-type")}}, {{cssxref(":first-of-type")}}, {{cssxref(":last-of-type")}}: Các pseudo-class CSS để chọn các ô cột mong muốn
