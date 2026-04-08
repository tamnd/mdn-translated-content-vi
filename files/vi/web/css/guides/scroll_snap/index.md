---
title: CSS scroll snap
short-title: Scroll snap
slug: Web/CSS/Guides/Scroll_snap
page-type: css-module
spec-urls:
  - https://drafts.csswg.org/css-scroll-snap/
  - https://drafts.csswg.org/css-scroll-snap-2/
sidebar: cssref
---

Module **CSS scroll snap** cung cấp các thuộc tính cho phép bạn kiểm soát hành vi panning và cuộn bằng cách định nghĩa các snap position. Nội dung có thể snap vào vị trí khi người dùng cuộn qua nội dung tràn trong một {{Glossary("scroll container")}}, tạo ra khả năng phân trang và định vị cuộn.

Module này bao gồm các thuộc tính scroll-padding của scroll container để điều chỉnh vùng xem tối ưu khi paging trong các thao tác scroll-into-view. Nó cũng bao gồm scroll-margin và scroll-alignment, được đặt trên các phần tử con của scroll container, để điều chỉnh vùng hiển thị của các phần tử con khi chúng được cuộn vào view, cùng với một thuộc tính để buộc cuộn dừng lại trên từng phần tử con.

## Scroll snap hoạt động

Để xem scroll snapping hoạt động trong ô bên dưới, hãy cuộn lên-xuống và trái-phải qua lưới gồm 45 ô được đánh số trong viewport có thể cuộn.
Nhấp "Play" trong ví dụ bên dưới để xem hoặc chỉnh sửa source trong MDN Playground:

```js hidden live-sample___scroll_snap
const positions = ["start", "center", "end"];
const inlineDirection = document.getElementById("inline");
const blockDirection = document.getElementById("block");
const stop = document.getElementById("stop");
const snap = document.getElementById("snap");
const all = document.querySelector("article");
const rules = document.getElementById("css-output").sheet.cssRules;

setSST();
setSSA();

inlineDirection.addEventListener("change", () => {
  setSSA();
});
blockDirection.addEventListener("change", () => {
  setSSA();
});
stop.addEventListener("change", () => {
  setSST();
});
snap.addEventListener("change", () => {
  all.classList.toggle("snapDisabled");
});

function setSSA() {
  rules[0].style.scrollSnapAlign = `${positions[blockDirection.value]} ${
    positions[inlineDirection.value]
  }`;
}

function setSST() {
  if (stop.checked) {
    rules[0].style.scrollSnapStop = "always";
  } else {
    rules[0].style.scrollSnapStop = "normal";
  }
}
```

```html hidden live-sample___scroll_snap
<article>
  <ul>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
  </ul>
  <div>
    <fieldset>
      <legend>Change the options</legend>
      <p>
        <label
          ><input
            type="range"
            min="0"
            max="2"
            value="1"
            list="places"
            id="block" />
          block position</label
        >
      </p>
      <p>
        <label>
          <input
            type="range"
            min="0"
            max="2"
            value="1"
            list="places"
            id="inline" />
          inline position
        </label>
      </p>
      <p>
        <label>
          <input type="checkbox" id="stop" />
          Prevent scrolling past boxes
        </label>
      </p>
    </fieldset>

    <p>
      <label><input type="checkbox" id="snap" /> disable snapping</label>
    </p>

    <datalist id="places">
      <option value="0">start</option>
      <option value="1">center</option>
      <option value="2">end</option>
    </datalist>
  </div>
</article>
```

```css hidden live-sample___scroll_snap
li {
  /*
  starts with:
      scroll-snap-align: center center;
      scroll-snap-stop: normal (defaults);

  CSS gets changed with JavaScript when you change the controls.
  the following can be set:
      scroll-snap-stop: always | normal;
      scroll-snap-align: start | center | end {2}
        */
}
ul {
  overflow: auto;
  scroll-snap-type: both mandatory;
  overscroll-behavior-x: contain;
}
article.snapDisabled fieldset {
  opacity: 20%;
  pointer-events: none;
}
article.snapDisabled ul {
  scroll-snap-type: initial;
  overscroll-behavior-x: initial;
}

@layer page-setup {
  article {
    display: flex;
    gap: 2vw;
  }
  div {
    flex: 1;
  }
  ul {
    display: grid;
    gap: 6.25vw;
    padding: 12.5vw;
    box-sizing: border-box;
    border: 1px solid;
    grid-template-columns: repeat(5, 1fr);
    background: conic-gradient(
      at bottom left,
      red 0deg,
      yellow 15deg,
      green 30deg,
      blue 45deg,
      purple 60deg,
      magenta 75deg
    );
    background-attachment: local;
    margin: auto;
    width: 20vw;
    height: 20vw;
  }
  li {
    scroll-snap-align: center;
    height: 12.5vw;
    width: 12.5vw;
    outline: 3px inset;
    list-style-type: none;
    background: white;
    font-family: monospace;
    font-size: 3rem;
    line-height: 12vw;
    text-align: center;
    counter-increment: items 1;
  }
  li::after {
    content: counter(items);
  }
  input {
    vertical-align: bottom;
  }
  p {
    font-family: monospace;
  }
}
```

