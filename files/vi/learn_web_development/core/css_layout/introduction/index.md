---
title: Giới thiệu về bố cục CSS
short-title: Giới thiệu
slug: Learn_web_development/Core/CSS_layout/Introduction
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Core/CSS_layout/Floats", "Learn_web_development/Core/CSS_layout")}}

Bài học này tóm tắt lại một số tính năng bố cục CSS mà chúng ta đã đề cập trong các mô-đun trước, như các giá trị {{cssxref("display")}} khác nhau, đồng thời giới thiệu một số khái niệm chúng ta sẽ đề cập trong mô-đun này. Bài học cũng bao gồm khái niệm luồng thông thường một cách chi tiết.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content"
          >Cấu trúc nội dung với HTML</a
        >,
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">Kiến thức cơ bản về tạo kiểu CSS</a>,
        <a href="/en-US/docs/Learn_web_development/Core/Text_styling/Fundamentals">Tạo kiểu văn bản và phông chữ cơ bản</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Nhận biết các phương pháp được sử dụng để triển khai bố cục trang hiện đại.</li>
          <li>Hiểu rằng luồng thông thường là cách mặc định trình duyệt sắp xếp nội dung khối và nội tuyến.</li>
          <li>Biết rằng các thuộc tính như <code>display</code>, <code>float</code> và <code>position</code> được thiết kế để thay đổi cách trình duyệt sắp xếp nội dung.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

Các kỹ thuật bố cục trang CSS cho phép chúng ta lấy các phần tử chứa trong trang web và kiểm soát vị trí của chúng liên quan đến các yếu tố sau: vị trí mặc định của chúng trong luồng bố cục thông thường, các phần tử xung quanh chúng, vùng chứa cha của chúng và khung nhìn/cửa sổ chính.

Các kỹ thuật bố cục trang mà chúng ta sẽ đề cập bên dưới và trình bày chi tiết trong mô-đun đều có các mục đích sử dụng, ưu điểm và nhược điểm riêng. Không có kỹ thuật nào được thiết kế để sử dụng một mình. Bằng cách hiểu mỗi phương pháp bố cục được thiết kế để làm gì, bạn sẽ ở vị trí tốt để hiểu phương pháp nào phù hợp nhất cho từng tác vụ.

## Luồng bố cục thông thường

Các phần tử trên trang web được sắp xếp theo **luồng thông thường** nếu bạn chưa áp dụng bất kỳ CSS nào để thay đổi cách chúng hoạt động. Bạn có thể thay đổi cách các phần tử hoạt động bằng cách điều chỉnh vị trí của chúng trong luồng thông thường hoặc bằng cách loại bỏ chúng hoàn toàn khỏi luồng đó. Bắt đầu với một tài liệu có cấu trúc tốt, có thể đọc được trong luồng thông thường là cách tốt nhất để bắt đầu bất kỳ trang web nào. Điều này đảm bảo nội dung của bạn có thể đọc được ngay cả khi người dùng đang sử dụng trình duyệt rất hạn chế hoặc một thiết bị như trình đọc màn hình đọc nội dung của trang. Ngoài ra, vì luồng thông thường được thiết kế để tạo ra một tài liệu có thể đọc, bằng cách bắt đầu theo cách này, bạn đang làm việc _cùng với_ tài liệu thay vì _chống lại_ nó khi bạn thực hiện các thay đổi đối với bố cục.

Trước khi đi sâu hơn vào các phương pháp bố cục khác nhau, đáng để xem lại một số điều bạn đã học trong các mô-đun trước liên quan đến luồng tài liệu thông thường.

## Các phần tử được sắp xếp như thế nào theo mặc định?

Quá trình bắt đầu khi các hộp của từng phần tử được sắp xếp theo cách mà bất kỳ đệm, viền hoặc lề nào chúng có đều được thêm vào nội dung của chúng. Đây là điều chúng ta gọi là **mô hình hộp**.

