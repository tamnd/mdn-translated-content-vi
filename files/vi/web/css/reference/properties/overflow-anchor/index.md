---
title: overflow-anchor
slug: Web/CSS/Reference/Properties/overflow-anchor
page-type: css-property
browser-compat: css.properties.overflow-anchor
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`overflow-anchor`** cung cấp cách để tắt hành vi neo cuộn (scroll anchoring) của trình duyệt, vốn điều chỉnh vị trí cuộn để giảm thiểu sự dịch chuyển nội dung.

Hành vi neo cuộn được bật theo mặc định trong bất kỳ trình duyệt nào hỗ trợ nó. Do đó, việc thay đổi giá trị của thuộc tính này thường chỉ cần thiết khi bạn gặp vấn đề với neo cuộn trong tài liệu hoặc một phần của tài liệu và cần tắt hành vi này.

{{InteractiveExample("CSS Demo: overflow-anchor")}}

```css interactive-example-choice
overflow-anchor: auto;
```

```css interactive-example-choice
overflow-anchor: none;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="whole-content-wrapper">
    <button id="playback" type="button">Start lottery</button>
    <p>Magic numbers for today are:</p>
    <div id="example-element"></div>
  </div>
</section>
```

```css interactive-example
.whole-content-wrapper {
  display: flex;
  flex-direction: column;
  height: 100%;
  width: 100%;
}

#example-element {
  height: 100%;
  border: 2px dashed dodgerblue;
  padding: 0.75em;
  text-align: left;
  overflow: scroll;
}

#playback {
  font-size: 1em;
  width: 10em;
  height: 4em;
  font-weight: bold;
  margin: 1em auto;
  background-color: aliceblue;
  border: solid 2px dodgerblue;
  border-radius: 5px;
}

#playback:hover {
  border-color: lightseagreen;
}

#playback:active {
  filter: brightness(0.9);
}
```

```js interactive-example
const example = document.getElementById("example-element");
const button = document.getElementById("playback");
let intervalId;

function setInitialState() {
  example.innerHTML = "";
  Array.from({ length: 10 }, (_, i) => i).forEach(addContent);
  example.scrollTop = example.scrollHeight;
}

function addContent() {
  console.log("adding content");
  const magicNumber = Math.floor(Math.random() * 10000);
  example.insertAdjacentHTML(
    "afterbegin",
    `<div class="new-content-container">New Magic Number: ${magicNumber}</div>`,
  );
}

button.addEventListener("click", () => {
  if (example.classList.contains("running")) {
    example.classList.remove("running");
    button.textContent = "Start lottery";
    clearInterval(intervalId);
  } else {
    example.classList.add("running");
    button.textContent = "Stop lottery";
    setInitialState();
    intervalId = setInterval(addContent, 1000);
  }
});
```

## Cú pháp

```css
/* Giá trị từ khóa */
overflow-anchor: auto;
overflow-anchor: none;

/* Giá trị toàn cục */
overflow-anchor: inherit;
overflow-anchor: initial;
overflow-anchor: revert;
overflow-anchor: revert-layer;
overflow-anchor: unset;
```

### Giá trị

- `auto`
  - : Phần tử trở thành neo tiềm năng khi điều chỉnh vị trí cuộn.
- `none`
  - : Phần tử sẽ không được chọn làm neo tiềm năng.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Ngăn neo cuộn

Để ngăn neo cuộn trong một tài liệu, hãy sử dụng thuộc tính `overflow-anchor`.

```css
* {
  overflow-anchor: none;
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Overview of scroll anchoring](/en-US/docs/Web/CSS/Guides/Scroll_anchoring/Overview)
- [CSS scroll anchoring](/en-US/docs/Web/CSS/Guides/Scroll_anchoring) module
