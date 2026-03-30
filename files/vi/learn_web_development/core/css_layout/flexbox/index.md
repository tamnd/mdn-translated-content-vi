---
title: Flexbox
slug: Learn_web_development/Core/CSS_layout/Flexbox
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/CSS_layout/Test_your_skills/Position", "Learn_web_development/Core/CSS_layout/Test_your_skills/Flexbox", "Learn_web_development/Core/CSS_layout")}}

[Flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout) là phương pháp bố cục một chiều để sắp xếp các mục theo hàng hoặc cột. Các mục _flex_ (mở rộng) để lấp đầy không gian bổ sung hoặc co lại để vừa với các không gian nhỏ hơn. Bài viết này giải thích tất cả các kiến thức cơ bản.

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
          <li>Mục đích của flexbox — sắp xếp linh hoạt một tập hợp các phần tử khối hoặc nội tuyến trong một chiều.</li>
          <li>Thuật ngữ flex — vùng chứa flex, mục flex, trục chính và trục chéo.</li>
          <li>Hiểu những gì <code>display: flex</code> cung cấp theo mặc định.</li>
          <li>Cách bọc nội dung sang hàng và cột mới.</li>
          <li>Kích thước linh hoạt và sắp xếp thứ tự các mục flex.</li>
          <li>Căn chỉnh nội dung theo chiều dọc và ngang.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Tại sao lại là flexbox?

Bố cục hộp linh hoạt CSS cho phép bạn:

- Căn giữa theo chiều dọc một khối nội dung bên trong cha của nó.
- Làm cho tất cả các con của một vùng chứa chiếm cùng một lượng chiều rộng/chiều cao có sẵn, bất kể có bao nhiêu chiều rộng/chiều cao.
- Làm cho tất cả các cột trong bố cục nhiều cột có cùng chiều cao ngay cả khi chúng chứa lượng nội dung khác nhau.

Các tính năng Flexbox có thể là giải pháp hoàn hảo cho nhu cầu bố cục một chiều của bạn. Hãy cùng tìm hiểu sâu hơn và tìm hiểu!

