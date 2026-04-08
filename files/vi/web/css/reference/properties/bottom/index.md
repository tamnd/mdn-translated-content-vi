---
title: bottom
slug: Web/CSS/Reference/Properties/bottom
page-type: css-property
browser-compat: css.properties.bottom
sidebar: cssref
---

Thuộc tính **`bottom`** [CSS](/en-US/docs/Web/CSS) tham gia vào việc đặt vị trí theo chiều dọc của một [phần tử được định vị](/en-US/docs/Web/CSS/Reference/Properties/position). {{glossary("inset properties", "Thuộc tính inset")}} này không có hiệu lực trên các phần tử không được định vị.

{{InteractiveExample("CSS Demo: bottom")}}

```css interactive-example-choice
bottom: 0;
```

```css interactive-example-choice
bottom: 4em;
```

```css interactive-example-choice
bottom: 10%;
```

```css interactive-example-choice
bottom: 20px;
```

```html interactive-example
<section id="default-example">
  <div class="example-container">
    <div id="example-element">I am absolutely positioned.</div>
    <p>
      As much mud in the streets as if the waters had but newly retired from the
      face of the earth, and it would not be wonderful to meet a Megalosaurus,
      forty feet long or so, waddling like an elephantine lizard up Holborn
      Hill.
    </p>
  </div>
</section>
```

```css interactive-example
.example-container {
  border: 0.75em solid;
  padding: 0.75em;
  text-align: left;
  position: relative;
  width: 100%;
  min-height: 200px;
}

#example-element {
  background-color: #264653;
  border: 4px solid #ffb500;
  color: white;
  position: absolute;
  width: 140px;
  height: 60px;
}
```

## Cú pháp

