---
title: animation
slug: Web/CSS/Reference/Properties/animation
page-type: css-shorthand-property
browser-compat: css.properties.animation
sidebar: cssref
---

Thuộc tính [viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) **`animation`** [CSS](/en-US/docs/Web/CSS) áp dụng hiệu ứng động giữa các style. Đây là viết tắt của {{cssxref("animation-name")}}, {{cssxref("animation-duration")}}, {{cssxref("animation-timing-function")}}, {{cssxref("animation-delay")}}, {{cssxref("animation-iteration-count")}}, {{cssxref("animation-direction")}}, {{cssxref("animation-fill-mode")}}, {{cssxref("animation-play-state")}}, và {{cssxref("animation-timeline")}}.

{{InteractiveExample("CSS Demo: animation")}}

```css interactive-example-choice
animation: 3s ease-in 1s infinite reverse both running slide-in;
```

```css interactive-example-choice
animation: 3s linear 1s infinite running slide-in;
```

```css interactive-example-choice
animation: 3s linear 1s infinite alternate slide-in;
```

```css interactive-example-choice
animation: 0.5s linear 1s infinite alternate slide-in;
```

```html interactive-example
<section class="flex-column" id="default-example">
  <div id="example-element"></div>
</section>
```

```css interactive-example
#example-element {
  background-color: #1766aa;
  margin: 20px;
  border: 5px solid #333333;
  width: 150px;
  height: 150px;
  border-radius: 50%;
}

@keyframes slide-in {
  from {
    margin-left: -20%;
  }
  to {
    margin-left: 100%;
  }
}
```

## Các thuộc tính cấu thành

Thuộc tính này là viết tắt của các thuộc tính CSS sau:

- {{cssxref("animation-delay")}}
- {{cssxref("animation-direction")}}
- {{cssxref("animation-duration")}}
- {{cssxref("animation-fill-mode")}}
- {{cssxref("animation-iteration-count")}}
- {{cssxref("animation-name")}}
- {{cssxref("animation-play-state")}}
- {{cssxref("animation-timeline")}}
- {{cssxref("animation-timing-function")}}

## Cú pháp

```css
/* @keyframes duration | easing-function | delay |
iteration-count | direction | fill-mode | play-state | name */
animation: 3s ease-in 1s 2 reverse both paused slide-in;

/* @keyframes duration | easing-function | delay | name */
animation: 3s linear 1s slide-in;

/* hai animation */
animation:
  3s linear slide-in,
  3s ease-out 5s slide-out;
```

Thuộc tính `animation` được chỉ định dưới dạng một hoặc nhiều animation đơn lẻ, được phân tách bằng dấu phẩy.

Mỗi animation đơn lẻ được chỉ định như sau:

- không, một hoặc hai lần xuất hiện của giá trị {{cssxref("&lt;time&gt;")}}

