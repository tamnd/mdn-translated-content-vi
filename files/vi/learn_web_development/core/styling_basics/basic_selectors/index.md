---
title: Bộ chọn CSS cơ bản
short-title: Bộ chọn cơ bản
slug: Learn_web_development/Core/Styling_basics/Basic_selectors
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Styling_a_bio_page", "Learn_web_development/Core/Styling_basics/Attribute_selectors", "Learn_web_development/Core/Styling_basics")}}

Bạn đã thấy rằng trong {{Glossary("CSS")}}, các bộ chọn được sử dụng để nhắm mục tiêu các phần tử {{glossary("HTML")}} trên các trang web của chúng ta mà chúng ta muốn tạo kiểu. Có rất nhiều bộ chọn CSS khác nhau, cho phép độ chính xác chi tiết khi chọn các phần tử để tạo kiểu, và trong vài bài viết tiếp theo, chúng ta sẽ xem xét các loại khác nhau một cách sâu sắc. Trong bài viết này, chúng ta sẽ ôn lại một số kiến thức cơ bản về bộ chọn, bao gồm bộ chọn theo loại, lớp và ID cơ bản, và danh sách bộ chọn. Chúng ta cũng sẽ giới thiệu bộ chọn toàn cục.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Kiến thức cơ bản về HTML (học qua
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Basic_HTML_syntax"
          >Cú pháp HTML cơ bản</a
        >).
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Các loại bộ chọn cơ bản — theo loại phần tử, lớp, ID.</li>
          <li>Hiểu rằng ID là duy nhất trong mỗi tài liệu — bạn nên sử dụng ID để chọn một phần tử cụ thể.</li>
          <li>Hiểu rằng bạn có thể có nhiều lớp trên mỗi phần tử, và chúng có thể được sử dụng để xếp chồng kiểu theo yêu cầu.</li>
          <li>Danh sách bộ chọn.</li>
          <li>Bộ chọn toàn cục.</li>
        <ul>
      </td>
    </tr>
  </tbody>
</table>

## Bộ chọn là gì?

Bộ chọn CSS là phần đầu tiên của Quy tắc CSS. Đây là mẫu các phần tử và các thuật ngữ khác cho trình duyệt biết phần tử HTML nào cần áp dụng các giá trị thuộc tính CSS bên trong quy tắc. Phần tử hoặc các phần tử được chọn bởi bộ chọn được gọi là _chủ đề của bộ chọn_.

![Một số mã với h1 được tô sáng.](selector.png)

Trong các bài viết trước, bạn đã gặp nhiều bộ chọn khác nhau và học rằng có các bộ chọn nhắm mục tiêu tài liệu theo các cách khác nhau; ví dụ, bằng cách chọn một phần tử như `h1`, hoặc một lớp như `.special`. Hãy bắt đầu bằng cách ôn lại các bộ chọn chính mà bạn đã thấy.

## Bộ chọn theo loại

Một **bộ chọn theo loại** đôi khi được gọi là _bộ chọn tên thẻ_ hoặc _bộ chọn phần tử_ vì nó chọn một thẻ/phần tử HTML trong tài liệu của bạn. Trong ví dụ bên dưới, chúng ta đã sử dụng bộ chọn `span`, `em` và `strong`.

Hãy thử chỉnh sửa ví dụ sau (nhấp **"Play"** để mở nó trong MDN Playground) để thêm quy tắc CSS chọn phần tử `<h1>` và thay đổi màu của nó thành màu xanh lam:

```html live-sample___type
<h1>Type selectors</h1>
<p>
  Veggies es bonus vobis, proinde vos postulo essum magis
  <span>kohlrabi welsh onion</span> daikon amaranth tatsoi tomatillo melon azuki
  bean garlic.
</p>

<p>
  Gumbo beet greens corn soko <strong>endive</strong> gumbo gourd. Parsley
  shallot courgette tatsoi pea sprouts fava bean collard greens dandelion okra
  wakame tomato. Dandelion cucumber earthnut pea peanut soko zucchini.
</p>

<p>
  Turnip greens yarrow ricebean rutabaga <em>endive cauliflower</em> sea lettuce
  kohlrabi amaranth water spinach avocado daikon napa cabbage asparagus winter
  purslane kale. Celery potato scallion desert raisin horseradish spinach
</p>
```