Theo mặc định, nội dung của [phần tử cấp khối](/en-US/docs/Glossary/Block-level_content) lấp đầy không gian nội tuyến có sẵn của phần tử cha chứa nó, phát triển theo chiều khối để chứa nội dung của nó. Kích thước của [phần tử cấp nội tuyến](/en-US/docs/Glossary/Inline-level_content) chỉ bằng kích thước nội dung của chúng. Bạn có thể đặt {{cssxref("width")}} hoặc {{cssxref("height")}} trên một số phần tử có giá trị thuộc tính {{cssxref("display")}} mặc định là `inline`, như {{HTMLElement("img")}}, nhưng giá trị `display` vẫn sẽ là `inline`.

Nếu bạn muốn kiểm soát thuộc tính `display` của phần tử cấp nội tuyến theo cách này, hãy sử dụng CSS để đặt nó hoạt động như phần tử cấp khối (ví dụ: với `display: block;` hoặc `display: inline-block;`, kết hợp các đặc điểm từ cả hai).

Điều đó giải thích cách các phần tử được cấu trúc riêng lẻ, nhưng còn cách chúng được cấu trúc khi tương tác với nhau thì sao? Luồng bố cục thông thường (được đề cập trong bài viết giới thiệu bố cục) là hệ thống trong đó các phần tử được đặt bên trong khung nhìn của trình duyệt. Theo mặc định, các phần tử cấp khối được sắp xếp theo _chiều luồng khối_, dựa trên [chế độ viết](/en-US/docs/Web/CSS/Reference/Properties/writing-mode) của cha (_mặc định_: horizontal-tb). Mỗi phần tử sẽ xuất hiện trên một dòng mới bên dưới dòng cuối, với mỗi phần tử được ngăn cách bởi lề đã được chỉ định. Ví dụ, trong tiếng Anh (hoặc bất kỳ chế độ viết ngang, từ trên xuống dưới nào khác), các phần tử cấp khối được sắp xếp theo chiều dọc.

Các phần tử nội tuyến hoạt động khác. Chúng không xuất hiện trên các dòng mới; thay vào đó, chúng đều nằm trên cùng một dòng cùng với bất kỳ nội dung văn bản liền kề (hoặc được bao bọc) miễn là có đủ không gian cho chúng trong chiều rộng của phần tử khối cha. Nếu không có đủ không gian, thì nội dung tràn ra sẽ chuyển xuống dòng mới.

Nếu hai phần tử liền kề theo chiều dọc đều có lề được đặt và các lề của chúng chạm vào nhau, lề lớn hơn trong hai lề sẽ được giữ lại và lề nhỏ hơn sẽ biến mất. Điều này được gọi là [**sụp lề**](/en-US/docs/Web/CSS/Guides/Box_model/Margin_collapsing).
Sụp lề chỉ liên quan đến **chiều dọc**.

### Ví dụ luồng thông thường

Hãy xem một ví dụ đơn giản giải thích tất cả điều này:

```html
<h1>Luồng tài liệu cơ bản</h1>

<p>
  I am a basic block level element. My adjacent block level elements sit on new
  lines below me.
</p>

<p>
  By default we span 100% of the width of our parent element, and we are as tall
  as our child content. Our total width and height is our content + padding +
  border width/height.
</p>

<p>
  We are separated by our margins. Because of margin collapsing, we are
  separated by the size of one of our margins, not both.
</p>

<p>
  Inline elements <span>like this one</span> and <span>this one</span> sit on
  the same line along with adjacent text nodes, if there is space on the same
  line. Overflowing inline elements will
  <span>wrap onto a new line if possible (like this one containing text)</span>,
  or just go on to a new line if not, much like this image will do:
  <img
    src="https://mdn.github.io/shared-assets/images/examples/long.jpg"
    alt="snippet of cloth" />
</p>
```

```css
body {
  width: 500px;
  margin: 0 auto;
}

p {
  background: rgb(255 84 104 / 30%);
  border: 2px solid rgb(255 84 104);
  padding: 10px;
  margin: 10px;
}

span {
  background: white;
  border: 1px solid black;
}
```

{{ EmbedLiveSample('How_are_elements_laid_out_by_default', '100%', 600) }}

Lưu ý rằng HTML được hiển thị theo đúng thứ tự xuất hiện trong mã nguồn, với các phần tử khối được xếp chồng lên nhau.

