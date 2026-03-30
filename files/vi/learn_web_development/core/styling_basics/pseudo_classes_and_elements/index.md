---
title: Lớp giả và phần tử giả
short-title: Lớp giả và phần tử giả
slug: Learn_web_development/Core/Styling_basics/Pseudo_classes_and_elements
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Attribute_selectors", "Learn_web_development/Core/Styling_basics/Combinators", "Learn_web_development/Core/Styling_basics")}}

Tập hợp bộ chọn tiếp theo chúng ta sẽ xem xét được gọi là **lớp giả** và **phần tử giả**. Có rất nhiều loại, và chúng thường phục vụ các mục đích khá cụ thể. Khi bạn biết cách sử dụng chúng, bạn có thể xem qua các loại khác nhau để xem liệu có loại nào phù hợp với tác vụ bạn đang cố gắng thực hiện không.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Kiến thức cơ bản về HTML (học qua
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Basic_HTML_syntax"
          >Cú pháp HTML cơ bản</a
        >), <a href="/en-US/docs/Learn_web_development/Core/Styling_basics/Basic_selectors">Bộ chọn CSS cơ bản</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Lớp giả và phần tử giả.</li>
          <li>Sự khác biệt giữa hai loại.</li>
          <li>Kết hợp lớp giả và phần tử giả.</li>
          <li>Nội dung được tạo ra.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Lớp giả là gì?

Lớp giả là bộ chọn chọn các phần tử ở trạng thái cụ thể, ví dụ, chúng là phần tử đầu tiên của loại của chúng, hoặc chúng đang được con trỏ chuột di qua. Chúng có xu hướng hoạt động như thể bạn đã áp dụng một lớp cho một phần trong tài liệu, thường giúp bạn giảm các lớp dư thừa trong đánh dấu và cung cấp mã linh hoạt và dễ bảo trì hơn.

Lớp giả là các từ khóa bắt đầu bằng dấu hai chấm. Ví dụ, `:hover` là một lớp giả.

### Ví dụ lớp giả cơ bản

Hãy xem một ví dụ cơ bản. Nếu chúng ta muốn làm cho đoạn đầu tiên trong một bài viết lớn hơn và in đậm, chúng ta có thể thêm một lớp vào đoạn đó và sau đó thêm CSS vào lớp đó:

```html live-sample___first-child
<article>
  <p class="first">
    Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion
    daikon amaranth tatsoi tomatillo melon azuki bean garlic.
  </p>

  <p>
    Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette
    tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato.
    Dandelion cucumber earthnut pea peanut soko zucchini.
  </p>
</article>
```

```css live-sample___first-child
.first {
  font-size: 120%;
  font-weight: bold;
}
```

{{EmbedLiveSample("first-child")}}

Tuy nhiên, điều này có thể gây phiền phức để duy trì — nếu một đoạn mới được thêm vào đầu tài liệu thì sao? Chúng ta sẽ cần di chuyển lớp sang đoạn mới. Thay vì thêm lớp, chúng ta có thể sử dụng bộ chọn lớp giả {{cssxref(":first-child")}} — điều này sẽ _luôn_ nhắm mục tiêu phần tử con đầu tiên của một phần tử (trong trường hợp này là `<article>`), và chúng ta sẽ không cần chỉnh sửa HTML nữa (điều này có thể không phải lúc nào cũng có thể, có thể do nó được tạo bởi CMS).

```html live-sample___first-child2
<article>
  <p>
    Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion
    daikon amaranth tatsoi tomatillo melon azuki bean garlic.
  </p>

  <p>
    Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette
    tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato.
    Dandelion cucumber earthnut pea peanut soko zucchini.
  </p>
</article>
```

```css live-sample___first-child2
article p:first-child {
  font-size: 120%;
  font-weight: bold;
}
```

{{EmbedLiveSample("first-child2")}}

Tất cả các lớp giả hoạt động theo cách này. Chúng nhắm mục tiêu một phần tài liệu của bạn ở trạng thái nhất định, hoạt động như thể bạn đã thêm một lớp vào HTML của mình.

> [!NOTE]
> Lớp giả và phần tử có thể được viết mà không có bộ chọn phần tử nào đứng trước chúng. Trong ví dụ trên, bạn có thể viết `:first-child` và quy tắc sẽ áp dụng cho _bất kỳ_ phần tử nào là phần tử con đầu tiên của phần tử `<article>`, không chỉ phần tử con đầu tiên là đoạn văn — `:first-child` tương đương với `*:first-child`. Tuy nhiên, thông thường bạn muốn kiểm soát nhiều hơn thế, vì vậy bạn cần cụ thể hơn.

### Lớp giả hành động người dùng

Một số lớp giả chỉ áp dụng khi người dùng tương tác với tài liệu theo một cách nào đó. Các lớp giả **hành động người dùng** này, đôi khi được gọi là **lớp giả động**, hoạt động như thể một lớp đã được thêm vào phần tử khi người dùng tương tác với nó. Ví dụ bao gồm:

