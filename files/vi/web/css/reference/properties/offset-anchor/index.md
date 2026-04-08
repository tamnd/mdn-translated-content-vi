---
title: offset-anchor
slug: Web/CSS/Reference/Properties/offset-anchor
page-type: css-property
browser-compat: css.properties.offset-anchor
sidebar: cssref
---

Thuộc tính **`offset-anchor`** [CSS](/en-US/docs/Web/CSS) chỉ định điểm bên trong hộp của phần tử đang di chuyển dọc theo một {{cssxref("offset-path")}} mà thực sự di chuyển theo đường dẫn.

{{InteractiveExample("CSS Demo: offset-anchor")}}

```css interactive-example-choice
offset-anchor: auto;
```

```css interactive-example-choice
offset-anchor: right top;
```

```css interactive-example-choice
offset-anchor: left bottom;
```

```css interactive-example-choice
offset-anchor: 20% 80%;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="wrapper">
    <div id="example-element"></div>
  </div>
  <button id="playback" type="button">Play</button>
</section>
```

```css interactive-example
#example-element {
  offset-path: path("M 0,20 L 200,20");
  animation: distance 3000ms infinite alternate ease-in-out;
  width: 40px;
  height: 40px;
  background: cyan;
  animation-play-state: paused;
}

#example-element.running {
  animation-play-state: running;
}

.wrapper {
  background-image: linear-gradient(
    to bottom,
    transparent,
    transparent 49%,
    black 50%,
    black 51%,
    transparent 52%
  );
  border: 1px solid #cccccc;
  width: 90%;
}

@keyframes distance {
  0% {
    offset-distance: 0%;
  }
  100% {
    offset-distance: 100%;
  }
}

#playback {
  position: absolute;
  top: 0;
  left: 0;
  font-size: 1em;
}
```

```js interactive-example
const example = document.getElementById("example-element");
const button = document.getElementById("playback");

button.addEventListener("click", () => {
  if (example.classList.contains("running")) {
    example.classList.remove("running");
    button.textContent = "Play";
  } else {
    example.classList.add("running");
    button.textContent = "Pause";
  }
});
```

## Cú pháp

```css
/* Giá trị từ khóa */
offset-anchor: top;
offset-anchor: bottom;
offset-anchor: left;
offset-anchor: right;
offset-anchor: center;
offset-anchor: auto;

/* Giá trị <percentage> */
offset-anchor: 25% 75%;

/* Giá trị <length> */
offset-anchor: 0 0;
offset-anchor: 1cm 2cm;
offset-anchor: 10ch 8em;

/* Giá trị offset cạnh */
offset-anchor: bottom 10px right 20px;
offset-anchor: right 3em bottom 10px;

/* Giá trị toàn cục */
offset-anchor: inherit;
offset-anchor: initial;
offset-anchor: revert;
offset-anchor: revert-layer;
offset-anchor: unset;
```

### Giá trị

- `auto`
  - : `offset-anchor` được cấp cùng giá trị với {{cssxref("transform-origin")}} của phần tử, trừ khi {{cssxref("offset-path")}} là `none`, trong trường hợp đó nó lấy giá trị từ {{cssxref("offset-position")}}.
- `<position>`
  - : Một {{cssxref("&lt;position&gt;")}} xác định tọa độ x/y, để đặt một phần tử tương đối so với các cạnh của hộp phần tử. Nó có thể được xác định bằng một đến bốn giá trị. Để biết thêm chi tiết, hãy xem trang tham khảo {{cssxref("&lt;position&gt;")}} và {{cssxref("background-position")}}. Lưu ý rằng cú pháp vị trí 3 giá trị không hoạt động cho bất kỳ cách sử dụng `<position>` nào, ngoại trừ trong `background(-position)`.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt các giá trị offset-anchor khác nhau

Trong ví dụ sau, chúng ta có ba phần tử {{htmlelement("div")}} được lồng trong các phần tử {{htmlelement("section")}}. Mỗi `<div>` được cấp cùng {{cssxref("offset-path")}} (một đường ngang dài 200 pixel) và được tạo hoạt ảnh để di chuyển dọc theo nó. Ba phần tử sau đó được cấp các giá trị {{cssxref("background-color")}} và `offset-anchor` khác nhau.

Mỗi `<section>` đã được tạo kiểu với một gradient tuyến tính để tạo cho nó một đường ngang chạy qua tâm, cho bạn thấy trực quan nơi các đường dẫn offset của `<div>` đang chạy.

Điều này cho phép bạn thấy hiệu ứng của các giá trị `offset-anchor` khác nhau — cái đầu tiên, `auto`, khiến điểm trung tâm của `<div>` di chuyển dọc theo đường dẫn. Hai cái còn lại khiến điểm trên-phải và dưới-trái của `<div>` di chuyển dọc theo đường dẫn, tương ứng.

#### HTML

```html
<section>
  <div class="offset-anchor1"></div>
</section>
<section>
  <div class="offset-anchor2"></div>
</section>
<section>
  <div class="offset-anchor3"></div>
</section>
```

#### CSS

```css
div {
  offset-path: path("M 0,20 L 200,20");
  animation: move 3000ms infinite alternate ease-in-out;
  width: 40px;
  height: 40px;
}

section {
  background-image: linear-gradient(
    to bottom,
    transparent,
    transparent 49%,
    black 50%,
    black 51%,
    transparent 52%
  );
  border: 1px solid #cccccc;
  margin-bottom: 10px;
}

.offset-anchor1 {
  offset-anchor: auto;
  background: cyan;
}

.offset-anchor2 {
  offset-anchor: right top;
  background: purple;
}

.offset-anchor3 {
  offset-anchor: left bottom;
  background: magenta;
}

@keyframes move {
  0% {
    offset-distance: 0%;
  }
  100% {
    offset-distance: 100%;
  }
}
```

#### Kết quả

{{EmbedLiveSample('Setting_various_offset-anchor_values', '100%', '300')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("offset")}}
- {{cssxref("offset-distance")}}
- {{cssxref("offset-rotate")}}
- [SVG `<path>`](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Paths)
