---
title: height
slug: Web/CSS/Reference/Properties/height
page-type: css-property
browser-compat: css.properties.height
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`height`** chỉ định chiều cao của một phần tử. Mặc định, thuộc tính xác định chiều cao của [vùng nội dung](/en-US/docs/Web/CSS/Guides/Box_model/Introduction#content_area). Tuy nhiên, nếu {{cssxref("box-sizing")}} được đặt thành `border-box`, nó sẽ xác định chiều cao của [vùng viền](/en-US/docs/Web/CSS/Guides/Box_model/Introduction#border_area).

{{InteractiveExample("CSS Demo: height")}}

```css interactive-example-choice
height: 150px;
```

```css interactive-example-choice
height: 6em;
```

```css interactive-example-choice
height: 75%;
```

```css interactive-example-choice
height: auto;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    This is a box where you can change the height.
  </div>
</section>
```

```css interactive-example
#example-element {
  display: flex;
  flex-direction: column;
  background-color: #5b6dcd;
  justify-content: center;
  color: white;
}
```

Các thuộc tính {{cssxref("min-height")}} và {{cssxref("max-height")}} ghi đè `height`.

> [!NOTE]
> Là thuộc tính hình học, `height` cũng áp dụng cho các phần tử SVG {{SVGElement("svg")}}, {{SVGElement("rect")}}, {{SVGElement("image")}}, và {{SVGElement("foreignObject")}}, với `auto` được giải quyết thành `0` và giá trị phần trăm tương đối so với chiều cao viewport SVG đối với `<rect>`. Giá trị thuộc tính CSS `height` ghi đè bất kỳ giá trị thuộc tính SVG {{SVGAttr("height")}} nào được đặt trên phần tử SVG.

## Cú pháp

```css
/* Giá trị <length> */
height: 120px;
height: 10em;
height: 100vh;
height: anchor-size(height);
height: anchor-size(--my-anchor self-block, 250px);
height: clamp(200px, anchor-size(width));

/* Giá trị <percentage> */
height: 75%;

/* Giá trị từ khóa */
height: max-content;
height: min-content;
height: fit-content;
height: fit-content(20em);
height: auto;
height: stretch;

/* Giá trị toàn cục */
height: inherit;
height: initial;
height: revert;
height: revert-layer;
height: unset;
```

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Xác định chiều cao dưới dạng giá trị khoảng cách.
- {{cssxref("&lt;percentage&gt;")}}
  - : Xác định chiều cao dưới dạng phần trăm chiều cao của [khối chứa](/en-US/docs/Web/CSS/Guides/Display/Containing_block).
- `auto`
  - : Trình duyệt sẽ tính toán và chọn chiều cao cho phần tử được chỉ định.
- {{cssxref("max-content")}}
  - : Chiều cao ưu tiên nội tại.
- {{cssxref("min-content")}}
  - : Chiều cao tối thiểu nội tại.
- {{cssxref("fit-content")}}
  - : Sử dụng không gian có sẵn, nhưng không vượt quá [max-content](/en-US/docs/Web/CSS/Reference/Values/max-content), tức là `min(max-content, max(min-content, stretch))`.
- [`fit-content(<length-percentage>)`](/en-US/docs/Web/CSS/Reference/Values/fit-content_function)
  - : Sử dụng công thức fit-content với không gian có sẵn được thay thế bằng đối số được chỉ định, tức là `min(max-content, max(min-content, <length-percentage>))`.
- `stretch`
  - : Đặt chiều cao của [hộp lề](/en-US/docs/Learn_web_development/Core/Styling_basics/Box_model#parts_of_a_box) của phần tử bằng chiều cao của [khối chứa](/en-US/docs/Web/CSS/Guides/Display/Containing_block#identifying_the_containing_block). Nó cố gắng làm cho hộp lề lấp đầy không gian có sẵn trong khối chứa, vì vậy theo một cách nào đó hoạt động tương tự như `100%` nhưng áp dụng kích thước kết quả cho hộp lề thay vì hộp được xác định bởi [box-sizing](/en-US/docs/Web/CSS/Reference/Properties/box-sizing).

## Khả năng truy cập

Đảm bảo rằng các phần tử được đặt `height` không bị cắt bớt và/hoặc không che khuất nội dung khác khi trang được phóng to để tăng kích thước văn bản.

- [MDN Understanding WCAG, Guideline 1.4 explanations](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background)
- [Understanding Success Criterion 1.4.4 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-scale.html)

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt chiều cao bằng pixel và phần trăm

#### HTML

```html
<div id="taller">I'm 50 pixels tall.</div>
<div id="shorter">I'm 25 pixels tall.</div>
<div id="parent">
  <div id="child">I'm half the height of my parent.</div>
</div>
```

#### CSS

```css
div {
  width: 250px;
  margin-bottom: 5px;
  border: 2px solid blue;
}

#taller {
  height: 50px;
}

#shorter {
  height: 25px;
}

#parent {
  height: 100px;
}

#child {
  height: 50%;
  width: 75%;
}
```

#### Kết quả

{{EmbedLiveSample('Setting_height_using_pixels_and_percentages', 'auto', 240)}}

### Kéo dãn chiều cao để lấp đầy khối chứa

#### HTML

```html
<div class="parent">
  <div class="child">text</div>
</div>

<div class="parent">
  <div class="child stretch">stretch</div>
</div>
```

#### CSS

```css hidden
@supports not (height: stretch) {
  .parent {
    display: none !important;
  }

  body::after {
    content: "Your browser doesn't support the `stretch` value yet.";
  }
}
```

```css
.parent {
  height: 150px;
  margin: 1rem;
  border: solid;
}

.child {
  margin: 1rem;
  background: #00999999;
}

.stretch {
  height: stretch;
}
```

#### Kết quả

{{EmbedLiveSample('Stretch height to fill the containing block', 'auto', 380)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("width")}}
- {{cssxref("box-sizing")}}
- {{cssxref("min-height")}}, {{cssxref("max-height")}}
- {{cssxref("block-size")}}, {{cssxref("inline-size")}}
- {{cssxref("anchor-size()")}}
- {{cssxref("clamp()")}}
- {{cssxref("minmax()")}}
- Thuộc tính SVG {{SVGAttr("height")}}
- [Giới thiệu về mô hình hộp CSS](/en-US/docs/Web/CSS/Guides/Box_model/Introduction)
- [Mô-đun mô hình hộp CSS](/en-US/docs/Web/CSS/Guides/Box_model)
