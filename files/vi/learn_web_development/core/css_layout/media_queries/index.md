---
title: Kiến thức cơ bản về truy vấn phương tiện
short-title: Truy vấn phương tiện
slug: Learn_web_development/Core/CSS_layout/Media_queries
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/CSS_layout/Responsive_Design", "Learn_web_development/Core/CSS_layout/Test_your_skills/Responsive_design", "Learn_web_development/Core/CSS_layout")}}

**Truy vấn phương tiện CSS** cung cấp cho bạn một cách để áp dụng CSS chỉ khi môi trường trình duyệt và thiết bị khớp với quy tắc bạn chỉ định, ví dụ như "khung nhìn rộng hơn 480 pixel". Truy vấn phương tiện là một phần quan trọng của [thiết kế web responsive](/en-US/docs/Learn_web_development/Core/CSS_layout/Responsive_Design), vì chúng cho phép bạn tạo các bố cục khác nhau tùy thuộc vào kích thước của khung nhìn, nhưng chúng cũng có thể được sử dụng để phát hiện các thứ khác về môi trường mà trang web của bạn đang chạy, ví dụ như liệu người dùng có đang sử dụng màn hình cảm ứng thay vì chuột hay không.

Trong bài học này, bạn sẽ học về cú pháp được sử dụng trong truy vấn phương tiện, sau đó sử dụng chúng trong các ví dụ cho thấy cách một thiết kế cơ bản có thể được làm cho responsive.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content"
          >Cấu trúc nội dung với HTML</a
        >,
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">Kiến thức cơ bản về tạo kiểu CSS</a>,
        <a href="/en-US/docs/Learn_web_development/Core/Text_styling/Fundamentals">Tạo kiểu văn bản và phông chữ cơ bản</a>,
        quen thuộc với <a href="/en-US/docs/Learn_web_development/Core/CSS_layout/Introduction">các khái niệm cơ bản về bố cục CSS</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Cú pháp của truy vấn phương tiện.</li>
          <li>Các loại truy vấn phương tiện phổ biến.</li>
          <li>Sử dụng truy vấn phương tiện <code>width</code> và <code>height</code> để tạo bố cục responsive.</li>
          <li>Chọn điểm ngắt.</li>
          <li>Sử dụng truy vấn phương tiện để triển khai thiết kế mobile-first.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Kiến thức cơ bản về truy vấn phương tiện

Cú pháp truy vấn phương tiện đơn giản nhất trông như sau:

```css
@media media-type and (media-feature-rule) {
  /* CSS rules go here */
}
```

Nó bao gồm:

- Loại phương tiện, cho trình duyệt biết mã này dành cho loại phương tiện nào (print hoặc screen).
- Biểu thức phương tiện, là một quy tắc hoặc bài kiểm tra phải vượt qua để CSS được áp dụng.
- Tập hợp các quy tắc CSS sẽ được áp dụng nếu bài kiểm tra vượt qua và loại phương tiện đúng.

### Các loại phương tiện

Các loại phương tiện có thể chỉ định là:

- `all`
- `print`
- `screen`

Truy vấn phương tiện sau sẽ chỉ đặt body thành 12pt nếu trang được in. Nó sẽ không áp dụng khi trang được tải trong trình duyệt.

```css
@media print {
  body {
    font-size: 12pt;
  }
}
```

> [!NOTE]
> Loại phương tiện ở đây khác với cái gọi là {{glossary("MIME type")}}.
> Có một số loại phương tiện khác được định nghĩa trong thông số kỹ thuật Media Queries Cấp độ 3; những loại này đã bị phản đối và nên tránh.
> Loại phương tiện là tùy chọn; nếu bạn không chỉ định loại phương tiện trong truy vấn phương tiện, thì truy vấn phương tiện sẽ mặc định áp dụng cho tất cả các loại phương tiện.

### Quy tắc tính năng phương tiện

Sau khi chỉ định loại, bạn có thể nhắm mục tiêu đến một tính năng phương tiện bằng quy tắc.
Các ví dụ sau đây cho thấy cách sử dụng các truy vấn phương tiện khác nhau.
Để thay đổi `width` màn hình của bạn, hãy thay đổi kích thước trình duyệt hoặc xoay thiết bị cầm tay của bạn.

