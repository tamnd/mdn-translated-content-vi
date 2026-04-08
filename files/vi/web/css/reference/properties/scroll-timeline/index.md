---
title: scroll-timeline
slug: Web/CSS/Reference/Properties/scroll-timeline
page-type: css-shorthand-property
browser-compat: css.properties.scroll-timeline
sidebar: cssref
---

Thuộc tính **`scroll-timeline`** [CSS](/en-US/docs/Web/CSS) là một [thuộc tính viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) dùng để định nghĩa một [dòng thời gian tiến trình cuộn có tên](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines#named_scroll_progress_timelines), tiến trình này được điều khiển bằng cách cuộn một phần tử có thể cuộn (_scroller_) từ trên xuống dưới (hoặc từ trái sang phải).

## Các thuộc tính thành phần

Thuộc tính này là viết tắt của các thuộc tính CSS sau, theo thứ tự:

- {{cssxref("scroll-timeline-name")}}
- {{cssxref("scroll-timeline-axis")}}

## Cú pháp

```css
/* Một giá trị */
scroll-timeline: none;
scroll-timeline: --custom_name_for_timeline;

/* Hai giá trị */
scroll-timeline: --custom_name_for_timeline block;
scroll-timeline: --custom_name_for_timeline x;
scroll-timeline: none inline;
scroll-timeline: none y;

/* Giá trị toàn cục */
scroll-timeline: inherit;
scroll-timeline: initial;
scroll-timeline: revert;
scroll-timeline: revert-layer;
scroll-timeline: unset;
```

### Giá trị

- {{cssxref("scroll-timeline-name", "&lt;scroll-timeline-name>")}}
  - : Một {{cssxref("dashed-ident")}} hoặc từ khóa `none`.

- {{cssxref("scroll-timeline-axis", "&lt;scroll-timeline-axis>")}}
  - : Một từ khóa {{cssxref("axis")}}. Giá trị mặc định là `block`.

## Mô tả

Thuộc tính viết tắt `scroll-timeline` có thể được áp dụng cho phần tử container để đặt cả hai thuộc tính `scroll-timeline-name` và `scroll-timeline-axis`. Nó được đặt trên scroller sẽ cung cấp dòng thời gian. Nếu container không có nội dung tràn để cuộn, hoặc nếu tràn bị ẩn hoặc bị cắt, thì sẽ không có dòng thời gian nào được tạo.

Giá trị cho {{cssxref("scroll-timeline-name")}}, nếu không đặt thành `none`, phải là một {{cssxref("dashed-ident")}}, nghĩa là nó phải bắt đầu bằng `--`. Điều này giúp tránh xung đột tên với các từ khóa CSS chuẩn. Tên sau đó có thể được dùng làm giá trị của thuộc tính {{cssxref("animation-timeline")}} của phần tử để định nghĩa phần tử container cuộn sẽ xác định [dòng thời gian hoạt ảnh](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines#named_scroll_progress_timelines) của nó, điều khiển tiến trình hoạt ảnh khi cuộn.

Giá trị {{cssxref("axis")}} cuộn tùy chọn định nghĩa {{cssxref("scroll-timeline-axis")}}, mặc định là `block` nếu bỏ qua. Nếu cả tên và trục đều được chỉ định, thứ tự phải là giá trị `<scroll-timeline-name>` theo sau là giá trị `<axis>`. Nếu `<axis>` được liệt kê trước, khai báo sẽ không hợp lệ và bị bỏ qua.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Tạo hoạt ảnh dòng thời gian tiến trình cuộn có tên

Trong ví dụ này, dòng thời gian cuộn có tên `--square-timeline` được định nghĩa bằng thuộc tính `scroll-timeline-name` trên phần tử `#container`.
Tên dòng thời gian sau đó được áp dụng cho hoạt ảnh trên phần tử `#square` bằng `animation-timeline: --square-timeline`.

#### HTML

Chúng ta bao gồm một container với hai phần tử `<div>` con.

```html
<div id="container">
  <div id="square"></div>
  <div id="stretcher"></div>
</div>
```

#### CSS

Chúng ta đặt container cao `300px` để tạo cuộn dọc.

Sử dụng thuộc tính `scroll-timeline`, chúng ta định nghĩa container là nguồn của dòng thời gian cuộn có tên `--square-timeline`, đặt rõ ràng thanh cuộn dọc mặc định làm bộ điều khiển dòng thời gian.

```css
#container {
  height: 300px;
  overflow-y: scroll;

  scroll-timeline: --square-timeline y;
  /* Firefox hỗ trợ cú pháp không chuẩn vertical/horizontal */
  scroll-timeline: --square-timeline vertical;

  position: relative;
}
```

Chúng ta cung cấp các kiểu cơ bản cho hình vuông. Chúng ta áp dụng `rotateAnimation` bằng thuộc tính {{cssxref("animation-name")}}. Theo mặc định, điều này sẽ sử dụng dòng thời gian tài liệu dựa trên thời gian. Bằng cách đặt thuộc tính `animation-timeline` thành dòng thời gian `--square-timeline` được đặt tên ở trên, chúng ta đặt hình vuông quay theo dòng thời gian dựa trên cuộn, tiến triển khi container cuộn.

```css
#square {
  background-color: deeppink;
  width: 100px;
  height: 100px;
  position: absolute;
  bottom: 0;

  animation: rotateAnimation 1ms linear;
  animation-timeline: --square-timeline;
}
```

Chúng ta đảm bảo container tràn bằng cách định nghĩa một stretcher rộng hơn phần tử cha.
Không có nội dung tràn khỏi container, sẽ không có thanh cuộn, và do đó không có dòng thời gian cuộn. Chúng ta cũng định nghĩa một hoạt ảnh keyframe CSS xoay các phần tử được áp dụng nó một vòng đầy đủ.

```css
#stretcher {
  height: 600px;
  background: #dedede;
}

@keyframes rotateAnimation {
  from {
    transform: rotate(0deg);
  }

  to {
    transform: rotate(360deg);
  }
}
```

```css hidden
@layer no-support {
  @supports not (scroll-timeline: --square-timeline) {
    body::before {
      content: "Your browser doesn't support the `scroll-timeline` property.";
      background-color: wheat;
      display: block;
      text-align: center;
      padding: 1em;
    }
  }
}
```

#### Kết quả

Cuộn thanh dọc để xem hình vuông hoạt ảnh khi bạn cuộn.

{{EmbedLiveSample("Creating_a_named_scroll_progress_timeline_animation", "100%", "320px")}}

Hình vuông hoạt ảnh khi bạn cuộn. Khi sử dụng `scroll-timeline`, thời lượng hoạt ảnh phụ thuộc vào tốc độ cuộn của bạn, không phải giá trị của thuộc tính `animation-duration`.

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("animation-timeline")}}
- {{cssxref("scroll-timeline-axis")}}
- {{cssxref("scroll-timeline-name")}}
- [Hướng dẫn: Dòng thời gian hoạt ảnh cuộn](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines)
- Module [CSS scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations)
- Module [CSS animations](/en-US/docs/Web/CSS/Guides/Animations)
