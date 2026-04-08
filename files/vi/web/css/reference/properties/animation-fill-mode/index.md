---
title: animation-fill-mode
slug: Web/CSS/Reference/Properties/animation-fill-mode
page-type: css-property
browser-compat: css.properties.animation-fill-mode
sidebar: cssref
---

Thuộc tính **`animation-fill-mode`** [CSS](/en-US/docs/Web/CSS) đặt cách animation CSS áp dụng style cho mục tiêu của nó trước và sau khi thực thi.

Thường thuận tiện hơn khi sử dụng thuộc tính viết tắt {{cssxref("animation")}} để đặt tất cả các thuộc tính animation cùng một lúc.

{{InteractiveExample("CSS Demo: animation-fill-mode")}}

```css interactive-example-choice
animation-fill-mode: none;
animation-delay: 1s;
```

```css interactive-example-choice
animation-fill-mode: forwards;
animation-delay: 1s;
```

```css interactive-example-choice
animation-fill-mode: backwards;
animation-delay: 1s;
```

```css interactive-example-choice
animation-fill-mode: both;
animation-delay: 1s;
```

```html interactive-example
<section class="flex-column" id="default-example">
  <div>Animation <span id="play-status"></span></div>
  <div id="example-element">Select a mode to start!</div>
</section>
```

```css interactive-example
#example-element {
  background-color: #1766aa;
  color: white;
  margin: auto;
  margin-left: 0;
  border: 5px solid #333333;
  width: 150px;
  height: 150px;
  border-radius: 50%;

  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}

#play-status {
  font-weight: bold;
}

.animating {
  animation: slide 1s ease-in 1;
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
/* Animation đơn */
animation-fill-mode: none;
animation-fill-mode: forwards;
animation-fill-mode: backwards;
animation-fill-mode: both;

/* Nhiều animation */
animation-fill-mode: none, backwards;
animation-fill-mode: both, forwards, none;

/* Giá trị toàn cục */
animation-fill-mode: inherit;
animation-fill-mode: initial;
animation-fill-mode: revert;
animation-fill-mode: revert-layer;
animation-fill-mode: unset;
```

### Giá trị

- `none`
  - : Animation sẽ không áp dụng bất kỳ style nào cho mục tiêu khi không thực thi. Thay vào đó, phần tử sẽ được hiển thị bằng bất kỳ quy tắc CSS nào khác được áp dụng cho nó. Đây là giá trị mặc định.
- `forwards`
  - : Mục tiêu sẽ giữ lại các giá trị tính toán được đặt bởi [keyframe](/en-US/docs/Web/CSS/Reference/At-rules/@keyframes) cuối cùng gặp trong quá trình thực thi. Keyframe cuối cùng phụ thuộc vào giá trị của {{cssxref("animation-direction")}} và {{cssxref("animation-iteration-count")}}:

    | `animation-direction` | `animation-iteration-count` | keyframe cuối cùng gặp |
    | --------------------- | --------------------------- | ---------------------- |
    | `normal`              | chẵn hoặc lẻ                | `100%` hoặc `to`       |
    | `reverse`             | chẵn hoặc lẻ                | `0%` hoặc `from`       |
    | `alternate`           | chẵn                        | `0%` hoặc `from`       |
    | `alternate`           | lẻ                          | `100%` hoặc `to`       |
    | `alternate-reverse`   | chẵn                        | `100%` hoặc `to`       |
    | `alternate-reverse`   | lẻ                          | `0%` hoặc `from`       |

    Các thuộc tính được animate hoạt động như thể được bao gồm trong giá trị thuộc tính {{cssxref("will-change")}} được đặt. Nếu một ngữ cảnh xếp chồng mới được tạo ra trong quá trình animation, phần tử mục tiêu giữ lại ngữ cảnh xếp chồng sau khi animation kết thúc.

- `backwards`
  - : Animation sẽ áp dụng các giá trị được định nghĩa trong [keyframe](/en-US/docs/Web/CSS/Reference/At-rules/@keyframes) liên quan đầu tiên ngay khi được áp dụng cho mục tiêu, và giữ lại điều này trong thời gian {{cssxref("animation-delay")}}. Keyframe liên quan đầu tiên phụ thuộc vào giá trị của {{cssxref("animation-direction")}}:

    | `animation-direction`              | keyframe liên quan đầu tiên |
    | ---------------------------------- | --------------------------- |
    | `normal` hoặc `alternate`          | `0%` hoặc `from`            |
    | `reverse` hoặc `alternate-reverse` | `100%` hoặc `to`            |

- `both`
  - : Animation sẽ tuân theo các quy tắc cho cả forwards và backwards, do đó mở rộng các thuộc tính animation theo cả hai hướng.

> [!NOTE]
> Khi bạn chỉ định nhiều giá trị được phân tách bằng dấu phẩy trên thuộc tính `animation-*`, chúng được áp dụng cho các animation theo thứ tự xuất hiện của {{cssxref("animation-name")}}. Đối với các tình huống mà số lượng animation và giá trị thuộc tính `animation-*` không khớp, hãy xem [Setting multiple animation property values](/en-US/docs/Web/CSS/Guides/Animations/Using#setting_multiple_animation_property_values).

> [!NOTE]
> `animation-fill-mode` có cùng hiệu lực khi tạo [CSS scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations) như đối với animation dựa trên thời gian thông thường.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt chế độ fill

Bạn có thể thấy hiệu lực của `animation-fill-mode` trong ví dụ sau. Nó minh họa cách bạn có thể làm cho animation duy trì ở trạng thái cuối cùng thay vì trở về trạng thái ban đầu (là hành vi mặc định).

#### HTML

```html
<p>Move your mouse over the gray box!</p>
<div class="demo">
  <div class="grows-and-stays">This grows and stays big.</div>
  <div class="grows">This just grows.</div>
</div>
```

#### CSS

```css
.demo {
  border-top: 100px solid #cccccc;
  height: 300px;
}

@keyframes grow {
  0% {
    font-size: 0;
  }
  100% {
    font-size: 40px;
  }
}

.demo:hover .grows {
  animation-name: grow;
  animation-duration: 3s;
}

.demo:hover .grows-and-stays {
  animation-name: grow;
  animation-duration: 3s;
  animation-fill-mode: forwards;
}
```

#### Kết quả

{{EmbedLiveSample('Setting fill mode',700,300)}}

Xem [CSS animations](/en-US/docs/Web/CSS/Guides/Animations/Using) để biết thêm ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using CSS animations](/en-US/docs/Web/CSS/Guides/Animations/Using)
- JavaScript {{domxref("AnimationEvent")}} API
- Các thuộc tính animation liên quan khác: {{cssxref("animation")}}, {{cssxref("animation-composition")}}, {{cssxref("animation-delay")}}, {{cssxref("animation-direction")}}, {{cssxref("animation-duration")}}, {{cssxref("animation-iteration-count")}}, {{cssxref("animation-name")}}, {{cssxref("animation-play-state")}}, {{cssxref("animation-timeline")}}, {{cssxref("animation-timing-function")}}