```css live-sample___type
body {
  font-family: sans-serif;
}

span {
  background-color: yellow;
}

strong {
  color: rebeccapurple;
}

em {
  color: rebeccapurple;
}
```

{{EmbedLiveSample("type", "", "280px")}}

## Bộ chọn lớp

Bộ chọn lớp phân biệt hoa thường bắt đầu bằng ký tự dấu chấm (`.`). Nó sẽ chọn mọi thứ trong tài liệu có lớp đó được áp dụng. Trong ví dụ trực tiếp bên dưới, chúng ta đã tạo một lớp gọi là `highlight` và áp dụng nó ở một số nơi trong tài liệu. Tất cả các phần tử có lớp đó đều được tô sáng.

```html live-sample___class
<h1 class="highlight">Class selectors</h1>
<p>
  Veggies es bonus vobis, proinde vos postulo essum magis
  <span class="highlight">kohlrabi welsh onion</span> daikon amaranth tatsoi
  tomatillo melon azuki bean garlic.
</p>

<p class="highlight">
  Gumbo beet greens corn soko <strong>endive</strong> gumbo gourd. Parsley
  shallot courgette tatsoi pea sprouts fava bean collard greens dandelion okra
  wakame tomato. Dandelion cucumber earthnut pea peanut soko zucchini.
</p>
```

```css live-sample___class
body {
  font-family: sans-serif;
}

.highlight {
  background-color: yellow;
}
```

{{EmbedLiveSample("class", "", "220px")}}

### Thử nghiệm với bộ chọn lớp

Hãy thử chỉnh sửa ví dụ trên (sử dụng MDN Playground) để thực hiện các thay đổi sau:

1. Chỉnh sửa HTML để thay đổi nội dung mà kiểu `.highlight` được áp dụng. Ví dụ, bạn có thể thêm một số phần tử `<span>` để bọc các phần khác nhau của nội dung hiện có và áp dụng lớp `highlight` cho chúng, xóa một số lớp `highlight` hiện có, hoặc thêm nội dung mới để áp dụng lớp `highlight`.
2. Chỉnh sửa CSS để sửa đổi các khai báo bên trong quy tắc `.highlight`, thêm khai báo mới nếu bạn muốn, và lưu ý cách điều này ảnh hưởng đến việc tạo kiểu của tất cả các phần tử có lớp `highlight` được áp dụng.
3. Tạo quy tắc lớp mới bên trong CSS với các khai báo khác nhau bên trong (ví dụ, với bộ chọn `.highlight2`), sau đó thử áp dụng nó cho một số HTML của bạn.

### Nhắm mục tiêu lớp trên các phần tử cụ thể

Bạn có thể tạo bộ chọn nhắm mục tiêu các phần tử cụ thể có lớp được áp dụng. Trong ví dụ tiếp theo, chúng ta sẽ làm nổi bật `<span>` với lớp `highlight` khác với tiêu đề `<h1>` với lớp `highlight`. Chúng ta làm điều này bằng cách sử dụng bộ chọn theo loại cho phần tử chúng ta muốn nhắm mục tiêu, với lớp được thêm vào bằng dấu chấm, không có khoảng trắng ở giữa.

```html live-sample___class-type
<h1 class="highlight">Class selectors</h1>
<p>
  Veggies es bonus vobis, proinde vos postulo essum magis
  <span class="highlight">kohlrabi welsh onion</span> daikon amaranth tatsoi
  tomatillo melon azuki bean garlic.
</p>

<p class="highlight">
  Gumbo beet greens corn soko <strong>endive</strong> gumbo gourd. Parsley
  shallot courgette tatsoi pea sprouts fava bean collard greens dandelion okra
  wakame tomato. Dandelion cucumber earthnut pea peanut soko zucchini.
</p>
```

```css live-sample___class-type
body {
  font-family: sans-serif;
}

span.highlight {
  background-color: yellow;
}

h1.highlight {
  background-color: pink;
}
```