> [!NOTE]
> Ngoài ra, bạn có thể sử dụng các tính năng định kích thước responsive trong công cụ dành cho nhà phát triển trình duyệt (như [Chế độ Thiết kế Responsive](https://firefox-source-docs.mozilla.org/devtools-user/responsive_design_mode/) của Firefox) để mô phỏng các chiều rộng thiết bị khác nhau.

#### Chiều rộng và chiều cao

Tính năng chúng ta thường phát hiện nhiều nhất để tạo thiết kế responsive (và được hỗ trợ rộng rãi trên trình duyệt) là chiều rộng khung nhìn, và chúng ta có thể áp dụng CSS nếu khung nhìn cao hơn hoặc thấp hơn một chiều rộng nhất định — hoặc một chiều rộng chính xác — bằng cách sử dụng tính năng phương tiện `width` và thêm tiền tố `min-` hoặc `max-` khi cần.

Các tính năng này được sử dụng để tạo bố cục phản hồi với các kích thước màn hình khác nhau. Ví dụ, để đặt màu văn bản body thành màu đỏ nếu khung nhìn đúng bằng 600 pixel, bạn sẽ sử dụng truy vấn phương tiện sau.

```css live-sample___width
@media screen and (width: 600px) {
  body {
    color: red;
  }
}
```

```html live-sample___width
<p>
  One November night in the year 1782, so the story runs, two brothers sat over
  their winter fire in the little French town of Annonay, watching the grey
  smoke-wreaths from the hearth curl up the wide chimney. Their names were
  Stephen and Joseph Montgolfier, they were papermakers by trade, and were noted
  as possessing thoughtful minds and a deep interest in all scientific knowledge
  and new discovery.
</p>
```

{{EmbedLiveSample("width")}}

Hãy thử điều chỉnh chiều rộng cửa sổ trình duyệt để xem liệu bạn có thể tìm thấy điểm ngọt ngào nơi bản demo trên rộng đúng bằng `600px` để văn bản sẽ chuyển sang màu đỏ không.

Các tính năng phương tiện `width` (và `height`) có thể được sử dụng dưới dạng phạm vi, và do đó có thể được thêm tiền tố `min-` hoặc `max-` để chỉ ra rằng giá trị đã cho là giá trị tối thiểu hoặc tối đa. Ví dụ, để làm cho màu xanh dương nếu khung nhìn rộng 600 pixel hoặc hẹp hơn, hãy sử dụng `max-width`:

```css live-sample___max-width
@media screen and (max-width: 600px) {
  body {
    color: blue;
  }
}
```

```html hidden live-sample___max-width
<p>
  One November night in the year 1782, so the story runs, two brothers sat over
  their winter fire in the little French town of Annonay, watching the grey
  smoke-wreaths from the hearth curl up the wide chimney. Their names were
  Stephen and Joseph Montgolfier, they were papermakers by trade, and were noted
  as possessing thoughtful minds and a deep interest in all scientific knowledge
  and new discovery.
</p>
```

{{EmbedLiveSample("max-width")}}

Hãy thử thu hẹp cửa sổ cho đến khi văn bản trên chuyển sang màu xanh dương.

Trong thực tế, việc sử dụng các giá trị tối thiểu hoặc tối đa hữu ích hơn nhiều cho thiết kế responsive, vì vậy bạn sẽ hiếm khi thấy `width` hoặc `height` được sử dụng một mình.

Có nhiều tính năng phương tiện khác mà bạn có thể kiểm tra, mặc dù một số tính năng mới hơn được giới thiệu trong Cấp độ 4 và 5 của thông số kỹ thuật truy vấn phương tiện có hỗ trợ trình duyệt hạn chế. Mỗi tính năng được ghi lại trên MDN cùng với thông tin hỗ trợ trình duyệt, và bạn có thể tìm danh sách đầy đủ tại [Using Media Queries: Syntax](/en-US/docs/Web/CSS/Guides/Media_queries/Using#syntax).

#### Hướng

Một tính năng phương tiện được hỗ trợ tốt là `orientation`, cho phép chúng ta kiểm tra hướng dọc hoặc ngang. Để thay đổi màu văn bản body nếu thiết bị ở hướng ngang, hãy sử dụng truy vấn phương tiện sau.

```css live-sample___orientation
@media (orientation: landscape) {
  body {
    color: rebeccapurple;
  }
}
```

```html hidden live-sample___orientation
<p>
  One November night in the year 1782, so the story runs, two brothers sat over
  their winter fire in the little French town of Annonay, watching the grey
  smoke-wreaths from the hearth curl up the wide chimney. Their names were
  Stephen and Joseph Montgolfier, they were papermakers by trade, and were noted
  as possessing thoughtful minds and a deep interest in all scientific knowledge
  and new discovery.
</p>
```

{{EmbedLiveSample("orientation")}}

Ví dụ trên khá khó để kiểm tra trong trang; để xem nó hoạt động, bạn nên sao chép mã trên vào một tệp HTML cục bộ và mở nó trong tab riêng của nó.

Chế độ xem máy tính để bàn tiêu chuẩn có hướng ngang, và một thiết kế hoạt động tốt ở hướng này có thể không hoạt động tốt khi được xem trên điện thoại hoặc máy tính bảng ở chế độ dọc. Kiểm tra hướng có thể giúp bạn tạo bố cục được tối ưu hóa cho các thiết bị ở chế độ dọc.

#### Sử dụng thiết bị trỏ

Là một phần của thông số kỹ thuật Cấp độ 4, tính năng phương tiện `hover` đã được giới thiệu. Tính năng này có nghĩa là bạn có thể kiểm tra xem người dùng có khả năng di chuột qua một phần tử hay không, về cơ bản có nghĩa là họ đang sử dụng một loại thiết bị trỏ nào đó; màn hình cảm ứng và điều hướng bàn phím không di chuột.

```css live-sample___hover-example
@media screen and (hover: hover) {
  body:hover {
    color: white;
    background: black;
  }
}
```

```html hidden live-sample___hover-example
<p>
  One November night in the year 1782, so the story runs, two brothers sat over
  their winter fire in the little French town of Annonay, watching the grey
  smoke-wreaths from the hearth curl up the wide chimney. Their names were
  Stephen and Joseph Montgolfier, they were papermakers by trade, and were noted
  as possessing thoughtful minds and a deep interest in all scientific knowledge
  and new discovery.
</p>
```

{{EmbedLiveSample("hover-example")}}

Ví dụ trên thay đổi thành chữ trắng trên nền đen khi di chuột qua, nhưng chỉ trên các thiết bị có khả năng di chuột. Nếu chúng ta biết người dùng không thể di chuột, chúng ta có thể hiển thị một số tính năng tương tác theo mặc định. Đối với người dùng có thể di chuột, chúng ta có thể chọn làm chúng có sẵn khi một liên kết được di chuột qua.

Cũng trong Cấp độ 4 là tính năng phương tiện `pointer`. Nó có ba giá trị có thể, `none`, `fine` và `coarse`. Con trỏ `fine` là thứ gì đó như chuột hoặc bàn di chuột. Nó cho phép người dùng nhắm mục tiêu chính xác một vùng nhỏ. Con trỏ `coarse` là ngón tay của bạn trên màn hình cảm ứng. Giá trị `none` có nghĩa là người dùng không có thiết bị trỏ; có lẽ họ đang điều hướng chỉ bằng bàn phím hoặc bằng lệnh giọng nói.

Sử dụng `pointer` có thể giúp bạn thiết kế các giao diện tốt hơn phản hồi với loại tương tác mà người dùng đang thực hiện với màn hình. Ví dụ, bạn có thể tạo các vùng hit lớn hơn nếu bạn biết người dùng đang tương tác với thiết bị như màn hình cảm ứng.

### Sử dụng cú pháp phạm vi

Một trường hợp phổ biến là kiểm tra xem chiều rộng khung nhìn có nằm giữa hai giá trị không:

```css
@media (min-width: 30em) and (max-width: 50em) {
  /* … */
}
```

Nếu bạn muốn cải thiện khả năng đọc, bạn có thể sử dụng cú pháp "phạm vi":

```css
@media (30em <= width <= 50em) {
  /* … */
}
```

Vì vậy trong trường hợp này, các kiểu được áp dụng khi chiều rộng khung nhìn nằm giữa `30em` và `50em`.

## Truy vấn phương tiện phức tạp hơn

Với tất cả các truy vấn phương tiện khác nhau có thể có, bạn có thể muốn kết hợp chúng hoặc tạo danh sách các truy vấn — bất kỳ cái nào trong số đó có thể khớp.

Như trước đây, hãy thử kiểm tra các ví dụ trong phần này bằng cách điều chỉnh chiều rộng trình duyệt của bạn.

### Logic "and" trong truy vấn phương tiện

Để kết hợp các tính năng phương tiện, bạn có thể sử dụng `and` giống như cách chúng ta đã sử dụng `and` ở trên để kết hợp loại phương tiện và tính năng. Ví dụ, chúng ta có thể muốn kiểm tra `width` và `orientation`. Văn bản body sẽ chỉ là màu xanh dương nếu khung nhìn rộng ít nhất 600 pixel và thiết bị ở chế độ ngang.

```css live-sample___and
@media screen and (width >= 600px) and (orientation: landscape) {
  body {
    color: blue;
  }
}
```

```html hidden live-sample___and
<p>
  One November night in the year 1782, so the story runs, two brothers sat over
  their winter fire in the little French town of Annonay, watching the grey
  smoke-wreaths from the hearth curl up the wide chimney. Their names were
  Stephen and Joseph Montgolfier, they were papermakers by trade, and were noted
  as possessing thoughtful minds and a deep interest in all scientific knowledge
  and new discovery.
</p>
```

{{EmbedLiveSample("and")}}

### Logic "or" trong truy vấn phương tiện

Nếu bạn có một tập hợp các truy vấn, bất kỳ cái nào trong số đó có thể khớp, thì bạn có thể phân cách các truy vấn này bằng dấu phẩy. Trong ví dụ dưới đây văn bản sẽ là màu xanh dương nếu khung nhìn rộng ít nhất 600 pixel HOẶC thiết bị ở hướng ngang. Nếu một trong hai điều này đúng thì truy vấn khớp.

```css live-sample___or
@media screen and (width >= 600px), screen and (orientation: landscape) {
  body {
    color: blue;
  }
}
```

```html hidden live-sample___or
<p>
  One November night in the year 1782, so the story runs, two brothers sat over
  their winter fire in the little French town of Annonay, watching the grey
  smoke-wreaths from the hearth curl up the wide chimney. Their names were
  Stephen and Joseph Montgolfier, they were papermakers by trade, and were noted
  as possessing thoughtful minds and a deep interest in all scientific knowledge
  and new discovery.
</p>
```

{{EmbedLiveSample("or")}}

### Logic "not" trong truy vấn phương tiện

Bạn có thể phủ định toàn bộ truy vấn phương tiện bằng cách sử dụng toán tử `not`. Điều này đảo ngược ý nghĩa của toàn bộ truy vấn phương tiện. Do đó trong ví dụ tiếp theo này, văn bản sẽ chỉ là màu xanh dương nếu khung nhìn _không_ rộng ít nhất 600 pixel.

```css live-sample___not
@media not (width >= 600px) {
  body {
    color: blue;
  }
}
```

```html hidden live-sample___not
<p>
  One November night in the year 1782, so the story runs, two brothers sat over
  their winter fire in the little French town of Annonay, watching the grey
  smoke-wreaths from the hearth curl up the wide chimney. Their names were
  Stephen and Joseph Montgolfier, they were papermakers by trade, and were noted
  as possessing thoughtful minds and a deep interest in all scientific knowledge
  and new discovery.
</p>
```

{{EmbedLiveSample("not")}}

Bạn cũng có thể sử dụng `not` để phủ định các biểu thức cụ thể.

```css
@media (not (width < 600px)) and (not (width > 1000px)) {
  body {
    color: blue;
  }
}
```

Điều này sẽ áp dụng các kiểu nếu chiều rộng khung nhìn nằm giữa 600 và 1000 pixel. Điều này tương đương với `(600px <= width <= 1000px)`.

## Cách chọn điểm ngắt

Trong những ngày đầu của thiết kế responsive, nhiều nhà thiết kế sẽ cố gắng nhắm mục tiêu các kích thước màn hình cụ thể. Danh sách kích thước màn hình của các điện thoại và máy tính bảng phổ biến đã được công bố để các thiết kế có thể được tạo ra để phù hợp gọn gàng với các khung nhìn đó.

Bây giờ có quá nhiều thiết bị, với vô số kích thước khác nhau, khiến điều đó không khả thi. Điều này có nghĩa là thay vì nhắm mục tiêu các kích thước cụ thể cho tất cả các thiết kế, cách tiếp cận tốt hơn là thay đổi thiết kế ở kích thước mà nội dung bắt đầu bị hỏng theo một cách nào đó. Có lẽ độ dài dòng trở nên quá dài, hoặc thanh bên bị bóp lại và khó đọc. Đó là điểm mà bạn muốn sử dụng truy vấn phương tiện để thay đổi thiết kế sang thiết kế tốt hơn cho không gian bạn có. Cách tiếp cận này có nghĩa là không quan trọng kích thước chính xác của thiết bị được sử dụng là gì; mọi phạm vi đều được phục vụ. Các điểm mà tại đó truy vấn phương tiện được giới thiệu được gọi là **điểm ngắt**.

[Chế độ Thiết kế Responsive](https://firefox-source-docs.mozilla.org/devtools-user/responsive_design_mode/index.html) trong Firefox DevTools rất hữu ích để xác định vị trí các điểm ngắt này. Bạn có thể dễ dàng làm cho khung nhìn nhỏ hơn và lớn hơn để xem nơi nào nội dung sẽ được cải thiện bằng cách thêm truy vấn phương tiện và điều chỉnh thiết kế.

![Ảnh chụp màn hình bố cục trong chế độ xem di động trong Firefox DevTools.](rwd-mode.png)

## Thiết kế responsive mobile-first

Nói chung, bạn có thể thực hiện hai cách tiếp cận để thiết kế responsive. Bạn có thể bắt đầu với chế độ xem máy tính để bàn hoặc rộng nhất rồi thêm điểm ngắt để di chuyển mọi thứ khi khung nhìn trở nên nhỏ hơn, hoặc bạn có thể bắt đầu với chế độ xem nhỏ nhất và thêm bố cục khi khung nhìn trở nên lớn hơn. Cách tiếp cận thứ hai này được mô tả là thiết kế responsive **mobile-first** và thường là cách tiếp cận tốt nhất để làm theo.

Chế độ xem cho các thiết bị nhỏ nhất thường là một cột nội dung đơn giản, giống như nó xuất hiện trong luồng thông thường. Điều này có nghĩa là bạn có thể không cần phải làm nhiều bố cục cho các thiết bị nhỏ — sắp xếp nguồn của bạn tốt và bạn sẽ có bố cục có thể đọc được theo mặc định.

## Tạo thiết kế mobile-first của riêng bạn

Bây giờ đến lượt bạn; trong phần hướng dẫn này bạn sẽ xây dựng thiết kế responsive mobile-first cơ bản của riêng mình. Trên một trang web thực tế, bạn có thể sẽ có nhiều thứ hơn cần điều chỉnh trong các truy vấn phương tiện, nhưng cách tiếp cận sẽ hoàn toàn giống nhau.

### Bắt đầu

Điểm khởi đầu của chúng ta là một tài liệu HTML với một số CSS được áp dụng để thêm màu nền vào các phần khác nhau của bố cục.

Trước tiên, hãy sao chép mã HTML từ khối bên dưới vào trình soạn thảo văn bản, lưu nó như một tệp HTML trên máy tính của bạn và mở nó trong trình duyệt:

```html live-sample___walkthrough
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Media Queries: a simple mobile first design, step 1</title>
  <style>
    /* Add styles here */
  </style>
</head>
<div class="wrapper">
  <header>
    <nav>
      <ul>
        <li><a href="">About</a></li>
        <li><a href="">Contact</a></li>
        <li><a href="">Meet the team</a></li>
        <li><a href="">Blog</a></li>
      </ul>
    </nav>
  </header>
  <main>
    <article>
      <div class="content">
        <h1>Veggies!</h1>
        <p>
          Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh
          onion daikon amaranth tatsoi tomatillo melon azuki bean garlic.
        </p>

        <p>
          Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot
          courgette tatsoi pea sprouts fava bean collard greens dandelion okra
          wakame tomato. Dandelion cucumber earthnut pea peanut soko zucchini.
        </p>

        <p>
          Turnip greens yarrow ricebean rutabaga endive cauliflower sea lettuce
          kohlrabi amaranth water spinach avocado daikon napa cabbage asparagus
          winter purslane kale. Celery potato scallion desert raisin horseradish
          spinach carrot soko. Lotus root water spinach fennel kombu maize
          bamboo shoot green bean swiss chard seakale pumpkin onion chickpea
          gram corn pea. Brussels sprout coriander water chestnut gourd swiss
          chard wakame kohlrabi beetroot carrot watercress. Corn amaranth
          salsify bunya nuts nori azuki bean chickweed potato bell pepper
          artichoke.
        </p>

        <p>
          Nori grape silver beet broccoli kombu beet greens fava bean potato
          quandong celery. Bunya nuts black-eyed pea prairie turnip leek lentil
          turnip greens parsnip. Sea lettuce lettuce water chestnut eggplant
          winter purslane fennel azuki bean earthnut pea sierra leone bologi
          leek soko chicory celtuce parsley jícama salsify.
        </p>
      </div>
      <aside class="related">
        <p>
          All these veggies are brought to you by the
          <a href="https://veggieipsum.com/">Veggie Ipsum generator</a>.
        </p>
      </aside>
    </article>
    <aside class="sidebar">
      <h2>External vegetable-based links</h2>
      <ul>
        <li>
          <a
            href="https://www.thekitchn.com/how-to-cook-broccoli-5-ways-167323">
            How to cook broccoli
          </a>
        </li>
        <li>
          <a href="https://www.bbcgoodfood.com/glossary/swiss-chard">
            Swiss Chard
          </a>
        </li>
        <li>
          <a
            href="https://www.bbcgoodfood.com/recipes/collection/christmas-parsnip">
            Christmas Parsnip Recipes
          </a>
        </li>
      </ul>
    </aside>
  </main>

  <footer>
    <p>&copy; 2024</p>
  </footer>
</div>
```

Nguồn của tài liệu được sắp xếp theo cách làm cho nội dung có thể đọc được. Đây là bước đầu tiên quan trọng và đảm bảo rằng nếu nội dung được đọc bởi trình đọc màn hình, nó sẽ dễ hiểu.

Các kiểu ban đầu cho ví dụ của chúng ta như sau; hãy sao chép những kiểu này vào tệp HTML của bạn bên trong các thẻ `<style></style>`, thay thế comment `/* Add styles here */`.

```css live-sample___walkthrough
* {
  box-sizing: border-box;
}

body {
  width: 90%;
  margin: 2em auto;
  font:
    1em/1.3 "Helvetica",
    "Arial",
    sans-serif;
}

a:link,
a:visited {
  color: #333333;
}

nav ul,
aside ul {
  list-style: none;
  padding: 0;
}

nav a:link,
nav a:visited {
  background-color: rgb(207 232 220 / 20%);
  border: 2px solid rgb(79 185 227);
  text-decoration: none;
  display: block;
  padding: 10px;
  color: #333333;
  font-weight: bold;
}

nav a:hover {
  background-color: rgb(207 232 220 / 70%);
}

.related {
  background-color: rgb(79 185 227 / 30%);
  border: 1px solid rgb(79 185 227);
  padding: 10px;
}

.sidebar {
  background-color: rgb(207 232 220 / 50%);
  padding: 10px;
}

article {
  margin-bottom: 1em;
}
```

Nếu bạn xem bố cục trong Chế độ Thiết kế Responsive trong DevTools, hoặc thu hẹp cửa sổ trình duyệt đến chiều rộng giống như điện thoại di động, bạn sẽ thấy nó hoạt động khá tốt như một chế độ xem di động đơn giản của trang web.

{{EmbedLiveSample("walkthrough", "", "600px")}}

### Tạo bố cục hai cột cho chiều rộng trung bình

Kéo rộng cửa sổ cho đến khi bạn có thể thấy độ dài dòng trở nên khá dài; đây là lúc bạn có không gian cho điều hướng hiển thị theo hàng ngang. Đây là nơi chúng ta sẽ thêm truy vấn phương tiện đầu tiên. Chúng ta sẽ sử dụng đơn vị `em`, vì điều này có nghĩa là nếu người dùng đã tăng kích thước văn bản của họ, điểm ngắt sẽ xảy ra ở độ dài dòng tương tự nhưng khung nhìn rộng hơn so với người dùng có kích thước văn bản nhỏ hơn.

Thêm phần sau vào cuối CSS của bạn:

```css
@media screen and (width >= 40em) {
  article {
    display: grid;
    grid-template-columns: 3fr 1fr;
    column-gap: 20px;
  }

  nav ul {
    display: flex;
  }

  nav li {
    flex: 1;
  }
}
```

CSS này cho chúng ta bố cục hai cột bên trong `<article>`, gồm nội dung bài viết và thông tin liên quan trong phần tử `<aside>`. Chúng ta cũng đã sử dụng flexbox để đặt điều hướng vào một hàng.

### Thêm cột thứ ba cho màn hình rộng hơn

Hãy tiếp tục mở rộng chiều rộng cho đến khi chúng ta cảm thấy có đủ không gian cho thanh bên cũng tạo thành một cột mới. Bên trong truy vấn phương tiện, chúng ta sẽ làm cho phần tử `<main>` thành lưới hai cột. Sau đó chúng ta cần xóa {{cssxref("margin-bottom")}} trên bài viết để hai thanh bên căn thẳng với nhau, và chúng ta sẽ thêm một {{cssxref("border")}} vào đầu footer. Thông thường những chỉnh sửa nhỏ này là loại công việc bạn sẽ làm để làm cho thiết kế trông đẹp ở mỗi điểm ngắt.

Thêm phần sau vào cuối CSS của bạn:

```css
@media screen and (width >= 70em) {
  main {
    display: grid;
    grid-template-columns: 3fr 1fr;
    column-gap: 20px;
  }

  article {
    margin-bottom: 0;
  }

  footer {
    border-top: 1px solid #cccccc;
    margin-top: 2em;
  }
}
```

Đó là ví dụ đã hoàn chỉnh. Nếu bạn xem kết quả ở các chiều rộng khác nhau, bạn có thể thấy cách thiết kế phản hồi và hoạt động như một cột, hai cột hoặc ba cột, tùy thuộc vào chiều rộng có sẵn. Đây là một ví dụ cơ bản về thiết kế responsive mobile-first.

### viewport meta

Nếu bạn nhìn vào nguồn HTML trong ví dụ trên, bạn sẽ thấy phần tử sau được bao gồm trong phần head của tài liệu:

```html
<meta name="viewport" content="width=device-width,initial-scale=1" />
```

Đây là thẻ meta [`viewport`](/en-US/docs/Web/HTML/Reference/Elements/meta/name/viewport) — nó tồn tại như một cách để kiểm soát cách các trình duyệt di động hiển thị nội dung, đảm bảo chúng tôn trọng các truy vấn phương tiện của bạn. Thẻ trên cho các trình duyệt di động "đừng hiển thị nội dung với khung nhìn 980 pixel — hãy hiển thị nó bằng chiều rộng thiết bị thực và đặt mức tỷ lệ ban đầu mặc định để có tính nhất quán tốt hơn." Các truy vấn phương tiện sau đó sẽ hoạt động như mong đợi.

Để biết thêm thông tin về lý do tại sao điều này cần thiết, hãy xem phần [Thẻ meta viewport](/en-US/docs/Learn_web_development/Core/CSS_layout/Responsive_Design#the_viewport_meta_tag) trong bài viết trước.

## Bạn có thực sự cần truy vấn phương tiện không?

Flexbox và CSS Grid cung cấp cho bạn các cách để tạo các thành phần linh hoạt và thậm chí responsive mà không cần truy vấn phương tiện: Luôn đáng để cân nhắc xem bạn có thực sự cần một cái không. Ví dụ, bạn có thể muốn một tập hợp thẻ có chiều rộng ít nhất 200 pixel và khớp nhiều thẻ 200 pixel này qua cột nội dung chính nhất có thể, bất kể nó rộng bao nhiêu.

Điều này có thể đạt được với CSS Grid, hoàn toàn không cần truy vấn phương tiện:

```html live-sample___grid
<ul class="grid">
  <li>
    <h2>Card 1</h2>
    <p>…</p>
  </li>
  <li>
    <h2>Card 2</h2>
    <p>…</p>
  </li>
  <li>
    <h2>Card 3</h2>
    <p>…</p>
  </li>
  <li>
    <h2>Card 4</h2>
    <p>…</p>
  </li>
  <li>
    <h2>Card 5</h2>
    <p>…</p>
  </li>
</ul>
```

```css live-sample___grid
body {
  font: 1.2em / 1.5 sans-serif;
}
.grid {
  list-style: none;
  margin: 0;
  padding: 0;
  display: grid;
  gap: 20px;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
}

.grid li {
  border: 1px solid #666666;
  padding: 10px;
}
```

{{EmbedLiveSample("grid", "", "350px")}}

Hãy thử làm cho cửa sổ trình duyệt rộng hơn và hẹp hơn để xem số lượng track cột thay đổi.

Điều tuyệt vời về phương pháp này là lưới không xem xét chiều rộng khung nhìn mà là chiều rộng nó có sẵn cho thành phần này. Có vẻ lạ khi kết thúc một phần về truy vấn phương tiện với đề xuất rằng bạn có thể không cần một cái! Tuy nhiên, trong thực tế bạn sẽ thấy rằng việc sử dụng tốt các phương pháp bố cục hiện đại, được tăng cường bằng truy vấn phương tiện, sẽ mang lại kết quả tốt nhất.

## Tóm tắt

Trong bài học này bạn đã học về truy vấn phương tiện, và cũng khám phá cách sử dụng chúng trong thực tế để tạo thiết kế responsive mobile-first.

Bạn có thể sử dụng điểm khởi đầu mà chúng ta đã tạo để thử thêm nhiều truy vấn phương tiện hơn. Ví dụ, có lẽ bạn có thể thay đổi kích thước điều hướng nếu bạn phát hiện khách truy cập có con trỏ thô, sử dụng tính năng phương tiện `pointer`.

Bạn cũng có thể thử nghiệm thêm các thành phần khác nhau và xem liệu việc thêm truy vấn phương tiện, hay sử dụng phương pháp bố cục như flexbox hoặc grid có phải là cách phù hợp nhất để làm cho các thành phần responsive hay không. Rất thường không có cách đúng hay sai — bạn nên thử nghiệm và xem cái nào hoạt động tốt nhất cho thiết kế và nội dung của bạn.

Được rồi, chúng ta gần đến cuối mô-đun này rồi. Trong bài viết tiếp theo, chúng ta sẽ cung cấp cho bạn một số bài kiểm tra mà bạn có thể sử dụng để kiểm tra xem bạn đã hiểu và ghi nhớ tốt như thế nào tất cả thông tin về thiết kế web responsive và truy vấn phương tiện được cung cấp trong hai bài viết trước.

{{PreviousMenuNext("Learn_web_development/Core/CSS_layout/Responsive_Design", "Learn_web_development/Core/CSS_layout/Test_your_skills/Responsive_design", "Learn_web_development/Core/CSS_layout")}}
