---
title: Bộ kết hợp
slug: Learn_web_development/Core/Styling_basics/Combinators
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Pseudo_classes_and_elements", "Learn_web_development/Core/Styling_basics/Test_your_skills/Selectors", "Learn_web_development/Core/Styling_basics")}}

Các bộ chọn cuối cùng chúng ta sẽ xem xét được gọi là bộ kết hợp. Bộ kết hợp được sử dụng để kết hợp các bộ chọn khác theo cách cho phép chúng ta chọn các phần tử dựa trên vị trí của chúng trong DOM so với các phần tử khác (ví dụ, phần tử con hoặc phần tử anh chị em).

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
          <li>Khái niệm cơ bản về bộ kết hợp.</li>
          <li>Bộ kết hợp hậu duệ và bộ kết hợp con.</li>
          <li>Bộ kết hợp anh chị em tiếp theo và anh chị em tiếp sau.</li>
          <li>Lồng ghép.</li>
          <li>Kết hợp bộ kết hợp với bộ chọn.</li>
        <ul>
      </td>
    </tr>
  </tbody>
</table>

## Bộ kết hợp hậu duệ

**Bộ kết hợp hậu duệ** — được biểu thị bằng ký tự khoảng cách (<code> </code>) — kết hợp hai bộ chọn sao cho các phần tử khớp với bộ chọn thứ hai được chọn nếu chúng có phần tử tổ tiên (cha, cha của cha, hoặc cha của cha của cha, v.v.) khớp với bộ chọn đầu tiên. Các bộ chọn sử dụng bộ kết hợp hậu duệ được gọi là _bộ chọn hậu duệ_.

```css
body article p {
}
```

Trong ví dụ bên dưới, chúng ta chỉ khớp phần tử `<p>` bên trong một phần tử có lớp `.box`.

```html live-sample___descendant
<div class="box"><p>Text in .box</p></div>
<p>Text not in .box</p>
```

```css live-sample___descendant
.box p {
  color: red;
}
```

{{EmbedLiveSample("descendant")}}