```css
/* Giá trị <length> */
bottom: 3px;
bottom: 2.4em;
bottom: calc(anchor(--my-anchor 50%) + 5px);
bottom: anchor-size(width);

/* <percentage> của chiều cao của khối chứa */
bottom: 10%;

/* Giá trị từ khóa */
bottom: auto;

/* Giá trị toàn cục */
bottom: inherit;
bottom: initial;
bottom: revert;
bottom: revert-layer;
bottom: unset;
```

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Giá trị {{cssxref("&lt;length&gt;")}} âm, không hoặc dương:
    - Đối với _phần tử được định vị tuyệt đối_, đại diện cho khoảng cách đến cạnh dưới của khối chứa.
    - Đối với _phần tử được định vị tương đối_, đại diện cho khoảng cách mà phần tử được di chuyển lên trên so với vị trí bình thường của nó.
    - Đối với _phần tử được định vị neo (anchor-positioned)_, hàm {{cssxref("anchor()")}} phân giải thành giá trị {{cssxref("&lt;length&gt;")}} tương đối so với vị trí của cạnh trên hoặc dưới của _phần tử neo_ liên kết (xem [Sử dụng thuộc tính inset với giá trị hàm `anchor()`](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using#using_inset_properties_with_anchor_function_values)), và hàm {{cssxref("anchor-size()")}} phân giải thành giá trị {{cssxref("&lt;length&gt;")}} tương đối so với chiều rộng hoặc chiều cao của phần tử neo liên kết (xem [Đặt vị trí phần tử dựa trên kích thước neo](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using#setting_element_position_based_on_anchor_size)).

- {{cssxref("&lt;percentage&gt;")}}
  - : Giá trị {{cssxref("&lt;percentage&gt;")}} của chiều cao của khối chứa.
- `auto`
  - : Chỉ định rằng:
    - Đối với _phần tử được định vị tuyệt đối_, vị trí của phần tử dựa trên thuộc tính {{Cssxref("top")}}, trong khi `height: auto` được xử lý như chiều cao dựa trên nội dung; hoặc nếu `top` cũng là `auto`, phần tử được đặt ở vị trí mà nó sẽ ở theo chiều dọc nếu đó là phần tử tĩnh.
    - Đối với _phần tử được định vị tương đối_, khoảng cách của phần tử từ vị trí bình thường dựa trên thuộc tính {{Cssxref("top")}}; hoặc nếu `top` cũng là `auto`, phần tử không bị di chuyển theo chiều dọc.

## Mô tả

Hiệu ứng của `bottom` phụ thuộc vào cách phần tử được định vị (tức là giá trị của thuộc tính {{cssxref("position")}}):

- Khi `position` được đặt thành `absolute` hoặc `fixed`, thuộc tính `bottom` chỉ định khoảng cách giữa cạnh ngoài của [margin dưới](/en-US/docs/Web/CSS/Guides/Box_model/Introduction) của phần tử và cạnh ngoài của padding dưới của khối chứa, hoặc trong trường hợp [phần tử được định vị neo](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using) khi hàm {{cssxref("anchor()")}} được sử dụng trong giá trị, tương đối so với vị trí của cạnh [`<anchor-side>`](/en-US/docs/Web/CSS/Reference/Values/anchor#anchor-side) được chỉ định. Thuộc tính `bottom` [tương thích](/en-US/docs/Web/CSS/Reference/Values/anchor#compatibility_of_inset_properties_and_anchor-side_values) với các giá trị `top`, `bottom`, `start`, `end`, `self-start`, `self-end`, `center` và `<percentage>`.
- Khi `position` được đặt thành `relative`, thuộc tính `bottom` chỉ định khoảng cách mà cạnh dưới của phần tử được di chuyển lên trên so với vị trí bình thường của nó.
- Khi `position` được đặt thành `sticky`, thuộc tính `bottom` được dùng để tính toán hình chữ nhật ràng buộc sticky.
- Khi `position` được đặt thành `static`, thuộc tính `bottom` _không có hiệu lực_.

Khi cả {{cssxref("top")}} và `bottom` đều được chỉ định, `position` được đặt thành `absolute` hoặc `fixed`, _và_ {{cssxref("height")}} không được chỉ định (là `auto` hoặc `100%`), thì cả hai khoảng cách `top` và `bottom` đều được tính đến. Trong tất cả các trường hợp khác, nếu {{cssxref("height")}} bị ràng buộc bằng bất kỳ cách nào hoặc `position` được đặt thành `relative`, thuộc tính `top` có độ ưu tiên cao hơn và thuộc tính `bottom` bị bỏ qua.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Định vị tuyệt đối và cố định

Ví dụ này minh họa sự khác biệt trong hành vi của thuộc tính `bottom` khi {{cssxref("position")}} là `absolute` so với `fixed`.

#### HTML

```html
<p>
  This<br />is<br />some<br />tall,<br />tall,<br />tall,<br />tall,<br />tall<br />content.
</p>
<div class="fixed"><p>Fixed</p></div>
<div class="absolute"><p>Absolute</p></div>
```

#### CSS

```css
p {
  font-size: 30px;
  line-height: 2em;
}

div {
  width: 48%;
  text-align: center;
  background: rgb(55 55 55 / 20%);
  border: 1px solid blue;
}

.absolute {
  position: absolute;
  bottom: 0;
  left: 0;
}

.fixed {
  position: fixed;
  bottom: 0;
  right: 0;
}
```

#### Kết quả

{{EmbedLiveSample('Absolute_and_fixed_positioning','500','250')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("top")}}, {{cssxref("left")}}, và {{cssxref("right")}}
- Viết tắt {{cssxref("inset")}}
- {{cssxref("inset-block-start")}}, {{cssxref("inset-block-end")}}, {{cssxref("inset-inline-start")}}, và {{cssxref("inset-inline-end")}}
- Các viết tắt {{cssxref("inset-block")}} và {{cssxref("inset-inline")}}
- {{cssxref("position")}}
- Module [CSS positioned layout](/en-US/docs/Web/CSS/Guides/Positioned_layout)
