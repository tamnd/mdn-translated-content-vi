---
title: CSS là gì?
slug: Learn_web_development/Core/Styling_basics/What_is_CSS
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Core/Styling_basics/Getting_started", "Learn_web_development/Core/Styling_basics")}}

**{{Glossary("CSS")}}** (Cascading Style Sheets) cho phép bạn tạo các trang web trông tuyệt vời, nhưng nó hoạt động như thế nào bên trong? Bài viết này giải thích CSS là gì, cú pháp cơ bản trông như thế nào, và cách trình duyệt áp dụng CSS vào HTML để tạo kiểu cho nó.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <a
          href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Installing_software"
          >Phần mềm cơ bản đã được cài đặt</a
        >, kiến thức cơ bản về
        <a
          href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Dealing_with_files"
          >làm việc với tệp</a
        >, và quen thuộc với HTML (hãy học qua mô-đun
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content"
          >Cấu trúc nội dung với HTML</a
        >.)
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Mục đích của CSS.</li>
          <li>HTML không liên quan gì đến việc tạo kiểu.</li>
          <li>Khái niệm về kiểu mặc định của trình duyệt.</li>
          <li>Mã CSS trông như thế nào.</li>
          <li>Cách CSS được áp dụng vào HTML.</li>
        <ul>
      </td>
    </tr>
  </tbody>
</table>

## Kiểu mặc định của trình duyệt

Trong mô-đun [Cấu trúc nội dung với HTML](/en-US/docs/Learn_web_development/Core/Structuring_content), chúng ta đã đề cập đến HTML là gì và cách nó được sử dụng để đánh dấu tài liệu. Các tài liệu này sẽ có thể đọc được trong trình duyệt web. Các tiêu đề sẽ trông lớn hơn văn bản thông thường, các đoạn văn bản sẽ xuống dòng mới và có khoảng cách giữa chúng. Các liên kết được tô màu và gạch chân để phân biệt với phần còn lại của văn bản.

Những gì bạn thấy là kiểu mặc định của trình duyệt — tạo kiểu rất cơ bản mà trình duyệt áp dụng vào HTML để đảm bảo rằng trang web sẽ có thể đọc được ngay cả khi không có tạo kiểu rõ ràng nào được chỉ định bởi tác giả của trang. Các kiểu này được xác định trong các bảng kiểu CSS mặc định có trong trình duyệt — chúng không liên quan gì đến HTML.

![Kiểu mặc định được sử dụng bởi một trình duyệt](html-example.png)

Web sẽ là một nơi nhàm chán nếu tất cả các trang web trông như vậy. Đây là lý do tại sao bạn cần học về CSS.

## CSS dùng để làm gì?

Sử dụng CSS, bạn có thể kiểm soát chính xác cách các phần tử HTML trông như thế nào trong trình duyệt, trình bày tài liệu của bạn cho người dùng với bất kỳ thiết kế và bố cục nào bạn muốn.

- Một **tài liệu** thường là tệp văn bản được cấu trúc bằng ngôn ngữ đánh dấu, phổ biến nhất là {{Glossary("HTML")}} (được gọi là _tài liệu HTML_). Bạn cũng có thể gặp các tài liệu được viết bằng các ngôn ngữ đánh dấu khác như {{Glossary("SVG")}} hoặc {{Glossary("XML")}}. Tài liệu HTML chứa nội dung của trang web và xác định cấu trúc của nó.
- **Trình bày** một tài liệu cho người dùng có nghĩa là chuyển đổi nó thành một dạng có thể sử dụng được bởi độc giả. {{Glossary("browser","Các trình duyệt")}} như {{Glossary("Mozilla Firefox","Firefox")}}, {{Glossary("Google Chrome","Chrome")}}, {{Glossary("Apple_Safari","Safari")}} và {{Glossary("Microsoft Edge","Edge")}} được thiết kế để trình bày tài liệu một cách trực quan, ví dụ trên màn hình máy tính, máy chiếu, thiết bị di động hoặc máy in. Trong bối cảnh web, điều này thường được gọi là _kết xuất_; chúng tôi đã cung cấp mô tả đơn giản về quá trình kết xuất trang web trong [Cách trình duyệt tải các trang web](/en-US/docs/Learn_web_development/Getting_started/Web_standards/How_browsers_load_websites).

> [!NOTE]
> Trình duyệt đôi khi được gọi là {{Glossary("User agent","tác nhân người dùng")}}, về cơ bản có nghĩa là một chương trình máy tính đại diện cho một người trong hệ thống máy tính.

