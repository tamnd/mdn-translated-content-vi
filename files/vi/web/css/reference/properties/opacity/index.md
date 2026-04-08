---
title: opacity
slug: Web/CSS/Reference/Properties/opacity
page-type: css-property
browser-compat: css.properties.opacity
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`opacity`** đặt độ mờ đục của một phần tử. Độ mờ đục là mức độ mà nội dung phía sau phần tử bị ẩn đi, và là nghịch đảo của độ trong suốt.

{{InteractiveExample("CSS Demo: opacity")}}

```css interactive-example-choice
opacity: 0;
```

```css interactive-example-choice
opacity: 0.33;
```

```css interactive-example-choice
opacity: 1;
```

```html interactive-example
<section class="default-example" id="default-example">
  <p id="example-element">
    London. Michaelmas term lately over, and the Lord Chancellor sitting in
    Lincoln's Inn Hall. Implacable November weather. As much mud in the streets
    as if the waters had but newly retired from the face of the earth, and it
    would not be wonderful to meet a Megalosaurus, forty feet long or so,
    waddling like an elephantine lizard up Holborn Hill.
  </p>
</section>
```

```css interactive-example
#example-element {
  background-color: #963770;
  color: white;
  padding: 1em;
}
```

## Cú pháp

```css
opacity: 0.9;
opacity: 90%;

/* Giá trị toàn cục */
opacity: inherit;
opacity: initial;
opacity: revert;
opacity: revert-layer;
opacity: unset;
```

### Giá trị

- `<alpha-value>`
  - : Một {{cssxref("number")}} trong khoảng từ `0.0` đến `1.0` (bao gồm hai đầu), hoặc một {{cssxref("percentage")}} trong khoảng từ `0%` đến `100%` (bao gồm hai đầu), biểu thị độ mờ đục của kênh (tức là giá trị của kênh alpha). Bất kỳ giá trị nào nằm ngoài khoảng này, dù hợp lệ, đều được kẹp về giới hạn gần nhất trong khoảng.

    | Giá trị                                                         | Ý nghĩa                                                                |
    | --------------------------------------------------------------- | ---------------------------------------------------------------------- |
    | `0`                                                             | Phần tử hoàn toàn trong suốt (tức là vô hình).                         |
    | Bất kỳ {{cssxref("number")}} nào giữa `0` và `1` (không kể đầu) | Phần tử bán trong suốt (tức là có thể thấy nội dung phía sau phần tử). |
    | `1` (giá trị mặc định)                                          | Phần tử hoàn toàn mờ đục (trực quan đặc).                              |

## Mô tả

`opacity` áp dụng cho toàn bộ phần tử, bao gồm cả nội dung của nó, mặc dù giá trị không được kế thừa bởi các phần tử con. Do đó, phần tử và các phần tử con của nó đều có cùng độ mờ đục so với nền của phần tử, ngay cả khi chúng có độ mờ đục khác nhau so với nhau.

Để chỉ thay đổi độ mờ đục của nền, hãy sử dụng thuộc tính {{cssxref("background")}} với một [giá trị màu](/en-US/docs/Web/CSS/Reference/Values/color_value) có kênh alpha. Ví dụ:

```css
background: rgb(0 0 0 / 40%);
```

Khi giá trị `opacity` được đặt là `0`, phần tử và tất cả các phần tử con của nó đều vô hình, nhưng chúng vẫn là một phần của DOM. Điều đó có nghĩa là chúng vẫn nhận [sự kiện con trỏ](/en-US/docs/Web/API/Pointer_events) và, nếu các phần tử nằm trong thứ tự tab, chúng vẫn nhận được tiêu điểm. Để đảm bảo khả năng sử dụng tốt, hãy đảm bảo làm cho các phần tử đó hiển thị khi nhận tương tác từ người dùng hoặc sử dụng thuộc tính CSS {{cssxref("pointer-events")}} để vô hiệu hóa sự kiện con trỏ và loại phần tử khỏi thứ tự tab bằng cách vô hiệu hóa với thuộc tính `disabled` hoặc đặt [`tab-index="-1"`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex) cho các phần tử tương tác không liên quan đến biểu mẫu.

Việc sử dụng `opacity` với giá trị khác `1` sẽ đặt phần tử vào một [ngữ cảnh xếp chồng](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context) mới.

Không nên chỉ dùng độ mờ đục để cung cấp thông tin cho trình đọc màn hình. Hãy sử dụng thuộc tính HTML [`hidden`](/en-US/docs/Web/HTML/Reference/Global_attributes/hidden), CSS {{cssxref("visibility")}}, hoặc thuộc tính kiểu CSS {{cssxref("display")}}. Tốt nhất nên tránh dùng thuộc tính [`aria-hidden`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-hidden), nhưng nếu phần tử bị ẩn bằng opacity, thì cũng nên ẩn nó khỏi trình đọc màn hình.

### Chuyển tiếp opacity