{{EmbedLiveSample("scroll_snap", "", "250px")}}

Với scroll snap, một trong các ô được đánh số mà bạn cuộn đến sẽ snap vào vị trí. CSS ban đầu làm cho ô được đánh số snap vào giữa viewport. Dùng các thanh trượt để thay đổi vị trí snap theo block và inline.

Sử dụng các thuộc tính snap, bạn có thể cho phép hoặc chặn cuộn qua một phần tử — ô được đánh số trong trường hợp này. Chọn hộp kiểm "Prevent scrolling past boxes" để buộc tất cả các hành động cuộn chỉ giới hạn cuộn đến ô liền kề.

Để so sánh scroll snapping với cuộn thông thường, hãy chọn hộp kiểm "disable snapping" và thử cuộn lại.

## Tham chiếu

### Thuộc tính trên container

- {{cssxref("scroll-snap-type")}}
- {{cssxref("scroll-padding")}}
  - {{cssxref("scroll-padding-top")}}
  - {{cssxref("scroll-padding-right")}}
  - {{cssxref("scroll-padding-bottom")}}
  - {{cssxref("scroll-padding-left")}}
  - {{cssxref("scroll-padding-inline")}}
  - {{cssxref("scroll-padding-inline-start")}}
  - {{cssxref("scroll-padding-inline-end")}}
  - {{cssxref("scroll-padding-block")}}
  - {{cssxref("scroll-padding-block-start")}}
  - {{cssxref("scroll-padding-block-end")}}

### Thuộc tính trên phần tử con

- {{cssxref("scroll-initial-target")}}
- {{cssxref("scroll-margin")}}
  - {{cssxref("scroll-margin-top")}}
  - {{cssxref("scroll-margin-right")}}
  - {{cssxref("scroll-margin-bottom")}}
  - {{cssxref("scroll-margin-left")}}
  - {{cssxref("scroll-margin-inline")}}
  - {{cssxref("scroll-margin-inline-start")}}
  - {{cssxref("scroll-margin-inline-end")}}
  - {{cssxref("scroll-margin-block")}}
  - {{cssxref("scroll-margin-block-start")}}
  - {{cssxref("scroll-margin-block-end")}}
- {{cssxref("scroll-snap-align")}}
- {{cssxref("scroll-snap-stop")}}

### Sự kiện

- {{domxref("Element/scrollsnapchange_event", "scrollsnapchange")}} {{experimental_inline}}
- {{domxref("Element/scrollsnapchanging_event", "scrollsnapchanging")}} {{experimental_inline}}

### Interface

- {{domxref("SnapEvent")}} {{experimental_inline}}
  - {{domxref("SnapEvent.snapTargetBlock")}} {{experimental_inline}}
  - {{domxref("SnapEvent.snapTargetInline")}} {{experimental_inline}}

## Hướng dẫn

- [Khái niệm cơ bản của CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap/Basic_concepts)
  - : Tổng quan và ví dụ về các tính năng CSS scroll snap.
- [Sử dụng scroll snap events](/en-US/docs/Web/CSS/Guides/Scroll_snap/Using_scroll_snap_events)
  - : Hướng dẫn sử dụng các sự kiện scroll snap {{domxref("Element/scrollsnapchanging_event", "scrollsnapchanging")}} và {{domxref("Element/scrollsnapchange_event", "scrollsnapchange")}} được kích hoạt khi trình duyệt xác định một snap target mới đang chờ xử lý hoặc đã được chọn.

## Khái niệm liên quan

- Pseudo-class {{cssxref(":target")}}
- Thuộc tính CSS {{cssxref("overflow")}}
- Phương thức {{domxref("Element.scroll", "scroll()")}} của Element
- Phương thức {{domxref("Element.scrollBy", "scrollBy()")}} của Element
- Phương thức {{domxref("Element.scrollIntoView", "scrollIntoView()")}} của Element
- Phương thức {{domxref("Element.scrollTo", "scrollTo()")}} của Element
- Sự kiện {{domxref("Element.scroll_event", "scroll")}} của Element
- Sự kiện {{domxref("Element.scrollend_event", "scrollend")}} của Element
- ARIA role [`scrollbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/scrollbar_role)
- Thuật ngữ {{Glossary("Scroll container")}}

## Đặc tả

{{Specifications}}

## Xem thêm

- Module [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow)
- Module [CSS scrollbars styling](/en-US/docs/Web/CSS/Guides/Scrollbars_styling)
- Module [CSS scroll anchoring](/en-US/docs/Web/CSS/Guides/Scroll_anchoring)
- [Keyboard-only scrolling areas](https://adrianroselli.com/2022/06/keyboard-only-scrolling-areas.html) trên adrianroselli.com (2022)
- [Scroll snap examples](https://codepen.io/collection/KpqBGW) trên CodePen (2022)
- [Practical CSS scroll snapping/](https://css-tricks.com/practical-css-scroll-snapping/) trên CSS-Tricks (2020)
- [CSS scroll snap](https://12daysofweb.dev/2022/css-scroll-snap/) trên 12 Days of Web (2019)
- [Well-controlled scrolling with CSS scroll snap](https://web.dev/articles/css-scroll-snap) trên web.dev (2018)
