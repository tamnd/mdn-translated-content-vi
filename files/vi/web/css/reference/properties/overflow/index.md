---
title: overflow
slug: Web/CSS/Reference/Properties/overflow
page-type: css-shorthand-property
browser-compat: css.properties.overflow
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) [viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) **`overflow`** đặt hành vi mong muốn khi nội dung không vừa trong hộp đệm (padding box) của phần tử (tràn ra ngoài) theo chiều ngang và/hoặc chiều dọc.

{{InteractiveExample("CSS Demo: overflow")}}

```css interactive-example-choice
overflow: visible;
```

```css interactive-example-choice
overflow: hidden;
```

```css interactive-example-choice
overflow: clip;
```

```css interactive-example-choice
overflow: scroll;
```

```css interactive-example-choice
overflow: auto;
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

## Thuộc tính thành phần

Thuộc tính này là viết tắt cho các thuộc tính CSS sau:

- {{cssxref("overflow-x")}}
- {{cssxref("overflow-y")}}

## Cú pháp

```css
/* Giá trị từ khóa */
overflow: visible;
overflow: hidden;
overflow: clip;
overflow: scroll;
overflow: auto;
overflow: hidden visible;

/* Giá trị toàn cục */
overflow: inherit;
overflow: initial;
overflow: revert;
overflow: revert-layer;
overflow: unset;
```

Thuộc tính `overflow` được chỉ định bằng một hoặc hai giá trị từ khóa {{CSSXref("overflow_value", "&lt;overflow&gt;")}}. Nếu chỉ có một từ khóa được chỉ định, cả `overflow-x` và `overflow-y` đều được đặt cùng giá trị. Nếu hai từ khóa được chỉ định, giá trị đầu tiên áp dụng cho `overflow-x` theo chiều ngang và giá trị thứ hai áp dụng cho `overflow-y` theo chiều dọc.

### Giá trị

- `visible`
  - : Nội dung tràn không bị cắt và có thể hiển thị ngoài hộp đệm của phần tử. Hộp phần tử không phải là {{glossary("scroll container")}}. Đây là giá trị mặc định của thuộc tính `overflow`.
- `hidden`
  - : Nội dung tràn bị cắt tại hộp đệm của phần tử. Không có thanh cuộn, và nội dung bị cắt không hiển thị (tức là, nội dung bị cắt bị ẩn), nhưng nội dung vẫn tồn tại. Trình duyệt không thêm thanh cuộn và cũng không cho phép người dùng xem nội dung ngoài vùng bị cắt bằng các hành động như kéo trên màn hình cảm ứng hoặc dùng con lăn chuột. Tuy nhiên, nội dung _có thể_ được cuộn theo lập trình (ví dụ: bằng cách liên kết đến văn bản neo, bằng cách tab đến phần tử ẩn nhưng có thể focus, hoặc bằng cách đặt giá trị của thuộc tính {{domxref("Element.scrollLeft", "scrollLeft")}} hoặc phương thức {{domxref("Element.scrollTo", "scrollTo()")}}), trong trường hợp đó hộp phần tử là một scroll container.
- `clip`
  - : Nội dung tràn bị cắt tại _cạnh clip tràn_ của phần tử được định nghĩa bằng thuộc tính {{cssxref("overflow-clip-margin")}}. Do đó, nội dung tràn ra ngoài hộp đệm của phần tử bởi giá trị {{cssxref("&lt;length&gt;")}} của `overflow-clip-margin` hoặc bởi `0px` nếu không được đặt. Nội dung tràn ngoài vùng bị cắt không hiển thị, trình duyệt không thêm thanh cuộn, và cuộn theo lập trình cũng không được hỗ trợ. Không có [bối cảnh định dạng](/en-US/docs/Web/CSS/Guides/Display/Block_formatting_context) mới được tạo. Để thiết lập bối cảnh định dạng, sử dụng `overflow: clip` cùng với {{cssxref("display", "display: flow-root", "#flow-root")}}. Hộp phần tử không phải là scroll container.
- `scroll`
  - : Nội dung tràn bị cắt tại hộp đệm của phần tử, và nội dung tràn có thể được cuộn vào tầm nhìn bằng thanh cuộn. Trình duyệt hiển thị thanh cuộn dù có hay không có nội dung tràn, vì vậy theo cả chiều ngang và chiều dọc nếu giá trị áp dụng cho cả hai chiều. Việc sử dụng từ khóa này do đó có thể ngăn thanh cuộn xuất hiện và biến mất khi nội dung thay đổi. Máy in vẫn có thể in nội dung tràn. Hộp phần tử là một scroll container.
- `auto`
  - : Nội dung tràn bị cắt tại hộp đệm của phần tử, và nội dung tràn có thể được cuộn vào tầm nhìn bằng thanh cuộn. Khác với `scroll`, trình duyệt chỉ hiển thị thanh cuộn _khi_ nội dung tràn. Nếu nội dung vừa trong hộp đệm của phần tử, nó trông giống như với `visible` nhưng vẫn thiết lập bối cảnh định dạng mới. Hộp phần tử là một scroll container.

> [!NOTE]
> Giá trị từ khóa `overlay` là bí danh giá trị kế thừa cho `auto`. Với `overlay`, các thanh cuộn được vẽ trên nội dung thay vì chiếm không gian.

## Mô tả

Các tùy chọn tràn bao gồm: ẩn nội dung tràn, kích hoạt thanh cuộn để xem nội dung tràn hoặc hiển thị nội dung chảy ra ngoài hộp phần tử vào khu vực xung quanh, và các kết hợp của những tùy chọn đó.

Cần lưu ý các điểm sau khi sử dụng các từ khóa khác nhau cho `overflow`:

- Chỉ định một giá trị khác với `visible` (mặc định) hoặc `clip` cho `overflow` sẽ tạo ra một [bối cảnh định dạng khối](/en-US/docs/Web/CSS/Guides/Display/Block_formatting_context) mới. Điều này cần thiết vì lý do kỹ thuật; nếu một float giao cắt với phần tử cuộn, nó sẽ buộc bố cục lại nội dung sau mỗi bước cuộn, dẫn đến trải nghiệm cuộn chậm.
- Để cài đặt `overflow` tạo ra hiệu ứng mong muốn, phần tử cấp khối phải có chiều cao đặt sẵn ({{cssxref("height")}} hoặc {{cssxref("max-height")}}) nếu tràn theo chiều dọc, chiều rộng đặt sẵn ({{cssxref("width")}} hoặc {{cssxref("max-width")}}) nếu tràn theo chiều ngang, kích thước khối đặt sẵn ({{cssxref("block-size")}} hoặc {{cssxref("max-block-size")}}) nếu tràn theo chiều khối, hoặc kích thước nội tuyến đặt sẵn ({{cssxref("inline-size")}} hoặc {{cssxref("max-inline-size")}}) hoặc {{cssxref("white-space")}} được đặt thành `nowrap` nếu tràn theo chiều nội tuyến.
- Đặt overflow thành `visible` theo một chiều (tức là `overflow-x` hoặc `overflow-y`) khi nó không được đặt thành `visible` hoặc `clip` theo chiều kia sẽ khiến giá trị `visible` hoạt động như `auto`.
- Đặt overflow thành `clip` theo một chiều khi nó không được đặt thành `visible` hoặc `clip` theo chiều kia sẽ khiến giá trị `clip` hoạt động như `hidden`.
- Thuộc tính JavaScript {{domxref("Element.scrollTop")}} có thể được dùng để cuộn qua nội dung trong scroll container, ngoại trừ khi `overflow` được đặt thành `clip`.
- Đặt `overflow` trên ảnh và các {{glossary("replaced elements")}} khác hoạt động như mong đợi trong các trình duyệt hỗ trợ CSS Overflow Module Level 4; trong các phiên bản trước của đặc tả, các phần tử thay thế luôn bị cắt theo hộp chứa. Xem [Tương thích trình duyệt](#browser_compatibility) để biết các trình duyệt hỗ trợ.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Khả năng tiếp cận

Vùng nội dung có thể cuộn không thể focus bằng bàn phím, vì vậy nó không thể được cuộn bởi người dùng chỉ dùng bàn phím. Firefox và Chrome 132 trở lên là ngoại lệ; chúng làm cho các scroll container có thể focus theo mặc định.

Đối với các trình duyệt khác, để cho phép người dùng chỉ dùng bàn phím cuộn vùng chứa, bạn cần gán [`tabindex`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex) cho vùng chứa bằng `tabindex="0"`. Thật không may, khi trình đọc màn hình gặp điểm dừng tab này, nó có thể không có ngữ cảnh về vùng chứa và có thể sẽ thông báo toàn bộ nội dung của vùng chứa. Để giảm thiểu điều này, hãy cung cấp cho vùng chứa một [vai trò WAI-ARIA](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles) phù hợp (ví dụ `role="region"`) và tên có thể truy cập (qua [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) hoặc [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby)).

## Ví dụ

### Minh họa kết quả của các từ khóa overflow khác nhau

#### HTML

```html
<div>
  <code>visible</code>
  <p class="visible">
    Maya Angelou: "I've learned that people will forget what you said, people
    will forget what you did, but people will never forget how you made them
    feel."
  </p>
