---
title: break-inside
slug: Web/CSS/Reference/Properties/break-inside
page-type: css-property
browser-compat: css.properties.break-inside
sidebar: cssref
---

Thuộc tính **`break-inside`** trong [CSS](/en-US/docs/Web/CSS) xác định cách các ngắt trang, cột hoặc vùng hoạt động bên trong một hộp được tạo ra. Nếu không có hộp nào được tạo, thuộc tính này sẽ bị bỏ qua.

{{InteractiveExample("CSS Demo: break-inside")}}

```css interactive-example-choice
break-inside: auto;
```

```css interactive-example-choice
break-inside: avoid;
```

```html interactive-example
<div>
  <p>
    The effect of this property can be noticed when the document is being
    printed or a preview of a print is displayed.
  </p>
  <button id="print-btn">Show Print Preview</button>
  <div class="box-container">
    <div class="box">Content before the property</div>
    <div class="box" id="example-element">Content with 'break-inside'</div>
    <div class="box">Content after the property</div>
  </div>
</div>
```

```css interactive-example
.box {
  border: solid #5b6dcd 5px;
  background-color: #5b6dcd;
  margin: 10px 0;
  padding: 5px;
}

#example-element {
  border: solid 5px #ffc129;
  background-color: #ffc129;
  color: black;
}

@media print {
  #example-element {
    height: 25cm;
  }
}
```

```js interactive-example
const btn = document.getElementById("print-btn");

btn.addEventListener("click", () => {
  window.print();
});
```

## Cú pháp

```css
/* Giá trị từ khóa */
break-inside: auto;
break-inside: avoid;
break-inside: avoid-page;
break-inside: avoid-column;
break-inside: avoid-region;

/* Giá trị toàn cục */
break-inside: inherit;
break-inside: initial;
break-inside: revert;
break-inside: revert-layer;
break-inside: unset;
```

Mỗi điểm ngắt có thể xảy ra (tức là mỗi ranh giới phần tử) chịu ảnh hưởng bởi ba thuộc tính: giá trị {{cssxref("break-after")}} của phần tử trước, giá trị {{cssxref("break-before")}} của phần tử tiếp theo và giá trị `break-inside` của phần tử chứa.

Để xác định có cần thực hiện ngắt hay không, các quy tắc sau được áp dụng:

1. Nếu bất kỳ giá trị nào trong ba giá trị liên quan là _giá trị ngắt bắt buộc_ (`always`, `left`, `right`, `page`, `column` hoặc `region`), giá trị đó có độ ưu tiên cao nhất. Nếu có nhiều hơn một giá trị như vậy, giá trị của phần tử xuất hiện sau cùng trong luồng sẽ được sử dụng. Do đó, giá trị `break-before` có độ ưu tiên cao hơn `break-after`, còn `break-after` có độ ưu tiên cao hơn `break-inside`.
2. Nếu bất kỳ giá trị nào trong ba giá trị liên quan là _giá trị tránh ngắt_ (`avoid`, `avoid-page`, `avoid-region` hoặc `avoid-column`), sẽ không có ngắt nào được áp dụng tại điểm đó.

Sau khi các ngắt bắt buộc đã được áp dụng, các ngắt mềm có thể được thêm vào nếu cần, nhưng không được thêm vào các ranh giới phần tử có giá trị `avoid` tương ứng.

### Giá trị

- `auto`
  - : Cho phép, nhưng không bắt buộc, bất kỳ ngắt nào (trang, cột hoặc vùng) được chèn bên trong hộp chính.
- `avoid`
  - : Tránh bất kỳ ngắt nào (trang, cột hoặc vùng) được chèn bên trong hộp chính.
- `avoid-page`
  - : Tránh bất kỳ ngắt trang nào bên trong hộp chính.
- `avoid-column`
  - : Tránh bất kỳ ngắt cột nào bên trong hộp chính.
- `avoid-region`
  - : Tránh bất kỳ ngắt vùng nào bên trong hộp chính.

## Bí danh ngắt trang

Vì lý do tương thích, thuộc tính cũ {{cssxref("page-break-inside")}} nên được trình duyệt xem như bí danh của `break-inside`. Điều này đảm bảo các trang web sử dụng `page-break-inside` tiếp tục hoạt động đúng. Một tập hợp con các giá trị nên được ánh xạ như sau:

| page-break-inside | break-inside |
| ----------------- | ------------ |
| `auto`            | `auto`       |
| `avoid`           | `avoid`      |

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Tránh ngắt bên trong một hình ảnh có chú thích

Trong ví dụ sau, chúng ta có một vùng chứa gồm thẻ `<h1>` trải qua tất cả các cột (đạt được bằng cách dùng `column-span: all`) và một loạt đoạn văn được bố cục theo nhiều cột với `column-width: 200px`. Chúng ta cũng có thẻ `<figure>` chứa một hình ảnh và chú thích.

Theo mặc định, có thể xảy ra ngắt giữa hình ảnh và chú thích, điều này không mong muốn. Để tránh điều này, chúng ta đặt `break-inside: avoid` trên thẻ `<figure>`, nhờ đó chúng luôn ở cùng nhau.

#### HTML

```html
<article>
  <h1>Main heading</h1>

  <p>
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae
    fringilla mauris. Quisque commodo eget nisi sed pretium. Mauris luctus nec
    lacus in ultricies. Mauris vitae hendrerit arcu, ac scelerisque lacus.
    Aliquam lobortis in lacus sit amet posuere. Fusce iaculis urna id neque
    dapibus, eu lacinia lectus dictum.
  </p>

  <figure>
    <img
      src="https://mdn.dev/archives/media/attachments/2020/07/29/17350/3b4892b7e820122ac6dd7678891d4507/firefox.png" />
    <figcaption>The Firefox logo — fox wrapped around the world</figcaption>
  </figure>

  <p>
    Praesent condimentum dui dui, sit amet rutrum diam tincidunt eu. Cras
    suscipit porta leo sit amet rutrum. Sed vehicula ornare tincidunt. Curabitur
    a ipsum ac diam mattis volutpat ac ut elit. Nullam luctus justo non
    vestibulum gravida. Morbi metus libero, pharetra non porttitor a, molestie
    nec nisi.
  </p>

  <p>
    In finibus viverra enim vel suscipit. Quisque consequat velit eu orci
    malesuada, ut interdum tortor molestie. Proin sed pellentesque augue. Nam
    risus justo, faucibus non porta a, congue vel massa. Cras luctus lacus nisl,
    sed tincidunt velit pharetra ac. Duis suscipit faucibus dui sed ultricies.
  </p>
</article>
```

#### CSS

```css
html {
  font-family: "Helvetica", "Arial", sans-serif;
}

body {
  width: 80%;
  margin: 0 auto;
}

h1 {
  font-size: 3rem;
  letter-spacing: 2px;
  column-span: all;
}

h1 + p {
  margin-top: 0;
}

p {
  line-height: 1.5;
  break-after: column;
}

figure {
  break-inside: avoid;
}

img {
  max-width: 70%;
  display: block;
  margin: 0 auto;
}

figcaption {
  font-style: italic;
  font-size: 0.8rem;
  width: 70%;
}

article {
  column-width: 200px;
  gap: 20px;
}
```

### Kết quả

{{EmbedLiveSample('Avoiding_breaking_inside_a_figure', '100%', 600)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Tìm hiểu: Bố cục nhiều cột](/en-US/docs/Learn_web_development/Core/CSS_layout/Multiple-column_Layout)
- [Breaking Boxes With CSS Fragmentation](https://www.smashingmagazine.com/2019/02/css-fragmentation/)
