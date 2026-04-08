---
title: CSS borders and box decorations
short-title: Borders and box decorations
slug: Web/CSS/Guides/Borders_and_box_decorations
page-type: css-module
spec-urls: https://drafts.csswg.org/css-borders-4/
sidebar: cssref
---

Module **CSS borders and box decorations** cung cấp các thuộc tính để thêm border, góc bo tròn và box shadow cho các phần tử. Module này mở rộng border và box decoration được giới thiệu trong module [CSS backgrounds and borders](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders), bổ sung các thuộc tính {{cssxref("corner-shape")}} và `border-shape`, các thuộc tính {{cssxref("border-radius")}} theo hướng logic, các thuộc tính longhand cho thuộc tính {{cssxref("box-shadow")}}, và các thuộc tính để tạo border một phần.

## Borders và box decorations thực tế

Chọn giá trị `superellipse()` từ menu thả xuống để thay đổi hình dạng border. Dùng thanh trượt để thay đổi kích thước border radius. Bật/tắt hộp kiểm để ẩn và hiện box shadow.

```html hidden
<p>
  <label for="corner-shape-choice"
    >Choose a <code>superellipse()</code> value:</label
  >
  <select id="corner-shape-choice">
    <option>superellipse(infinity)</option>
    <option>superellipse(5)</option>
    <option>superellipse(3)</option>
    <option>superellipse(2)</option>
    <option>superellipse(1.5)</option>
    <option>superellipse(1)</option>
    <option>superellipse(0.5)</option>
    <option>superellipse(0)</option>
    <option>superellipse(-0.5)</option>
    <option selected>superellipse(-1)</option>
    <option>superellipse(-1.5)</option>
    <option>superellipse(-2)</option>
    <option>superellipse(-3)</option>
    <option>superellipse(-5)</option>
    <option>superellipse(-infinity)</option>
  </select>
</p>
<p>
  <label for="radius">Choose a <code>border-radius</code> value:</label>
  <input
    type="range"
    step="5"
    min="0"
    max="100"
    value="30"
    id="radius"
    list="tens" />
  <datalist id="tens">
    <option value="0" label="0"></option>
    <option value="20" label="20px"></option>
    <option value="40" label="40px"></option>
    <option value="60" label="60px"></option>
    <option value="80" label="80px"></option>
    <option value="100" label="100px"></option>
  </datalist>
</p>

<p>
  <input type="checkbox" id="check" />
  <label for="check">Toggle the box-shadow</label>
</p>
<div></div>
```

```css hidden
div {
  width: 100%;
  height: 200px;
  background-color: plum;
  background-image:
    repeating-linear-gradient(transparent 0 19px, #00000022 19px 20px),
    repeating-linear-gradient(to left, transparent 0 19px, #00000022 19px 20px);
}

div {
  box-shadow: 3px 3px 5px rgb(0 0 0 / 0.5);
  border-radius: 30px;
}
body:has(input:checked) div {
  box-shadow: none;
}

@layer page-setup {
  html {
    font-family: "Helvetica", "Arial", sans-serif;
  }
  body {
    max-width: 600px;
    min-width: fit-content;
    margin: 20px auto;
  }
  div {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 20px;
  }
  select {
    padding: 3px 5px;
  }
  code {
    font-weight: bolder;
  }
}
```

```js hidden
const rectangle = document.querySelector("div");
const select = document.querySelector("select");
const range = document.getElementById("radius");

function setCornerShape() {
  rectangle.style.cornerShape = select.value;
  rectangle.style.borderRadius = `${range.value}px`;
  rectangle.innerHTML = `<pre>div {
  corner-shape: ${select.value};
  border-radius: ${range.value}px;
}</pre>`;
}

select.addEventListener("change", setCornerShape);
range.addEventListener("input", setCornerShape);
setCornerShape();
```

{{EmbedLiveSample("backgrounds", "", "350px")}}

## Tham chiếu

### Thuộc tính