Khi [chuyển tiếp](/en-US/docs/Web/CSS/Guides/Transitions) độ mờ đục của các phần tử khi thêm chúng vào trang trong khi nội dung trước đó bị ẩn bằng [`visibility: hidden`](/en-US/docs/Web/CSS/Reference/Properties/visibility#hidden), [`display: none`](/en-US/docs/Web/CSS/Reference/Properties/display#none), hoặc [`content-visibility: hidden`](/en-US/docs/Web/CSS/Reference/Properties/content-visibility#hidden), bạn cần bao gồm cả {{cssxref("@starting-style")}} và [`transition-behavior: allow-discrete`](/en-US/docs/Web/CSS/Reference/Properties/transition-behavior#allow-discrete):

```css
.card {
  transition:
    opacity 5s,
    display 5s;
  background-color: orange;

  transition-behavior: allow-discrete;
  @starting-style {
    opacity: 0;
  }
}

.card.hidden {
  display: none;
  opacity: 0;
}
```

Để bật chuyển tiếp kiểu ban đầu, cần có các quy tắc `@starting-style`. Trong đoạn code trên, việc đặt `opacity: 0` trong `@starting-style` cung cấp điểm bắt đầu cho chuyển tiếp khi phần tử nhận bản cập nhật kiểu ban đầu. Để biết thêm chi tiết, xem {{cssxref("@starting-style")}}.

Cần đặt `transition-behavior: allow-discrete` để chuyển tiếp sang `display: none`. Xem thuộc tính {{cssxref("transition-behavior")}} để biết thêm chi tiết.

## Khả năng tiếp cận

Nếu độ mờ đục của văn bản được điều chỉnh, điều quan trọng là phải đảm bảo tỷ lệ tương phản giữa màu văn bản và nền đủ cao để những người có thị lực kém vẫn có thể đọc được nội dung trang.

Tỷ lệ tương phản màu sắc được xác định bằng cách so sánh độ sáng của các giá trị màu văn bản và nền đã điều chỉnh độ mờ. Để đáp ứng [Hướng dẫn Tiếp cận Nội dung Web (WCAG)](https://www.w3.org/WAI/standards-guidelines/wcag/) hiện tại, cần tỷ lệ 4,5:1 cho nội dung văn bản và 3:1 cho văn bản lớn hơn như tiêu đề. Văn bản lớn được định nghĩa là 18,66px và [đậm](/en-US/docs/Web/CSS/Reference/Properties/font-weight) trở lên, hoặc 24px trở lên.

- [WebAIM: Color Contrast Checker](https://webaim.org/resources/contrastchecker/)
- [MDN Understanding WCAG, Guideline 1.4 explanations](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background)
- [Understanding Success Criterion 1.4.3 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html)

Nhiều hệ điều hành cung cấp tùy chọn giảm độ trong suốt. Để đặt `opacity` dựa trên tùy chọn trong suốt của hệ điều hành người dùng, hãy sử dụng media query [`prefers-reduced-transparency`](/en-US/docs/Web/CSS/Reference/At-rules/@media/prefers-reduced-transparency).

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Thiết lập opacity

Ví dụ sau minh họa cách thuộc tính `opacity` thay đổi độ mờ đục của toàn bộ phần tử và nội dung, khiến văn bản rất khó đọc.

#### HTML

```html
<div class="light">Bạn hầu như không thể thấy điều này.</div>
<div class="medium">Điều này dễ thấy hơn.</div>
<div class="heavy">Điều này rất dễ thấy.</div>
```

#### CSS

```css
div {
  background-color: yellow;
  font-weight: bold;
  font-size: 130%;
}
.light {
  opacity: 0.2; /* Barely see the text over the background */
}
.medium {
  opacity: 0.5; /* See the text more clearly over the background */
}
.heavy {
  opacity: 0.9; /* See the text very clearly over the background */
}
```

#### Kết quả

{{EmbedLiveSample('Setting_opacity', '640', '105')}}

### Thiết lập opacity khi hover

Trong ví dụ sau, opacity được thay đổi khi hover, nhờ đó hình nền có sọc trên phần tử cha hiển thị xuyên qua ảnh.

#### HTML

```html
<div class="wrapper">
  <img
    src="/shared-assets/images/examples/dino.svg"
    alt="MDN Dino"
    width="128"
    height="146"
    class="opacity" />
</div>
```

#### CSS

```css
img.opacity {
  opacity: 1;
}

img.opacity:hover {
  opacity: 0.5;
}

.wrapper {
  width: 200px;
  height: 160px;
  background-color: #f03cc3;
  background-image: linear-gradient(
    90deg,
    transparent 50%,
    rgb(255 255 255 / 50%) 50%
  );
  background-size: 20px 20px;
}
```

#### Kết quả

{{EmbedLiveSample('Setting_opacity_on_hover', '150', '200')}}

### Tạo kiểu dựa trên tùy chọn người dùng

Để tạo kiểu phần tử dựa trên tùy chọn trong suốt của hệ điều hành người dùng, hãy sử dụng media query [`prefers-reduced-transparency`](/en-US/docs/Web/CSS/Reference/At-rules/@media/prefers-reduced-transparency). Ví dụ sau minh họa cách sử dụng media query `prefers-color-scheme` để chỉ định `opacity` mong muốn dựa trên tùy chọn của người dùng.

```css
.element {
  opacity: 0.5;
}

@media (prefers-reduced-transparency) {
  .element {
    opacity: 1;
  }
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Media query [`prefers-reduced-transparency`](/en-US/docs/Web/CSS/Reference/At-rules/@media/prefers-reduced-transparency)
- Module [CSS color](/en-US/docs/Web/CSS/Guides/Colors)
- Thuộc tính SVG {{SVGAttr("opacity")}}
