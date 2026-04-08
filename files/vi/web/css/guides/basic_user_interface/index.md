---
title: CSS basic user interface
short-title: Basic user interface
slug: Web/CSS/Guides/Basic_user_interface
page-type: css-module
spec-urls:
  - https://drafts.csswg.org/css-ui-3/
  - https://drafts.csswg.org/css-ui/
sidebar: cssref
---

Module **CSS basic user interface** cho phép bạn xác định việc hiển thị và chức năng của các tính năng liên quan đến giao diện người dùng, bao gồm các thuộc tính outline, phản hồi trực quan cho thiết bị trỏ và bàn phím, và sửa đổi giao diện mặc định của các widget giao diện người dùng.

Các thuộc tính basic user interface có thể được sử dụng để cải thiện trải nghiệm người dùng và khả năng tiếp cận bằng cách cung cấp các gợi ý trực quan cho các phần tử đang được tương tác, bao gồm định kiểu con trỏ chuột và điều hướng focus theo hướng bàn phím, và định kiểu con trỏ caret khi một phần tử có thể chỉnh sửa được focus. Module này bao gồm các tính năng cung cấp outline cho các phần tử được focus (hoặc không được focus) mà không ảnh hưởng đến kích thước [box model](/en-US/docs/Learn_web_development/Core/Styling_basics/Box_model#what_is_the_css_box_model) của phần tử và định kiểu các control giao diện người dùng. Module UI này cũng cho phép định kiểu các control giao diện người dùng.

## Basic user interface trong thực tế

Để xem các thuộc tính basic user interface có thể thay đổi giao diện của các tính năng UI như thế nào, hãy tương tác với các phần tử trong mẫu này. Lưu ý rằng một số tính năng trong mẫu này cải thiện tính khả dụng trong khi các tính năng khác gây hại cho trải nghiệm người dùng.

```html hidden live-sample___basicUI
<div><span contenteditable>Edit this text </span></div>
<fieldset>
  <legend>Play with these fake form controls</legend>
  <input type="checkbox" id="check" />
  <input type="radio" name="a" />
  <input type="radio" name="a" />
  <input type="range" />
  <progress></progress>
</fieldset>
<fieldset>
  <legend>Be careful not to ruin usability: try resizing these.</legend>
  <textarea>
  cursor: wait;
  </textarea>
  <textarea>
  resize: none;
  </textarea>
  <textarea>
  pointer-events: none;
  </textarea>
</fieldset>
```

```css hidden live-sample___basicUI
body {
  font-family: sans-serif;
  font-size: 1.25rem;
}
[contenteditable] {
  cursor: copy;
  caret-color: magenta;
  border: 1px solid #cccccc;
}
:focus {
  outline: dashed magenta 3px;
  outline-offset: 10px;
}
* {
  accent-color: magenta;
}
div,
fieldset {
  margin: 20px;
}
textarea:nth-of-type(1) {
  cursor: wait;
}
textarea:nth-of-type(2) {
  resize: none;
}
textarea:nth-of-type(3) {
  pointer-events: none;
}
```

{{EmbedLiveSample("basicUI", "", "300px")}}

Các thuộc tính CSS {{CSSxRef("outline")}} và {{CSSxRef("outline-offset")}} được sử dụng để cung cấp phản hồi cho người dùng về phần tử nào hiện đang được focus. Một {{CSSxRef("accent-color")}} cung cấp màu theme cho tất cả các form control. Con trỏ caret xuất hiện khi văn bản được chỉnh sửa có cùng màu nhờ thuộc tính {{CSSxRef("caret-color")}}. Tất cả những điều này đều có thể được coi là cải tiến UI.

Một số tính năng gây hại cho tính khả dụng. Thuộc tính {{CSSxRef("cursor")}} được sử dụng để thay đổi con trỏ khỏi mặc định của trình duyệt, điều này gây nhầm lẫn. Thuộc tính {{CSSxRef("resize")}} ngăn {{HTMLElement("textarea")}} thứ hai không thể thay đổi kích thước trong khi thuộc tính {{CSSxRef("pointer-events")}} ngăn `<textarea>` thứ ba nhận sự kiện nhấp chuột. Nó vẫn có thể được focus bằng bàn phím.

Nhấp "Play" trong ví dụ trên để xem hoặc chỉnh sửa mã cho hoạt ảnh trong MDN Playground.

## Tham chiếu

### Thuộc tính

- {{CSSxRef("accent-color")}}
- {{CSSxRef("appearance")}}
- {{CSSxRef("caret-animation")}}
- {{CSSxRef("caret-color")}}
- {{CSSxRef("caret-shape")}}
- {{CSSxRef("cursor")}}
- {{CSSxRef("interest-delay")}}, viết tắt cho:
  - {{CSSxRef("interest-delay-start")}}
  - {{CSSxRef("interest-delay-end")}}
- {{CSSxRef("outline")}}, viết tắt cho:
  - {{CSSxRef("outline-color")}}
  - {{CSSxRef("outline-style")}}
  - {{CSSxRef("outline-width")}}
- {{CSSxRef("outline-offset")}}
- {{CSSxRef("pointer-events")}}
- {{CSSxRef("resize")}}
- {{CSSxRef("user-select")}}

Module CSS basic user interface cũng xác định các thuộc tính {{CSSxRef("caret")}}, `nav-down`, `nav-left`, `nav-right`, và `nav-up`. Hiện tại, không có trình duyệt nào hỗ trợ các tính năng này.

## Hướng dẫn

- [Learn forms: advanced form styling](/en-US/docs/Learn_web_development/Extensions/Forms/Advanced_form_styling)
  - : Giải thích cách {{CSSxRef("appearance")}} có thể được sử dụng để định kiểu các form control.

## Khái niệm liên quan

- Thuộc tính CSS {{cssxref("cursor")}}
- Thuộc tính SVG [`cursor`](/en-US/docs/Web/SVG/Reference/Attribute/cursor)
- Pseudo-class CSS {{CSSxRef(":focus")}}, {{CSSxRef(":focus-within")}}, và {{CSSxRef(":focus-visible")}}
- Interface {{DOMXref("CaretPosition")}}

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [Tips for Designing Useful and Usable Focus Indicators](https://www.deque.com/blog/give-site-focus-tips-designing-usable-focus-indicators/) (2016)