CSS có thể được sử dụng cho nhiều mục đích liên quan đến giao diện và cảm nhận của trang web, ví dụ:

- Tạo kiểu văn bản, bao gồm thay đổi [màu sắc](/en-US/docs/Web/CSS/Reference/Values/color_value) và [kích thước](/en-US/docs/Web/CSS/Reference/Properties/font-size) của tiêu đề và liên kết.
- Tạo bố cục, chẳng hạn như [bố cục lưới](/en-US/docs/Learn_web_development/Core/CSS_layout/Grids) hoặc [bố cục nhiều cột](/en-US/docs/Web/CSS/How_to/Layout_cookbook/Column_layouts).
- Các hiệu ứng đặc biệt như [hiệu ứng động](/en-US/docs/Web/CSS/Guides/Animations).

Ngôn ngữ CSS được tổ chức thành các _mô-đun_ chứa các chức năng liên quan. Ví dụ, hãy xem các trang tham chiếu MDN cho mô-đun [Nền và Đường viền](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders) để tìm hiểu mục đích của nó và các thuộc tính cũng như tính năng mà nó chứa. Trong các trang mô-đun của chúng tôi, bạn cũng sẽ tìm thấy các liên kết đến _Thông số kỹ thuật_ xác định các công nghệ.

## Cú pháp CSS cơ bản

CSS là ngôn ngữ dựa trên quy tắc — bạn định nghĩa các quy tắc bằng cách chỉ định các nhóm kiểu cần áp dụng cho một phần tử hoặc nhóm phần tử cụ thể trên trang web của bạn.

Ví dụ, bạn có thể muốn tạo kiểu cho tiêu đề chính trên trang của mình thành văn bản đỏ lớn. Đoạn mã sau đây cho thấy một quy tắc CSS rất đơn giản để đạt được điều này:

```css
h1 {
  color: red;
  font-size: 2.5em;
}
```

- Trong ví dụ trên, quy tắc CSS mở đầu bằng một {{Glossary("CSS Selector", "bộ chọn")}}. Đây _chọn_ các phần tử HTML mà chúng ta sẽ tạo kiểu. Trong trường hợp này, chúng ta đang tạo kiểu cho tiêu đề cấp một (`{{htmlelement("Heading_Elements", "&lt;h1>")}}`).
- Sau đó chúng ta có một cặp dấu ngoặc nhọn — `{ }`.
- Bên trong dấu ngoặc nhọn chứa một hoặc nhiều **khai báo**, có dạng cặp **thuộc tính** và **giá trị**. Chúng ta xác định thuộc tính (ví dụ, `color` trong ví dụ trên) trước dấu hai chấm và xác định giá trị của thuộc tính sau dấu hai chấm (`red` là giá trị được đặt cho thuộc tính `color`).
- Ví dụ này chứa hai khai báo, một cho `color` và một cho `font-size`.

