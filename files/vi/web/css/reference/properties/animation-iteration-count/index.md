---
title: animation-iteration-count
slug: Web/CSS/Reference/Properties/animation-iteration-count
page-type: css-property
browser-compat: css.properties.animation-iteration-count
sidebar: cssref
---

Thuộc tính **`animation-iteration-count`** trong [CSS](/en-US/docs/Web/CSS) đặt số lần một chuỗi hoạt ảnh sẽ được phát trước khi dừng lại.

Thường tiện lợi khi sử dụng thuộc tính viết tắt {{cssxref("animation")}} để đặt tất cả các thuộc tính hoạt ảnh cùng một lúc.

{{InteractiveExample("CSS Demo: animation-iteration-count")}}

```css interactive-example-choice
animation-iteration-count: 0;
```

```css interactive-example-choice
animation-iteration-count: 2;
```

```css interactive-example-choice
animation-iteration-count: 1.5;
```

```html interactive-example
<section class="flex-column" id="default-example">
  <div>Animation <span id="play-status"></span></div>
  <div id="example-element">Select a count to start!</div>
</section>
```

```css interactive-example
#example-element {
  align-items: center;
  background-color: #1766aa;
  border-radius: 50%;
  border: 5px solid #333333;
  color: white;
  display: flex;
  flex-direction: column;
  height: 150px;
  justify-content: center;
  margin: auto;
  margin-left: 0;
  width: 150px;
}

#play-status {
  font-weight: bold;
}

.animating {
  animation-name: slide;
  animation-duration: 3s;
  animation-timing-function: ease-in;
}

@keyframes slide {
  from {
    background-color: orange;
    color: black;
    margin-left: 0;
  }
  to {
    background-color: orange;
    color: black;
    margin-left: 80%;
  }
}
```

```js interactive-example
const el = document.getElementById("example-element");
const status = document.getElementById("play-status");

function update() {
  status.textContent = "delaying";
  el.className = "";
  window.requestAnimationFrame(() => {
    window.requestAnimationFrame(() => {
      el.className = "animating";
    });
  });
}

el.addEventListener("animationstart", () => {
  status.textContent = "playing";
});

el.addEventListener("animationend", () => {
  status.textContent = "finished";
});

const observer = new MutationObserver(() => {
  update();
});

observer.observe(el, {
  attributes: true,
  attributeFilter: ["style"],
});

update();
```

## Cú pháp

```css
/* Giá trị từ khóa */
animation-iteration-count: infinite;

/* Giá trị <number> */
animation-iteration-count: 3;
animation-iteration-count: 2.4;

/* Nhiều giá trị */
animation-iteration-count: 2, 0, infinite;

/* Giá trị toàn cục */
animation-iteration-count: inherit;
animation-iteration-count: initial;
animation-iteration-count: revert;
animation-iteration-count: revert-layer;
animation-iteration-count: unset;
```

Thuộc tính **`animation-iteration-count`** được chỉ định là một hoặc nhiều giá trị được phân cách bằng dấu phẩy.

### Giá trị

- `infinite`
  - : Hoạt ảnh sẽ lặp lại mãi mãi.
- {{cssxref("&lt;number&gt;")}}
  - : Số lần hoạt ảnh sẽ lặp lại; mặc định là `1`. Bạn có thể chỉ định giá trị không phải số nguyên để phát một phần của chu kỳ hoạt ảnh: ví dụ, `0.5` sẽ phát một nửa chu kỳ hoạt ảnh. Giá trị âm không hợp lệ.

> [!NOTE]
> Khi bạn chỉ định nhiều giá trị phân cách bằng dấu phẩy trên một thuộc tính `animation-*`, chúng được áp dụng cho các hoạt ảnh theo thứ tự xuất hiện của {{cssxref("animation-name")}}. Đối với các trường hợp số lượng hoạt ảnh và giá trị thuộc tính `animation-*` không khớp, hãy xem [Đặt nhiều giá trị thuộc tính hoạt ảnh](/en-US/docs/Web/CSS/Guides/Animations/Using#setting_multiple_animation_property_values).

> [!NOTE]
> Khi tạo [hoạt ảnh cuộn trang trong CSS](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations), việc chỉ định `animation-iteration-count` khiến hoạt ảnh lặp lại số lần đó trong quá trình tiến triển của dòng thời gian. Nếu không cung cấp `animation-iteration-count`, hoạt ảnh sẽ chỉ xảy ra một lần. `infinite` là giá trị hợp lệ cho hoạt ảnh cuộn trang, nhưng nó tạo ra một hoạt ảnh không hoạt động.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt số lần lặp lại

Hoạt ảnh này sẽ chạy 10 lần.

#### HTML

```html
<div class="box"></div>
```

#### CSS

```css
.box {
  background-color: rebeccapurple;
  border-radius: 10px;
  width: 100px;
  height: 100px;
}

.box:hover {
  animation-name: rotate;
  animation-duration: 0.7s;
  animation-iteration-count: 10;
}

@keyframes rotate {
  0% {
    transform: rotate(0);
  }
  100% {
    transform: rotate(360deg);
  }
}
```

#### Kết quả

Di chuột qua hình chữ nhật để bắt đầu hoạt ảnh.

{{EmbedLiveSample("Setting iteration count","100%","250")}}

Xem [hoạt ảnh CSS](/en-US/docs/Web/CSS/Guides/Animations/Using) để biết thêm ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng hoạt ảnh CSS](/en-US/docs/Web/CSS/Guides/Animations/Using)
- API JavaScript {{domxref("AnimationEvent")}}
- Các thuộc tính hoạt ảnh liên quan khác: {{cssxref("animation")}}, {{cssxref("animation-composition")}}, {{cssxref("animation-delay")}}, {{cssxref("animation-direction")}}, {{cssxref("animation-duration")}}, {{cssxref("animation-fill-mode")}}, {{cssxref("animation-name")}}, {{cssxref("animation-play-state")}}, {{cssxref("animation-timeline")}}, {{cssxref("animation-timing-function")}}
