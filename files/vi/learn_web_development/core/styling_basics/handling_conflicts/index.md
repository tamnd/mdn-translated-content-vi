---
title: Xử lý xung đột
slug: Learn_web_development/Core/Styling_basics/Handling_conflicts
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Test_your_skills/Box_model", "Learn_web_development/Core/Styling_basics/Test_your_skills/Cascade", "Learn_web_development/Core/Styling_basics")}}

Mục tiêu của bài học này là phát triển sự hiểu biết của bạn về một số khái niệm cơ bản nhất của CSS — tầng (cascade), độ đặc hiệu (specificity), và kế thừa (inheritance) — kiểm soát cách CSS được áp dụng vào HTML và cách các xung đột giữa các khai báo kiểu được giải quyết.

Mặc dù việc học qua bài học này có thể có vẻ ít liên quan ngay lập tức và hơi mang tính học thuật hơn so với một số phần khác của khóa học, nhưng hiểu những khái niệm này sẽ giúp bạn tránh được rất nhiều đau đớn sau này! Chúng tôi khuyến khích bạn làm việc cẩn thận qua phần này và kiểm tra xem bạn hiểu các khái niệm trước khi tiếp tục.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Kiến thức cơ bản về HTML (học qua
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Basic_HTML_syntax"
          >Cú pháp HTML cơ bản</a
        >), <a href="/en-US/docs/Learn_web_development/Core/Styling_basics/Basic_selectors">Bộ chọn CSS</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Hiểu cách các quy tắc có thể xung đột trong CSS.</li>
          <li>Kế thừa.</li>
          <li>Tầng.</li>
          <li>Các khái niệm chính chi phối kết quả của các xung đột — độ đặc hiệu, thứ tự nguồn, và tầm quan trọng.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Các quy tắc xung đột

CSS là viết tắt của **Cascading Style Sheets** (Bảng kiểu tầng), và từ đầu tiên _cascading_ (tầng) là cực kỳ quan trọng để hiểu — cách tầng hoạt động là chìa khóa để hiểu CSS.

Vào một thời điểm nào đó, bạn sẽ làm việc trên một dự án và bạn sẽ thấy rằng một số CSS bạn nghĩ nên áp dụng cho một phần tử thực sự không hoạt động. Thường thì vấn đề này xảy ra khi bạn tạo hai quy tắc áp dụng các giá trị khác nhau của cùng một thuộc tính cho cùng một phần tử.

[**Tầng**](/en-US/docs/Web/CSS/Guides/Cascade/Introduction), và khái niệm liên quan chặt chẽ là [**độ đặc hiệu**](/en-US/docs/Web/CSS/Guides/Cascade/Specificity), là các cơ chế kiểm soát quy tắc nào áp dụng khi xung đột như vậy xảy ra. Khai báo tạo kiểu cho phần tử của bạn có thể không phải là khai báo bạn mong đợi, vì vậy bạn cần hiểu cách các cơ chế này hoạt động.

Cũng quan trọng ở đây là khái niệm [**kế thừa**](/en-US/docs/Web/CSS/Guides/Cascade/Inheritance), có nghĩa là một số thuộc tính CSS theo mặc định kế thừa các giá trị được đặt trên phần tử cha của phần tử hiện tại và một số thì không. Điều này cũng có thể gây ra hành vi không mong đợi.

Hãy bắt đầu bằng cách xem nhanh các khái niệm chính chúng ta đang xử lý, sau đó chúng ta sẽ xem xét từng khái niệm lần lượt và xem cách chúng tương tác với nhau và với CSS của bạn. Những khái niệm này có thể có vẻ khó hiểu, nhưng chúng sẽ trở nên rõ hơn khi bạn có nhiều kinh nghiệm hơn viết CSS.

### Tầng

Các stylesheet [**tầng**](/en-US/docs/Web/CSS/Guides/Cascade/Introduction). Ở mức độ đơn giản nhất, điều này có nghĩa là nguồn gốc và thứ tự của các quy tắc CSS quan trọng. Khi hai quy tắc đều có cùng độ đặc hiệu bằng nhau, quy tắc được xác định cuối cùng trong stylesheet sẽ được sử dụng. Có các khái niệm khác có tác dụng, chẳng hạn như [cascade layers](/en-US/docs/Learn_web_development/Core/Styling_basics/Cascade_layers), nhưng những thứ này phức tạp hơn và chúng ta sẽ không đề cập chi tiết ở đây.

