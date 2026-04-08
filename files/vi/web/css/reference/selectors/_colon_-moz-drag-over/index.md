---
title: :-moz-drag-over
slug: Web/CSS/Reference/Selectors/:-moz-drag-over
page-type: css-pseudo-class
status:
  - non-standard
sidebar: cssref
---

{{Non-standard_header}}

**`:-moz-drag-over`** là [lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/vi/docs/Web/CSS) là một [phần mở rộng Mozilla](/vi/docs/Web/CSS/Reference/Mozilla_extensions) khớp với một phần tử khi sự kiện {{domxref("HTMLElement/dragover_event", "dragover")}} được gọi trên nó.

## Cú pháp

```css
:-moz-drag-over {
  /* ... */
}
```

## Ví dụ

### HTML

```html
<div id="drop-target">
  <p>Drop target</p>
</div>

<div draggable="true">
  <p>Draggable</p>
</div>
```

### JavaScript

Hầu hết các phần tử không phải là nơi hợp lệ để thả dữ liệu, vì vậy để cho phép thả, bạn phải ngăn hành vi mặc định bằng cách hủy các sự kiện [`dragenter`](/vi/docs/Web/API/HTMLElement/dragenter_event) hoặc [`dragover`](/vi/docs/Web/API/HTMLElement/dragover_event) (hoặc cả hai). Trong ví dụ này, chúng ta chỉ cần hủy sự kiện `dragenter`, là sự kiện đầu tiên được kích hoạt khi trình duyệt đánh giá xem một phần tử có thể là mục tiêu thả hay không. Để biết thêm thông tin, xem [Thao tác kéo: Chỉ định mục tiêu thả](/vi/docs/Web/API/HTML_Drag_and_Drop_API/Drag_operations#dragging_over_elements_and_specifying_drop_targets).

```js
const target = document.getElementById("drop-target");
/* dragenter event fired on the drop target */
target.addEventListener("dragenter", (event) => {
  // prevent default to allow drop
  event.preventDefault();
});
```

### CSS

```css
body {
  font-family: "Arial";
}
div {
  display: inline-block;
  width: 150px;
  height: 150px;
  border: 2px dotted black;
  background-color: aquamarine;
  margin: 1rem;
}
p {
  padding: 1rem;
}
```

CSS sau thay đổi màu của mục tiêu thả thành đỏ khi phần tử có thể kéo phủ lên vùng thả.

```css
#drop-target {
  background-color: cornflowerblue;
}
#drop-target:-moz-drag-over {
  background-color: red;
}
```

### Kết quả

{{EmbedLiveSample("Examples", "100%", "200px")}}

## Thông số kỹ thuật

Không thuộc bất kỳ tiêu chuẩn nào.

## Xem thêm

- [Phần mở rộng Mozilla CSS](/vi/docs/Web/CSS/Reference/Mozilla_extensions)
- [Kéo và thả HTML](/vi/docs/Web/API/HTML_Drag_and_Drop_API)
