---
title: list-style-position
slug: Web/CSS/Reference/Properties/list-style-position
page-type: css-property
browser-compat: css.properties.list-style-position
sidebar: cssref
---

Thuộc tính CSS **`list-style-position`** đặt vị trí của {{cssxref("::marker")}} so với mục danh sách.

{{InteractiveExample("CSS Demo: list-style-position")}}

```css interactive-example-choice
list-style-position: inside;
```

```css interactive-example-choice
list-style-position: outside;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div>
    <p>NASA Notable Missions</p>
    <ul class="transition-all" id="example-element">
      <li>Apollo 11: First Human Landing</li>
      <li>City in Space: The International Space Station</li>
      <li>Great Observatory: The Hubble Space Telescope</li>
      <li>Everlasting Mars Rovers</li>
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

## Cú pháp

```css
/* Giá trị từ khóa */
list-style-position: inside;
list-style-position: outside;

/* Giá trị toàn cục */
list-style-position: inherit;
list-style-position: initial;
list-style-position: revert;
list-style-position: revert-layer;
list-style-position: unset;
```

Thuộc tính `list-style-position` được chỉ định là một trong các giá trị từ khóa được liệt kê bên dưới.

### Giá trị

- `inside`
  - : {{cssxref("::marker")}} là phần tử đầu tiên trong nội dung của mục danh sách.
- `outside`
  - : {{cssxref("::marker")}} nằm ngoài hộp khối chính. Đây là giá trị mặc định của {{cssxref("list-style")}}.

## Mô tả

Thuộc tính này được áp dụng cho các mục danh sách, tức là các phần tử có `{{cssxref("display")}}: list-item;`. [Theo mặc định](https://html.spec.whatwg.org/multipage/rendering.html#lists) bao gồm các phần tử {{HTMLElement("li")}}. Vì thuộc tính này được kế thừa, nó có thể được đặt trên phần tử cha (thường là {{HTMLElement("ol")}} hoặc {{HTMLElement("ul")}}) để áp dụng cho tất cả các mục danh sách.

Nếu một phần tử khối là con đầu tiên của phần tử danh sách được khai báo là `list-style-position: inside`, thì phần tử khối đó được đặt trên dòng sau hộp dấu đầu dòng.

Thường tiện hơn khi sử dụng thuộc tính rút gọn {{cssxref("list-style")}}.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Đặt vị trí mục danh sách

#### HTML

```html
<p>List 1</p>
<ul class="inside">
  <li>List Item 1-1</li>
  <li>List Item 1-2</li>
  <li>List Item 1-3</li>
  <li>List Item 1-4</li>
</ul>
<p>List 2</p>
<ul class="outside">
  <li>List Item 2-1</li>
  <li>List Item 2-2</li>
  <li>List Item 2-3</li>
  <li>List Item 2-4</li>
</ul>
<p>List 3</p>
<ul class="inside-img">
  <li>List Item 3-1</li>
  <li>List Item 3-2</li>
  <li>List Item 3-3</li>
  <li>List Item 3-4</li>
</ul>
```

#### CSS

```css
.inside {
  list-style-position: inside;
  list-style-type: square;
}

.outside {
  list-style-position: outside;
  list-style-type: circle;
}

.inside-img {
  list-style-position: inside;
  list-style-image: url("star-solid.gif");
}
```

#### Kết quả

{{EmbedLiveSample("Setting_list_item_position", 200, 420)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính rút gọn {{Cssxref("list-style")}}
- Thuộc tính {{Cssxref("list-style-type")}}
- Thuộc tính {{Cssxref("list-style-image")}}
- Phần tử giả {{cssxref("::marker")}}
- Mô-đun [CSS lists and counters](/en-US/docs/Web/CSS/Guides/Lists)
- Mô-đun [CSS counter styles](/en-US/docs/Web/CSS/Guides/Counter_styles)
