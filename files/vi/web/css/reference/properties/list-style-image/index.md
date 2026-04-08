---
title: list-style-image
slug: Web/CSS/Reference/Properties/list-style-image
page-type: css-property
browser-compat: css.properties.list-style-image
sidebar: cssref
---

Thuộc tính CSS **`list-style-image`** đặt hình ảnh được dùng làm dấu đầu dòng của mục danh sách.

Thường tiện hơn khi sử dụng thuộc tính rút gọn {{ cssxref("list-style") }}.

{{InteractiveExample("CSS Demo: list-style-image")}}

```css interactive-example-choice
list-style-image: url("/shared-assets/images/examples/rocket.svg");
```

```css interactive-example-choice
list-style-image: none;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div>
    <p>NASA Notable Missions</p>
    <ul class="transition-all unhighlighted" id="example-element">
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

> [!NOTE]
> Thuộc tính này được áp dụng cho các mục danh sách, tức là các phần tử có `{{cssxref("display")}}: list-item;` [theo mặc định](https://html.spec.whatwg.org/multipage/rendering.html#lists) bao gồm các phần tử {{HTMLElement("li")}}. Vì thuộc tính này được kế thừa, nó có thể được đặt trên phần tử cha (thường là {{HTMLElement("ol")}} hoặc {{HTMLElement("ul")}}) để áp dụng cho tất cả các mục danh sách.

## Cú pháp

```css
/* Giá trị từ khóa */
list-style-image: none;

/* Giá trị <url> */
list-style-image: url("star-solid.gif");

/* Giá trị hình ảnh hợp lệ */
list-style-image: linear-gradient(to left bottom, red, blue);

/* Giá trị toàn cục */
list-style-image: inherit;
list-style-image: initial;
list-style-image: revert;
list-style-image: revert-layer;
list-style-image: unset;
```

### Giá trị

- {{cssxref("image")}}
  - : Một hình ảnh hợp lệ được dùng làm dấu đầu dòng.
- `none`
  - : Chỉ định rằng không có hình ảnh nào được dùng làm dấu đầu dòng. Nếu giá trị này được đặt, dấu đầu dòng được định nghĩa trong {{ Cssxref("list-style-type") }} sẽ được sử dụng thay thế. Đây là giá trị mặc định của {{cssxref("list-style")}}.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Sử dụng giá trị url

Ví dụ này có một ngôi sao làm dấu đầu dòng, được thêm vào bằng hàm hình ảnh {{cssxref("url_value", "&lt;url&gt;")}}.

#### HTML

```html
<ul>
  <li>Item 1</li>
  <li>Item 2</li>
</ul>
```

#### CSS

```css
ul {
  list-style-image: url("star-solid.gif");
}
```

#### Kết quả

{{ EmbedLiveSample('Using_a_url_value') }}

### Sử dụng gradient

Ví dụ này có một [CSS gradient](/en-US/docs/Web/CSS/Guides/Images/Using_gradients) làm dấu đầu dòng, được tạo bằng hàm hình ảnh {{cssxref("gradient/linear-gradient", "linear-gradient()")}}.

#### HTML

```html
<ul>
  <li>Item 1</li>
  <li>Item 2</li>
</ul>
```

#### CSS

```css
ul {
  font-size: 200%;
  list-style-image: linear-gradient(to left bottom, red, blue);
}
```

#### Kết quả

{{ EmbedLiveSample('Using_a_gradient') }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính rút gọn {{Cssxref("list-style")}}
- Thuộc tính {{Cssxref("list-style-type")}}
- Thuộc tính {{Cssxref("list-style-position")}}
- Phần tử giả {{cssxref("::marker")}}
- Mô-đun [CSS lists and counters](/en-US/docs/Web/CSS/Guides/Lists)
- Mô-đun [CSS counter styles](/en-US/docs/Web/CSS/Guides/Counter_styles)