Đối với nhiều phần tử trên trang của bạn, luồng thông thường sẽ tạo ra chính xác bố cục bạn cần. Tuy nhiên, đối với các bố cục phức tạp hơn, bạn sẽ cần thay đổi hành vi mặc định này bằng một số công cụ có sẵn trong CSS. Bắt đầu với tài liệu HTML có cấu trúc tốt là rất quan trọng vì sau đó bạn có thể làm việc với cách các thứ được sắp xếp theo mặc định thay vì phải chống lại nó.

## Ghi đè luồng thông thường

Các phương pháp có thể ghi đè luồng thông thường và thay đổi cách các phần tử được sắp xếp trong CSS, mà chúng ta sẽ trình bày chi tiết trong mô-đun này, là:

- Thuộc tính {{cssxref("display")}}
  - : Các giá trị tiêu chuẩn như `block`, `inline` hoặc `inline-block` có thể thay đổi cách các phần tử hoạt động trong luồng thông thường, ví dụ: bằng cách làm cho một phần tử cấp khối hoạt động như phần tử cấp nội tuyến (chúng ta đã đề cập về điều này trong bài học [Mô hình hộp](/en-US/docs/Learn_web_development/Core/Styling_basics/Box_model#block_and_inline_boxes)).
- Floats (Thả nổi)
  - : Áp dụng giá trị {{cssxref("float")}} như `left` có thể làm cho các phần tử cấp khối bao quanh một bên của phần tử, giống như cách hình ảnh đôi khi có văn bản nổi xung quanh chúng trong bố cục tạp chí.
- Định vị
  - : Thuộc tính {{cssxref("position")}} cho phép bạn kiểm soát chính xác vị trí đặt các hộp bên trong các hộp khác. Định vị `static` là mặc định trong luồng thông thường, nhưng bạn có thể làm cho các phần tử được sắp xếp khác đi bằng cách sử dụng các giá trị khác, ví dụ: cố định chúng ở đầu khung nhìn trình duyệt bằng `position: fixed`.
- Các hệ thống bố cục cụ thể được truy cập thông qua `display`
  - : Chúng ta cũng có các phương pháp bố cục hoàn chỉnh được kích hoạt qua các giá trị `display` cụ thể. Quan trọng nhất cần biết là [CSS grid](/en-US/docs/Learn_web_development/Core/CSS_layout/Grids) và [Flexbox](/en-US/docs/Learn_web_development/Core/CSS_layout/Flexbox), cả hai đều thay đổi cách các phần tử con được sắp xếp bên trong cha của chúng.
- Thiết kế responsive
  - : Thiết kế responsive đề cập đến việc tạo các bố cục thích ứng với các thiết bị khác nhau mà trang web được hiển thị trên (ví dụ: máy tính để bàn và điện thoại di động). Thiết kế responsive không cung cấp bất kỳ công cụ bố cục cụ thể nào của riêng nó; thành phần quan trọng nhất của nó là at-rule {{cssxref("@media")}}, cho phép bạn áp dụng các bố cục khác nhau tùy thuộc vào các thuộc tính thiết bị như chiều rộng màn hình hoặc độ phân giải.

### Các kỹ thuật bố cục khác

Có những kỹ thuật bố cục ít được sử dụng hơn mà chúng ta sẽ không đề cập trong mô-đun này:

- [Bố cục bảng](/en-US/docs/Web/CSS/Guides/Table)
  - : Các tính năng được thiết kế để tạo kiểu cho các phần của bảng HTML có thể được sử dụng trên các phần tử không phải bảng bằng cách sử dụng `display: table` và các thuộc tính liên quan.
- [Bố cục nhiều cột](/en-US/docs/Web/CSS/Guides/Multicol_layout)
  - : Các thuộc tính bố cục nhiều cột có thể khiến nội dung của một khối được sắp xếp thành các cột, như bạn có thể thấy trong một tờ báo.

## Tóm tắt

Bài viết này đã cung cấp một tóm tắt ngắn gọn về tất cả các công nghệ bố cục mà bạn nên biết tại thời điểm này trong quá trình học! Hãy đọc tiếp để biết thêm thông tin về từng công nghệ riêng lẻ. Tiếp theo, chúng ta sẽ xem xét về floats.

{{NextMenu("Learn_web_development/Core/CSS_layout/Floats", "Learn_web_development/Core/CSS_layout")}}
