---
title: CSS custom highlight API
short-title: Custom highlight API
slug: Web/CSS/Guides/Custom_highlight_API
page-type: css-module
spec-urls: https://drafts.csswg.org/css-highlight-api-1/
sidebar: cssref
---

Module **CSS custom highlight API** cung cấp một cách lập trình để nhắm vào các phạm vi văn bản cụ thể được xác định bởi các đối tượng range, mà không ảnh hưởng đến cấu trúc DOM bên dưới. Các đối tượng range sau đó có thể được chọn thông qua pseudo-element `::highlight()`, và có thể thêm hoặc xóa các style highlight. Các tính năng của module này có thể tạo ra các hiệu ứng highlight tương tự như cách các trình soạn thảo văn bản highlight lỗi chính tả hoặc ngữ pháp, và các trình soạn thảo code highlight lỗi cú pháp.

CSS Custom Highlight API mở rộng khái niệm của các pseudo-element highlight khác như {{cssxref('::selection')}}, {{cssxref('::spelling-error')}}, {{cssxref('::grammar-error')}}, và {{cssxref('::target-text')}} bằng cách cung cấp một cách tạo ra các phạm vi văn bản tùy ý (được định nghĩa là các đối tượng {{domxref('Range')}} trong JavaScript) và tạo style cho chúng qua CSS, thay vì bị giới hạn ở các phạm vi do trình duyệt định nghĩa.

## CSS custom highlight API trong hoạt động

Để bật tạo style cho các phạm vi văn bản trên trang web bằng CSS Custom Highlight API, bạn tạo một đối tượng {{domxref("Range")}}, sau đó một đối tượng {{domxref("Highlight")}} cho phạm vi đó. Sau khi đăng ký highlight bằng phương thức {{domxref("HighlightRegistry.set()")}}, bạn có thể chọn phạm vi đó bằng pseudo-element {{cssxref("::highlight()")}}. Tên được định nghĩa trong phương thức `set()` được sử dụng làm tham số của bộ chọn pseudo-element `::highlight()` để chọn phạm vi đó. Phạm vi được chọn bởi pseudo-element `::highlight()` có thể được tạo style bằng [một số thuộc tính giới hạn](/en-US/docs/Web/CSS/Reference/Selectors/::highlight#allowable_properties).

```html-nolint hidden
<h1>Directions</h1>
<h2>Lincoln Memorial to Martin Luther King, Jr. Memorial</h2>
<ol><li>Head south on Lincoln Memorial Circle</li
  ><li>Turn right toward Independence Ave</li
  ><li>Turn left onto Independence Ave</li
  ><li>Turn right onto West Basin Dr</li
  ><li>Look up when you reach 64 Independence Ave!</li>
</ol>
<hr />
<label
  >Number of steps completed:
  <input type="number" min="0" max="5" value="0" id="currentStep" />
</label>
```

Ví dụ này sử dụng thuộc tính {{cssxref("text-decoration")}} để gạch ngang phạm vi highlight `steps` được định nghĩa bởi JavaScript của chúng ta:

```css
::highlight(steps) {
  text-decoration: line-through;
  color: blue;
}
```

Chúng ta tạo một `Range` với node bắt đầu và kết thúc (là cùng một node trong trường hợp này). Sau đó chúng ta đặt phạm vi này là `Highlight` bằng phương thức `set()` của interface CSS `HighlightRegistry`.

```js
const rangeToHighlight = new Range();
const list = document.querySelector("ol");
rangeToHighlight.setStart(list, 0);
rangeToHighlight.setEnd(list, 0);

CSS.highlights.set("steps", new Highlight(rangeToHighlight));
```

Một event listener cập nhật cuối của phạm vi được highlight khi số bước hoàn thành thay đổi:

```js
const currentPositionSlider = document.querySelector("input");
currentPositionSlider.addEventListener("change", (e) => {
  rangeToHighlight.setEnd(list, e.target.value);
});
```

{{ EmbedLiveSample('Custom highlight API in action', 700, 300) }}

## Tham chiếu

### Pseudo-elements

- {{CSSXref("::highlight()")}}

### Interfaces

- {{domxref("Highlight")}}
- {{domxref("HighlightRegistry")}}

### Mở rộng interface

Module này thêm các thuộc tính và phương thức vào các interface được định nghĩa trong các đặc tả khác.

- {{domxref("CSS")}}
  - {{domxref("CSS.highlights")}}

## Hướng dẫn

- [CSS custom highlight API](/en-US/docs/Web/API/CSS_Custom_Highlight_API#concepts_and_usage)
  - : Các khái niệm và cách sử dụng CSS custom highlight API, bao gồm tạo các đối tượng `Range` và `Highlight`, đăng ký highlight bằng `HighlightRegistry`, và tạo style cho highlight bằng pseudo-element `::highlight()`.

## Các khái niệm liên quan

- {{CSSXref("::grammar-error")}}
- {{CSSXref("::selection")}}
- {{CSSXref("::spelling-error")}}
- {{CSSXref("::target-text")}}
- Interface {{domxref("Range")}} và constructor {{domxref("Range.range", "Range()")}}
- [Text fragments](/en-US/docs/Web/URI/Reference/Fragment/Text_fragments)
- Interface {{domxref("FragmentDirective")}}

## Đặc tả

{{Specifications}}

## Xem thêm

- [CSS pseudo-element module](/en-US/docs/Web/CSS/Guides/Pseudo-elements)
- [CSS Object Model (CSSOM)](/en-US/docs/Web/API/CSS_Object_Model) APIs