- {{cssxref(":hover")}} — đã đề cập ở trên; chỉ áp dụng nếu người dùng di chuyển con trỏ qua một phần tử, thường là liên kết.
- {{cssxref(":focus")}} — chỉ áp dụng nếu người dùng tập trung phần tử bằng cách nhấp hoặc sử dụng điều khiển bàn phím.

```html live-sample___hover
<p><a href="">Hover over me</a></p>
```

```css live-sample___hover
a:link,
a:visited {
  color: rebeccapurple;
  font-weight: bold;
}

a:hover {
  color: hotpink;
}
```

{{EmbedLiveSample("hover")}}

### Thử nghiệm với lớp giả

Quay lại [ví dụ lớp giả đầu tiên](#basic_pseudo-class_example) của chúng ta và chỉnh sửa CSS bằng MDN playground:

1. Thêm quy tắc tô màu văn bản đoạn `blue` khi di chuột qua.
2. Thêm quy tắc chọn chỉ đoạn cuối cùng bên trong bài viết và cho nó `background-color` màu `orange`.

Bạn có thể tìm thông tin về tất cả các lớp giả khác trên trang tham chiếu MDN [Pseudo-classes](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes).

## Phần tử giả là gì?

Phần tử giả hoạt động theo cách tương tự. Tuy nhiên, chúng hoạt động như thể bạn đã thêm một phần tử HTML hoàn toàn mới vào đánh dấu, thay vì áp dụng một lớp vào các phần tử hiện có.

Phần tử giả bắt đầu bằng dấu hai chấm kép `::`. `::before` là ví dụ về phần tử giả.

> [!NOTE]
> Một số phần tử giả sớm sử dụng cú pháp dấu hai chấm đơn, vì vậy bạn đôi khi có thể thấy điều này trong mã hoặc ví dụ. Các trình duyệt hiện đại hỗ trợ các phần tử giả sớm với cú pháp dấu hai chấm đơn hoặc kép để tương thích ngược.

Ví dụ, nếu bạn muốn chọn dòng đầu tiên của một đoạn văn, bạn có thể bọc nó trong phần tử `<span>` và sử dụng bộ chọn phần tử; tuy nhiên, điều đó sẽ thất bại nếu số từ bạn đã bọc dài hơn hoặc ngắn hơn chiều rộng của phần tử cha. Vì chúng ta thường không biết có bao nhiêu từ sẽ vừa trên một dòng — vì điều đó sẽ thay đổi nếu chiều rộng màn hình hoặc cỡ chữ thay đổi — không thể thực hiện điều này một cách mạnh mẽ bằng cách thêm HTML.

Bộ chọn phần tử giả `::first-line` sẽ thực hiện điều này đáng tin cậy — nếu số từ tăng hoặc giảm, nó vẫn chỉ chọn dòng đầu tiên.

```html live-sample___first-line
<article>
  <p>
    Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion
    daikon amaranth tatsoi tomatillo melon azuki bean garlic.
  </p>

  <p>
    Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette
    tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato.
    Dandelion cucumber earthnut pea peanut soko zucchini.
  </p>
</article>
```

```css live-sample___first-line
article p::first-line {
  font-size: 120%;
  font-weight: bold;
}
```

{{EmbedLiveSample("first-line")}}

Nó hoạt động như thể một `<span>` được bao bọc một cách kỳ diệu xung quanh dòng được định dạng đầu tiên đó, và được cập nhật mỗi khi độ dài dòng thay đổi.

Bạn có thể thấy rằng điều này chọn dòng đầu tiên của cả hai đoạn.

### Thử nghiệm với phần tử giả

Chỉnh sửa CSS của ví dụ trước bằng MDN playground:

1. Thêm quy tắc cho phần văn bản được chọn bằng con trỏ chuột có `background-color` màu `red` (bạn sẽ cần phần tử giả {{cssxref("::selection")}} cho điều này). Chọn một số văn bản để kiểm tra.
2. Thêm quy tắc cho chữ cái đầu tiên của mỗi `<p>` bên trong `<article>`:

- `background-color` màu `yellow`.
- `border` `1px solid black`.
- `font-size` là `2rem`.

Bạn có thể tìm thông tin về tất cả các phần tử giả khác trên trang tham chiếu MDN [Pseudo-elements](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements).

## Kết hợp lớp giả và phần tử giả

Nếu bạn muốn làm cho dòng đầu tiên của đoạn đầu tiên in đậm, bạn có thể nối các bộ chọn `:first-child` và `::first-line` lại với nhau.

Hãy thử chỉnh sửa ví dụ trước để sử dụng CSS sau. Chúng ta đang nói rằng chúng ta muốn chọn dòng đầu tiên, của phần tử `<p>` đầu tiên, bên trong phần tử `<article>`.

```css
article p:first-child::first-line {
  font-size: 120%;
  font-weight: bold;
}
```

## Tạo nội dung với ::before và ::after

Có một vài phần tử giả đặc biệt, được sử dụng cùng với thuộc tính {{cssxref("content")}} để chèn nội dung vào tài liệu của bạn bằng CSS. Kỹ thuật này được gọi là **nội dung được tạo ra**.

Bạn có thể sử dụng nó để chèn một chuỗi văn bản, chẳng hạn như trong ví dụ bên dưới. Chúng ta cũng đã cho nội dung được tạo ra một màu nền `yellow` để có thể dễ dàng phân biệt với nội dung đoạn văn.

```html live-sample___before
<p class="box">Content in the box in my HTML page.</p>
```

```css live-sample___before
.box::before {
  content: "This should show before the other content. ";
  background-color: yellow;
}
```

{{EmbedLiveSample("before")}}

### Thử nghiệm với nội dung được tạo ra

Hãy thử chỉnh sửa ví dụ trước như sau:

- Thay đổi giá trị văn bản của thuộc tính {{cssxref("content")}} và xem nó thay đổi trong kết quả.
- Thay đổi phần tử giả `::before` thành `::after` và xem văn bản được chèn vào cuối phần tử thay vì đầu.

### Biểu tượng nội dung được tạo ra

Ví dụ trên là CSS hợp lệ. Tuy nhiên, việc chèn chuỗi văn bản từ CSS không phải là điều chúng ta làm thường xuyên, vì văn bản đó không thể truy cập được bởi một số trình đọc màn hình và có thể khó cho ai đó tìm và chỉnh sửa trong tương lai. Cách sử dụng hợp lệ hơn của các phần tử giả này là để chèn biểu tượng, ví dụ như mũi tên nhỏ được thêm vào trong ví dụ bên dưới, đây là chỉ báo trực quan mà chúng ta không muốn trình đọc màn hình đọc ra:

```html live-sample___after-icon
<p class="box">Content in the box in my HTML page.</p>
```

```css live-sample___after-icon
.box::after {
  content: " ➥";
}
```

{{EmbedLiveSample("after-icon")}}

### Hình dạng được tạo ra

Nội dung được tạo ra cũng thường được sử dụng để chèn một chuỗi rỗng, sau đó có thể được tạo kiểu giống như bất kỳ phần tử nào trên trang.

Trong ví dụ tiếp theo, chúng ta đã thêm một chuỗi rỗng bằng phần tử giả `::before`. Chúng ta đã đặt nó thành `display: block` để chúng ta có thể tạo kiểu với chiều rộng và chiều cao, tạo ra hình vuông. Sau đó chúng ta sử dụng CSS để tạo kiểu cho nó giống như bất kỳ phần tử nào.

```html live-sample___before-styled
<p class="box">Content in the box in my HTML page.</p>
```

```css live-sample___before-styled
.box::before {
  content: "";
  display: block;
  width: 100px;
  height: 100px;
  background-color: rebeccapurple;
  border: 1px solid black;
}
```

{{EmbedLiveSample("before-styled", "", "160")}}

Hãy thử nghiệm với CSS trên để thay đổi cách hình dạng được tạo ra trông và hoạt động.

Bạn sẽ thường xuyên thấy nội dung được tạo ra được sử dụng cho các nhiệm vụ khác nhau. Một ví dụ tuyệt vời là trang web [CSS Arrow Please](https://cssarrowplease.com/), giúp bạn tạo mũi tên bằng CSS. Hãy xem CSS khi bạn tạo mũi tên và bạn sẽ thấy các phần tử giả {{cssxref("::before")}} và {{cssxref("::after")}} đang được sử dụng. Bất cứ khi nào bạn thấy các bộ chọn này, hãy xem thuộc tính {{cssxref("content")}} để xem những gì đang được thêm vào phần tử HTML.

## Tóm tắt

Trong bài viết này, chúng ta đã giới thiệu lớp giả và phần tử giả CSS, là các loại bộ chọn đặc biệt.

Lớp giả cho phép bạn nhắm mục tiêu phần tử khi nó ở trạng thái cụ thể, như thể bạn đã thêm một lớp cho trạng thái đó vào DOM. Phần tử giả hoạt động như thể bạn đã thêm một phần tử hoàn toàn mới vào DOM, và cho phép bạn tạo kiểu cho phần tử đó. Các phần tử giả `::before` và `::after` cho phép bạn chèn nội dung vào tài liệu bằng CSS.

Trong bài viết tiếp theo, chúng ta sẽ học về các bộ kết hợp.

## Xem thêm

- [Tham chiếu lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes)
- [Tham chiếu phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements)

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Attribute_selectors", "Learn_web_development/Core/Styling_basics/Combinators", "Learn_web_development/Core/Styling_basics")}}