{{EmbedLiveSample("class-type", "", "200px")}}

Cách tiếp cận này thu hẹp phạm vi của quy tắc. Quy tắc sẽ chỉ áp dụng cho sự kết hợp cụ thể đó của phần tử và lớp. Bạn sẽ cần thêm một bộ chọn khác nếu bạn muốn quy tắc áp dụng cho các phần tử khác.

### Nhắm mục tiêu phần tử nếu nó có nhiều hơn một lớp được áp dụng

Bạn có thể áp dụng nhiều lớp cho một phần tử và nhắm mục tiêu chúng riêng lẻ, hoặc chỉ chọn phần tử khi tất cả các lớp trong bộ chọn đều có mặt. Điều này có thể hữu ích khi xây dựng các thành phần có thể kết hợp theo các cách khác nhau trên trang web của bạn.

Trong ví dụ bên dưới, chúng ta có một `<div>` chứa một ghi chú. Đường viền màu xám được áp dụng khi hộp có lớp `notebox`. Nếu nó cũng có lớp `warning` hoặc `danger`, chúng ta thay đổi {{cssxref("border-color")}}.

Chúng ta có thể nói với trình duyệt rằng chúng ta chỉ muốn khớp với phần tử nếu nó có hai lớp được áp dụng bằng cách nối chúng lại với nhau mà không có khoảng trắng ở giữa. Bạn sẽ thấy rằng `<div>` cuối cùng không được áp dụng bất kỳ kiểu nào vì nó chỉ có lớp `danger`. Để có bất kỳ kiểu nào được áp dụng, nó cũng cần lớp `notebox`.

```html live-sample___class-many
<div class="notebox">This is an informational note.</div>

<div class="notebox warning">This note shows a warning.</div>

<div class="notebox danger">This note shows danger!</div>

<div class="danger">
  This won't get styled — it also needs to have the notebox class
</div>
```

```css live-sample___class-many
body {
  font-family: sans-serif;
}

.notebox {
  border: 4px solid #666666;
  padding: 0.5em;
  margin: 0.5em;
}

.notebox.warning {
  border-color: orange;
  font-weight: bold;
}

.notebox.danger {
  border-color: red;
  font-weight: bold;
}
```

{{EmbedLiveSample("class-many", "", "200px")}}

## Bộ chọn ID

Bộ chọn ID phân biệt hoa thường bắt đầu bằng `#` thay vì ký tự dấu chấm, nhưng được sử dụng theo cách tương tự như bộ chọn lớp. Sự khác biệt là ID chỉ có thể được sử dụng một lần trên mỗi trang, và các phần tử chỉ có thể có một giá trị `id` duy nhất. Bộ chọn ID chọn một phần tử có `id` cụ thể, và bạn có thể đặt trước ID với bộ chọn theo loại để chỉ nhắm mục tiêu phần tử nếu cả phần tử và ID đều khớp. Bạn có thể thấy cả hai cách sử dụng này trong ví dụ sau:

```html live-sample___id
<h1 id="heading">ID selector</h1>
<p>
  Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion
  daikon amaranth tatsoi tomatillo melon azuki bean garlic.
</p>

<p id="one">
  Gumbo beet greens corn soko <strong>endive</strong> gumbo gourd. Parsley
  shallot courgette tatsoi pea sprouts fava bean collard greens dandelion okra
  wakame tomato. Dandelion cucumber earthnut pea peanut soko zucchini.
</p>
```

```css live-sample___id
body {
  font-family: sans-serif;
}

#one {
  background-color: yellow;
}

h1#heading {
  color: rebeccapurple;
}
```

{{EmbedLiveSample("id", "", "200px")}}

> [!WARNING]
> Sử dụng cùng một ID nhiều lần trong một tài liệu có thể dường như hoạt động cho mục đích tạo kiểu, nhưng đừng làm điều này. Điều này dẫn đến mã không hợp lệ và sẽ gây ra các hành vi lạ ở nhiều nơi.

### Thử nghiệm với bộ chọn ID

Hãy thử chỉnh sửa ví dụ trên để thực hiện các thay đổi sau:

1. Chỉnh sửa HTML để áp dụng kiểu `#one` cho đoạn đầu tiên thay vì đoạn thứ hai.
2. Chỉnh sửa CSS để sửa đổi các khai báo bên trong các bộ chọn ID, và lưu ý cách điều này thay đổi giao diện của HTML.

## Danh sách bộ chọn

Nếu bạn muốn áp dụng cùng CSS cho nhiều mục, bạn có thể kết hợp các bộ chọn riêng lẻ thành một _danh sách bộ chọn_. Quy tắc sau đó được áp dụng cho tất cả các bộ chọn riêng lẻ. Ví dụ, nếu tôi có cùng CSS cho bộ chọn `h1` và `.special`, tôi có thể viết này thành hai quy tắc riêng biệt.

```css
h1 {
  color: blue;
}

.special {
  color: blue;
}
```

Tôi cũng có thể kết hợp chúng thành một danh sách bộ chọn bằng cách thêm dấu phẩy giữa chúng.

```css-nolint
h1, .special {
  color: blue;
}
```

Khoảng trắng hợp lệ trước hoặc sau dấu phẩy. Bạn cũng có thể thấy các bộ chọn dễ đọc hơn nếu mỗi bộ chọn nằm trên một dòng mới.

```css
h1,
.special {
  color: blue;
}
```

### Thử nghiệm với danh sách bộ chọn

Trong ví dụ bên dưới, hãy thử kết hợp hai bộ chọn có khai báo giống nhau. Màn hình trực quan sẽ giống nhau sau đó.

```html live-sample___selector-list
<h1>Type selectors</h1>
<p>
  Veggies es bonus vobis, proinde vos postulo essum magis
  <span>kohlrabi welsh onion</span> daikon amaranth tatsoi tomatillo melon azuki
  bean garlic.
</p>

<p>
  Gumbo beet greens corn soko <strong>endive</strong> gumbo gourd. Parsley
  shallot courgette tatsoi pea sprouts fava bean collard greens dandelion okra
  wakame tomato. Dandelion cucumber earthnut pea peanut soko zucchini.
</p>

<p>
  Turnip greens yarrow ricebean rutabaga <em>endive cauliflower</em> sea lettuce
  kohlrabi amaranth water spinach avocado daikon napa cabbage asparagus winter
  purslane kale. Celery potato scallion desert raisin horseradish spinach
</p>
```

```css live-sample___selector-list
body {
  font-family: sans-serif;
}
span {
  background-color: yellow;
}

strong {
  color: rebeccapurple;
}

em {
  color: rebeccapurple;
}
```

{{EmbedLiveSample("selector-list", "", "280px")}}

### Bộ chọn không hợp lệ trong danh sách bộ chọn

Khi bạn nhóm các bộ chọn theo cách này, nếu bất kỳ bộ chọn nào không hợp lệ về mặt cú pháp, toàn bộ quy tắc sẽ bị bỏ qua.

Trong ví dụ sau, quy tắc bộ chọn lớp không hợp lệ sẽ bị bỏ qua, trong khi `h1` vẫn được tạo kiểu.

```css-nolint
h1 {
  color: blue;
}

..special {
  color: blue;
}
```

Tuy nhiên, khi kết hợp, cả `h1` lẫn lớp sẽ không được tạo kiểu vì toàn bộ quy tắc được coi là không hợp lệ.

```css-nolint
h1, ..special {
  color: blue;
}
```

## Bộ chọn toàn cục

Bộ chọn toàn cục được biểu thị bằng dấu hoa thị (`*`). Nó chọn mọi thứ trong tài liệu. Nếu `*` được nối bằng [bộ kết hợp hậu duệ](/en-US/docs/Web/CSS/Reference/Selectors/Descendant_combinator), nó chọn mọi thứ bên trong phần tử tổ tiên đó. Ví dụ, `p *` chọn tất cả các phần tử lồng bên trong phần tử `<p>`.

Trong ví dụ sau, chúng ta sử dụng bộ chọn toàn cục để xóa lề trên tất cả các phần tử. Thay vì kiểu mặc định của trình duyệt, vốn cách các tiêu đề và đoạn văn bằng lề, mọi thứ đều gần nhau.