Trong ví dụ bên dưới, chúng ta có hai quy tắc có thể áp dụng cho phần tử `<h1>`. Nội dung `<h1>` cuối cùng được tô màu xanh. Điều này là vì cả hai quy tắc đều từ cùng một nguồn, có bộ chọn phần tử giống nhau, và do đó mang cùng độ đặc hiệu, nhưng quy tắc cuối cùng trong thứ tự nguồn thắng.

```html live-sample___cascade-simple
<h1>This is my heading.</h1>
```

```css live-sample___cascade-simple
h1 {
  color: red;
}
h1 {
  color: blue;
}
```

{{EmbedLiveSample("cascade-simple")}}

### Độ đặc hiệu

[Độ đặc hiệu](/en-US/docs/Web/CSS/Guides/Cascade/Specificity) là thuật toán mà trình duyệt sử dụng để quyết định giá trị thuộc tính nào được áp dụng cho một phần tử. Nếu nhiều quy tắc có các bộ chọn khác nhau đặt các giá trị khác nhau cho cùng một thuộc tính và nhắm mục tiêu cùng một phần tử, độ đặc hiệu quyết định giá trị thuộc tính nào được áp dụng cho phần tử. Độ đặc hiệu về cơ bản là thước đo mức độ cụ thể của bộ chọn sẽ là:

- Bộ chọn kiểu (phần tử) ít cụ thể hơn; nó sẽ chọn tất cả các phần tử của loại đó xuất hiện trên trang, vì vậy nó có ít trọng lượng hơn. Bộ chọn phần tử giả có cùng độ đặc hiệu với bộ chọn phần tử thông thường.
- Bộ chọn lớp cụ thể hơn; nó sẽ chỉ chọn các phần tử trên trang có giá trị thuộc tính `class` cụ thể, vì vậy nó có nhiều trọng lượng hơn. Bộ chọn thuộc tính và lớp giả có cùng trọng lượng với lớp.
- Bộ chọn ID thậm chí còn cụ thể hơn — nó chỉ chọn một phần tử duy nhất với giá trị `id` cụ thể. Do đó, nó có nhiều trọng lượng hơn.

Bên dưới, chúng ta lại có hai quy tắc có thể áp dụng cho phần tử `<h1>`. Nội dung `<h1>` bên dưới cuối cùng được tô màu `red`, mặc dù khai báo `color: blue` xuất hiện sau trong thứ tự nguồn, vì bộ chọn lớp `main-heading` cho quy tắc của nó độ đặc hiệu cao hơn bộ chọn kiểu `h1`. Khai báo có độ đặc hiệu cao hơn, được xác định bằng bộ chọn lớp, được áp dụng.

```html live-sample___specificity-simple
<h1 class="main-heading">This is my heading.</h1>
```

```css live-sample___specificity-simple
.main-heading {
  color: red;
}

h1 {
  color: blue;
}
```

{{EmbedLiveSample("specificity-simple")}}

Chúng ta sẽ giải thích thuật toán độ đặc hiệu sau.

### Kế thừa

Kế thừa cũng cần được hiểu trong ngữ cảnh này — một số giá trị thuộc tính CSS được đặt trên các phần tử cha được kế thừa bởi các phần tử con của chúng, và một số thì không.

Ví dụ, nếu bạn đặt `color` và `font-family` trên một phần tử, mọi phần tử bên trong nó cũng sẽ được tạo kiểu với màu và phông chữ đó, trừ khi bạn đã áp dụng các giá trị màu và phông chữ khác trực tiếp cho chúng.

```html live-sample___inheritance-simple
<p>
  As the body has been set to have a color of blue this is inherited through the
  descendants.
</p>
<p>
  We can change the color by specifically targeting an element with a different
  style, such as this
  <span>span</span>.
</p>
```

```css live-sample___inheritance-simple
body {
  color: blue;
}

span {
  color: black;
}
```

{{EmbedLiveSample("inheritance-simple")}}

Một số thuộc tính không kế thừa — ví dụ {{cssxref("width")}} Nếu bạn đặt `width` là `50%` trên một phần tử, tất cả các hậu duệ của nó không có chiều rộng là `50%` của `width` của cha chúng. Nếu điều này xảy ra, CSS sẽ rất bực bội khi sử dụng!

