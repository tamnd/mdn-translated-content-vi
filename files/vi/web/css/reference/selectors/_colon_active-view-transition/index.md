---
title: :active-view-transition
slug: Web/CSS/Reference/Selectors/:active-view-transition
page-type: css-pseudo-class
browser-compat: css.selectors.active-view-transition
sidebar: cssref
---

**`:active-view-transition`** là [lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/vi/docs/Web/CSS) khớp với phần tử gốc của tài liệu khi một [hiệu ứng chuyển cảnh view](/en-US/docs/Web/API/View_Transition_API#concepts_and_usage) đang diễn ra (_active_) và ngừng khớp khi hiệu ứng chuyển cảnh hoàn tất.

## Cú pháp

```css
:root:active-view-transition ... {
  /* ... */
}
```

## Ví dụ

### Tạo kiểu cho hiệu ứng chuyển cảnh view đang hoạt động

Ví dụ này mở rộng [ví dụ chuyển cảnh view cơ bản](/en-US/docs/Web/API/Document/startViewTransition#basic_usage) trên trang `startViewTransition`.

```html
<main>
  <section class="color">
    <h2>Color is changing!</h2>
  </section>
  <button id="change-color">Change Color</button>
</main>
```

Phần tử `<h2>` ban đầu có kiểu `display: none`, và được ghi đè bằng lớp giả `:active-view-transition` để đặt kiểu `<h2>` thành `display: block`.
Nút được ẩn bằng `visibility: hidden` khi hiệu ứng chuyển cảnh view đang diễn ra:

```css hidden
html {
  --bg: indigo;
}
main {
  display: flex;
  flex-direction: column;
  gap: 5px;
}
section {
  background-color: var(--bg);
  height: 60px;
  border-radius: 5px;
  display: flex;
  justify-content: center;
  align-items: center;
}
::view-transition-group(root) {
  animation-duration: 2s;
}
```

```css
h2 {
  display: none;
  color: white;
}
:root:active-view-transition h2 {
  display: block;
}
:root:active-view-transition button {
  visibility: hidden;
}
```

```js hidden
const colors = ["darkred", "darkslateblue", "darkgreen"];
const colBlock = document.querySelector(".color");
let count = 0;
const updateColour = () => {
  colBlock.style = `--bg: ${colors[count]}`;
  count = count !== colors.length - 1 ? ++count : 0;
};
const changeColor = () => {
  if (!document.startViewTransition) {
    updateColour();
    return;
  }
  const transition = document.startViewTransition(() => {
    updateColour();
  });
};
const changeColorButton = document.querySelector("#change-color");
changeColorButton.addEventListener("click", changeColor);
changeColorButton.addEventListener("keypress", changeColor);
```

{{EmbedLiveSample('showing_view_transition_is_running', '100%', '120')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Lớp giả {{cssxref(":active-view-transition-type()")}}
- Phương thức [`startViewTransition()`](/en-US/docs/Web/API/Document/startViewTransition)
- {{domxref("Document.activeViewTransition")}}
- [View Transition API](/en-US/docs/Web/API/View_Transition_API)
- [Sử dụng View Transition API](/en-US/docs/Web/API/View_Transition_API/Using)
- [Sử dụng các kiểu chuyển cảnh view](/en-US/docs/Web/API/View_Transition_API/Using_types)