```html live-sample___universal
<h1>Universal selector</h1>
<p>
  Veggies es bonus vobis, proinde vos postulo essum magis
  <span>kohlrabi welsh onion</span> daikon amaranth tatsoi tomatillo melon azuki
  bean garlic.
</p>

<p>
  Gumbo beet greens corn soko <strong>endive</strong> gumbo gourd. Parsley
  shallot courgette tatsoi pea sprouts fava bean collard greens dandelion okra
  wakame tomato. Dandelion cucumber earthnut pea peanut soko zucchini.
</p>
```

```css live-sample___universal
body {
  font-family: sans-serif;
}

* {
  margin: 0;
}
```

{{EmbedLiveSample("universal")}}

Loại hành vi này đôi khi được thấy trong "bảng kiểu đặt lại", loại bỏ tất cả kiểu trình duyệt. Vì bộ chọn toàn cục thực hiện các thay đổi toàn cục, chúng ta sử dụng nó cho các tình huống rất cụ thể, chẳng hạn như tình huống được mô tả bên dưới.

### Sử dụng bộ chọn toàn cục để làm cho bộ chọn của bạn dễ đọc hơn

Một cách sử dụng của bộ chọn toàn cục là để làm cho các bộ chọn dễ đọc hơn và trực quan hơn. Ví dụ, nếu chúng ta muốn chọn tất cả các phần tử hậu duệ của phần tử `<article>` là phần tử con đầu tiên của cha chúng, bao gồm cả phần tử con trực tiếp, chúng ta có thể sử dụng lớp giả {{cssxref(":first-child")}}. Chúng ta sẽ học thêm về điều này trong [lớp giả và phần tử giả](/en-US/docs/Learn_web_development/Core/Styling_basics/Pseudo_classes_and_elements):

```css
article :first-child {
  font-weight: bold;
}
```

Tuy nhiên, bộ chọn này có thể bị nhầm lẫn với `article:first-child`, sẽ chọn bất kỳ phần tử `<article>` nào là phần tử con đầu tiên của phần tử khác.

Để tránh sự nhầm lẫn này, chúng ta có thể thêm bộ chọn toàn cục vào lớp giả `:first-child`, để rõ ràng hơn bộ chọn đang làm gì. Nó đang chọn _bất kỳ_ phần tử nào là phần tử con đầu tiên của phần tử `<article>`, hoặc phần tử con đầu tiên của bất kỳ phần tử hậu duệ nào của `<article>`:

```css
article *:first-child {
  font-weight: bold;
}
```

Cả hai đều tương đương, nhưng một số người thấy tùy chọn thứ hai dễ đọc hơn.

> [!NOTE]
> Bạn ít có khả năng thấy kỹ thuật này được sử dụng nhiều trên các trang web được xuất bản. Chúng tôi không sử dụng nó nhiều trên MDN, ví dụ. Tuy nhiên, bạn vẫn nên cân nhắc sử dụng nó trong mã của mình nếu bạn thấy nó dễ hiểu hơn.

## Tóm tắt

Trong bài viết này, chúng ta đã ôn lại các bộ chọn CSS, cho phép bạn nhắm mục tiêu các phần tử HTML cụ thể, xem xét bộ chọn theo loại, lớp và ID chi tiết hơn so với trước đây. Trong bài viết tiếp theo, chúng ta sẽ tìm hiểu sâu hơn về bộ chọn thuộc tính.

> [!NOTE]
> Để có danh sách đầy đủ các bộ chọn, hãy xem [tham chiếu bộ chọn CSS](/en-US/docs/Web/CSS/Guides/Selectors) của chúng tôi.

## Xem thêm

- [CSS classes](https://scrimba.com/the-frontend-developer-career-path-c0j/~01d?via=mdn), Scrimba <sup>[_Đối tác học tập MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup>
  - : Bài học tương tác cung cấp một số hướng dẫn về các lớp CSS.

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Styling_a_bio_page", "Learn_web_development/Core/Styling_basics/Attribute_selectors", "Learn_web_development/Core/Styling_basics")}}