- {{cssxref("border-block")}}
- {{cssxref("border-block-color")}}
- {{cssxref("border-block-end")}}
- {{cssxref("border-block-end-color")}}
- {{cssxref("border-block-end-style")}}
- {{cssxref("border-block-end-width")}}
- {{cssxref("border-block-start")}}
- {{cssxref("border-block-start-color")}}
- {{cssxref("border-block-start-style")}}
- {{cssxref("border-block-start-width")}}
- {{cssxref("border-block-style")}}
- {{cssxref("border-block-width")}}
- {{cssxref("border-bottom")}}
- {{cssxref("border-bottom-color")}}
- {{cssxref("border-bottom-left-radius")}}
- {{cssxref("border-bottom-right-radius")}}
- {{cssxref("border-bottom-style")}}
- {{cssxref("border-bottom-width")}}
- {{cssxref("border-color")}}
- {{cssxref("border-end-end-radius")}}
- {{cssxref("border-end-start-radius")}}
- {{cssxref("border-inline")}}
- {{cssxref("border-inline-color")}}
- {{cssxref("border-inline-end")}}
- {{cssxref("border-inline-end-color")}}
- {{cssxref("border-inline-end-style")}}
- {{cssxref("border-inline-end-width")}}
- {{cssxref("border-inline-start")}}
- {{cssxref("border-inline-start-color")}}
- {{cssxref("border-inline-start-style")}}
- {{cssxref("border-inline-start-width")}}
- {{cssxref("border-inline-style")}}
- {{cssxref("border-inline-width")}}
- {{cssxref("border-left")}}
- {{cssxref("border-left-color")}}
- {{cssxref("border-left-style")}}
- {{cssxref("border-left-width")}}
- {{cssxref("border-radius")}}
- {{cssxref("border-right")}}
- {{cssxref("border-right-color")}}
- {{cssxref("border-right-style")}}
- {{cssxref("border-right-width")}}
- {{cssxref("border-start-end-radius")}}
- {{cssxref("border-start-start-radius")}}
- {{cssxref("border-top")}}
- {{cssxref("border-top-color")}}
- {{cssxref("border-top-left-radius")}}
- {{cssxref("border-top-right-radius")}}
- {{cssxref("border-top-style")}}
- {{cssxref("border-top-width")}}
- {{cssxref("box-shadow")}}
- {{cssxref("corner-block-end-shape")}}
- {{cssxref("corner-block-start-shape")}}
- {{cssxref("corner-bottom-left-shape")}}
- {{cssxref("corner-bottom-right-shape")}}
- {{cssxref("corner-bottom-shape")}}
- {{cssxref("corner-end-end-shape")}}
- {{cssxref("corner-end-start-shape")}}
- {{cssxref("corner-inline-end-shape")}}
- {{cssxref("corner-inline-start-shape")}}
- {{cssxref("corner-left-shape")}}
- {{cssxref("corner-right-shape")}}
- {{cssxref("corner-shape")}}
- {{cssxref("corner-start-end-shape")}}
- {{cssxref("corner-start-start-shape")}}
- {{cssxref("corner-top-left-shape")}}
- {{cssxref("corner-top-right-shape")}}
- {{cssxref("corner-top-shape")}}

Module CSS borders and box decorations cấp độ 4 cũng giới thiệu các thuộc tính `border-shape`, `border-limit` và `border-clip`, cùng với các thuộc tính longhand `border-clip-bottom`, `border-clip-left`, `border-clip-right`, `border-clip-top`. Hiện tại chưa có trình duyệt nào hỗ trợ các tính năng này. Module cũng giới thiệu các thuộc tính thành phần cho {{cssxref("border-radius")}} và {{cssxref("box-shadow")}} vốn đã được hỗ trợ rộng rãi, bao gồm `border-block-end-radius`, `border-block-start-radius`, `border-bottom-radius`, `border-inline-end-radius`, `border-inline-start-radius`, `border-right-radius`, `border-top-radius`, `box-shadow-blur`, `box-shadow-color`, `box-shadow-offset`, `box-shadow-position` và `box-shadow-spread`. Các thuộc tính thành phần này cũng chưa được hỗ trợ.

### Kiểu dữ liệu

- {{cssxref("corner-shape-value")}}

### Hàm

- {{cssxref("superellipse()")}}

## Hướng dẫn

- [Learn CSS: the box model](/en-US/docs/Learn_web_development/Core/Styling_basics/Box_model)
  - : Tìm hiểu cách border và các thuộc tính box model khác ảnh hưởng đến CSS box model.

## Khái niệm liên quan

- Thuộc tính {{cssxref("box-sizing")}}
- Thuộc tính {{cssxref("box-decoration-break")}}
- Thuộc tính {{cssxref("text-shadow")}}
- Kiểu dữ liệu {{cssxref("url_value", "&lt;url&gt;")}}
- Kiểu dữ liệu {{cssxref("&lt;color&gt;")}}
- Kiểu dữ liệu {{cssxref("image")}}
- Kiểu dữ liệu {{cssxref("&lt;position&gt;")}}
- Từ khóa [`currentColor`](/en-US/docs/Web/CSS/Reference/Values/color_value#currentcolor_keyword)

Module [CSS backgrounds and borders](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders)

- {{cssxref("background-attachment")}}
- {{cssxref("background-clip")}}
- {{cssxref("background-color")}}
- {{cssxref("background-image")}}
- {{cssxref("background-origin")}}
- {{cssxref("background-position")}}
- {{cssxref("background-repeat")}}
- {{cssxref("background-size")}}
- Shorthand {{cssxref("background")}}
- {{cssxref("background-position-x")}}
- {{cssxref("background-position-y")}}
- {{cssxref("border-image-outset")}}
- {{cssxref("border-image-repeat")}}
- {{cssxref("border-image-slice")}}
- {{cssxref("border-image-source")}}
- {{cssxref("border-image-width")}}
- Shorthand {{cssxref("border-image")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- {{cssxref("filter")}}
- {{cssxref("backdrop-filter")}}
- Hàm filter [`drop-shadow()`](/en-US/docs/Web/CSS/Reference/Values/filter-function/drop-shadow)
- [Applying color to HTML elements using CSS](/en-US/docs/Web/CSS/Guides/Colors/Applying_color)
- Công cụ:
  - [Border-image generator](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Border-image_generator)
  - [Border-radius generator](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Border-radius_generator)
