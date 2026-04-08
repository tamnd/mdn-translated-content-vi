---
title: Block and inline layout in normal flow
short-title: Block and inline layout
slug: Web/CSS/Guides/Display/Block_and_inline_layout
page-type: guide
sidebar: cssref
---

Trong hướng dẫn này, chúng ta sẽ khám phá các cơ bản về cách các phần tử Block và Inline hoạt động khi chúng là một phần của normal flow.

Normal Flow được định nghĩa trong [đặc tả CSS 2.1](https://www.w3.org/TR/CSS2/visuren.html#normal-flow), giải thích rằng mọi hộp trong normal flow sẽ là một phần của _formatting context_. Chúng có thể là block hoặc inline, nhưng không thể là cả hai cùng một lúc. Chúng ta mô tả các hộp block-level là tham gia vào _block formatting context_, và các hộp inline-level là tham gia vào _inline formatting context_.

Hành vi của các phần tử có block hoặc inline formatting context cũng được định nghĩa trong đặc tả này. Đối với các phần tử có block formatting context, đặc tả nói:

> "Trong một block formatting context, các hộp được sắp xếp lần lượt từng cái một, theo chiều dọc, bắt đầu từ phía trên của containing block. Khoảng cách dọc giữa hai hộp anh em được xác định bởi các thuộc tính 'margin'. Margin dọc giữa các hộp block-level liền kề trong một block formatting context bị collapse.\
> Trong một block formatting context, cạnh trái ngoài của mỗi hộp chạm vào cạnh trái của containing block (đối với định dạng từ phải sang trái, các cạnh phải chạm nhau)." - 9.4.1

Đối với các phần tử có inline formatting context:

> "Trong một inline formatting context, các hộp được sắp xếp theo chiều ngang, lần lượt từng cái một, bắt đầu từ phía trên của containing block. Margin, border và padding ngang được tôn trọng giữa các hộp này. Các hộp có thể được căn chỉnh theo chiều dọc theo nhiều cách khác nhau: đáy hoặc đỉnh của chúng có thể được căn chỉnh, hoặc baseline của văn bản bên trong chúng có thể được căn chỉnh. Vùng hình chữ nhật chứa các hộp tạo thành một dòng được gọi là line box." - 9.4.2

Lưu ý rằng đặc tả CSS 2.1 mô tả tài liệu theo chiều ngang, writing mode từ trên xuống dưới. Ví dụ, bằng cách mô tả khoảng cách dọc giữa các hộp block. Hành vi trên các phần tử block và inline là như nhau khi làm việc trong writing mode dọc; chúng ta khám phá điều này trong hướng dẫn [Flow layout and writing modes](/en-US/docs/Web/CSS/Guides/Display/Flow_layout_and_writing_modes).

## Các phần tử tham gia vào block formatting context

Các phần tử block trong writing mode ngang như tiếng Anh, được sắp xếp theo chiều dọc, từng cái một theo thứ tự dưới nhau.

![Inline direction is horizontal. Block direction is vertical.](mdn-horizontal.png)

Trong writing mode dọc thì chúng sẽ được sắp xếp theo chiều ngang.

![Inline direction is vertical. Block direction is horizontal.](mdn-vertical.png)

Trong hướng dẫn này, chúng ta sẽ làm việc bằng tiếng Anh và do đó là writing mode ngang. Tuy nhiên, mọi thứ được mô tả đều hoạt động theo cùng một cách nếu tài liệu của bạn ở writing mode dọc.

Như được định nghĩa trong đặc tả, margin giữa hai hộp block là thứ tạo ra sự phân cách giữa các phần tử. Chúng ta có thể thấy điều này với layout của hai đoạn văn, mà tôi đã thêm border. Stylesheet mặc định của trình duyệt thêm khoảng cách giữa các đoạn văn bằng cách thêm margin vào đầu và cuối.

```html live-sample___normal-flow
<div class="box">
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney. Their names
    were Stephen and Joseph Montgolfier, they were papermakers by trade, and
    were noted as possessing thoughtful minds and a deep interest in all
    scientific knowledge and new discovery.
  </p>
  <p>
    Before that night—a memorable night, as it was to prove—hundreds of millions
    of people had watched the rising smoke-wreaths of their fires without
    drawing any special inspiration from the fact.
  </p>
</div>
```

```css live-sample___normal-flow
p {
  border: 2px solid green;
}
```

{{EmbedLiveSample("normal-flow", "", "200px")}}

Nếu chúng ta đặt margin trên phần tử đoạn văn thành `0` thì các border sẽ chạm nhau.

```html live-sample___normal-flow-margin-zero
<div class="box">
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney. Their names
    were Stephen and Joseph Montgolfier, they were papermakers by trade, and
    were noted as possessing thoughtful minds and a deep interest in all
    scientific knowledge and new discovery.
  </p>
  <p>
    Before that night—a memorable night, as it was to prove—hundreds of millions
    of people had watched the rising smoke-wreaths of their fires without
    drawing any special inspiration from the fact.
  </p>
</div>
```

```css live-sample___normal-flow-margin-zero
p {
  border: 2px solid green;
  margin: 0;
}
```

{{EmbedLiveSample("normal-flow-margin-zero")}}

Theo mặc định, các phần tử block sẽ chiếm toàn bộ không gian theo hướng inline, vì vậy các đoạn văn của chúng ta trải rộng ra và lớn nhất có thể bên trong containing block của chúng. Nếu chúng ta cho chúng một chiều rộng, chúng sẽ tiếp tục sắp xếp bên dưới nhau - ngay cả khi có không gian để chúng đứng cạnh nhau. Mỗi cái sẽ bắt đầu tại cạnh bắt đầu của containing block, vì vậy là nơi mà các câu sẽ bắt đầu trong writing mode đó.

```html live-sample___normal-flow-width
<div class="box">
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney. Their names
    were Stephen and Joseph Montgolfier, they were papermakers by trade, and
    were noted as possessing thoughtful minds and a deep interest in all
    scientific knowledge and new discovery.
  </p>
  <p>
    Before that night—a memorable night, as it was to prove—hundreds of millions
    of people had watched the rising smoke-wreaths of their fires without
    drawing any special inspiration from the fact.
  </p>
</div>
```

```css live-sample___normal-flow-width
p {
  border: 2px solid green;
  width: 40%;
}
```

{{EmbedLiveSample("normal-flow-width", "", "370px")}}

### Margin collapsing

Đặc tả giải thích rằng margin giữa các phần tử block _collapse_. Điều này có nghĩa là nếu bạn có một phần tử với top margin ngay sau một phần tử với bottom margin, thay vì tổng khoảng cách là tổng của hai margin này, margin sẽ collapse, và về cơ bản sẽ trở thành lớn bằng margin lớn hơn trong hai margin.

Trong ví dụ dưới đây, các đoạn văn có top margin là `20px` và bottom margin là `40px`. Kích thước của margin giữa các đoạn văn là `40px` vì top margin nhỏ hơn của đoạn văn thứ hai đã collapse với bottom margin lớn hơn của đoạn văn đầu tiên.

```html live-sample___normal-flow-collapsing
<div class="box">
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney. Their names
    were Stephen and Joseph Montgolfier, they were papermakers by trade, and
    were noted as possessing thoughtful minds and a deep interest in all
    scientific knowledge and new discovery.
  </p>
  <p>
    Before that night—a memorable night, as it was to prove—hundreds of millions
    of people had watched the rising smoke-wreaths of their fires without
    drawing any special inspiration from the fact.
  </p>
</div>
```

```css live-sample___normal-flow-collapsing
p {
  border: 2px solid green;
  margin: 20px 0 40px 0;
}
```

{{EmbedLiveSample("normal-flow-collapsing", "", "230px")}}

Bạn có thể đọc thêm về margin collapsing trong bài viết của chúng ta [Mastering Margin Collapsing](/en-US/docs/Web/CSS/Guides/Box_model/Margin_collapsing).

> [!NOTE]
> Nếu bạn không chắc chắn liệu margin có đang collapse hay không, hãy kiểm tra các giá trị Box Model trong DevTools của trình duyệt. Điều này sẽ cho bạn biết kích thước thực tế của margin, có thể giúp bạn xác định điều gì đang xảy ra.
>
> ![Screen shot box model panel in browser dev tools which shows the four values for margin, border, and padding along with height and width in a graphic at top and lists box-sizing, display, float, line-height, position, and z-index below the graphic.](box-model.png)

## Các phần tử tham gia vào inline formatting context

Các phần tử inline hiển thị lần lượt theo hướng mà các câu chạy trong writing mode cụ thể đó. Mặc dù chúng ta không có xu hướng nghĩ các phần tử inline như có một hộp, nhưng giống như mọi thứ trong CSS, chúng đều có. Các hộp inline này được sắp xếp lần lượt. Nếu không có đủ không gian trong containing block cho tất cả các hộp thì một hộp có thể xuống dòng mới. Các dòng được tạo ra được gọi là line box.

Trong ví dụ sau, chúng ta có ba hộp inline được tạo bởi một đoạn văn với phần tử {{HTMLElement("strong")}} bên trong.

```html live-sample___inline
<p>
  Before that night—<strong>a memorable night</strong>, as it was to
  prove—hundreds of millions of people had watched the rising smoke-wreaths of
  their fires without drawing any special inspiration from the fact.
</p>
```

{{EmbedLiveSample("inline")}}

Các hộp xung quanh các từ trước phần tử `<strong>` và sau phần tử `</strong>` được gọi là anonymous box, các hộp được giới thiệu để đảm bảo rằng mọi thứ đều được bao bọc trong một hộp, nhưng là những thứ chúng ta không thể nhắm đến trực tiếp.

Kích thước của line box theo hướng block (vì vậy là chiều cao khi làm việc bằng tiếng Anh) được xác định bởi hộp cao nhất bên trong nó. Trong ví dụ tiếp theo, phần tử `<strong>` là 300%; vì nội dung đó trải qua hai dòng, nó bây giờ xác định chiều cao của line box của hai dòng đó.

```html live-sample___line-box
<p>
  Before that night—<strong>a memorable night</strong>, as it was to
  prove—hundreds of millions of people had watched the rising smoke-wreaths of
  their fires without drawing any special inspiration from the fact.
</p>
```

```css live-sample___line-box
strong {
  font-size: 300%;
}
```

{{EmbedLiveSample("line-box")}}

Tìm hiểu thêm về cách các hộp block và inline hoạt động trong hướng dẫn của chúng ta về [visual formatting model](/en-US/docs/Web/CSS/Guides/Display/Visual_formatting_model).

## Thuộc tính display và flow layout

Ngoài các quy tắc tồn tại trong CSS2.1, các cấp độ mới hơn của CSS mô tả thêm về hành vi của các hộp block và inline. Thuộc tính {{cssxref("display")}} định nghĩa cách một hộp và bất kỳ hộp nào bên trong nó hoạt động. Trong CSS Display Model Level 3, chúng ta có thể tìm hiểu thêm về cách thuộc tính `display` thay đổi hành vi của các hộp và các hộp chúng tạo ra.

Kiểu display của một phần tử định nghĩa kiểu display bên ngoài; điều này quyết định cách hộp hiển thị cùng với các phần tử khác trong cùng một formatting context. Nó cũng định nghĩa kiểu display bên trong, quyết định cách các hộp bên trong phần tử này hoạt động. Chúng ta có thể thấy điều này rất rõ khi xem xét một flex layout. Trong ví dụ dưới đây tôi có một {{HTMLElement("div")}}, mà tôi đã cho `display: flex`. Flex container hoạt động như một phần tử block: nó hiển thị trên một dòng mới và chiếm toàn bộ không gian có thể theo hướng inline. Đây là kiểu display bên ngoài là `block`.

Tuy nhiên, các flex item đang tham gia vào một flex formatting context, vì cha của chúng là phần tử có `display: flex`, có kiểu display bên trong là `flex`, thiết lập flex formatting context cho các con trực tiếp.

```html live-sample___flex
<div class="container">
  <div>Flex Item</div>
  <div>Flex Item</div>
  <div>
    <div>Children</div>
    <div>are in</div>
    <div>normal flow</div>
  </div>
</div>
```

```css live-sample___flex
.container {
  display: flex;
}

.container > * {
  border: 1px solid green;
}
```

{{EmbedLiveSample("flex")}}

Do đó, bạn có thể nghĩ mọi hộp trong CSS hoạt động theo cách này. Bản thân hộp có kiểu display bên ngoài, vì vậy nó biết cách hoạt động cùng với các hộp khác. Sau đó nó có kiểu display bên trong thay đổi cách các con của nó hoạt động. Những con đó sau đó cũng có kiểu display bên ngoài và bên trong. Các flex item trong ví dụ trước trở thành các hộp flex level, vì vậy kiểu display bên ngoài của chúng được quyết định bởi việc chúng là một phần của flex formatting context. Tuy nhiên, chúng có kiểu display bên trong là _flow_, có nghĩa là các con của chúng tham gia vào normal flow. Các item được lồng vào trong flex item của chúng tự sắp xếp như các phần tử block và inline trừ khi có thứ gì đó thay đổi kiểu display của chúng.

Khái niệm về kiểu display bên ngoài và bên trong này là quan trọng vì nó cho chúng ta biết rằng một container sử dụng phương pháp layout như flexbox (`display: flex`) và grid layout (`display: grid`) vẫn đang tham gia vào block và inline layout, do kiểu display bên ngoài của các phương pháp đó là `block`.

### Thay đổi Formatting Context mà một phần tử tham gia

Các trình duyệt hiển thị các item trong block hoặc inline formatting context dựa trên những gì thường có ý nghĩa cho phần tử đó. Ví dụ, một phần tử {{HTMLElement("strong")}} được sử dụng để nhấn mạnh mạnh mẽ một đoạn nội dung và được hiển thị in đậm trong các trình duyệt theo mặc định. Thường sẽ không có ý nghĩa khi phần tử `<strong>` đó được hiển thị như một phần tử block-level, xuống dòng mới. Nếu bạn muốn tất cả các phần tử `<strong>` hiển thị như block box, bạn có thể làm vậy bằng cách đặt `strong { display: block; }`. Khả năng tạo style nội dung với CSS có nghĩa là bạn luôn có thể sử dụng các phần tử HTML ngữ nghĩa phù hợp nhất để đánh dấu nội dung của mình và sau đó thay đổi cách chúng được hiển thị với CSS.

```html live-sample___change-formatting
<p>
  Before that night—<strong>a memorable night</strong>, as it was to
  prove—hundreds of millions of people had watched the rising smoke-wreaths of
  their fires without drawing any special inspiration from the fact.
</p>
```

```css live-sample___change-formatting
strong {
  display: block;
}
```

{{EmbedLiveSample("change-formatting")}}

## Tóm tắt

Trong hướng dẫn này, chúng ta đã xem cách các phần tử hiển thị trong normal flow, như các phần tử block và inline. Một tài liệu HTML không có CSS styling nào cả vẫn sẽ hiển thị theo cách có thể đọc được nhờ hành vi mặc định này. Hiểu cách normal flow hoạt động là một điểm khởi đầu quan trọng để hiểu CSS layout như một tổng thể.

## Xem thêm

- [CSS Basic Box Model](/en-US/docs/Web/CSS/Guides/Box_model)
- [Learn: Normal Flow](/en-US/docs/Learn_web_development/Core/CSS_layout/Introduction#normal_layout_flow)
- [Inline-level elements](/en-US/docs/Glossary/Inline-level_content)
- [Block-level elements](/en-US/docs/Glossary/Block-level_content)