> [!NOTE]
> Trên các trang tham khảo thuộc tính CSS MDN, bạn có thể tìm thấy hộp thông tin kỹ thuật có tên "Formal definition" (Định nghĩa chính thức), liệt kê một số điểm dữ liệu về thuộc tính đó, bao gồm liệu nó có được kế thừa hay không. Xem [phần Formal definition của thuộc tính color](/en-US/docs/Web/CSS/Reference/Properties/color#formal_definition) làm ví dụ.

### Hiểu cách các khái niệm hoạt động cùng nhau

Ba khái niệm này (tầng, độ đặc hiệu, và kế thừa) cùng nhau kiểm soát CSS nào áp dụng cho phần tử nào. Trong các phần bên dưới, chúng ta sẽ thấy cách chúng hoạt động cùng nhau. Đôi khi có thể có vẻ hơi phức tạp, nhưng bạn sẽ bắt đầu nhớ chúng khi bạn có kinh nghiệm hơn với CSS, và bạn luôn có thể tra cứu chi tiết nếu bạn quên! Ngay cả các nhà phát triển có kinh nghiệm cũng không nhớ tất cả các chi tiết.

## Hiểu về kế thừa

Chúng ta sẽ bắt đầu với kế thừa. Trong ví dụ bên dưới, chúng ta có một phần tử {{HTMLElement("ul")}} với hai cấp danh sách không có thứ tự được lồng bên trong nó. Chúng ta đã cung cấp cho `<ul>` bên ngoài đường viền, khoảng đệm, và màu phông chữ.

Thuộc tính `color` là thuộc tính kế thừa. Vì vậy, giá trị thuộc tính `color` được áp dụng cho các con trực tiếp và cũng các con gián tiếp — các `<li>` con trực tiếp và những cái bên trong danh sách lồng đầu tiên. Sau đó chúng ta đã thêm lớp `special` vào danh sách lồng thứ hai và áp dụng màu khác cho nó. Điều này sau đó kế thừa xuống qua các con của nó.

```html live-sample___inheritance
<ul class="main">
  <li>Item One</li>
  <li>
    Item Two
    <ul>
      <li>2.1</li>
      <li>2.2</li>
    </ul>
  </li>
  <li>
    Item Three
    <ul class="special">
      <li>
        3.1
        <ul>
          <li>3.1.1</li>
          <li>3.1.2</li>
        </ul>
      </li>
      <li>3.2</li>
    </ul>
  </li>
</ul>
```

```css live-sample___inheritance
.main {
  color: rebeccapurple;
  border: 2px solid #cccccc;
  padding: 1em;
}

.special {
  color: black;
  font-weight: bold;
}
```

{{EmbedLiveSample("inheritance", "", "280px")}}

Các thuộc tính như `width` (như đã đề cập trước đó), `margin`, `padding`, và `border` không phải là thuộc tính kế thừa. Nếu đường viền được kế thừa bởi các con trong ví dụ danh sách này, mọi danh sách và mục danh sách sẽ có đường viền — có lẽ không phải là hiệu ứng chúng ta muốn!

Mặc dù mọi trang thuộc tính CSS đều liệt kê liệu thuộc tính có được kế thừa hay không, bạn thường có thể đoán điều đó một cách trực giác nếu bạn biết khía cạnh nào mà giá trị thuộc tính sẽ tạo kiểu.

### Kiểm soát kế thừa

CSS cung cấp năm giá trị thuộc tính phổ quát đặc biệt để kiểm soát kế thừa. Mọi thuộc tính CSS đều chấp nhận những giá trị này.

- {{cssxref("inherit")}}
  - : Đặt giá trị thuộc tính được áp dụng cho một phần tử được chọn giống như của phần tử cha của nó. Thực sự, điều này "bật kế thừa".
- {{cssxref("initial")}}
  - : Đặt giá trị thuộc tính được áp dụng cho một phần tử được chọn về [giá trị ban đầu](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#initial_value) của thuộc tính đó.
- {{cssxref("revert")}}
  - : Đặt lại giá trị thuộc tính được áp dụng cho một phần tử được chọn về kiểu mặc định của trình duyệt thay vì các mặc định được áp dụng cho thuộc tính đó. Giá trị này hoạt động như {{cssxref("unset")}} trong nhiều trường hợp.
- {{cssxref("revert-layer")}}
  - : Đặt lại giá trị thuộc tính được áp dụng cho một phần tử được chọn về giá trị được thiết lập trong [cascade layer](/en-US/docs/Web/CSS/Reference/At-rules/@layer) trước đó.
- {{cssxref("unset")}}
  - : Đặt lại thuộc tính về giá trị tự nhiên của nó, có nghĩa là nếu thuộc tính được kế thừa tự nhiên, nó hoạt động như `inherit`, ngược lại nó hoạt động như `initial`.

> [!NOTE]
> Xem [Origin types](/en-US/docs/Web/CSS/Guides/Cascade/Introduction#origin_types) để biết thêm thông tin về từng giá trị này và cách chúng hoạt động.

### Thử nghiệm với các thuộc tính kiểm soát kế thừa

Chúng ta có thể xem danh sách liên kết và khám phá cách các giá trị phổ quát hoạt động. Ví dụ trực tiếp bên dưới cho phép bạn thử nghiệm với CSS và xem điều gì xảy ra khi bạn thực hiện thay đổi. Thực sự thử nghiệm với mã là cách tốt nhất để hiểu HTML và CSS tốt hơn.

Ví dụ:

1. Mục danh sách thứ hai có lớp `my-class-1` được áp dụng. Điều này đặt màu của phần tử `<a>` được lồng bên trong thành `inherit`. Nếu bạn xóa quy tắc, màu sắc của liên kết thay đổi như thế nào?
2. Bạn có hiểu tại sao liên kết thứ ba và thứ tư có màu như vậy không? Liên kết thứ ba được đặt thành `initial`, có nghĩa là nó sử dụng giá trị ban đầu của thuộc tính (trong trường hợp này là màu đen) và không phải mặc định của trình duyệt cho liên kết, là màu xanh. Liên kết thứ tư được đặt thành `unset` có nghĩa là văn bản liên kết sử dụng màu của phần tử cha, màu xanh lá.
3. Liên kết nào sẽ thay đổi màu nếu bạn xác định màu mới cho phần tử `<a>` — ví dụ `a { color: red; }`?
4. Sau khi đọc phần tiếp theo về đặt lại tất cả thuộc tính, hãy quay lại và thay đổi thuộc tính `color` thành `all`. Lưu ý cách liên kết thứ hai nằm trên một dòng mới và có một dấu đầu dòng. Bạn nghĩ những thuộc tính nào đã được kế thừa?

```html live-sample___keywords
<ul>
  <li>Default <a href="#">link</a> color</li>
  <li class="my-class-1">Inherit the <a href="#">link</a> color</li>
  <li class="my-class-2">Reset the <a href="#">link</a> color</li>
  <li class="my-class-3">Unset the <a href="#">link</a> color</li>
</ul>
```

```css live-sample___keywords
body {
  color: green;
}

.my-class-1 a {
  color: inherit;
}

.my-class-2 a {
  color: initial;
}

.my-class-3 a {
  color: unset;
}
```

{{EmbedLiveSample("keywords")}}

### Đặt lại tất cả giá trị thuộc tính

Thuộc tính viết tắt CSS {{cssxref("all")}} có thể được sử dụng để áp dụng một trong những giá trị kế thừa này cho (hầu hết) tất cả các thuộc tính cùng một lúc. Giá trị của nó có thể là bất kỳ một trong các giá trị kế thừa (`inherit`, `initial`, `revert`, `revert-layer`, hoặc `unset`). Đây là cách tiện lợi để hoàn tác các thay đổi được thực hiện cho các kiểu để bạn có thể quay lại điểm bắt đầu đã biết trước khi bắt đầu thay đổi mới.

Trong ví dụ bên dưới, chúng ta có hai blockquote. Cái đầu tiên có kiểu được áp dụng cho chính phần tử blockquote. Cái thứ hai có một lớp được áp dụng cho blockquote, đặt giá trị của `all` thành `unset`.

```html live-sample___all
<blockquote>
  <p>This blockquote is styled</p>
</blockquote>

<blockquote class="fix-this">
  <p>This blockquote is not styled</p>
</blockquote>
```

```css live-sample___all
blockquote {
  background-color: orange;
  border: 2px solid blue;
}

.fix-this {
  all: unset;
}
```

{{EmbedLiveSample("all")}}

Hãy thử đặt giá trị của `all` thành một số giá trị có sẵn khác và quan sát sự khác biệt là gì.

## Hiểu về tầng

Bây giờ chúng ta hiểu rằng kế thừa là lý do tại sao một đoạn văn được lồng sâu trong cấu trúc HTML của bạn có cùng màu với CSS được áp dụng cho body. Từ các bài học giới thiệu, chúng ta hiểu cách thay đổi CSS được áp dụng cho thứ gì đó tại bất kỳ điểm nào trong tài liệu — dù bằng cách gán CSS cho một phần tử hoặc bằng cách tạo một lớp. Bây giờ chúng ta sẽ xem cách tầng xác định quy tắc CSS nào áp dụng khi nhiều hơn một khối kiểu áp dụng cùng một thuộc tính, nhưng với các giá trị khác nhau, cho cùng một phần tử.

Có ba yếu tố cần xem xét, được liệt kê ở đây theo thứ tự tầm quan trọng tăng dần. Những yếu tố sau sẽ ghi đè lên các yếu tố trước:

1. **Thứ tự nguồn**
2. **Độ đặc hiệu**
3. **Tầm quan trọng**

Chúng ta sẽ xem xét những điều này để xem cách trình duyệt xác định chính xác CSS nào nên được áp dụng.

### Thứ tự nguồn

Chúng ta đã thấy cách thứ tự nguồn quan trọng đối với tầng. Nếu bạn có nhiều hơn một quy tắc, tất cả đều có cùng trọng lượng, thì quy tắc xuất hiện cuối cùng trong CSS sẽ thắng. Bạn có thể nghĩ về điều này như: quy tắc gần phần tử nhất ghi đè các quy tắc trước đó cho đến khi quy tắc cuối cùng thắng và được tạo kiểu cho phần tử.

Thứ tự nguồn chỉ quan trọng khi trọng lượng độ đặc hiệu của các quy tắc bằng nhau, vì vậy hãy xem xét độ đặc hiệu tiếp theo.

### Độ đặc hiệu

Bạn sẽ thường gặp tình huống bạn biết rằng một quy tắc xuất hiện sau trong stylesheet, nhưng một quy tắc xung đột trước đó được áp dụng. Điều này xảy ra vì quy tắc trước đó có **độ đặc hiệu cao hơn** — nó cụ thể hơn, và do đó, đang được trình duyệt chọn là quy tắc nên tạo kiểu cho phần tử.

Như chúng ta đã thấy trước đó trong bài học này, bộ chọn lớp có trọng lượng nhiều hơn bộ chọn phần tử, vì vậy các thuộc tính được xác định trong khối kiểu lớp sẽ ghi đè những thuộc tính được xác định trong khối kiểu phần tử.

Điều cần lưu ý ở đây là mặc dù chúng ta đang suy nghĩ về bộ chọn và các quy tắc được áp dụng cho văn bản hoặc thành phần chúng chọn, không phải toàn bộ quy tắc bị ghi đè, chỉ những thuộc tính được khai báo ở nhiều nơi.

Hành vi này giúp tránh sự lặp lại trong CSS. Một thực hành phổ biến là xác định các kiểu chung cho các phần tử cơ bản, sau đó tạo các lớp cho những phần tử khác nhau. Ví dụ, trong stylesheet bên dưới, chúng ta đã xác định các kiểu chung cho tiêu đề cấp 2, sau đó tạo một số lớp chỉ thay đổi một số thuộc tính và giá trị. Các giá trị được xác định ban đầu được áp dụng cho tất cả các tiêu đề, sau đó các giá trị cụ thể hơn được áp dụng cho các tiêu đề có lớp.

```html live-sample___mixing-rules
<h2>Heading with no class</h2>
<h2 class="small">Heading with class of small</h2>
<h2 class="bright">Heading with class of bright</h2>
```

```css live-sample___mixing-rules
h2 {
  font-size: 2em;
  color: black;
  font-family: "Georgia", serif;
}

.small {
  font-size: 1em;
}

.bright {
  color: rebeccapurple;
}
```

{{EmbedLiveSample("mixing-rules", "", "240px")}}

Bây giờ hãy xem cách trình duyệt tính toán độ đặc hiệu. Chúng ta đã biết rằng bộ chọn phần tử có độ đặc hiệu thấp và có thể bị ghi đè bởi một lớp. Về cơ bản một giá trị tính bằng điểm được trao cho các loại bộ chọn khác nhau, và cộng những điểm này lại cho bạn trọng lượng của bộ chọn cụ thể đó, có thể được đánh giá so với các kết quả khớp tiềm năng khác.

Lượng độ đặc hiệu một bộ chọn có được đo bằng ba giá trị (hoặc thành phần) khác nhau, có thể được coi là các cột ID, CLASS, và ELEMENT đáng giá hàng trăm, hàng chục, và đơn vị tương ứng:

- **IDs**: Ghi một điểm trong cột này (100 điểm) cho mỗi bộ chọn ID chứa trong bộ chọn tổng thể.
- **Classes**: Ghi một điểm trong cột này (10 điểm) cho mỗi bộ chọn lớp, bộ chọn thuộc tính, hoặc lớp giả chứa trong bộ chọn tổng thể.
- **Elements**: Ghi một điểm trong cột này (1 điểm) cho mỗi bộ chọn phần tử hoặc phần tử giả chứa trong bộ chọn tổng thể.

> [!NOTE]
> Bộ chọn phổ quát ([`*`](/en-US/docs/Web/CSS/Reference/Selectors/Universal_selectors)), [bộ kết hợp](/en-US/docs/Learn_web_development/Core/Styling_basics/Combinators) (`+`, `>`, `~`, ' '), và bộ chọn điều chỉnh độ đặc hiệu ({{cssxref(":where()")}}) cùng với các tham số của nó, không có ảnh hưởng đến độ đặc hiệu.

Bảng sau đây cho thấy một số ví dụ biệt lập để giúp bạn hiểu. Hãy thử đọc qua những ví dụ này và đảm bảo bạn hiểu tại sao chúng có độ đặc hiệu mà chúng tôi đã cung cấp. Bạn có thể tìm thấy chi tiết về từng bộ chọn trong MDN [tham khảo bộ chọn](/en-US/docs/Web/CSS/Guides/Selectors/Selectors_and_combinators).

| Bộ chọn                                   | Identifier | Classes | Elements | Độ đặc hiệu tổng |
| ----------------------------------------- | ---------- | ------- | -------- | ---------------- |
| `h1`                                      | 0          | 0       | 1        | 0-0-1            |
| `h1 + p::first-letter`                    | 0          | 0       | 3        | 0-0-3            |
| `li > a[href*="en-US"] > .inline-warning` | 0          | 2       | 2        | 0-2-2            |
| `#identifier`                             | 1          | 0       | 0        | 1-0-0            |

#### Ví dụ về độ đặc hiệu chi tiết

Trước khi tiếp tục, hãy xem một ví dụ trong hành động. Bạn có thể muốn mở ví dụ này trong MDN Playground ở tab riêng để bạn có thể dễ dàng tham chiếu chéo khi bạn đọc phần giải thích.

```html live-sample___specificity-boxes
<div class="container" id="outer">
  <div class="container" id="inner">
    <ul>
      <li class="nav"><a href="#">One</a></li>
      <li class="nav"><a href="#">Two</a></li>
    </ul>
  </div>
</div>
```

```css live-sample___specificity-boxes
/* 1. specificity: 1-0-1 */
#outer a {
  background-color: red;
}

/* 2. specificity: 2-0-1 */
#outer #inner a {
  background-color: blue;
}

/* 3. specificity: 1-0-4 */
#outer div ul li a {
  color: yellow;
}

/* 4. specificity: 1-1-3 */
#outer div ul .nav a {
  color: white;
}

/* 5. specificity: 0-2-4 */
div div li:nth-child(2) a:hover {
  border: 10px solid black;
}

/* 6. specificity: 0-2-3 */
div li:nth-child(2) a:hover {
  border: 10px dashed black;
}

/* 7. specificity: 0-3-3 */
div div .nav:nth-child(2) a:hover {
  border: 10px double black;
}

a {
  display: inline-block;
  line-height: 40px;
  font-size: 20px;
  text-decoration: none;
  text-align: center;
  width: 200px;
  margin-bottom: 10px;
}

ul {
  padding: 0;
}

li {
  list-style-type: none;
}
```

{{EmbedLiveSample("specificity-boxes", "100%", "170")}}

Vậy điều gì đang xảy ra ở đây? Trước tiên, chúng ta chỉ quan tâm đến bảy quy tắc đầu tiên của ví dụ này, và như bạn sẽ nhận thấy, chúng ta đã bao gồm các giá trị độ đặc hiệu của chúng trong một bình luận trước mỗi quy tắc.

- Hai bộ chọn đầu tiên đang cạnh tranh về kiểu `background-color` của liên kết. Cái thứ hai thắng và làm cho màu nền là `blue` vì nó có thêm bộ chọn ID trong chuỗi: độ đặc hiệu của nó là 2-0-1 so với 1-0-1.
- Bộ chọn 3 và 4 đang cạnh tranh về kiểu `color` của văn bản liên kết. Cái thứ hai thắng và làm cho văn bản là `white` vì mặc dù nó có ít hơn một bộ chọn phần tử, bộ chọn còn thiếu được hoán đổi bởi bộ chọn lớp, có nhiều trọng lượng hơn bộ chọn phần tử. Độ đặc hiệu thắng là 1-1-3 so với 1-0-4.
- Bộ chọn 5–7 đang cạnh tranh về kiểu `border` của liên kết khi di chuột. Bộ chọn 6 rõ ràng thua bộ chọn 5 với độ đặc hiệu 0-2-3 so với 0-2-4; nó có ít hơn một bộ chọn phần tử trong chuỗi. Tuy nhiên, bộ chọn 7 đánh bại cả bộ chọn 5 và 6 vì nó có cùng số bộ chọn con trong chuỗi như bộ chọn 5, nhưng một phần tử đã được hoán đổi bởi bộ chọn lớp. Vì vậy, độ đặc hiệu thắng là 0-3-3 so với 0-2-3 và 0-2-4.

> [!NOTE]
> Mỗi loại bộ chọn có cấp độ đặc hiệu riêng không thể bị ghi đè bởi các bộ chọn có cấp độ đặc hiệu thấp hơn. Ví dụ, _một triệu_ bộ chọn **lớp** kết hợp sẽ không thể ghi đè độ đặc hiệu của _một_ bộ chọn **id**.
>
> Cách tốt nhất để đánh giá độ đặc hiệu là ghi điểm các cấp độ đặc hiệu riêng lẻ bắt đầu từ cao nhất và chuyển sang thấp nhất khi cần thiết. Chỉ khi có sự hòa trong điểm bộ chọn trong cột độ đặc hiệu, bạn mới cần đánh giá cột tiếp theo bên dưới; nếu không, bạn có thể bỏ qua các bộ chọn độ đặc hiệu thấp hơn vì chúng không bao giờ có thể ghi đè các bộ chọn độ đặc hiệu cao hơn.

#### ID so với lớp

Bộ chọn ID có độ đặc hiệu cao. Điều này có nghĩa là các kiểu được áp dụng dựa trên khớp bộ chọn ID sẽ ghi đè các kiểu được áp dụng dựa trên các bộ chọn khác, bao gồm bộ chọn lớp và kiểu. Vì ID chỉ có thể xuất hiện một lần trên trang và vì độ đặc hiệu cao của bộ chọn ID, nên tốt hơn là thêm lớp vào phần tử thay vì ID.

Nếu sử dụng ID là cách duy nhất để nhắm mục tiêu phần tử — có thể vì bạn không có quyền truy cập vào markup và không thể chỉnh sửa nó — hãy xem xét sử dụng ID trong [bộ chọn thuộc tính](/en-US/docs/Web/CSS/Reference/Selectors/Attribute_selectors), chẳng hạn như `p[id="header"]`.

### Kiểu nội tuyến

Kiểu nội tuyến, tức là khai báo kiểu bên trong thuộc tính [`style`](/en-US/docs/Web/HTML/Reference/Global_attributes/style), được ưu tiên hơn tất cả các kiểu bình thường, bất kể độ đặc hiệu. Những khai báo như vậy không có bộ chọn, nhưng độ đặc hiệu của chúng có thể được hiểu là 1-0-0-0; luôn nhiều hơn bất kỳ trọng lượng độ đặc hiệu nào khác bất kể có bao nhiêu ID trong các bộ chọn.

### !important

Có một phần đặc biệt của CSS mà bạn có thể sử dụng để ghi đè tất cả các phép tính trên, thậm chí cả kiểu nội tuyến - cờ `!important`. Tuy nhiên, bạn nên rất cẩn thận khi sử dụng nó. Cờ này được sử dụng để làm cho một cặp thuộc tính và giá trị riêng lẻ trở thành quy tắc cụ thể nhất, từ đó ghi đè các quy tắc bình thường của tầng, bao gồm cả kiểu nội tuyến bình thường.

> [!NOTE]
> Hữu ích khi biết rằng cờ `!important` tồn tại để bạn biết nó là gì khi gặp nó trong mã của người khác. **Tuy nhiên, chúng tôi khuyến khích mạnh mẽ rằng bạn không bao giờ sử dụng nó trừ khi bạn thực sự phải làm.** Cờ `!important` thay đổi cách tầng thường hoạt động, vì vậy nó có thể làm cho việc gỡ lỗi các vấn đề CSS thực sự khó giải quyết, đặc biệt là trong stylesheet lớn.

Hãy xem ví dụ này nơi chúng ta có hai đoạn văn, một trong đó có ID.

```html live-sample___important
<p class="better">This is a paragraph.</p>
<p class="better" id="winning">One selector to rule them all!</p>
```

```css live-sample___important
#winning {
  background-color: red;
  border: 1px solid black;
}

.better {
  background-color: gray;
  border: none !important;
}

p {
  background-color: blue;
  color: white;
  padding: 5px;
}
```

{{EmbedLiveSample("important")}}

Hãy đọc qua điều này để xem điều gì đang xảy ra — hãy thử xóa một số thuộc tính để xem điều gì xảy ra nếu bạn khó hiểu:

1. Bạn sẽ thấy rằng các giá trị {{cssxref("color")}} và {{cssxref("padding")}} của quy tắc thứ ba đã được áp dụng, nhưng {{cssxref("background-color")}} thì không. Tại sao? Thực ra, tất cả ba nên áp dụng vì các quy tắc sau trong thứ tự nguồn thường ghi đè các quy tắc trước.
2. Tuy nhiên, các quy tắc ở trên nó thắng vì bộ chọn lớp có độ đặc hiệu cao hơn bộ chọn phần tử.
3. Cả hai phần tử đều có [`class`](/en-US/docs/Web/HTML/Reference/Global_attributes/class) là `better`, nhưng cái thứ 2 cũng có [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) là `winning`. Vì ID có độ đặc hiệu _thậm chí cao hơn_ so với các lớp, `red` `background-color` và `1px black` `border` cả hai nên được áp dụng cho phần tử thứ 2, với phần tử đầu tiên có màu nền xám, và không có đường viền, như được chỉ định bởi lớp.
4. Phần tử thứ 2 _thực sự_ có `red` `background-color`, nhưng không có `border`. Tại sao? Vì cờ `!important` trong quy tắc thứ hai. Thêm cờ `!important` sau `border: none` có nghĩa là khai báo này sẽ thắng so với giá trị `border` trong quy tắc trước, ngay cả khi bộ chọn ID có độ đặc hiệu cao hơn.

> [!NOTE]
> Cách duy nhất để ghi đè khai báo quan trọng là bao gồm một khai báo quan trọng khác với _cùng độ đặc hiệu_ sau trong thứ tự nguồn, hoặc một với độ đặc hiệu cao hơn.

Một tình huống trong đó bạn có thể phải sử dụng cờ `!important` là khi bạn đang làm việc trên CMS mà bạn không thể chỉnh sửa các mô-đun CSS cốt lõi, và bạn thực sự muốn ghi đè kiểu nội tuyến hoặc khai báo quan trọng không thể ghi đè theo bất kỳ cách nào khác. Nhưng thực sự, đừng sử dụng nó nếu bạn có thể tránh nó.

## Hiệu ứng của vị trí CSS

Cuối cùng, điều quan trọng cần lưu ý là thứ tự ưu tiên của khai báo CSS phụ thuộc vào stylesheet nào được chỉ định trong đó.

Người dùng có thể đặt các stylesheet tùy chỉnh để ghi đè các kiểu của nhà phát triển. Ví dụ, người dùng khiếm thị có thể muốn đặt cỡ chữ trên tất cả các trang web họ truy cập thành gấp đôi kích thước bình thường để dễ đọc hơn.

### Thứ tự ghi đè khai báo

Các khai báo xung đột sẽ được áp dụng theo thứ tự sau, với các khai báo sau ghi đè các khai báo trước:

1. Khai báo trong stylesheet của user agent (ví dụ: kiểu mặc định của trình duyệt, được sử dụng khi không có kiểu nào khác được đặt).
2. Khai báo bình thường trong stylesheet người dùng (kiểu tùy chỉnh được đặt bởi người dùng).
3. Khai báo bình thường trong stylesheet tác giả (đây là các kiểu được đặt bởi chúng ta, các nhà phát triển web).
4. Khai báo quan trọng trong stylesheet tác giả.
5. Khai báo quan trọng trong stylesheet người dùng.
6. Khai báo quan trọng trong stylesheet user agent.

> [!NOTE]
> Thứ tự ưu tiên được đảo ngược đối với các kiểu được đánh dấu bằng `!important`. Có nghĩa là các stylesheet của nhà phát triển web sẽ ghi đè stylesheet người dùng, để thiết kế có thể được giữ như dự định; tuy nhiên, đôi khi người dùng có lý do chính đáng để ghi đè các kiểu của nhà phát triển web, như đã đề cập ở trên, và điều này có thể đạt được bằng cách sử dụng `!important` trong các quy tắc của họ.

## Tóm tắt

Nếu bạn hiểu hầu hết bài viết này, thì xin chúc mừng — bạn đã bắt đầu làm quen với các cơ chế cơ bản của CSS.

Nếu bạn không hoàn toàn hiểu tầng, độ đặc hiệu và kế thừa, đừng lo lắng! Đây chắc chắn là điều phức tạp nhất chúng ta đã đề cập cho đến nay trong khóa học và là điều mà ngay cả các nhà phát triển web chuyên nghiệp đôi khi cũng thấy khó khăn. Chúng tôi khuyên bạn nên quay lại bài viết này vài lần khi bạn tiếp tục qua khóa học, và tiếp tục suy nghĩ về nó.

Hãy tham khảo lại đây nếu bạn bắt đầu gặp các vấn đề lạ về kiểu không áp dụng như mong đợi. Đó có thể là vấn đề độ đặc hiệu. Tiếp theo, chúng ta sẽ cung cấp cho bạn một số bài kiểm tra mà bạn có thể sử dụng để kiểm tra mức độ hiểu và ghi nhớ thông tin chúng ta đã cung cấp về tầng.

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Test_your_skills/Box_model", "Learn_web_development/Core/Styling_basics/Test_your_skills/Cascade", "Learn_web_development/Core/Styling_basics")}}