Các {{Glossary("property/CSS","thuộc tính")}} CSS khác nhau có các giá trị cho phép khác nhau. Trong ví dụ của chúng ta, chúng ta có thuộc tính `color`, có thể nhận các [giá trị màu](/en-US/docs/Learn_web_development/Core/Styling_basics/Values_and_units#color) khác nhau. Chúng ta cũng có thuộc tính `font-size`. Thuộc tính này có thể nhận các [đơn vị kích thước](/en-US/docs/Learn_web_development/Core/Styling_basics/Values_and_units#numbers_lengths_and_percentages) khác nhau làm giá trị.

Một bảng kiểu CSS chứa nhiều quy tắc như vậy, được viết nối tiếp nhau.

```css
h1 {
  color: red;
  font-size: 2.5em;
}

p {
  color: aqua;
  padding: 5px;
  background: midnightblue;
}
```

Bạn sẽ thấy rằng bạn nhanh chóng học được một số giá trị, trong khi những giá trị khác bạn sẽ cần tra cứu. Các trang thuộc tính riêng lẻ trên MDN cung cấp cho bạn một cách nhanh chóng để tra cứu thuộc tính và giá trị của chúng.

> [!NOTE]
> Bạn có thể tìm thấy các liên kết đến tất cả các trang thuộc tính CSS (cùng với các tính năng CSS khác) được liệt kê trên [tham chiếu CSS](/en-US/docs/Web/CSS/Reference) của MDN. Ngoài ra, bạn nên quen với việc tìm kiếm "mdn _tên-tính-năng-css_" trong công cụ tìm kiếm yêu thích của bạn bất cứ khi nào bạn cần tìm hiểu thêm thông tin về một tính năng CSS. Ví dụ, hãy thử tìm kiếm "mdn color" hoặc "mdn font-size"!

## Cách CSS được áp dụng vào HTML?

Như đã giải thích trong [Cách trình duyệt tải các trang web](/en-US/docs/Learn_web_development/Getting_started/Web_standards/How_browsers_load_websites), khi bạn điều hướng đến một trang web, trình duyệt đầu tiên nhận tài liệu HTML chứa nội dung trang web và chuyển đổi nó thành **cây DOM**.

Sau đó, bất kỳ quy tắc CSS nào được tìm thấy trong trang web (được chèn trực tiếp vào HTML hoặc trong các tệp `.css` bên ngoài được tham chiếu) sẽ được sắp xếp vào các "nhóm" khác nhau, dựa trên các phần tử khác nhau mà chúng sẽ được áp dụng (như được chỉ định bởi các bộ chọn của chúng). Sau đó, các quy tắc CSS được áp dụng vào cây DOM, tạo ra một **cây kết xuất**, sau đó được vẽ lên cửa sổ trình duyệt.

Hãy xem một ví dụ. Đầu tiên, chúng ta sẽ xác định một đoạn HTML mà CSS có thể được áp dụng vào:

```html
<h1>CSS thật tuyệt vời</h1>

<p>Bạn có thể tạo kiểu cho văn bản.</p>

<p>Và tạo bố cục và hiệu ứng đặc biệt.</p>
```

Bây giờ, CSS của chúng ta, lặp lại từ phần trước:

```css
h1 {
  color: red;
  font-size: 2.5em;
}

p {
  color: aqua;
  padding: 5px;
  background: midnightblue;
}
```

CSS này:

- Chọn tất cả các phần tử `<h1>` trên trang, tô màu đỏ cho văn bản của chúng và làm chúng lớn hơn kích thước mặc định. Vì chỉ có một `<h1>` trong HTML ví dụ của chúng ta, nên chỉ phần tử đó sẽ được tạo kiểu.
- Chọn tất cả các phần tử `<p>` trên trang, cho chúng màu văn bản và nền tùy chỉnh và một số khoảng cách xung quanh văn bản. Có hai phần tử `<p>` trong HTML ví dụ của chúng ta, và cả hai đều được tạo kiểu.

Khi CSS được áp dụng vào HTML, kết quả kết xuất như sau:

{{EmbedLiveSample('How is CSS applied to HTML?', '100%', 200)}}

## Thử nghiệm với CSS

Hãy thử nghiệm với ví dụ trên. Để làm vậy, nhấn nút "Play" ở góc trên bên phải để tải nó trong trình chỉnh sửa MDN Playground.

Thực hiện những điều sau:

1. Thêm một đoạn văn bản khác bên dưới hai đoạn hiện có, và lưu ý rằng quy tắc CSS thứ hai được tự động áp dụng cho đoạn mới.
2. Thêm một tiêu đề phụ `<h2>` ở đâu đó bên dưới `<h1>`, có thể sau một trong các đoạn.
3. Hãy thử đặt cho các phần tử `<h2>` một màu khác bằng cách thêm quy tắc mới vào CSS. Sao chép quy tắc `h1`, đổi bộ chọn thành `h2` và đổi giá trị `color` từ `red` thành `purple`, chẳng hạn.
4. Nếu bạn cảm thấy táo bạo, hãy thử tra cứu một số thuộc tính và giá trị CSS mới trong [tham chiếu CSS](/en-US/docs/Web/CSS/Reference) của MDN để thêm vào quy tắc của bạn!

Để thực hành thêm với kiến thức cơ bản về CSS, hãy xem [Viết những dòng CSS đầu tiên của bạn!](https://scrimba.com/learn-html-and-css-c0p/~0j?via=mdn) từ Scrimba <sup>[_Đối tác học tập MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup>. Scrim này cung cấp tóm tắt hữu ích về cú pháp CSS cơ bản và cung cấp một thử thách tương tác nơi bạn có thể thực hành thêm về viết khai báo CSS.

## Tóm tắt

Bây giờ bạn đã hiểu một chút về CSS là gì và cách nó hoạt động, hãy tiếp tục cho bạn một số thực hành với việc tự viết CSS và giải thích cú pháp chi tiết hơn.

{{NextMenu("Learn_web_development/Core/Styling_basics/Getting_started", "Learn_web_development/Core/Styling_basics")}}
