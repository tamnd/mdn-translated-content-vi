---
title: scroll-timeline-axis
slug: Web/CSS/Reference/Properties/scroll-timeline-axis
page-type: css-property
browser-compat: css.properties.scroll-timeline-axis
sidebar: cssref
---

Thuộc tính **`scroll-timeline-axis`** [CSS](/en-US/docs/Web/CSS) được dùng để chỉ định hướng thanh cuộn sẽ được sử dụng để cung cấp [dòng thời gian cho hoạt ảnh cuộn](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines), tiến trình này được điều khiển bằng cách cuộn một phần tử có thể cuộn (_scroller_).

## Cú pháp

```css
/* Giá trị thuộc tính logic */
scroll-timeline-axis: block;
scroll-timeline-axis: inline;

/* Giá trị thuộc tính vật lý */
scroll-timeline-axis: y;
scroll-timeline-axis: x;

/* Giá trị toàn cục */
scroll-timeline-axis: inherit;
scroll-timeline-axis: initial;
scroll-timeline-axis: revert;
scroll-timeline-axis: revert-layer;
scroll-timeline-axis: unset;
```

### Giá trị

- `<axis>`
  - : Giá trị từ khóa {{ cssxref("axis") }} mô tả hướng, hoặc trục, của scrollport điều khiển hoạt ảnh cuộn. Giá trị mặc định là `block`.

## Mô tả

Thuộc tính `scroll-timeline-axis` chỉ định thanh cuộn nào sẽ được sử dụng để cung cấp dòng thời gian cho hoạt ảnh [dòng thời gian tiến trình cuộn](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines). Giá trị là `<axis>` của thanh cuộn. Thuộc tính `scroll-timeline` được đặt trên scroller sẽ cung cấp dòng thời gian.

Nếu phần tử scroller không tràn container của nó theo chiều trục, hoặc nếu tràn bị ẩn hoặc bị cắt, thì sẽ không có dòng thời gian tiến trình cuộn nào được tạo.

Các thuộc tính `scroll-timeline-axis` và {{cssxref("scroll-timeline-name")}} cũng có thể được đặt bằng thuộc tính viết tắt {{cssxref("scroll-timeline")}}.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Định nghĩa trục của dòng thời gian tiến trình cuộn

Trong ví dụ này, dòng thời gian tiến trình cuộn có tên `--my-scroller` được định nghĩa bằng thuộc tính `scroll-timeline-name` trên phần tử <code>:root</code> ({{htmlelement("html")}}). Dòng thời gian này sau đó được áp dụng cho hoạt ảnh trên phần tử có class `animation` bằng `animation-timeline: --my-scroller`.

Để minh họa hiệu ứng của `scroll-timeline-axis`, thanh cuộn ngang (không mặc định) được dùng trong ví dụ này để điều khiển hoạt ảnh.

#### HTML

HTML cho ví dụ được hiển thị bên dưới.

```html
<body>
  <div class="content"></div>
  <div class="box animation"></div>
</body>
```

#### CSS

CSS cho container đặt <code>:root</code> làm nguồn của dòng thời gian tiến trình cuộn có tên `--my-scroller` bằng thuộc tính `scroll-timeline-name`.
Trục cuộn được đặt bằng `scroll-timeline-axis: x;` khiến vị trí _thanh cuộn ngang_ xác định dòng thời gian hoạt ảnh. Chúng ta cũng bao gồm `scroll-timeline-axis: horizontal;` cho các trình duyệt hỗ trợ giá trị legacy không chuẩn `horizontal` và `vertical` thay vì `x` và `y`.

Chiều rộng của phần tử `.content` được đặt thành giá trị lớn để tràn khỏi phần tử `:root`.

Phần tử `.animation` có hoạt ảnh được áp dụng bằng viết tắt {{cssxref("animation")}}, và dòng thời gian cuộn được đặt bằng {{cssxref("animation-timeline")}}.

```css
:root {
  scroll-timeline-name: --my-scroller;

  scroll-timeline-axis: x;
  scroll-timeline-axis: horizontal;
}

body {
  margin: 0;
  overflow-y: hidden;
}

.content {
  height: 100vh;
  width: 2000px;
}

.box {
  width: 100px;
  height: 100px;
  border-radius: 10px;
  background-color: rebeccapurple;
  position: fixed;
  top: 25px;
  left: 25px;
}

.animation {
  animation: rotate-appear 1ms linear;
  animation-timeline: --my-scroller;
}

@keyframes rotate-appear {
  from {
    rotate: 0deg;
    top: 0%;
  }

  to {
    rotate: 720deg;
    top: 100%;
  }
}
```

```css hidden
@layer no-support {
  @supports not (scroll-timeline-axis: block) {
    body::before {
      content: "Your browser doesn't support the `scroll-timeline-axis` property.";
      background-color: wheat;
      display: block;
      width: 100%;
      text-align: center;
    }
  }
}
```

#### Kết quả

Cuộn thanh ngang ở phía dưới để xem hình vuông hoạt ảnh khi bạn cuộn.

{{EmbedLiveSample("Defining_the_axis_of_the_scroll_progress_timeline", "100%", "200px")}}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("animation-timeline")}}
- {{cssxref("scroll-timeline")}}
- {{cssxref("scroll-timeline-name")}}
- [Dòng thời gian hoạt ảnh cuộn](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines)
- Module [CSS scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations)