- không hoặc một lần xuất hiện của các giá trị sau:
  - [`<single-easing-function>`](#single-easing-function)
  - [`<single-animation-iteration-count>`](#single-animation-iteration-count)
  - [`<single-animation-direction>`](#single-animation-direction)
  - [`<single-animation-fill-mode>`](#single-animation-fill-mode)
  - [`<single-animation-play-state>`](#single-animation-play-state)

- tên tùy chọn cho animation, có thể là `none`, một {{cssxref("&lt;custom-ident&gt;")}}, hoặc một {{cssxref("&lt;string&gt;")}}

> [!NOTE]
> {{cssxref("animation-timeline")}}, {{cssxref("animation-range-start")}}, và {{cssxref("animation-range-end")}} hiện không được bao gồm trong danh sách này, vì các triển khai hiện tại chỉ là reset. Điều này có nghĩa là việc sử dụng `animation` sẽ reset giá trị `animation-timeline` đã được khai báo trước đó thành `auto` và các giá trị `animation-range-start` và `animation-range-end` đã được khai báo trước đó thành `normal`, nhưng các thuộc tính này không thể được đặt thông qua `animation`. Khi tạo [CSS scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations), bạn cần khai báo các thuộc tính này sau khi khai báo bất kỳ viết tắt `animation` nào để nó có hiệu lực.

### Giá trị

- `<single-easing-function>`
  - : Xác định loại chuyển tiếp. Giá trị phải là một trong những giá trị có sẵn trong {{cssxref("easing-function")}}.
- `<single-animation-iteration-count>`
  - : Số lần animation được phát. Giá trị phải là một trong những giá trị có sẵn trong {{cssxref("animation-iteration-count")}}.
- `<single-animation-direction>`
  - : Hướng mà animation được phát. Giá trị phải là một trong những giá trị có sẵn trong {{cssxref("animation-direction")}}.
- `<single-animation-fill-mode>`
  - : Xác định cách các style nên được áp dụng cho mục tiêu của animation trước và sau khi thực thi. Giá trị phải là một trong những giá trị có sẵn trong {{cssxref("animation-fill-mode")}}.
- `<single-animation-play-state>`
  - : Xác định animation có đang phát hay không. Giá trị phải là một trong những giá trị có sẵn trong {{cssxref("animation-play-state")}}.

## Mô tả

Thứ tự của các giá trị thời gian trong mỗi định nghĩa animation là quan trọng: giá trị đầu tiên có thể được phân tích là {{cssxref("&lt;time&gt;")}} được gán cho {{cssxref("animation-duration")}}, và giá trị thứ hai được gán cho {{cssxref("animation-delay")}}.

Thứ tự của các giá trị khác trong mỗi định nghĩa animation cũng quan trọng để phân biệt giá trị {{cssxref("animation-name")}} với các giá trị khác. Nếu một giá trị trong viết tắt `animation` có thể được phân tích là giá trị của thuộc tính animation khác ngoài `animation-name`, thì giá trị đó sẽ được áp dụng cho thuộc tính đó trước, không phải cho `animation-name`. Vì lý do này, thực hành được khuyến nghị là chỉ định giá trị `animation-name` là giá trị cuối cùng trong danh sách giá trị khi sử dụng viết tắt `animation`; điều này đúng ngay cả khi bạn chỉ định nhiều animation được phân tách bằng dấu phẩy sử dụng viết tắt `animation`.

Mặc dù tên animation phải được đặt để animation được áp dụng, tất cả các giá trị của viết tắt `animation` là tùy chọn và mặc định về giá trị khởi tạo của mỗi thành phần `animation` dài. Giá trị khởi tạo của `animation-name` là `none`, nghĩa là nếu không có giá trị `animation-name` nào được khai báo trong thuộc tính viết tắt `animation`, không có animation nào được áp dụng cho bất kỳ thuộc tính nào.

Khi giá trị `animation-duration` bị bỏ qua khỏi thuộc tính viết tắt `animation`, giá trị cho thuộc tính này mặc định là `0s`. Trong trường hợp này, animation vẫn sẽ xảy ra (các sự kiện [`animationStart`](/en-US/docs/Web/API/Element/animationstart_event) và [`animationEnd`](/en-US/docs/Web/API/Element/animationend_event) sẽ được kích hoạt) nhưng không có animation nào sẽ hiển thị.

Trong trường hợp giá trị [forwards](/en-US/docs/Web/CSS/Reference/Properties/animation-fill-mode#forwards) của `animation-fill-mode`, các thuộc tính được animate hoạt động như thể được bao gồm trong giá trị thuộc tính {{cssxref("will-change")}} được đặt. Nếu một ngữ cảnh xếp chồng mới được tạo ra trong quá trình animation, phần tử mục tiêu giữ lại ngữ cảnh xếp chồng sau khi animation kết thúc.

## Khả năng tiếp cận

Animation nhấp nháy và phát sáng có thể gây vấn đề cho những người có mối lo ngại về nhận thức như Rối loạn Tăng động Giảm chú ý (ADHD). Ngoài ra, một số loại chuyển động có thể là tác nhân gây Rối loạn Tiền đình, động kinh, đau nửa đầu và Nhạy cảm thị giác.

Hãy cân nhắc cung cấp cơ chế để tạm dừng hoặc vô hiệu hóa animation cũng như sử dụng [Reduced Motion Media Query](/en-US/docs/Web/CSS/Reference/At-rules/@media/prefers-reduced-motion) để tạo trải nghiệm bổ sung cho người dùng đã bày tỏ sở thích về trải nghiệm animation giảm thiểu.

- [Designing Safer Web Animation For Motion Sensitivity · An A List Apart Article](https://alistapart.com/article/designing-safer-web-animation-for-motion-sensitivity/)
- [An Introduction to the Reduced Motion Media Query | CSS-Tricks](https://css-tricks.com/introduction-reduced-motion-media-query/)
- [Responsive Design for Motion | WebKit](https://webkit.org/blog/7551/responsive-design-for-motion/)
- [MDN Understanding WCAG, Guideline 2.2 explanations](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Operable#guideline_2.2_%e2%80%94_enough_time_provide_users_enough_time_to_read_and_use_content)
- [Understanding Success Criterion 2.2.2 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/time-limits-pause.html)

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

> [!NOTE]
> Việc animate các thuộc tính [CSS Box Model](/en-US/docs/Web/CSS/Guides/Box_model) không được khuyến nghị. Animate bất kỳ thuộc tính mô hình hộp nào đều tốn nhiều CPU; hãy cân nhắc animate thuộc tính [transform](/en-US/docs/Web/CSS/Reference/Properties/transform) thay thế.

### Mặt trời mọc

Ở đây chúng ta animate một mặt trời vàng trên nền trời xanh nhạt. Mặt trời mọc lên trung tâm của khung nhìn và sau đó rơi ra khỏi tầm nhìn.

```html
<div class="sun"></div>
```

```css
:root {
  overflow: hidden; /* hides any part of the sun below the horizon */
  background-color: lightblue;
  display: flex;
  justify-content: center; /* centers the sun in the background */
}

.sun {
  background-color: yellow;
  border-radius: 50%; /* creates a circular background */
  height: 100vh; /* makes the sun the size of the viewport */
  aspect-ratio: 1 / 1;
  animation: 4s linear 0s infinite alternate sun-rise;
}

@keyframes sun-rise {
  from {
    /* pushes the sun down past the viewport */
    transform: translateY(110vh);
  }
  to {
    /* returns the sun to its default position */
    transform: translateY(0);
  }
}
```

{{EmbedLiveSample('Sun_Rise')}}

### Animate nhiều thuộc tính

Tiếp tục animation mặt trời trong ví dụ trước, chúng ta thêm animation thứ hai thay đổi màu của mặt trời khi nó mọc và lặn. Mặt trời bắt đầu với màu đỏ tối khi ở dưới đường chân trời và chuyển sang màu cam sáng khi đạt đỉnh.

```html
<div class="sun"></div>
```

```css
:root {
  overflow: hidden;
  background-color: lightblue;
  display: flex;
  justify-content: center;
}

.sun {
  background-color: yellow;
  border-radius: 50%;
  height: 100vh;
  aspect-ratio: 1 / 1;
  animation: 4s linear 0s infinite alternate animating-multiple-properties;
}

/* it is possible to animate multiple properties in a single animation */
@keyframes animating-multiple-properties {
  from {
    transform: translateY(110vh);
    background-color: red;
    filter: brightness(75%);
  }
  to {
    transform: translateY(0);
    background-color: orange;
    /* unset properties i.e. 'filter' will revert to default values */
  }
}
```

{{EmbedLiveSample('Animating Multiple Properties')}}

### Áp dụng nhiều animation

Đây là mặt trời mọc và lặn trên nền xanh nhạt. Mặt trời dần dần thay đổi qua cầu vồng màu sắc. Thời gian của vị trí và màu sắc của mặt trời là độc lập.

```html
<div class="sun"></div>
```

```css
:root {
  overflow: hidden;
  background-color: lightblue;
  display: flex;
  justify-content: center;
}

.sun {
  background-color: yellow;
  border-radius: 50%;
  height: 100vh;
  aspect-ratio: 1 / 1;
  /* multiple animations are separated by commas, each animation's parameters are set independently */
  animation:
    4s linear 0s infinite alternate rise,
    24s linear 0s infinite psychedelic;
}

@keyframes rise {
  from {
    transform: translateY(110vh);
  }
  to {
    transform: translateY(0);
  }
}

@keyframes psychedelic {
  from {
    filter: hue-rotate(0deg);
  }
  to {
    filter: hue-rotate(360deg);
  }
}
```

{{EmbedLiveSample('Applying Multiple Animations')}}

### Cascade nhiều animation

Đây là mặt trời vàng trên nền xanh nhạt. Mặt trời nảy giữa bên trái và bên phải của khung nhìn. Mặt trời vẫn nằm trong khung nhìn ngay cả khi animation rise được định nghĩa. Thuộc tính transform của animation rise bị 'ghi đè' bởi animation bounce.

```html
<div class="sun"></div>
```

```css
:root {
  overflow: hidden;
  background-color: lightblue;
  display: flex;
  justify-content: center;
}

.sun {
  background-color: yellow;
  border-radius: 50%;
  height: 100vh;
  aspect-ratio: 1 / 1;
  /*
    animations declared later in the cascade will override the
    properties of previously declared animations
  */
  /* bounce 'overwrites' the transform set by rise, hence the sun only moves horizontally */
  animation:
    4s linear 0s infinite alternate rise,
    4s linear 0s infinite alternate bounce;
}

@keyframes rise {
  from {
    transform: translateY(110vh);
  }
  to {
    transform: translateY(0);
  }
}

@keyframes bounce {
  from {
    transform: translateX(-50vw);
  }
  to {
    transform: translateX(50vw);
  }
}
```

{{EmbedLiveSample('Cascading Multiple Animations')}}

Xem [Using CSS animations](/en-US/docs/Web/CSS/Guides/Animations/Using#examples) để biết thêm ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using CSS animations](/en-US/docs/Web/CSS/Guides/Animations/Using)
- JavaScript {{domxref("AnimationEvent")}} API