> [!NOTE]
> [Aside: Compound selectors](https://scrimba.com/frontend-path-c0j/~0br?via=mdn) <sup>[_Đối tác học tập MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup> từ Scrimba là bài học tương tác cung cấp cách xử lý thực tế về bộ kết hợp hậu duệ.

## Bộ kết hợp con

**Bộ kết hợp con** (`>`) được đặt giữa hai bộ chọn CSS. Nó chỉ khớp các phần tử khớp với bộ chọn thứ hai là con trực tiếp của các phần tử khớp với bộ chọn đầu tiên. Các phần tử hậu duệ ở cấp thấp hơn trong phân cấp không khớp. Ví dụ, để chỉ chọn các phần tử `<p>` là con trực tiếp của các phần tử `<article>`:

```css
article > p {
  /* … */
}
```

Trong ví dụ tiếp theo, chúng ta có danh sách có thứ tự ({{htmlelement("ol")}}) được lồng bên trong danh sách không có thứ tự ({{htmlelement("ul")}}). Bộ kết hợp con chỉ chọn các phần tử `<li>` là con trực tiếp của `<ul>`, và tạo kiểu cho chúng với đường viền trên.

```html live-sample___child
<ul>
  <li>Unordered item</li>
  <li>
    Unordered item
    <ol>
      <li>Item 1</li>
      <li>Item 2</li>
    </ol>
  </li>
</ul>
```

```css live-sample___child
ul > li {
  border-top: 5px solid red;
}
```

{{EmbedLiveSample("child")}}

Trong ví dụ trước, hãy thử xóa `>` chỉ định bộ chọn là bộ chọn con. Bạn sẽ có bộ chọn hậu duệ, và tất cả các phần tử `<li>` sẽ có đường viền đỏ.

## Bộ kết hợp anh chị em tiếp theo

**Bộ kết hợp anh chị em tiếp theo** (`+`) được đặt giữa hai bộ chọn CSS. Nó chỉ khớp các phần tử khớp với bộ chọn thứ hai đứng ngay sau phần tử khớp với bộ chọn đầu tiên. Ví dụ, để chọn tất cả các phần tử `<img>` đứng ngay sau phần tử `<p>`:

```css
p + img {
  /* … */
}
```

Trường hợp sử dụng phổ biến là thực hiện điều gì đó với đoạn văn theo sau tiêu đề, như trong ví dụ bên dưới. Ở đây, chúng ta chọn bất kỳ đoạn nào chia sẻ phần tử cha với `<h1>`, và đứng ngay sau `<h1>` đó.

```html live-sample___adjacent
<article>
  <h1>A heading</h1>
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

```css live-sample___adjacent
body {
  font-family: sans-serif;
}

h1 + p {
  font-weight: bold;
  background-color: #333333;
  color: white;
  padding: 0.5em;
}
```

{{EmbedLiveSample("adjacent", "", "220px")}}

Trong ví dụ trước:

1. Thử chèn một phần tử khác như `<h2>` giữa `<h1>` và `<p>`. Bạn sẽ thấy rằng đoạn văn không còn được khớp bởi bộ chọn và do đó không được áp dụng màu nền và màu chữ khi phần tử ở cạnh nhau.
2. Bây giờ hãy sửa đổi bộ chọn `h1 + p` để kiểu đặc biệt được áp dụng lại cho đoạn đầu tiên.

## Bộ kết hợp anh chị em tiếp sau

Nếu bạn muốn chọn các anh chị em của một phần tử ngay cả khi chúng không đứng liền nhau, thì bạn có thể sử dụng **bộ kết hợp anh chị em tiếp sau** (`~`). Để chọn tất cả các phần tử `<img>` đứng _bất kỳ nơi nào_ sau các phần tử `<p>`, chúng ta làm như sau:

```css
p ~ img {
  /* … */
}
```

Trong ví dụ bên dưới, chúng ta chọn tất cả các phần tử `<p>` đứng sau `<h1>`, và ngay cả khi có một `<div>` trong tài liệu, `<p>` đứng sau nó cũng được chọn.

```html live-sample___general
<article>
  <h1>A heading</h1>
  <p>I am a paragraph.</p>
  <div>I am a div</div>
  <p>I am another paragraph.</p>
</article>
```

```css live-sample___general
body {
  font-family: sans-serif;
}

h1 ~ p {
  font-weight: bold;
  background-color: #333333;
  color: white;
  padding: 0.5em;
}
```

{{EmbedLiveSample("general", "", "220px")}}

## Kết hợp bộ kết hợp với bộ chọn

Bạn có thể kết hợp bất kỳ bộ chọn nào mà chúng ta đã khám phá trong các bài học trước với các bộ kết hợp để chọn một phần tài liệu của bạn. Ví dụ, để chọn các mục danh sách có `class` là `a` là con trực tiếp của `<ul>`, hãy thử như sau:

```css
ul > li[class="a"] {
}
```

Tuy nhiên, hãy cẩn thận khi tạo các danh sách lớn các bộ chọn chọn các phần rất cụ thể của tài liệu. Sẽ khó tái sử dụng các quy tắc CSS vì bạn đã làm cho bộ chọn rất cụ thể với vị trí của phần tử đó trong đánh dấu.

Thường tốt hơn là tạo một lớp đơn giản và áp dụng nó cho phần tử đó. Điều đó nói rằng, kiến thức của bạn về bộ kết hợp sẽ rất hữu ích nếu bạn cần tạo kiểu cho thứ gì đó trong tài liệu của mình và không thể truy cập HTML, có thể vì nó được tạo bởi {{Glossary("CMS")}}.

## Tóm tắt

Đó là tất cả về bộ chọn, hiện tại. Tiếp theo, chúng ta sẽ cung cấp cho bạn một số bài kiểm tra mà bạn có thể sử dụng để kiểm tra mức độ hiểu và ghi nhớ thông tin chúng ta đã cung cấp về bộ chọn CSS.

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Pseudo_classes_and_elements", "Learn_web_development/Core/Styling_basics/Test_your_skills/Selectors", "Learn_web_development/Core/Styling_basics")}}
