---
title: Tạo kiểu danh sách
slug: Learn_web_development/Core/Text_styling/Styling_lists
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Text_styling/Fundamentals", "Learn_web_development/Core/Text_styling/Styling_links", "Learn_web_development/Core/Text_styling")}}

[Danh sách](/en-US/docs/Learn_web_development/Core/Structuring_content/Lists) về cơ bản hoạt động như bất kỳ văn bản nào khác, nhưng có một số thuộc tính CSS dành riêng cho danh sách mà bạn cần biết, cũng như một số phương pháp tốt nhất cần xem xét. Bài viết này giải thích tất cả.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content"
          >Cấu trúc nội dung với HTML</a
        > và
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">Kiến thức cơ bản về tạo kiểu CSS</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Tạo khoảng cách cho các mục danh sách, ví dụ bằng margin hoặc chiều cao dòng.</li>
          <li>Sử dụng các thuộc tính <code>list-style</code>.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Ví dụ danh sách đơn giản

Để bắt đầu, hãy xem xét một ví dụ danh sách đơn giản. Xuyên suốt bài viết này, chúng ta sẽ xem xét các danh sách không có thứ tự, có thứ tự và danh sách mô tả — tất cả đều có các tính năng tạo kiểu tương tự nhau, cũng như một số tính năng đặc trưng riêng của chúng. Ví dụ chưa được tạo kiểu [có sẵn trên GitHub](https://mdn.github.io/learning-area/css/styling-text/styling-lists/unstyled-list.html) (cũng hãy xem [mã nguồn](https://github.com/mdn/learning-area/blob/main/css/styling-text/styling-lists/unstyled-list.html) nhé).

HTML cho ví dụ danh sách của chúng ta trông như sau:

```html
<h2>Shopping (unordered) list</h2>

<p>
  Paragraph for reference, paragraph for reference, paragraph for reference,
  paragraph for reference, paragraph for reference, paragraph for reference.
</p>

<ul>
  <li>Hummus</li>
  <li>Pita</li>
  <li>Green salad</li>
  <li>Halloumi</li>
</ul>

<h2>Recipe (ordered) list</h2>

<p>
  Paragraph for reference, paragraph for reference, paragraph for reference,
  paragraph for reference, paragraph for reference, paragraph for reference.
</p>

<ol>
  <li>Toast pita, leave to cool, then slice down the edge.</li>
  <li>
    Fry the halloumi in a shallow, non-stick pan, until browned on both sides.
  </li>
  <li>Wash and chop the salad.</li>
  <li>Fill pita with salad, hummus, and fried halloumi.</li>
</ol>

<h2>Ingredient description list</h2>

<p>
  Paragraph for reference, paragraph for reference, paragraph for reference,
  paragraph for reference, paragraph for reference, paragraph for reference.
</p>

<dl>
  <dt>Hummus</dt>
  <dd>
    A thick dip/sauce generally made from chick peas blended with tahini, lemon
    juice, salt, garlic, and other ingredients.
  </dd>
  <dt>Pita</dt>
  <dd>A soft, slightly leavened flatbread.</dd>
  <dt>Halloumi</dt>
  <dd>
    A semi-hard, unripened, brined cheese with a higher-than-usual melting
    point, usually made from goat/sheep milk.
  </dd>
  <dt>Green salad</dt>
  <dd>That green healthy stuff that many of us just use to garnish kebabs.</dd>
</dl>
```

Nếu bạn truy cập ví dụ trực tiếp bây giờ và kiểm tra các phần tử danh sách bằng [công cụ dành cho nhà phát triển của trình duyệt](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/What_are_browser_developer_tools), bạn sẽ nhận thấy một vài giá trị tạo kiểu mặc định:

- Các phần tử {{htmlelement("ul")}} và {{htmlelement("ol")}} có {{cssxref("margin")}} trên và dưới là `16px` (`1em`) và {{cssxref("padding-left")}} là `40px` (`2.5em`). Nếu thuộc tính hướng [`dir`](/en-US/docs/Web/HTML/Reference/Global_attributes/dir) được thiết lập là phải sang trái (`rtl`) cho các phần tử `ul` và `ol`, thì {{cssxref("padding-right")}} có hiệu lực và giá trị mặc định của nó là `40px` (`2.5em`).
- Các mục danh sách (phần tử {{htmlelement("li")}}) không có giá trị mặc định nào được thiết lập cho khoảng cách.
- Phần tử {{htmlelement("dl")}} có {{cssxref("margin")}} trên và dưới là `16px` (`1em`), nhưng không có padding được thiết lập.
- Các phần tử {{htmlelement("dd")}} có {{cssxref("margin-left")}} là `40px` (`2.5em`).
- Các phần tử {{htmlelement("p")}} chúng ta đã bao gồm cho tham chiếu có {{cssxref("margin")}} trên và dưới là `16px` (`1em`) — giống như các loại danh sách khác nhau.

## Xử lý khoảng cách danh sách

Khi tạo kiểu danh sách, bạn cần điều chỉnh kiểu của chúng để giữ khoảng cách dọc giống như các phần tử xung quanh (như đoạn văn và hình ảnh; đôi khi được gọi là nhịp dọc), và khoảng cách ngang giống nhau (bạn có thể xem [ví dụ đã được tạo kiểu hoàn chỉnh](https://mdn.github.io/learning-area/css/styling-text/styling-lists/) trên GitHub, và [tìm mã nguồn](https://github.com/mdn/learning-area/blob/main/css/styling-text/styling-lists/index.html) cũng vậy).

CSS được sử dụng để tạo kiểu văn bản và khoảng cách như sau:

```css
/* General styles */

html {
  font-family: "Helvetica", "Arial", sans-serif;
  font-size: 10px;
}

h2 {
  font-size: 2rem;
}

ul,
ol,
dl,
p {
  font-size: 1.5rem;
}

li,
p {
  line-height: 1.5;
}

/* Description list styles */

dd,
dt {
  line-height: 1.5;
}

dt {
  font-weight: bold;
}
```

- Quy tắc đầu tiên thiết lập phông chữ toàn trang và kích thước phông cơ sở là 10px. Những thứ này được kế thừa bởi mọi thứ trên trang.
- Quy tắc 2 và 3 thiết lập kích thước phông tương đối cho các tiêu đề, các loại danh sách khác nhau (con của các phần tử danh sách kế thừa những thứ này), và các đoạn văn. Điều này có nghĩa là mỗi đoạn văn và danh sách sẽ có cùng kích thước phông và khoảng cách trên và dưới, giúp giữ cho nhịp dọc nhất quán.
- Quy tắc 4 thiết lập cùng {{cssxref("line-height")}} trên các đoạn văn và các mục danh sách — vì vậy các đoạn văn và mỗi mục danh sách riêng lẻ sẽ có cùng khoảng cách giữa các dòng. Điều này cũng sẽ giúp giữ cho nhịp dọc nhất quán.
- Quy tắc 5 và 6 áp dụng cho danh sách mô tả. Chúng ta thiết lập cùng `line-height` trên các thuật ngữ và mô tả của danh sách mô tả như chúng ta đã làm với các đoạn văn và các mục danh sách. Một lần nữa, tính nhất quán là tốt! Chúng ta cũng làm cho các thuật ngữ mô tả có phông chữ đậm, để chúng nổi bật về mặt trực quan dễ dàng hơn.

## Các kiểu dành riêng cho danh sách

Bây giờ chúng ta đã xem xét các kỹ thuật khoảng cách chung cho danh sách, hãy khám phá một số thuộc tính dành riêng cho danh sách. Có ba thuộc tính bạn nên biết để bắt đầu, có thể được thiết lập trên các phần tử {{htmlelement("ul")}} hoặc {{htmlelement("ol")}}:

- {{cssxref("list-style-type")}}: Thiết lập loại dấu đầu dòng để sử dụng cho danh sách, ví dụ: dấu đầu dòng hình vuông hoặc tròn cho danh sách không có thứ tự, hoặc số, chữ cái, hoặc chữ số La Mã cho danh sách có thứ tự.
- {{cssxref("list-style-position")}}: Thiết lập dấu đầu dòng, ở đầu mỗi mục, xuất hiện bên trong hoặc bên ngoài danh sách.
- {{cssxref("list-style-image")}}: Cho phép bạn sử dụng hình ảnh tùy chỉnh cho dấu đầu dòng, thay vì hình vuông hoặc tròn đơn giản.

### Kiểu dấu đầu dòng

Như đã đề cập ở trên, thuộc tính {{cssxref("list-style-type")}} cho phép bạn thiết lập loại dấu đầu dòng để sử dụng cho các điểm dấu đầu dòng. Trong ví dụ của chúng ta, chúng ta đã thiết lập danh sách có thứ tự để sử dụng chữ số La Mã viết hoa với:

```css
ol {
  list-style-type: upper-roman;
}
```

Điều này cho chúng ta giao diện sau:

![an ordered list with the bullet points set to appear outside the list item text.](outer-bullets.png)

Bạn có thể tìm thấy nhiều tùy chọn hơn bằng cách kiểm tra trang tham chiếu {{cssxref("list-style-type")}}.

### Vị trí dấu đầu dòng

Thuộc tính {{cssxref("list-style-position")}} thiết lập dấu đầu dòng xuất hiện bên trong các mục danh sách, hay bên ngoài trước khi bắt đầu mỗi mục. Giá trị mặc định là `outside`, khiến cho các dấu đầu dòng nằm bên ngoài các mục danh sách, như đã thấy ở trên.

Nếu bạn thiết lập giá trị là `inside`, các dấu đầu dòng sẽ nằm bên trong các dòng:

```css
ol {
  list-style-type: upper-roman;
  list-style-position: inside;
}
```

![an ordered list with the bullet points set to appear inside the list item text.](inner-bullets.png)

### Sử dụng hình ảnh dấu đầu dòng tùy chỉnh

Thuộc tính {{cssxref("list-style-image")}} cho phép bạn sử dụng hình ảnh tùy chỉnh cho dấu đầu dòng của mình. Cú pháp khá đơn giản:

```css
ul {
  list-style-image: url("star.svg");
}
```

Tuy nhiên, thuộc tính này có phần hạn chế về mặt kiểm soát vị trí, kích thước, v.v. của các dấu đầu dòng. Bạn tốt hơn nên sử dụng nhóm thuộc tính {{cssxref("background")}}, mà bạn đã học trong bài học [Backgrounds and borders](/en-US/docs/Learn_web_development/Core/Styling_basics/Backgrounds_and_borders) trước của chúng ta.

Trong ví dụ đã hoàn thành của chúng ta, chúng ta đã tạo kiểu danh sách không có thứ tự như sau (trên những gì bạn đã thấy ở trên):

```css
ul {
  padding-left: 2rem;
  list-style-type: none;
}

ul li {
  padding-left: 2rem;
  background-image: url("star.svg");
  background-position: 0 0;
  background-size: 1.6rem 1.6rem;
  background-repeat: no-repeat;
}
```

Ở đây chúng ta đã làm như sau:

- Giảm {{cssxref("padding-left")}} của {{htmlelement("ul")}} từ giá trị mặc định `40px` xuống `20px`, sau đó thiết lập cùng lượng đó trên các mục danh sách. Điều này để, nhìn chung, các mục danh sách vẫn được căn thẳng với các mục danh sách có thứ tự và các mô tả danh sách mô tả, nhưng các mục danh sách có một số padding để các hình ảnh nền nằm bên trong. Nếu chúng ta không làm điều này, các hình ảnh nền sẽ chồng lên văn bản mục danh sách, trông lộn xộn.
- Thiết lập {{cssxref("list-style-type")}} thành `none`, để không có dấu đầu dòng nào xuất hiện theo mặc định. Chúng ta sẽ sử dụng các thuộc tính {{cssxref("background")}} để xử lý các dấu đầu dòng thay thế.
- Chèn một dấu đầu dòng vào mỗi mục danh sách không có thứ tự. Các thuộc tính liên quan như sau:
  - {{cssxref("background-image")}}: Điều này tham chiếu đường dẫn đến tệp hình ảnh bạn muốn sử dụng làm dấu đầu dòng.
  - {{cssxref("background-position")}}: Điều này định nghĩa nơi hình ảnh sẽ xuất hiện trong nền của phần tử được chọn — trong trường hợp này chúng ta nói `0 0`, có nghĩa là dấu đầu dòng sẽ xuất hiện ở góc trên bên trái của mỗi mục danh sách.
  - {{cssxref("background-size")}}: Điều này thiết lập kích thước của hình ảnh nền. Lý tưởng là chúng ta muốn các dấu đầu dòng có cùng kích thước với các mục danh sách (hoặc nhỏ hơn hoặc lớn hơn một chút). Chúng ta đang sử dụng kích thước `1.6rem` (`16px`), phù hợp rất tốt với padding `20px` chúng ta đã cho phép dấu đầu dòng nằm bên trong — 16px cộng 4px khoảng cách giữa dấu đầu dòng và văn bản mục danh sách hoạt động tốt.
  - {{cssxref("background-repeat")}}: Theo mặc định, hình ảnh nền lặp lại cho đến khi lấp đầy không gian nền khả dụng. Chúng ta chỉ muốn một bản sao của hình ảnh được chèn trong mỗi trường hợp, vì vậy chúng ta thiết lập giá trị này là `no-repeat`.

Điều này cho chúng ta kết quả sau:

![an unordered list with the bullet points set as little star images](list_formatting.png)

### Cú pháp tắt list-style

Ba thuộc tính đã đề cập ở trên đều có thể được thiết lập bằng một thuộc tính tắt duy nhất là {{cssxref("list-style")}}. Ví dụ, CSS sau:

```css
ul {
  list-style-type: square;
  list-style-image: url("example.png");
  list-style-position: inside;
}
```

Có thể được thay thế bằng:

```css
ul {
  list-style: square url("example.png") inside;
}
```

Các giá trị có thể được liệt kê theo bất kỳ thứ tự nào, và bạn có thể sử dụng một, hai, hoặc cả ba (các giá trị mặc định được sử dụng cho các thuộc tính không được bao gồm là `disc`, `none`, và `outside`). Nếu cả `type` và `image` đều được chỉ định, type được sử dụng làm dự phòng nếu hình ảnh không thể tải vì lý do nào đó.

## Kiểm soát đếm danh sách

Đôi khi bạn có thể muốn đếm khác đi trên một danh sách có thứ tự — ví dụ: bắt đầu từ một số khác ngoài 1, hoặc đếm ngược, hoặc đếm theo các bước lớn hơn 1. HTML và CSS có một số công cụ để giúp bạn ở đây.

### start

Thuộc tính [`start`](/en-US/docs/Web/HTML/Reference/Elements/ol#start) cho phép bạn bắt đầu đếm danh sách từ một số khác ngoài 1. Ví dụ sau:

```html
<ol start="4">
  <li>Toast pita, leave to cool, then slice down the edge.</li>
  <li>
    Fry the halloumi in a shallow, non-stick pan, until browned on both sides.
  </li>
  <li>Wash and chop the salad.</li>
  <li>Fill pita with salad, hummus, and fried halloumi.</li>
</ol>
```

Cho bạn đầu ra này:

{{ EmbedLiveSample('start', '100%', 150) }}

### reversed

Thuộc tính [`reversed`](/en-US/docs/Web/HTML/Reference/Elements/ol#reversed) sẽ bắt đầu danh sách đếm xuống thay vì lên. Ví dụ sau:

```html
<ol start="4" reversed>
  <li>Toast pita, leave to cool, then slice down the edge.</li>
  <li>
    Fry the halloumi in a shallow, non-stick pan, until browned on both sides.
  </li>
  <li>Wash and chop the salad.</li>
  <li>Fill pita with salad, hummus, and fried halloumi.</li>
</ol>
```

Cho bạn đầu ra này:

{{ EmbedLiveSample('reversed', '100%', 150) }}

> [!NOTE]
> Nếu có nhiều mục danh sách trong một danh sách đảo ngược hơn giá trị của thuộc tính `start`, việc đếm sẽ tiếp tục về không và sau đó vào các giá trị âm.

### value

Thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/li#value) cho phép bạn thiết lập các mục danh sách của mình thành các giá trị số cụ thể. Ví dụ sau:

```html
<ol>
  <li value="2">Toast pita, leave to cool, then slice down the edge.</li>
  <li value="4">
    Fry the halloumi in a shallow, non-stick pan, until browned on both sides.
  </li>
  <li value="6">Wash and chop the salad.</li>
  <li value="8">Fill pita with salad, hummus, and fried halloumi.</li>
</ol>
```

Cho bạn đầu ra này:

{{ EmbedLiveSample('value', '100%', 150) }}

> [!NOTE]
> Ngay cả khi bạn đang sử dụng {{cssxref("list-style-type")}} không phải là số, bạn vẫn cần sử dụng các giá trị số tương đương trong thuộc tính `value`.

## Tạo kiểu danh sách lồng nhau

Đã đến lúc bạn hoàn thành một nhiệm vụ khác. Lần này chúng ta muốn bạn lấy những gì bạn đã học ở trên và thử tạo kiểu cho một danh sách lồng nhau.

1. Nhấp vào **"Play"** trong khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground.
2. Tạo kiểu danh sách không có thứ tự với dấu đầu dòng hình vuông.
3. Cho các mục danh sách không có thứ tự và các mục danh sách có thứ tự một `line-height` là `1.5` của `font-size` của chúng.
4. Thiết lập danh sách có thứ tự để có các dấu đầu dòng bằng chữ cái chữ thường.
5. Hãy tự nhiên thực hành với ví dụ danh sách bao nhiêu tùy thích, thử nghiệm các loại dấu đầu dòng, khoảng cách, hoặc bất kỳ thứ gì khác bạn thấy thú vị.

Nếu bạn mắc lỗi, bạn có thể xóa công việc của mình bằng nút _Reset_ trong MDN Playground. Nếu bạn thực sự bị mắc kẹt, bạn có thể xem lời giải bên dưới đầu ra ví dụ.

```html live-sample___styling_lists
<ul>
  <li>First, light the candle.</li>
  <li>Next, open the box.</li>
  <li>
    Finally, place the three magic items in the box, in this exact order, to
    complete the spell:
    <ol>
      <li>The book of spells</li>
      <li>The shiny rod</li>
      <li>The goblin statue</li>
    </ol>
  </li>
</ul>
```

```css live-sample___styling_lists

```

{{ EmbedLiveSample('styling_lists', "100%", 160) }}

<details>
<summary>Nhấp vào đây để xem lời giải</summary>

CSS đã hoàn chỉnh của bạn trông giống như sau:

```css
ul {
  list-style-type: square;
}

li {
  line-height: 1.5;
}

ol {
  list-style-type: lower-alpha;
}
```

</details>

## Tóm tắt

Danh sách tương đối dễ nắm bắt việc tạo kiểu khi bạn biết một vài nguyên tắc cơ bản liên quan và các thuộc tính cụ thể. Trong bài viết tiếp theo, chúng ta sẽ chuyển sang các kỹ thuật tạo kiểu liên kết.

{{PreviousMenuNext("Learn_web_development/Core/Text_styling/Fundamentals", "Learn_web_development/Core/Text_styling/Styling_links", "Learn_web_development/Core/Text_styling")}}
