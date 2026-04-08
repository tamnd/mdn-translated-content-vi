---
title: order
slug: Web/CSS/Reference/Properties/order
page-type: css-property
browser-compat: css.properties.order
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`order`** đặt thứ tự để sắp xếp một mục trong container flex hoặc grid. Các mục trong container được sắp xếp theo giá trị `order` tăng dần rồi theo thứ tự mã nguồn. Các mục không được đặt giá trị `order` tường minh sẽ được gán giá trị mặc định là `0`.

{{InteractiveExample("CSS Demo: order")}}

```css interactive-example-choice
order: 0;
```

```css interactive-example-choice
order: 3;
```

```css interactive-example-choice
order: -1;
```

```css interactive-example-choice
order: 2;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">Box 1:</div>
  <div style="order: 1">Box 2: <code>order: 1;</code></div>
  <div style="order: 2">Box 3: <code>order: 2;</code></div>
  <div style="order: 2">Box 4: <code>order: 2;</code></div>
  <div style="order: 3">Box 5: <code>order: 3;</code></div>
</section>
```

```css interactive-example
.default-example {
  max-height: 300px;
  display: flex;
  flex-flow: column;
}

.default-example > div {
  background-color: rgb(0 0 255 / 0.2);
  border: 3px solid blue;
  margin: 0.5rem;
  padding: 0.5rem;
  flex: 1;
}

#example-element {
  background-color: rgb(255 0 200 / 0.2);
  border: 3px solid rebeccapurple;
}

#example-element::after {
  content: attr(style);
  outline: 2px dashed;
  font-family: monospace;
}
```

Trong bản demo trên, hãy chọn các tùy chọn ở bên trái để thay đổi giá trị thuộc tính `order` của hộp màu hồng. Các hộp xanh nhạt đã được gán giá trị `order` cố định.

Hãy lưu ý hiệu ứng của thứ tự mã nguồn. Ví dụ, khi chọn `order: 2;`, hộp màu hồng được đặt trước hai hộp xanh có `order: 2;`. Điều này là do hộp màu hồng xuất hiện trước các hộp xanh trong mã nguồn.

## Cú pháp

```css
/* Giá trị <integer> */
order: 5;
order: -5;

/* Giá trị toàn cục */
order: inherit;
order: initial;
order: revert;
order: revert-layer;
order: unset;
```

Vì `order` chỉ nhằm ảnh hưởng đến _thứ tự hiển thị_ của các phần tử chứ không phải thứ tự logic hay thứ tự tab của chúng, nó không được dùng trên các phương tiện phi trực quan như [giọng nói](https://drafts.csswg.org/css-speech/).

Được định nghĩa trong module [CSS display](/en-US/docs/Web/CSS/Guides/Display), thuộc tính này chỉ tác động đến các mục grid và flex. Khi `order` được đặt trên một phần tử mà thuộc tính {{cssxref("display")}} của phần tử cha không tạo ra container flex hoặc grid, nó không có hiệu lực.

### Giá trị

- {{cssxref("&lt;integer&gt;")}}
  - : Đại diện cho nhóm thứ tự được sử dụng bởi mục.

## Khả năng tiếp cận

Sử dụng thuộc tính `order` sẽ tạo ra sự ngắt kết nối giữa trình bày trực quan của nội dung và thứ tự DOM. Điều này sẽ ảnh hưởng bất lợi đến người dùng thị lực kém điều hướng với sự hỗ trợ của công nghệ hỗ trợ như trình đọc màn hình. Nếu thứ tự trực quan khác với thứ tự DOM, người dùng của bạn sẽ có trải nghiệm khác nhau tùy thuộc vào cách họ truy cập nội dung.

- [Flexbox & the keyboard navigation disconnect](https://tink.uk/flexbox-the-keyboard-navigation-disconnect/) via Tink (2016)
- [Source Order Matters](https://adrianroselli.com/2015/09/source-order-matters.html) via Adrian Roselli (2015)
- [Understanding WCAG, Guideline 1.3 explanations](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.3_—_create_content_that_can_be_presented_in_different_ways)
- [Understanding Success Criterion 1.3.2 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/content-structure-separation-sequence.html)

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Sắp xếp các mục trong container flex

Trong ví dụ này, chúng ta tạo bố cục hai thanh bên cổ điển.

#### HTML

Chúng ta có một header, một footer và một vùng nội dung chính. Nội dung chính bao gồm một bài viết và hai thanh bên. Hãy chú ý thứ tự của chúng! Chúng ta sẽ dùng thuộc tính CSS `order` để thay đổi thứ tự hiển thị.

```html
<header>Header</header>
<main>
  <article>Article</article>
  <nav>Nav</nav>
  <aside>Aside</aside>
</main>
<footer>Footer</footer>
```

#### CSS

Chúng ta tạo kiểu cho vùng chính bằng các tính năng module [flexible box layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout); bằng cách đặt {{cssxref("display")}} thành `flex`, phần tử {{htmlelement("main")}} trở thành container flex. Mặc định, điều này tạo ra các mục flex có chiều dọc bằng nhau. Các thanh bên đều được cấp một {{cssxref("width")}} tuyệt đối, trong khi {{htmlelement("article")}} sẽ tiêu thụ toàn bộ [không gian tự do dương](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Controlling_flex_item_ratios#positive_and_negative_free_space) với hệ số {{cssxref("flex-grow")}} được đặt qua thuật toán {{cssxref("flex")}}.

Sau đó chúng ta đặt các giá trị thuộc tính `order` khác nhau cho từng phần tử con của container flex; điều này có nghĩa là CSS đang xác định thứ tự hiển thị của thành phần đó thay vì xuất hiện theo thứ tự khai báo trong HTML.

```css
main {
  display: flex;
  text-align: center;
}
main > article {
  flex: 1;
  order: 2;
}
main > nav {
  width: 200px;
  order: 1;
}
main > aside {
  width: 200px;
  order: 3;
}
```

#### Kết quả

{{ EmbedLiveSample('Ordering_items_in_a_flex_container') }}

`<article>` xuất hiện đầu tiên trong thứ tự mã nguồn nhưng được hiển thị trực quan ở giữa.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Basic concepts of flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts)
- [Ordering flex items](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Ordering_items)
- [CSS grid layout and accessibility](/en-US/docs/Web/CSS/Guides/Grid_layout/Accessibility)
- Module [CSS display](/en-US/docs/Web/CSS/Guides/Display)
- {{glossary("Reading order")}}
