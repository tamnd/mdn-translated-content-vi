---
title: overflow-y
slug: Web/CSS/Reference/Properties/overflow-y
page-type: css-property
browser-compat: css.properties.overflow-y
sidebar: cssref
---

Thuộc tính [CSS](/vi/docs/Web/CSS) **`overflow-y`** xác định nội dung được hiển thị như thế nào khi tràn ra ngoài các cạnh trên và dưới của phần tử cấp khối. Có thể là không hiển thị gì, thanh cuộn, hoặc nội dung tràn ra ngoài. Thuộc tính này cũng có thể được đặt bằng thuộc tính viết tắt {{cssxref("overflow")}}.

{{InteractiveExample("CSS Demo: overflow-y")}}

```css interactive-example-choice
overflow-y: visible;
```

```css interactive-example-choice
overflow-y: hidden;
```

```css interactive-example-choice
overflow-y: clip;
```

```css interactive-example-choice
overflow-y: scroll;
```

```css interactive-example-choice
overflow-y: auto;
```

```html interactive-example
<section class="default-example" id="default-example">
  <p id="example-element">
    Michaelmas term lately over, and the Lord Chancellor sitting in Lincoln's
    Inn Hall. Implacable November weather. As much mud in the streets as if the
    waters had but newly retired from the face of the earth.
  </p>
</section>
```

```css interactive-example
#example-element {
  width: 15em;
  height: 9em;
  border: medium dotted;
  padding: 0.75em;
  text-align: left;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
overflow-y: visible;
overflow-y: hidden;
overflow-y: clip;
overflow-y: scroll;
overflow-y: auto;

/* Giá trị toàn cục */
overflow-y: inherit;
overflow-y: initial;
overflow-y: revert;
overflow-y: revert-layer;
overflow-y: unset;
```

Thuộc tính `overflow-y` được chỉ định là một giá trị từ khóa {{CSSXref("overflow_value", "&lt;overflow&gt;")}} duy nhất.

Nếu {{cssxref("overflow-x")}} là `hidden`, `scroll`, hoặc `auto` và thuộc tính `overflow-y` là `visible` (mặc định), giá trị sẽ được tính ngầm là `auto`.

### Giá trị

- `visible`
  - : Nội dung tràn ra ngoài không bị cắt và có thể hiển thị bên ngoài hộp đệm của phần tử ở cạnh trên và dưới. Hộp phần tử không phải là {{glossary("scroll container")}}.
- `hidden`
  - : Nội dung tràn ra ngoài được cắt nếu cần để vừa theo chiều dọc trong hộp đệm của phần tử. Không có thanh cuộn nào được cung cấp.
- `clip`
  - : Nội dung tràn ra ngoài bị cắt tại _cạnh clip tràn_ của phần tử được xác định bằng thuộc tính {{cssxref("overflow-clip-margin")}}. Kết quả là nội dung tràn ra ngoài hộp đệm của phần tử theo giá trị {{cssxref("&lt;length&gt;")}} của `overflow-clip-margin` hoặc `0px` nếu không được đặt. Sự khác biệt giữa `clip` và `hidden` là từ khóa `clip` cũng cấm tất cả các cuộn, kể cả cuộn theo chương trình. Không có ngữ cảnh định dạng mới nào được tạo ra. Để thiết lập ngữ cảnh định dạng, hãy sử dụng `overflow: clip` cùng với {{cssxref("display", "display: flow-root", "#flow-root")}}. Hộp phần tử không phải là scroll container.
- `scroll`
  - : Nội dung tràn ra ngoài được cắt nếu cần để vừa theo chiều dọc trong hộp đệm của phần tử. Trình duyệt hiển thị thanh cuộn theo chiều dọc dù nội dung có thực sự bị cắt hay không. (Điều này ngăn thanh cuộn xuất hiện hoặc biến mất khi nội dung thay đổi.) Máy in vẫn có thể in nội dung tràn ra ngoài.
- `auto`
  - : Nội dung tràn ra ngoài bị cắt tại hộp đệm của phần tử, và nội dung tràn có thể được cuộn vào tầm nhìn. Khác với `scroll`, tác nhân người dùng chỉ hiển thị thanh cuộn _khi_ nội dung tràn ra ngoài, ẩn thanh cuộn theo mặc định. Nếu nội dung vừa trong hộp đệm của phần tử, nó trông giống như `visible`, nhưng vẫn tạo ra ngữ cảnh định dạng khối mới.

> [!NOTE]
> Giá trị từ khóa `overlay` là giá trị bí danh kế thừa cho `auto`. Với `overlay`, các thanh cuộn được vẽ lên trên nội dung thay vì chiếm không gian.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Thiết lập hành vi overflow-y

#### HTML

```html
<ul>
  <li>
    <code>overflow-y:hidden</code> — hides the text outside the box
    <div id="div1">
      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
      veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
      commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
      velit esse cillum dolore eu fugiat nulla pariatur.
    </div>
  </li>

  <li>
    <code>overflow-y:scroll</code> — always adds a scrollbar
    <div id="div2">
      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
      veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
      commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
      velit esse cillum dolore eu fugiat nulla pariatur.
    </div>
  </li>

  <li>
    <code>overflow-y:visible</code> — displays the text outside the box if
    needed
    <div id="div3">
      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
      veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
      commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
      velit esse cillum dolore eu fugiat nulla pariatur.
    </div>
  </li>

  <li>
    <code>overflow-y:auto</code> — equivalent to <code>scroll</code>
    on most browsers
    <div id="div4">
      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
      veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
      commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
      velit esse cillum dolore eu fugiat nulla pariatur.
    </div>
  </li>
</ul>
```

#### CSS

```css
div {
  border: 1px solid black;
  width: 250px;
  height: 100px;
}

#div1 {
  overflow-y: hidden;
  margin-bottom: 12px;
}
#div2 {
  overflow-y: scroll;
  margin-bottom: 12px;
}
#div3 {
  overflow-y: visible;
  margin-bottom: 120px;
}
#div4 {
  overflow-y: auto;
  margin-bottom: 120px;
}
```

#### Kết quả

{{EmbedLiveSample("Setting_overflow-y_behavior", "100%", "780")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{Cssxref("clip")}}, {{Cssxref("display")}}, {{cssxref("text-overflow")}}, {{cssxref("white-space")}}
- Mô-đun [CSS overflow](/vi/docs/Web/CSS/Guides/Overflow)
- [Học: Nội dung tràn ra ngoài](/vi/docs/Learn_web_development/Core/Styling_basics/Overflow)
