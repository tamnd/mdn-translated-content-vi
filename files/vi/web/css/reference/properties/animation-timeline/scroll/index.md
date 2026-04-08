---
title: scroll()
slug: Web/CSS/Reference/Properties/animation-timeline/scroll
page-type: css-function
browser-compat: css.properties.animation-timeline.scroll
sidebar: cssref
---

Hàm **`scroll()`** trong [CSS](/en-US/docs/Web/CSS/Reference/Values/Functions) có thể được dùng với thuộc tính {{cssxref("animation-timeline")}} để tạo [dòng thời gian tiến trình cuộn trang ẩn danh](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines#anonymous_scroll_progress_timelines), xác định scroller và trục của dòng thời gian.

## Cú pháp

```css
/* Không có đối số */
animation-timeline: scroll();

/* Chỉ đối số <scroller> */
animation-timeline: scroll(nearest);
animation-timeline: scroll(root);
animation-timeline: scroll(self);

/* Chỉ đối số `<axis>` */
animation-timeline: scroll(block);
animation-timeline: scroll(inline);
animation-timeline: scroll(y);
animation-timeline: scroll(x);

/* <scroller> và <axis> */
animation-timeline: scroll(block nearest);
animation-timeline: scroll(inline root);
animation-timeline: scroll(x self);
```

### Tham số

- `<scroller>`
  - : Phần tử scroller sẽ cung cấp dòng thời gian tiến trình cuộn trang. Các giá trị hợp lệ bao gồm:
    - `nearest`
      - : Tổ tiên gần nhất của phần tử hiện tại có thanh cuộn trên một trong hai trục. Đây là giá trị mặc định.
    - `root`
      - : Phần tử gốc của tài liệu.
    - `self`
      - : Bản thân phần tử hiện tại.

- `<axis>`
  - : Giá trị từ khóa {{ cssxref("axis") }} mô tả hướng, hay trục, của scrollport kiểm soát hoạt ảnh dựa trên cuộn trang. Giá trị mặc định là `block`.

## Mô tả

Hàm CSS `scroll()` có thể được dùng làm một giá trị đơn trong thuộc tính {{cssxref("animation-timeline")}} phân cách bằng dấu phẩy để chỉ định dòng thời gian tiến trình cuộn trang cho hoạt ảnh {{cssxref("@keyframes")}}. Nó xác định phần tử có thể cuộn (_scroller_) và trục thanh cuộn sẽ cung cấp dòng thời gian hoạt ảnh.

Theo mặc định, `scroll()` tham chiếu trục `block` của container cuộn `nearest`. Các giá trị scroller và trục có thể được chỉ định theo bất kỳ thứ tự nào.

Năm khai báo sau đây tương đương nhau:

```css
animation-timeline: scroll();
animation-timeline: scroll(block);
animation-timeline: scroll(nearest);
animation-timeline: scroll(block nearest);
animation-timeline: scroll(nearest block);
```

Dòng thời gian tiến trình cuộn trang được tiến triển bằng cách cuộn scroller theo chiều ngang hoặc dọc, tùy thuộc vào `<axis>` và [chế độ viết](/en-US/docs/Web/CSS/Guides/Writing_modes/Writing_mode_systems). Nếu trục được chỉ định không chứa thanh cuộn, dòng thời gian hoạt ảnh sẽ không hoạt động.

## Cú pháp hình thức

{{CSSSyntax}}

## Ví dụ

### Đặt dòng thời gian tiến trình cuộn trang ẩn danh

Trong ví dụ này, phần tử `#square` được tạo hoạt ảnh bằng dòng thời gian tiến trình cuộn trang ẩn danh, được áp dụng cho phần tử cần tạo hoạt ảnh bằng hàm `scroll()`.
Dòng thời gian trong ví dụ này được cung cấp bởi phần tử cha gần nhất có (bất kỳ) thanh cuộn, từ thanh cuộn theo hướng khối.

#### HTML

HTML cho ví dụ này được hiển thị bên dưới.

```html
<div id="container">
  <div id="square"></div>
  <div id="stretcher"></div>
</div>
```

#### CSS

CSS bên dưới định nghĩa một hình vuông xoay theo các hướng xen kẽ theo dòng thời gian được cung cấp bởi thuộc tính `animation-timeline`.
Trong trường hợp này, dòng thời gian được cung cấp bởi `scroll(block nearest)`, nghĩa là nó sẽ chọn thanh cuộn theo hướng khối của phần tử tổ tiên gần nhất có thanh cuộn; trong trường hợp này là thanh cuộn dọc của phần tử "container".

> [!NOTE]
> `block` và `nearest` thực ra là các giá trị tham số mặc định, vì vậy chúng ta có thể chỉ dùng `scroll()`.

```css
#square {
  background-color: deeppink;
  width: 100px;
  height: 100px;
  margin-top: 100px;
  position: absolute;
  bottom: 0;

  animation-name: rotateAnimation;
  animation-duration: 1ms; /* Firefox yêu cầu điều này để áp dụng hoạt ảnh */
  animation-direction: alternate;
  animation-timeline: scroll(block nearest);
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

CSS cho container đặt chiều cao của nó là 300px và chúng ta cũng đặt container tạo thanh cuộn dọc nếu nó tràn.
CSS "stretcher" đặt chiều cao khối là 600px, buộc phần tử container tràn.
Hai điều này cùng nhau đảm bảo container có thanh cuộn dọc, cho phép nó được dùng làm nguồn của dòng thời gian tiến trình cuộn trang ẩn danh.

```css
#container {
  height: 300px;
  overflow-y: scroll;
  position: relative;
}

#stretcher {
  height: 600px;
}
```

```css hidden
@layer no-support {
  @supports not (animation-timeline: scroll()) {
    body::before {
      content: "Your browser doesn't support the CSS `scroll()` function.";
      background-color: wheat;
      display: block;
      text-align: center;
      padding: 1em;
    }
  }
}
```

#### Kết quả

Cuộn để xem phần tử hình vuông được tạo hoạt ảnh.

{{EmbedLiveSample("Setting an anonymous scroll progress timeline", "100%", "320px")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng hoạt ảnh CSS](/en-US/docs/Web/CSS/Guides/Animations/Using)
- [Hoạt ảnh CSS](/en-US/docs/Web/CSS/Guides/Animations) module
- [Hoạt ảnh cuộn trang CSS](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations) module
- {{domxref("ScrollTimeline")}}
- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
