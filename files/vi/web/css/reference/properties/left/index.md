---
title: left
slug: Web/CSS/Reference/Properties/left
page-type: css-property
browser-compat: css.properties.left
sidebar: cssref
---

Thuộc tính **`left`** trong [CSS](/vi/docs/Web/CSS) tham gia xác định vị trí ngang của một [phần tử được định vị](/vi/docs/Web/CSS/Reference/Properties/position). {{glossary("inset properties", "Thuộc tính inset")}} này không có hiệu lực đối với các phần tử không được định vị.

{{InteractiveExample("CSS Demo: left")}}

```css interactive-example-choice
left: 0;
```

```css interactive-example-choice
left: 4em;
```

```css interactive-example-choice
left: 10%;
```

```css interactive-example-choice
left: 20px;
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
left: 3px;
left: 2.4em;
left: anchor(--my-anchor 50%);
left: calc(anchor-size(--my-anchor inline, 100px) * 2);

/* <percentage> của chiều rộng khối chứa */
left: 10%;

/* Giá trị từ khóa */
left: auto;

/* Giá trị toàn cục */
left: inherit;
left: initial;
left: revert;
left: revert-layer;
left: unset;
```

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Một {{cssxref("&lt;length&gt;")}} âm, không hoặc dương:
    - Đối với _phần tử được định vị tuyệt đối_, nó biểu thị khoảng cách đến cạnh trái của khối chứa.
    - Đối với _phần tử được định vị theo neo_, hàm {{cssxref("anchor()")}} phân giải thành giá trị {{cssxref("&lt;length&gt;")}} tương đối so với vị trí của cạnh trái hoặc phải của _phần tử neo_ liên kết (xem [Sử dụng thuộc tính inset với giá trị hàm `anchor()`](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using#using_inset_properties_with_anchor_function_values)), và hàm {{cssxref("anchor-size()")}} phân giải thành giá trị {{cssxref("&lt;length&gt;")}} tương đối so với chiều rộng hoặc chiều cao của phần tử neo liên kết (xem [Đặt vị trí phần tử dựa trên kích thước neo](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using#setting_element_position_based_on_anchor_size)).
    - Đối với _phần tử được định vị tương đối_, nó biểu thị khoảng cách phần tử được dịch chuyển sang phải so với vị trí bình thường của nó.

- {{cssxref("&lt;percentage&gt;")}}
  - : Một {{cssxref("&lt;percentage&gt;")}} của chiều rộng khối chứa.
- `auto`
  - : Chỉ định rằng:
    - Đối với _phần tử được định vị tuyệt đối_, vị trí của phần tử dựa trên thuộc tính {{Cssxref("right")}}, trong khi `width: auto` được xử lý như chiều rộng dựa trên nội dung; hoặc nếu `right` cũng là `auto`, phần tử được đặt ở vị trí ngang mà nó sẽ ở nếu là phần tử tĩnh.
    - Đối với _phần tử được định vị tương đối_, khoảng cách của phần tử từ vị trí bình thường của nó dựa trên thuộc tính {{Cssxref("right")}}; hoặc nếu `right` cũng là `auto`, phần tử không bị dịch chuyển theo chiều ngang.

## Mô tả

Hiệu lực của `left` phụ thuộc vào cách phần tử được định vị (tức là giá trị của thuộc tính {{cssxref("position")}}):

- Khi `position` được đặt thành `absolute` hoặc `fixed`, thuộc tính `left` xác định khoảng cách giữa lề ngoài cạnh trái của phần tử và đường viền trong của cạnh trái khối chứa. (Khối chứa là tổ tiên mà phần tử được định vị tương đối.) Nếu phần tử được định vị có [_phần tử neo_](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using) liên kết, và giá trị thuộc tính bao gồm hàm {{cssxref("anchor()")}}, `left` định vị cạnh trái của phần tử được định vị tương đối so với vị trí của cạnh [`<anchor-side>`](/en-US/docs/Web/CSS/Reference/Values/anchor#anchor-side) được chỉ định. Thuộc tính `left` [tương thích](/en-US/docs/Web/CSS/Reference/Values/anchor#compatibility_of_inset_properties_and_anchor-side_values) với các giá trị `left`, `right`, `start`, `end`, `self-start`, `self-end`, `center`, và `<percentage>`.
- Khi `position` được đặt thành `relative`, thuộc tính `left` xác định khoảng cách cạnh trái của phần tử bị dịch chuyển sang phải từ vị trí bình thường của nó.
- Khi `position` được đặt thành `sticky`, thuộc tính `left` được dùng để tính toán hình chữ nhật ràng buộc sticky.
- Khi `position` được đặt thành `static`, thuộc tính `left` _không có hiệu lực_.

Khi cả `left` và {{cssxref("right")}} đều được xác định, và ràng buộc chiều rộng không ngăn cản, phần tử sẽ co giãn để thỏa mãn cả hai. Nếu phần tử không thể co giãn để thỏa mãn cả hai, vị trí của phần tử là _được chỉ định quá mức_. Trong trường hợp này, giá trị `left` được ưu tiên khi bộ chứa theo chiều trái sang phải; giá trị `right` được ưu tiên khi bộ chứa theo chiều phải sang trái.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Định vị các phần tử

#### HTML

```html
<div id="wrap">
  <div id="example_1">
    <pre>
      position: absolute;
      left: 20px;
      top: 20px;
    </pre>
    <p>
      The only containing element for this div is the main window, so it
      positions itself in relation to it.
    </p>
  </div>

  <div id="example_2">
    <pre>
      position: relative;
      top: 0;
      right: 0;
    </pre>
    <p>Relative position in relation to its siblings.</p>
  </div>

  <div id="example_3">
    <pre>
      float: right;
      position: relative;
      top: 20px;
      left: 20px;
    </pre>
    <p>Relative to its sibling div above, but removed from flow of content.</p>

    <div id="example_4">
      <pre>
        position: absolute;
        bottom: 10px;
        right: 20px;
      </pre>
      <p>Absolute position inside of a parent with relative position</p>
    </div>

    <div id="example_5">
      <pre>
        position: absolute;
        right: 0;
        left: 0;
        top: 200px;
      </pre>
      <p>Absolute position with both left and right declared</p>
    </div>
  </div>
</div>
```

#### CSS

```css
#wrap {
  width: 700px;
  margin: 0 auto;
  background: #5c5c5c;
}

pre {
  white-space: pre-line;
  word-wrap: break-word;
}

#example_1 {
  width: 200px;
  height: 200px;
  position: absolute;
  left: 20px;
  top: 20px;
  background-color: #d8f5ff;
}

#example_2 {
  width: 200px;
  height: 200px;
  position: relative;
  top: 0;
  right: 0;
  background-color: #c1ffdb;
}
#example_3 {
  width: 600px;
  height: 400px;
  position: relative;
  top: 20px;
  left: 20px;
  background-color: #ffd7c2;
}

#example_4 {
  width: 200px;
  height: 200px;
  position: absolute;
  bottom: 10px;
  right: 20px;
  background-color: #ffc7e4;
}
#example_5 {
  position: absolute;
  right: 0;
  left: 0;
  top: 100px;
  background-color: #d7ffc2;
}
```

#### Kết quả

{{EmbedLiveSample('Positioning_elements',1200,650)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("top")}}, {{cssxref("bottom")}}, và {{cssxref("right")}}
- Viết tắt {{cssxref("inset")}}
- {{cssxref("inset-block-start")}}, {{cssxref("inset-block-end")}}, {{cssxref("inset-inline-start")}}, và {{cssxref("inset-inline-end")}}
- Viết tắt {{cssxref("inset-block")}} và {{cssxref("inset-inline")}}
- {{cssxref("position")}}
- Mô-đun [CSS positioned layout](/en-US/docs/Web/CSS/Guides/Positioned_layout)
