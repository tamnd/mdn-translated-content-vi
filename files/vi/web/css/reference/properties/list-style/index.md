---
title: list-style
slug: Web/CSS/Reference/Properties/list-style
page-type: css-shorthand-property
browser-compat: css.properties.list-style
sidebar: cssref
---

Thuộc tính viết tắt **`list-style`** trong [CSS](/vi/docs/Web/CSS) cho phép bạn đặt tất cả các thuộc tính kiểu danh sách cùng một lúc.

{{InteractiveExample("CSS Demo: list-style")}}

```css interactive-example-choice
list-style: square;
```

```css interactive-example-choice
list-style: inside;
```

```css interactive-example-choice
list-style: url("/shared-assets/images/examples/rocket.svg");
```

```css interactive-example-choice
list-style: none;
```

```css interactive-example-choice
list-style: georgian inside url("/shared-assets/images/examples/rocket.svg");
```

```css interactive-example-choice
list-style: georgian outside url("/non-existent.svg");
```

```html interactive-example
<section class="default-example" id="default-example">
  <div>
    <p>NASA Notable Missions</p>
    <ul class="transition-all" id="example-element">
      <li>Apollo</li>
      <li>Hubble</li>
      <li>Chandra</li>
      <li>Cassini-Huygens</li>
      <li>Spitzer</li>
    </ul>
  </div>
</section>
```

```css interactive-example
.default-example {
  font-size: 1.2rem;
}

#example-element {
  width: 100%;
  background: #be094b;
  color: white;
}

section {
  text-align: left;
  flex-direction: column;
}

hr {
  width: 50%;
  color: lightgray;
  margin: 0.5em;
}

.note {
  font-size: 0.8rem;
}

.note a {
  color: #009e5f;
}

@counter-style space-counter {
  symbols: "\1F680" "\1F6F8" "\1F6F0" "\1F52D";
  suffix: " ";
}
```

Các giá trị của thuộc tính này được áp dụng cho các mục danh sách, bao gồm các phần tử {{HTMLElement("li")}} và các phần tử có `{{cssxref("display")}}: list-item;`. Vì thuộc tính này được kế thừa, nó có thể được đặt trên phần tử cha (thường là {{HTMLElement("ol")}} hoặc {{HTMLElement("ul")}}) để áp dụng cùng một kiểu danh sách cho tất cả các mục lồng nhau.

## Các thuộc tính thành phần

Thuộc tính này là viết tắt cho các thuộc tính CSS sau:

- {{cssxref("list-style-image")}}
- {{cssxref("list-style-position")}}
- {{cssxref("list-style-type")}}

## Cú pháp

```css
/* type */
list-style: square;

/* image */
list-style: url("../img/shape.png");

/* position */
list-style: inside;

/* hai giá trị */
list-style: georgian outside;
list-style: url("img/pip.svg") inside;

/* ba giá trị */
list-style: lower-roman url("img/shape.png") outside;

/* Giá trị từ khóa */
list-style: none;

/* Giá trị toàn cục */
list-style: inherit;
list-style: initial;
list-style: revert;
list-style: revert-layer;
list-style: unset;
```

Thuộc tính `list-style` được chỉ định là một, hai hoặc ba giá trị theo bất kỳ thứ tự nào. Nếu cả {{cssxref("list-style-type")}} và {{cssxref("list-style-image")}} đều được đặt, `list-style-type` được dùng làm dự phòng nếu ảnh không khả dụng.

### Giá trị

- {{cssxref("list-style-type")}}
  - : Một `<counter-style>`, {{cssxref("string")}}, hoặc `none`. Nếu bỏ qua trong viết tắt, giá trị mặc định `disc` được sử dụng. Xem {{cssxref("list-style-type")}}.
- {{cssxref("list-style-image")}}
  - : Một {{cssxref("image")}} hoặc `none`. Nếu bỏ qua, giá trị mặc định `none` được sử dụng. Xem {{cssxref("list-style-image")}}.
- {{cssxref("list-style-position")}}
  - : Là `inside` hoặc `outside`. Nếu bỏ qua, giá trị mặc định `outside` được sử dụng. Xem {{cssxref("list-style-position")}}.