> [!NOTE]
> Bài giới thiệu của Scrimba về [Flexbox](https://scrimba.com/learn-html-and-css-c0p/~017?via=mdn) <sup>[_Đối tác học tập MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup> cung cấp hướng dẫn tương tác về mức độ phổ biến của flexbox trên web và do đó tại sao nó quan trọng để học, và hướng dẫn bạn qua một trường hợp sử dụng điển hình thể hiện sức mạnh của flexbox.

## Giới thiệu một ví dụ đơn giản

Trong bài viết này, bạn sẽ làm qua một loạt bài tập để giúp bạn hiểu flexbox hoạt động như thế nào. Để bắt đầu, bạn nên tạo bản sao cục bộ của HTML và CSS. Tải nó trong trình duyệt hiện đại (như Firefox hoặc Chrome) và xem mã trong trình soạn thảo mã của bạn. Ngoài ra, hãy nhấp vào nút "Play" để mở nó trong playground.

```html live-sample___flexbox_0
<header>
  <h1>Sample flexbox example</h1>
</header>
<section>
  <article>
    <h2>First article</h2>
    <p>Content…</p>
  </article>
  <article>
    <h2>Second article</h2>
    <p>Content…</p>
  </article>
  <article>
    <h2>Third article</h2>
    <p>Content…</p>
  </article>
</section>
```

```css live-sample___flexbox_0
body {
  font-family: sans-serif;
  margin: 0;
}
header {
  background: purple;
  height: 100px;
}
h1 {
  text-align: center;
  color: white;
  line-height: 100px;
  margin: 0;
}
section {
  zoom: 0.8;
}
article {
  padding: 10px;
  margin: 10px;
  background: aqua;
}
/* Add your flexbox CSS below here */
```

{{EmbedLiveSample("flexbox_0", "100", "415")}}

Bạn sẽ thấy rằng chúng ta có một phần tử {{htmlelement("header")}} với tiêu đề cấp cao nhất bên trong và một phần tử {{htmlelement("section")}} chứa ba {{htmlelement("article")}}. Chúng ta sẽ sử dụng chúng để tạo một bố cục ba cột khá chuẩn.

## Chỉ định các phần tử cần sắp xếp dưới dạng hộp linh hoạt

Để bắt đầu, chúng ta cần chọn các phần tử nào sẽ được sắp xếp dưới dạng hộp linh hoạt. Để làm điều này, chúng ta đặt một giá trị đặc biệt của {{cssxref("display")}} trên phần tử cha của các phần tử mà bạn muốn ảnh hưởng. Trong trường hợp này, chúng ta muốn sắp xếp các phần tử {{htmlelement("article")}}, vì vậy chúng ta đặt điều này trên {{htmlelement("section")}}:

```html hidden live-sample___flexbox_1
<header>
  <h1>Sample flexbox example</h1>
</header>
<section>
  <article>
    <h2>First article</h2>
    <p>Content…</p>
  </article>
  <article>
    <h2>Second article</h2>
    <p>Content…</p>
  </article>
  <article>
    <h2>Third article</h2>
    <p>Content…</p>
  </article>
</section>
```

```css hidden live-sample___flexbox_1
body {
  font-family: sans-serif;
  margin: 0;
}
header {
  background: purple;
  height: 100px;
}
h1 {
  text-align: center;
  color: white;
  line-height: 100px;
  margin: 0;
}
section {
  zoom: 0.8;
}
article {
  padding: 10px;
  margin: 10px;
  background: aqua;
}
/* Add your flexbox CSS below here */
```

```css live-sample___flexbox_1
section {
  display: flex;
}
```

Điều này làm cho phần tử `<section>` trở thành **vùng chứa flex** và các con của nó trở thành **mục flex**. Đây là giao diện của nó:

{{EmbedLiveSample("flexbox_1", "100", "210")}}

Khai báo đơn này cho chúng ta tất cả những gì chúng ta cần. Thật đáng kinh ngạc, phải không? Chúng ta có một bố cục nhiều cột với các cột có kích thước bằng nhau, và các cột đều có cùng chiều cao. Điều này là vì các giá trị mặc định được cung cấp cho các mục flex (con của vùng chứa flex) được thiết lập để giải quyết các vấn đề phổ biến như thế này.

Hãy tóm tắt những gì đang xảy ra ở đây. Thêm giá trị {{cssxref("display")}} là `flex` vào một phần tử làm cho nó trở thành vùng chứa flex. Vùng chứa được hiển thị dưới dạng [Nội dung cấp khối](/en-US/docs/Glossary/Block-level_content) về cách nó tương tác với phần còn lại của trang. Khi phần tử được chuyển đổi thành vùng chứa flex, các con của nó được chuyển đổi thành (và sắp xếp như) các mục flex.

Bạn có thể làm cho vùng chứa nội tuyến bằng cách sử dụng [giá trị `display` bên ngoài](/en-US/docs/Web/CSS/Reference/Properties/display#outside) (ví dụ: `display: inline flex`), điều này ảnh hưởng đến cách chính vùng chứa được sắp xếp trên trang.
Giá trị hiển thị `inline-flex` cũ cũng hiển thị vùng chứa dưới dạng nội tuyến.
Chúng ta sẽ tập trung vào cách nội dung của vùng chứa hoạt động trong hướng dẫn này, nhưng nếu bạn muốn xem hiệu ứng của bố cục nội tuyến so với khối, bạn có thể xem [so sánh giá trị](/en-US/docs/Web/CSS/Reference/Properties/display#display_value_comparison) trên trang thuộc tính `display`.

Các phần tiếp theo giải thích chi tiết hơn các mục flex là gì và điều gì xảy ra bên trong một phần tử khi bạn làm cho nó trở thành vùng chứa flex.

## Mô hình flex

Khi các phần tử được sắp xếp dưới dạng mục flex, chúng được sắp xếp dọc theo hai trục:

![Ba mục flex trong ngôn ngữ từ trái sang phải được sắp xếp cạnh nhau trong một vùng chứa flex. Trục chính — trục của vùng chứa flex theo hướng các mục flex được sắp xếp — là nằm ngang. Các đầu của trục là main-start và main-end và lần lượt ở bên trái và bên phải. Trục chéo là dọc; vuông góc với trục chính. Điểm bắt đầu và kết thúc của trục chéo lần lượt ở phía trên và phía dưới. Độ dài của mục flex dọc theo trục chính, trong trường hợp này là chiều rộng, được gọi là kích thước chính, và độ dài của mục flex dọc theo trục chéo, trong trường hợp này là chiều cao, được gọi là kích thước chéo.](flex_terms.png)

- **Trục chính** là trục chạy theo hướng các mục flex được sắp xếp (ví dụ: theo hàng trên trang hoặc theo cột xuống trang.) Điểm bắt đầu và kết thúc của trục này được gọi là **main start** và **main end**. Độ dài từ cạnh main-start đến cạnh main-end là **main size**.
- **Trục chéo** là trục chạy vuông góc với hướng các mục flex được sắp xếp. Điểm bắt đầu và kết thúc của trục này được gọi là **cross start** và **cross end**. Độ dài từ cạnh cross-start đến cạnh cross-end là **cross size**.
- Phần tử cha có `display: flex` được đặt trên đó ({{htmlelement("section")}} trong ví dụ của chúng ta) được gọi là **vùng chứa flex**.
- Các mục được sắp xếp dưới dạng hộp linh hoạt bên trong vùng chứa flex được gọi là **mục flex** (các phần tử {{htmlelement("article")}} trong ví dụ của chúng ta).

Hãy nhớ thuật ngữ này khi bạn đọc qua các phần tiếp theo. Bạn luôn có thể tham chiếu lại nó nếu bạn bị nhầm lẫn về bất kỳ thuật ngữ nào đang được sử dụng.

## Cột hay hàng?

Flexbox cung cấp thuộc tính gọi là {{cssxref("flex-direction")}} chỉ định hướng trục chính chạy (hướng các con của flexbox được sắp xếp). Theo mặc định, điều này được đặt thành `row`, khiến chúng được sắp xếp theo hàng theo hướng ngôn ngữ mặc định của trình duyệt của bạn hoạt động (từ trái sang phải, trong trường hợp trình duyệt tiếng Anh).

Hãy thử thêm khai báo sau vào quy tắc {{htmlelement("section")}} của bạn:

```css
flex-direction: column;
```

Bạn sẽ thấy rằng điều này đặt các mục trở lại bố cục cột, giống như chúng trước khi chúng ta thêm bất kỳ CSS nào. Trước khi bạn tiếp tục, hãy xóa khai báo này khỏi ví dụ của bạn.

> [!NOTE]
> Bạn cũng có thể sắp xếp các mục flex theo hướng ngược lại bằng cách sử dụng các giá trị `row-reverse` và `column-reverse`. Hãy thử nghiệm với các giá trị này!

## Bọc

Một vấn đề phát sinh khi bạn có chiều rộng hoặc chiều cao cố định trong bố cục của mình là cuối cùng các con của flexbox sẽ tràn khỏi vùng chứa của chúng, làm hỏng bố cục. Trong ví dụ sau, chúng ta có 5 {{htmlelement("article")}} không vừa vì chúng có `min-width` là `400px`, vì vậy có thanh cuộn ngang.

```html hidden live-sample___flex-wrap_0
<header>
  <h1>Sample flexbox example</h1>
</header>
<section>
  <article>
    <h2>First article</h2>
    <p>Content…</p>
  </article>
  <article>
    <h2>Second article</h2>
    <p>Content…</p>
  </article>
  <article>
    <h2>Third article</h2>
    <p>Content…</p>
  </article>
  <article>
    <h2>Fourth article</h2>
    <p>Content…</p>
  </article>
  <article>
    <h2>Fifth article</h2>
    <p>Content…</p>
  </article>
</section>
```

```css hidden live-sample___flex-wrap_0
body {
  font-family: sans-serif;
  margin: 0;
}
header {
  background: purple;
  height: 100px;
}
h1 {
  text-align: center;
  color: white;
  line-height: 100px;
  margin: 0;
}
article {
  min-width: 400px;
  padding: 10px;
  margin: 10px;
  background: aqua;
}
section {
  display: flex;
  flex-direction: row;
  zoom: 0.8;
}
```

{{EmbedLiveSample("flex-wrap_0", "100", "230")}}

Ở đây chúng ta thấy rằng các con đang vỡ ra ngoài vùng chứa của chúng. Theo mặc định, trình duyệt cố gắng đặt tất cả các mục flex trong một hàng nếu `flex-direction` được đặt thành `row` hoặc một cột nếu `flex-direction` được đặt thành `column`.

```html hidden live-sample___flex-wrap_1
<header>
  <h1>Sample flexbox example</h1>
</header>
<section>
  <article>
    <h2>First article</h2>
    <p>Content…</p>
  </article>
  <article>
    <h2>Second article</h2>
    <p>Content…</p>
  </article>
  <article>
    <h2>Third article</h2>
    <p>Content…</p>
  </article>
  <article>
    <h2>Fourth article</h2>
    <p>Content…</p>
  </article>
  <article>
    <h2>Fifth article</h2>
    <p>Content…</p>
  </article>
</section>
```

```css hidden live-sample___flex-wrap_1
body {
  font-family: sans-serif;
  margin: 0;
}
header {
  background: purple;
  height: 100px;
}
h1 {
  text-align: center;
  color: white;
  line-height: 100px;
  margin: 0;
}
article {
  min-width: 400px;
  padding: 10px;
  margin: 10px;
  background: aqua;
}
section {
  display: flex;
  flex-direction: row;
  zoom: 0.8;
}
```

Một cách để bạn có thể khắc phục điều này là thêm khai báo sau vào quy tắc {{htmlelement("section")}} của bạn:

```css live-sample___flex-wrap_1
section {
  flex-wrap: wrap;
}
```

Bạn sẽ thấy bố cục trông tốt hơn nhiều khi bao gồm điều này:

{{EmbedLiveSample("flex-wrap_1", "100", "430")}}

Bây giờ chúng ta có nhiều hàng. Mỗi hàng có nhiều con flexbox phù hợp với nó như là hợp lý. Bất kỳ tràn ra nào sẽ được chuyển xuống hàng tiếp theo.

Nhưng còn có nhiều thứ chúng ta có thể làm ở đây. Trước tiên, hãy thử thay đổi giá trị thuộc tính {{cssxref("flex-direction")}} của bạn thành `row-reverse`. Bây giờ bạn sẽ thấy rằng bạn vẫn có bố cục nhiều hàng, nhưng nó bắt đầu từ góc đối diện của cửa sổ trình duyệt và chạy ngược lại.

## Viết tắt flex-flow

Tại thời điểm này, đáng chú ý rằng có một viết tắt cho {{cssxref("flex-direction")}} và {{cssxref("flex-wrap")}}: {{cssxref("flex-flow")}}. Vì vậy, ví dụ, bạn có thể thay thế

```css
flex-direction: row;
flex-wrap: wrap;
```

bằng

```css
flex-flow: row wrap;
```

## Kích thước linh hoạt của các mục flex

Hãy bây giờ quay lại ví dụ đầu tiên của chúng ta và xem cách chúng ta có thể kiểm soát tỷ lệ không gian mà các mục flex chiếm so với các mục flex khác.

```html hidden live-sample___flexbox_2
<header>
  <h1>Sample flexbox example</h1>
</header>
<section>
  <article>
    <h2>First article</h2>
    <p>Content…</p>
  </article>
  <article>
    <h2>Second article</h2>
    <p>Content…</p>
  </article>
  <article>
    <h2>Third article</h2>
    <p>Content…</p>
  </article>
</section>
```

```css hidden live-sample___flexbox_2
body {
  font-family: sans-serif;
  margin: 0;
}
header {
  background: purple;
  height: 100px;
}
h1 {
  text-align: center;
  color: white;
  line-height: 100px;
  margin: 0;
}
article {
  padding: 10px;
  margin: 10px;
  background: aqua;
}
section {
  zoom: 0.8;
  display: flex;
}
```

Trong bản sao cục bộ của bạn, hãy thêm quy tắc sau vào cuối CSS của bạn:

```css live-sample___flexbox_2
article {
  flex: 1;
}
```

{{EmbedLiveSample("flexbox_2", "100", "210")}}

Đây là giá trị tỷ lệ không có đơn vị quyết định lượng không gian có sẵn dọc theo trục chính mà mỗi mục flex sẽ chiếm so với các mục flex khác. Trong trường hợp này, chúng ta đang đặt cho mỗi phần tử {{htmlelement("article")}} cùng một giá trị (giá trị là `1`), có nghĩa là chúng sẽ tất cả chiếm lượng không gian bằng nhau còn lại sau khi các thuộc tính như đệm và lề được đặt. Giá trị này được chia sẻ theo tỷ lệ giữa các mục flex: đặt giá trị `400000` cho mỗi mục flex sẽ có hiệu ứng hoàn toàn giống nhau.

```html hidden live-sample___flexbox_3
<header>
  <h1>Sample flexbox example</h1>
</header>
<section>
  <article>
    <h2>First article</h2>
    <p>Content…</p>
  </article>
  <article>
    <h2>Second article</h2>
    <p>Content…</p>
  </article>
  <article>
    <h2>Third article</h2>
    <p>Content…</p>
  </article>
</section>
```

```css hidden live-sample___flexbox_3
body {
  font-family: sans-serif;
  margin: 0;
}
header {
  background: purple;
  height: 100px;
}
h1 {
  text-align: center;
  color: white;
  line-height: 100px;
  margin: 0;
}
article {
  padding: 10px;
  margin: 10px;
  background: aqua;
}
section {
  zoom: 0.8;
  display: flex;
}
article {
  flex: 1;
}
```

Bây giờ hãy thêm quy tắc sau bên dưới quy tắc trước:

```css live-sample___flexbox_3
article:nth-of-type(3) {
  flex: 2;
}
```

{{EmbedLiveSample("flexbox_3", "100", "210")}}

Bây giờ khi bạn làm mới, bạn sẽ thấy rằng {{htmlelement("article")}} thứ ba chiếm gấp đôi chiều rộng có sẵn so với hai cái kia. Bây giờ có tổng cộng bốn đơn vị tỷ lệ có sẵn (vì 1 + 1 + 2 = 4). Hai mục flex đầu tiên có một đơn vị mỗi cái, vì vậy chúng mỗi cái chiếm 1/4 không gian có sẵn. Cái thứ ba có hai đơn vị, vì vậy nó chiếm 2/4 không gian có sẵn (hoặc một nửa).

Bạn cũng có thể chỉ định giá trị kích thước tối thiểu trong giá trị flex. Hãy thử cập nhật các quy tắc article hiện có của bạn như sau:

```html hidden live-sample___flexbox_4
<header>
  <h1>Sample flexbox example</h1>
</header>
<section>
  <article>
    <h2>First article</h2>
    <p>Content…</p>
  </article>
  <article>
    <h2>Second article</h2>
    <p>Content…</p>
  </article>
  <article>
    <h2>Third article</h2>
    <p>Content…</p>
  </article>
</section>
```

```css hidden live-sample___flexbox_4
body {
  font-family: sans-serif;
  margin: 0;
}
header {
  background: purple;
  height: 100px;
}
h1 {
  text-align: center;
  color: white;
  line-height: 100px;
  margin: 0;
}
article {
  padding: 10px;
  margin: 10px;
  background: aqua;
}
section {
  zoom: 0.8;
  display: flex;
}
```

```css live-sample___flexbox_4
article {
  flex: 1 100px;
}

article:nth-of-type(3) {
  flex: 2 100px;
}
```

Về cơ bản điều này nêu: "Mỗi mục flex sẽ trước tiên được cấp `100px` không gian có sẵn. Sau đó, không gian còn lại có sẵn sẽ được chia sẻ theo các đơn vị tỷ lệ." Bạn sẽ thấy sự khác biệt trong cách không gian được chia sẻ.

{{EmbedLiveSample("flexbox_4", "100", "210")}}

Tất cả các mục flex có chiều rộng tối thiểu là 100 pixel — được đặt bằng 'flex'. Giá trị của flex cho hai mục flex đầu tiên là 1 và cho mục thứ ba là 2. Điều này chia không gian còn lại trong vùng chứa flex thành 4 đơn vị tỷ lệ. Một đơn vị được gán cho mỗi hai mục flex đầu tiên và 2 đơn vị được gán cho mục flex thứ ba, làm cho mục flex thứ ba rộng hơn hai mục kia có cùng chiều rộng.

Giá trị thực của flexbox có thể thấy được trong tính linh hoạt/khả năng responsive của nó. Nếu bạn thay đổi kích thước cửa sổ trình duyệt hoặc thêm phần tử {{htmlelement("article")}} khác, bố cục vẫn hoạt động tốt.

## flex: viết tắt so với cách viết đầy đủ

{{cssxref("flex")}} là thuộc tính viết tắt có thể chỉ định tối đa ba giá trị khác nhau:

- Giá trị tỷ lệ không có đơn vị mà chúng ta đã thảo luận ở trên. Điều này có thể được chỉ định riêng bằng thuộc tính đầy đủ {{cssxref("flex-grow")}}.
- Giá trị tỷ lệ không có đơn vị thứ hai, {{cssxref("flex-shrink")}}, xuất hiện khi các mục flex đang tràn khỏi vùng chứa của chúng. Giá trị này chỉ định lượng một mục sẽ co lại để tránh tràn. Đây là tính năng flexbox khá nâng cao và chúng ta sẽ không trình bày thêm trong bài viết này.
- Giá trị kích thước tối thiểu mà chúng ta đã thảo luận ở trên. Điều này có thể được chỉ định riêng bằng giá trị đầy đủ {{cssxref("flex-basis")}}.

Chúng ta khuyên không nên sử dụng các thuộc tính flex đầy đủ trừ khi bạn thực sự phải (ví dụ: để ghi đè thứ gì đó đã được đặt trước đó). Chúng dẫn đến việc viết nhiều mã hơn và có thể hơi khó hiểu.

## Căn chỉnh ngang và dọc

Bạn cũng có thể sử dụng các tính năng flexbox để căn chỉnh các mục flex dọc theo trục chính hoặc chéo. Hãy khám phá điều này bằng cách xem xét một ví dụ mới:

```html live-sample___flex-align_0
<div>
  <button>Smile</button>
  <button>Laugh</button>
  <button>Wink</button>
  <button>Shrug</button>
  <button>Blush</button>
</div>
```

```css live-sample___flex-align_0
body {
  font-family: sans-serif;
  width: 90%;
  max-width: 960px;
  margin: 10px auto;
}
div {
  height: 100px;
  border: 1px solid black;
}
button {
  font-size: 18px;
  line-height: 1.5;
  width: 15%;
}
/* Add your flexbox CSS below here */
```

Chúng ta sẽ biến điều này thành một thanh công cụ/nút gọn gàng, linh hoạt. Lúc này bạn sẽ thấy một thanh menu ngang với một số nút nằm chặt ở góc trên bên trái.

{{EmbedLiveSample("flex-align_0", "100", "125")}}

Trước tiên, hãy lấy bản sao cục bộ của ví dụ này.

Bây giờ, hãy thêm nội dung sau vào cuối CSS của ví dụ:

```html hidden live-sample___flex-align_1
<div>
  <button>Smile</button>
  <button>Laugh</button>
  <button>Wink</button>
  <button>Shrug</button>
  <button>Blush</button>
</div>
```

```css hidden live-sample___flex-align_1
body {
  font-family: sans-serif;
  width: 90%;
  max-width: 960px;
  margin: 10px auto;
}
div {
  height: 100px;
  border: 1px solid black;
}
button {
  font-size: 18px;
  line-height: 1.5;
  width: 15%;
}
/* Add your flexbox CSS below here */
```

```css live-sample___flex-align_1
div {
  display: flex;
  align-items: center;
  justify-content: space-around;
}
```

{{EmbedLiveSample("flex-align_1", "100", "125")}}

Làm mới trang và bạn sẽ thấy rằng các nút bây giờ được căn giữa theo chiều ngang và dọc. Chúng ta đã làm điều này thông qua hai thuộc tính mới. Các mục flex được định vị ở giữa trục chéo bằng cách đặt thuộc tính `align-items` thành `center`. Các mục flex được phân bố đều dọc theo trục chính bằng cách đặt thuộc tính `justify-content` thành `space-around`.

Thuộc tính {{cssxref("align-items")}} kiểm soát nơi các mục flex nằm trên trục chéo.

- Theo mặc định, giá trị là `normal` hoạt động như `stretch` trong flexbox. Điều này kéo dài tất cả các mục flex để lấp đầy cha theo hướng trục chéo. Nếu cha không có kích thước cố định theo hướng trục chéo, thì tất cả các mục flex sẽ trở nên cao (hoặc rộng) như mục flex cao nhất (hoặc rộng nhất). Đây là lý do tại sao ví dụ đầu tiên của chúng ta có các cột có chiều cao bằng nhau theo mặc định.
- Giá trị `center` mà chúng ta đã sử dụng trong mã trên khiến các mục duy trì kích thước nội tại của chúng, nhưng được căn giữa dọc theo trục chéo. Đây là lý do tại sao các nút trong ví dụ hiện tại được căn giữa theo chiều dọc.
- Bạn cũng có thể có các giá trị như `flex-start`, `self-start` hoặc `start` và `flex-end`, `self-end` hoặc `end`, sẽ căn chỉnh tất cả các mục ở đầu và cuối trục chéo tương ứng. Các giá trị `baseline` sẽ căn chỉnh các mục flex theo đường cơ sở của chúng; về cơ bản đáy của dòng văn bản đầu tiên của mỗi mục flex sẽ được căn chỉnh với đáy của dòng đầu tiên của phần tử có khoảng cách lớn nhất giữa điểm bắt đầu chéo và đường cơ sở đó. Xem {{cssxref("align-items")}} để biết đầy đủ chi tiết.

Bạn có thể ghi đè hành vi {{cssxref("align-items")}} cho các mục flex riêng lẻ bằng cách áp dụng thuộc tính {{cssxref("align-self")}} cho chúng. Ví dụ: hãy thử thêm nội dung sau vào CSS của bạn:

```html hidden live-sample___flex-align_2
<div>
  <button>Smile</button>
  <button>Laugh</button>
  <button>Wink</button>
  <button>Shrug</button>
  <button>Blush</button>
</div>
```

```css hidden live-sample___flex-align_2
body {
  font-family: sans-serif;
  width: 90%;
  max-width: 960px;
  margin: 10px auto;
}
div {
  height: 100px;
  border: 1px solid black;
}
button {
  font-size: 18px;
  line-height: 1.5;
  width: 15%;
}
div {
  display: flex;
  align-items: center;
  justify-content: space-around;
}
/* Add your flexbox CSS below here */
```

```css live-sample___flex-align_2
button:first-child {
  align-self: flex-end;
}
```

{{EmbedLiveSample("flex-align_2", "100", "125")}}

Hãy xem hiệu ứng này có gì và xóa nó khi bạn xong.

{{cssxref("justify-content")}} kiểm soát nơi các mục flex nằm trên trục chính.

- Giá trị mặc định là `normal`, hoạt động như `start`, làm cho tất cả các mục nằm ở đầu trục chính.
- Bạn có thể sử dụng `end` hoặc `flex-end` để làm cho chúng nằm ở cuối.
- Các giá trị `left` và `right` hoạt động như `start` hoặc `end` tùy thuộc vào hướng chế độ viết.
- `center` cũng là một giá trị cho `justify-content`. Nó sẽ làm cho các mục flex nằm ở giữa trục chính.
- Giá trị mà chúng ta đã sử dụng ở trên, `space-around`, rất hữu ích — nó phân phối tất cả các mục đều dọc theo trục chính với một chút không gian còn lại ở cả hai đầu.
- Có một giá trị khác, `space-between`, rất giống với `space-around` ngoại trừ nó không để lại không gian nào ở cả hai đầu.

Thuộc tính {{cssxref("justify-items")}} bị bỏ qua trong các bố cục flexbox.

Chúng ta muốn khuyến khích bạn thử nghiệm với các giá trị này để xem chúng hoạt động như thế nào trước khi bạn tiếp tục.

## Sắp xếp thứ tự các mục flex

Flexbox cũng có tính năng thay đổi thứ tự bố cục của các mục flex mà không ảnh hưởng đến thứ tự nguồn. Đây là một điều khác không thể thực hiện với các phương pháp bố cục truyền thống.

Hãy thử thêm CSS sau vào mã ví dụ thanh nút của bạn:

```css
button:first-child {
  order: 1;
}
```

Làm mới và bạn sẽ thấy nút "Smile" đã chuyển đến cuối trục chính. Hãy nói về cách điều này hoạt động chi tiết hơn:

- Theo mặc định, tất cả các mục flex đều có giá trị {{cssxref("order")}} là `0`.
- Các mục flex có giá trị thứ tự được chỉ định cao hơn sẽ xuất hiện sau trong thứ tự hiển thị so với các mục có giá trị thứ tự thấp hơn.
- Các mục flex có cùng giá trị thứ tự sẽ xuất hiện theo thứ tự nguồn của chúng. Vì vậy, nếu bạn có bốn mục có giá trị thứ tự được đặt là `2`, `1`, `1` và `0` tương ứng, thứ tự hiển thị của chúng sẽ là thứ 4, thứ 2, thứ 3, rồi thứ 1.
- Mục thứ 3 xuất hiện sau thứ 2 vì nó có cùng giá trị thứ tự và đứng sau nó trong thứ tự nguồn.

Bạn có thể đặt các giá trị thứ tự âm để làm cho các mục xuất hiện sớm hơn các mục có giá trị `0`. Ví dụ: bạn có thể làm cho nút "Blush" xuất hiện ở đầu trục chính bằng quy tắc sau:

```css
button:last-child {
  order: -1;
}
```

Mặc dù bạn có thể thay đổi thứ tự bằng `order`, thứ tự tab vẫn giống như thứ tự mã. Thay đổi thứ tự của các phần tử có thể focus có thể ảnh hưởng tiêu cực đến khả năng sử dụng cho người dùng bàn phím!

## Các hộp flex lồng nhau

Có thể tạo một số bố cục khá phức tạp với flexbox. Hoàn toàn ổn khi đặt một mục flex cũng là vùng chứa flex, để các con của nó cũng được sắp xếp như hộp linh hoạt.

```html hidden live-sample___flex-nesting
<header>
  <h1>Complex flexbox example</h1>
</header>
<section>
  <article>
    <h2>First article</h2>
    <p>Content…</p>
  </article>
  <article>
    <h2>Second article</h2>
    <p>Content…</p>
  </article>
  <article>
    <div>
      <button>Smile</button>
      <button>Laugh</button>
      <button>Wink</button>
      <button>Shrug</button>
      <button>Blush</button>
    </div>
    <div>
      <p>Paragraph one content…</p>
    </div>
    <div>
      <p>Paragraph two content…</p>
    </div>
  </article>
</section>
```

```css hidden live-sample___flex-nesting
body {
  font-family: sans-serif;
  margin: 0;
}
header {
  background: purple;
  height: 100px;
}
h1 {
  text-align: center;
  color: white;
  line-height: 100px;
  margin: 0;
}
article {
  padding: 10px;
  margin: 10px;
  background: aqua;
}
section {
  display: flex;
  zoom: 0.8;
}
article {
  flex: 1 170px;
}
article:nth-of-type(3) {
  flex: 3 170px;
  display: flex;
  flex-flow: column;
}
article:nth-of-type(3) div:first-child {
  flex: 1 100px;
  display: flex;
  flex-flow: row wrap;
  align-items: center;
  justify-content: space-around;
}
button {
  flex: 1 auto;
  margin: 5px;
  font-size: 18px;
  line-height: 1.5;
}
```

{{EmbedLiveSample("flex-nesting", "100", "290")}}

Bố cục phức tạp này có một vài mục flex cũng là vùng chứa flex. HTML cho điều này khá đơn giản. Chúng ta có một phần tử {{htmlelement("section")}} chứa ba {{htmlelement("article")}}. {{htmlelement("article")}} thứ ba chứa ba {{htmlelement("div")}}, và {{htmlelement("div")}} đầu tiên chứa năm {{htmlelement("button")}}:

```plain
section - article
          article
          article - div - button
                    div   button
                    div   button
                          button
                          button
```

Hãy xem mã chúng ta đã sử dụng cho bố cục.

Trước tiên, chúng ta đặt các con của {{htmlelement("section")}} được sắp xếp dưới dạng hộp linh hoạt.

```css
section {
  display: flex;
}
```

Tiếp theo, chúng ta đặt một số giá trị flex trên các {{htmlelement("article")}} chính. Chú ý đặc biệt đến quy tắc thứ hai ở đây: chúng ta đang đặt {{htmlelement("article")}} thứ ba để có các con của nó được sắp xếp như mục flex, nhưng lần này chúng ta đang sắp xếp chúng như cột.

```css
article {
  flex: 1 100px;
}

article:nth-of-type(3) {
  flex: 3 100px;
  display: flex;
  flex-flow: column;
}
```

Tiếp theo, chúng ta chọn {{htmlelement("div")}} đầu tiên. Đầu tiên chúng ta sử dụng `flex: 1 100px;` để thực sự cho nó chiều cao tối thiểu là `100px`, sau đó chúng ta đặt các con của nó (các phần tử {{htmlelement("button")}}) cũng được sắp xếp như mục flex. Ở đây chúng ta sắp xếp chúng theo hàng bọc và căn chỉnh chúng ở giữa không gian có sẵn như chúng ta đã làm với ví dụ nút riêng lẻ mà chúng ta đã thấy trước đó.

```css
article:nth-of-type(3) div:first-child {
  flex: 1 100px;
  display: flex;
  flex-flow: row wrap;
  align-items: center;
  justify-content: space-around;
}
```

Cuối cùng, chúng ta đặt một số kích thước trên nút. Lần này bằng cách đặt giá trị flex là `1 auto`. Điều này có một hiệu ứng rất thú vị, mà bạn sẽ thấy nếu bạn thử thay đổi chiều rộng cửa sổ trình duyệt của mình. Các nút sẽ chiếm nhiều không gian nhất có thể. Nhiều như vừa vặn trên một dòng; vượt quá đó, chúng sẽ xuống dòng mới.

```css
button {
  flex: 1 auto;
  margin: 5px;
  font-size: 18px;
  line-height: 1.5;
}
```

## Tóm tắt

Điều đó kết thúc chuyến tham quan của chúng ta về những kiến thức cơ bản về flexbox. Chúng ta hy vọng bạn đã có niềm vui và sẽ có cơ hội thử nghiệm với nó khi bạn tiếp tục học. Trong bài viết tiếp theo, chúng ta sẽ cung cấp cho bạn một số bài kiểm tra để kiểm tra mức độ hiểu và ghi nhớ tất cả thông tin này của bạn.

## Xem thêm

- [Các khái niệm cơ bản của flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts)
- [Căn chỉnh các mục trong vùng chứa flex](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Aligning_items)
- [Sắp xếp thứ tự các mục flex](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Ordering_items)
- [Kiểm soát tỷ lệ của các mục flex dọc theo trục chính](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Controlling_flex_item_ratios)
- Mô-đun [Bố cục hộp linh hoạt CSS](/en-US/docs/Web/CSS/Guides/Flexible_box_layout)
- [Hướng dẫn CSS-Tricks về flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/) — bài viết giải thích mọi thứ về flexbox một cách hấp dẫn
- [Flexbox Froggy](https://flexboxfroggy.com/) — trò chơi giáo dục để học và hiểu rõ hơn về những kiến thức cơ bản về flexbox

{{PreviousMenuNext("Learn_web_development/Core/CSS_layout/Test_your_skills/Position", "Learn_web_development/Core/CSS_layout/Test_your_skills/Flexbox", "Learn_web_development/Core/CSS_layout")}}
