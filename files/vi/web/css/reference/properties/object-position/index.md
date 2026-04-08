---
title: object-position
slug: Web/CSS/Reference/Properties/object-position
page-type: css-property
browser-compat: css.properties.object-position
sidebar: cssref
---

Thuộc tính **`object-position`** [CSS](/en-US/docs/Web/CSS) chỉ định vị trí căn chỉnh của nội dung của {{ glossary("replaced elements", "phần tử thay thế")}} được chọn trong hộp của phần tử. Các vùng trong hộp không được che phủ bởi đối tượng của phần tử thay thế sẽ hiển thị nền của phần tử.

Bạn có thể điều chỉnh cách kích thước nội tại của đối tượng của phần tử thay thế (tức là kích thước tự nhiên của nó) được điều chỉnh để vừa với hộp của phần tử bằng cách sử dụng thuộc tính {{cssxref("object-fit")}}.

{{InteractiveExample("CSS Demo: object-position")}}

```css interactive-example-choice
object-position: 50% 50%;
```

```css interactive-example-choice
object-position: right top;
```

```css interactive-example-choice
object-position: left bottom;
```

```css interactive-example-choice
object-position: 250px 125px;
```

```html interactive-example
<section id="default-example">
  <img
    class="transition-all"
    id="example-element"
    src="/shared-assets/images/examples/moon.jpg" />
</section>
```

```css interactive-example
#example-element {
  height: 250px;
  width: 250px;
  object-fit: none;
  border: 1px solid red;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
object-position: top;
object-position: bottom;
object-position: left;
object-position: right;
object-position: center;

/* Giá trị <percentage> */
object-position: 25% 75%;

/* Giá trị <length> */
object-position: 0 0;
object-position: 1cm 2cm;
object-position: 10ch 8em;

/* Giá trị offset cạnh */
object-position: bottom 10px right 20px;
object-position: right 3em bottom 10px;
object-position: top 0 right 10px;

/* Giá trị toàn cục */
object-position: inherit;
object-position: initial;
object-position: revert;
object-position: revert-layer;
object-position: unset;
```

### Giá trị

- {{cssxref("&lt;position&gt;")}}
  - : Từ một đến bốn giá trị xác định vị trí 2D của phần tử. Có thể sử dụng offset tương đối hoặc tuyệt đối.

> [!NOTE]
> Vị trí có thể được đặt sao cho phần tử thay thế được vẽ bên ngoài hộp của nó.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Định vị nội dung hình ảnh

#### HTML

Ở đây chúng ta thấy HTML bao gồm hai phần tử {{HTMLElement("img")}}, mỗi phần tử hiển thị logo MDN.

```html
<img id="object-position-1" src="mdn.svg" alt="MDN Logo" />
<img id="object-position-2" src="mdn.svg" alt="MDN Logo" />
```

#### CSS

CSS bao gồm kiểu mặc định cho chính phần tử `<img>`, cũng như các kiểu riêng biệt cho từng hình ảnh.

```css
img {
  width: 300px;
  height: 250px;
  border: 1px solid black;
  background-color: silver;
  margin-right: 1em;
  object-fit: none;
}

#object-position-1 {
  object-position: 10px;
}

#object-position-2 {
  object-position: 100% 10%;
}
```

Hình ảnh đầu tiên được định vị với cạnh trái của nó lùi vào 10 pixel từ cạnh trái của hộp phần tử. Hình ảnh thứ hai được định vị với cạnh phải của nó nằm sát cạnh phải của hộp phần tử và nằm ở 10% so với chiều cao của hộp phần tử.

#### Kết quả

{{ EmbedLiveSample('Positioning_image_content', '100%','600px') }}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính CSS liên quan đến hình ảnh khác: {{cssxref("object-fit")}}, {{cssxref("image-orientation")}}, {{cssxref("image-rendering")}}, {{cssxref("image-resolution")}}.