- `none`
  - : Không sử dụng kiểu danh sách nào.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Khả năng tiếp cận

Safari không nhận dạng danh sách có thứ tự hay không có thứ tự là danh sách trong cây khả năng tiếp cận nếu chúng có giá trị `list-style` là `none`, trừ khi danh sách được lồng trong phần tử điều hướng {{HTMLElement("nav")}}. [Hành vi này là có chủ ý](https://webkit.org/b/170179#c1) và không được coi là lỗi.

Để đảm bảo danh sách được thông báo là danh sách, hãy thêm [`role="list"`](/vi/docs/Web/Accessibility/ARIA/Reference/Roles/list_role) vào các phần tử {{HTMLElement("ol")}} và {{HTMLElement("ul")}}, đặc biệt nếu danh sách không được lồng trong `<nav>`. Điều này khôi phục ngữ nghĩa danh sách mà không ảnh hưởng đến thiết kế:

```html
<ul role="list">
  <li>An item</li>
  <li>Another item</li>
</ul>
```

Nếu `role` ARIA không phải là tùy chọn cho mã của bạn, có thể dùng CSS thay thế. Thêm [nội dung giả](/vi/docs/Web/CSS/Reference/Properties/content) không rỗng như văn bản hoặc hình ảnh trước mỗi mục danh sách có thể khôi phục ngữ nghĩa danh sách, nhưng ảnh hưởng đến giao diện trực quan. Safari xác định xem nội dung giả được thêm vào có đủ như nội dung có thể tiếp cận hay không, khôi phục ngữ nghĩa danh sách nếu có. Nói chung, Safari coi văn bản và hình ảnh là đủ, đó là lý do tại sao `content: "+ ";` hiển thị bên dưới hoạt động (nhưng yêu cầu tạo kiểu thêm để không ảnh hưởng đến thiết kế).

```css
ul {
  list-style: none;
}

ul li::before {
  content: "+ ";
}
```

Khai báo `content: "";` (chuỗi rỗng) bị bỏ qua, cũng như các giá trị `content` chỉ chứa khoảng trắng, chẳng hạn như `content: " ";`.

Các cách giải quyết CSS này chỉ nên được sử dụng khi không có giải pháp HTML nào khả dụng, và chỉ sau khi kiểm tra để đảm bảo chúng không dẫn đến các hành vi bất ngờ có thể tác động tiêu cực đến trải nghiệm người dùng.

- ['Fixing' Lists](https://www.scottohara.me/blog/2019/01/12/lists-and-safari.html) (2023)
- [VoiceOver and list-style-type: none](https://gerardkcohen.me/writing/2017/voiceover-list-style-type.html) (2017)
- [Understanding WCAG: Create content that can be presented in different ways](/vi/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.3_—_create_content_that_can_be_presented_in_different_ways)
- [Understanding success criterion 1.3.1: Info and relationships | WCAG 2.1](https://www.w3.org/WAI/WCAG21/Understanding/info-and-relationships.html)

## Ví dụ

### Thiết lập kiểu và vị trí danh sách

#### HTML

```html
List 1
<ul class="one">
  <li>List Item1</li>
  <li>List Item2</li>
  <li>List Item3</li>
</ul>
List 2
<ul class="two">
  <li>List Item A</li>
  <li>List Item B</li>
  <li>List Item C</li>
</ul>
```

#### CSS

```css
.one {
  list-style: circle;
}

.two {
  list-style: square inside;
}
```

#### Kết quả

{{EmbedLiveSample('Setting_list_style_type_and_position', 'auto', 240)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính thành phần: {{Cssxref("list-style-type")}}, {{Cssxref("list-style-image")}}, và {{Cssxref("list-style-position")}}
- Phần tử giả {{Cssxref("::marker")}}
- Mô-đun [CSS lists and counters](/en-US/docs/Web/CSS/Guides/Lists)
- Mô-đun [CSS counter styles](/en-US/docs/Web/CSS/Guides/Counter_styles)