</div>

<div>
  <code>hidden</code>
  <p class="hidden">
    Maya Angelou: "I've learned that people will forget what you said, people
    will forget what you did, but people will never forget how you made them
    feel."
  </p>
</div>

<div>
  <code>clip</code>
  <p class="clip">
    Maya Angelou: "I've learned that people will forget what you said, people
    will forget what you did, but people will never forget how you made them
    feel."
  </p>
</div>

<div>
  <code>scroll</code>
  <p class="scroll">
    Maya Angelou: "I've learned that people will forget what you said, people
    will forget what you did, but people will never forget how you made them
    feel."
  </p>
</div>

<div>
  <code>auto</code>
  <p class="auto">
    Maya Angelou: "I've learned that people will forget what you said, people
    will forget what you did, but people will never forget how you made them
    feel."
  </p>
</div>

<div>
  <code>overlay</code>
  <p class="overlay">
    Maya Angelou: "I've learned that people will forget what you said, people
    will forget what you did, but people will never forget how you made them
    feel."
  </p>
</div>
```

#### CSS

```css hidden
body {
  display: flex;
  flex-wrap: wrap;
  justify-content: start;
}

div {
  margin: 2em;
  font-size: 1.2em;
}

p {
  width: 5em;
  height: 5em;
  border: dotted;
  margin-top: 0.5em;
}

div:nth-of-type(5),
div:nth-of-type(6) {
  margin-top: 200px;
}
```

```css
p.visible {
  overflow: visible;
}

p.hidden {
  overflow: hidden;
}

p.clip {
  overflow: clip;
  overflow-clip-margin: 1em;
}

p.scroll {
  overflow: scroll;
}

p.auto {
  overflow: auto;
}

p.overlay {
  overflow: overlay;
}
```

#### Kết quả

{{EmbedLiveSample("Demonstrating results of various overflow keywords", "500", "620")}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{Cssxref("overflow-x")}}, {{Cssxref("overflow-y")}}
- {{Cssxref("overflow-block")}}, {{Cssxref("overflow-clip-margin")}}, {{Cssxref("overflow-inline")}}
- {{Cssxref("clip")}}, {{Cssxref("display")}}, {{cssxref("text-overflow")}}, {{cssxref("white-space")}}
- SVG {{SVGAttr("overflow")}} attribute
- [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow) module
- [Keyboard-only scrolling areas](https://adrianroselli.com/2022/06/keyboard-only-scrolling-areas.html) on adrianroselli.com (2022)
