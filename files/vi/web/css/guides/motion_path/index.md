---
title: CSS motion path
short-title: Motion path
slug: Web/CSS/Guides/Motion_path
page-type: css-module
spec-urls: https://drafts.csswg.org/motion-1/
sidebar: cssref
---

Module **CSS motion path** cho phép tác giả tạo hoạt ảnh cho bất kỳ đối tượng đồ họa nào dọc theo một đường dẫn tùy chỉnh.

Module [CSS transforms](/en-US/docs/Web/CSS/Guides/Transforms) cung cấp các tính năng cho phép các hộp được định vị lại, xoay, thu phóng và nghiêng so với vị trí bố cục của nó, mà không làm gián đoạn bố cục của bất kỳ phần tử nào khác trên trang. Các transform này có thể được tạo hoạt ảnh và chuyển tiếp, nhưng chỉ theo những cách tương đối cơ bản.

Các tính năng của module CSS motion path cung cấp các offset transform: các transform căn chỉnh một điểm trên phần tử với một khoảng cách offset dọc theo một offset path, tùy chọn xoay phần tử đã được transform để theo hướng đường dẫn. Module này cho phép các khả năng transform mạnh mẽ, ví dụ:

- Định vị sử dụng tọa độ cực thay vì giới hạn transformation trong tọa độ {{cssxref("transform")}} hình chữ nhật tiêu chuẩn.
- Tạo hoạt ảnh cho một phần tử dọc theo một đường dẫn đã xác định.

CSS motion path cho phép định nghĩa các chuyển đổi không gian 2D phức tạp bằng cách tận dụng [các hàm shape CSS](/en-US/docs/Web/CSS/Reference/Values/Functions#shape_functions).

Ví dụ, bạn có thể định nghĩa một đường dẫn cụ thể với bất kỳ hình dạng nào bạn muốn với thuộc tính {{cssxref("offset-path")}}. Sau đó bạn có thể tạo hoạt ảnh cho một phần tử để di chuyển dọc theo đường dẫn đó bằng cách tạo hoạt ảnh thuộc tính {{cssxref("offset-distance")}}, và xoay nó tại bất kỳ điểm nào với thuộc tính {{cssxref("offset-rotate")}}.

## Motion path trong thực tế

```html hidden
<div id="heart">
  <div id="motion-demo"></div>
</div>
```

```css hidden
#motion-demo {
  offset-path: path(
    "M20,70 A40,40,0,0,1,100,70 A40,40,0,0,1,180,70 Q180,130,100,190 Q20,130,20,70 Z"
  );
  animation: move 3000ms infinite linear;
  width: 10px;
  height: 10px;
  background: red;
}

#heart {
  width: 200px;
  height: 200px;
  background-color: lightpink;
  clip-path: path(
    "M20,70 A40,40,0,0,1,100,70 A40,40,0,0,1,180,70 Q180,130,100,190 Q20,130,20,70 Z"
  );
}

@keyframes move {
  100% {
    offset-distance: 100%;
  }
}
```

{{EmbedLiveSample('Motion paths in action', '100%', 220)}}

Trong ví dụ này, chúng ta đã sử dụng [CSS masking](/en-US/docs/Web/CSS/Guides/Masking) và [CSS shapes](/en-US/docs/Web/CSS/Guides/Shapes) để cắt một container có nền hồng nhạt thành hình trái tim. Chúng ta đã sử dụng hàm {{cssxref("basic-shape/path","path()")}} làm giá trị của thuộc tính {{cssxref("clip-path")}}. Con của nó là một hộp đỏ `10px` x `10px` được làm cho theo dọc cạnh của phần tử cha. Chúng ta đã làm điều này bằng cách sử dụng cùng {{cssxref("basic-shape")}} làm đường dẫn, đặt thuộc tính {{cssxref("offset-path")}} của hộp thành cùng giá trị hàm `path()`. Chúng ta đã sử dụng [CSS animations](/en-US/docs/Web/CSS/Guides/Animations) để thay đổi {{cssxref("offset-distance")}} từ `0%` đến `100%` trong ba giây.

## Tham chiếu

### Thuộc tính

- Shorthand {{cssxref("offset")}}
- {{cssxref("offset-anchor")}}
- {{cssxref("offset-distance")}}
- {{cssxref("offset-path")}}
- {{cssxref("offset-position")}}
- {{cssxref("offset-rotate")}}

### Hàm

- {{cssxref("ray")}}

## Hướng dẫn

- [Sử dụng CSS animations](/en-US/docs/Web/CSS/Guides/Animations/Using)
  - : Hướng dẫn từng bước về cách tạo hoạt ảnh sử dụng CSS.

## Khái niệm liên quan

Module [CSS transforms](/en-US/docs/Web/CSS/Guides/Transforms)

- {{cssxref("transform")}}
- {{cssxref("transform-origin")}}
- {{cssxref("translate")}}

Module [CSS masking](/en-US/docs/Web/CSS/Guides/Masking)

- {{cssxref("clip-path")}}
- {{cssxref("clip-rule")}}

Module [CSS shapes](/en-US/docs/Web/CSS/Guides/Shapes)

- {{cssxref("basic-shape")}}
- {{cssxref("basic-shape/circle","circle()")}}
- {{cssxref("basic-shape/ellipse","ellipse()")}}
- {{cssxref("basic-shape/inset","inset()")}}
- {{cssxref("basic-shape/path","path()")}}
- {{cssxref("basic-shape/polygon","polygon()")}}
- {{cssxref("basic-shape/rect","rect()")}}
- {{cssxref("basic-shape/shape","shape()")}}
- {{cssxref("basic-shape/xywh","xywh()")}}

Module [CSS animations](/en-US/docs/Web/CSS/Guides/Animations)

- Shorthand {{cssxref("animation")}}
- {{cssxref("@keyframes")}}

Module [CSS box model](/en-US/docs/Web/CSS/Guides/Box_model)

- [`<coord-box>`](/en-US/docs/Web/CSS/Reference/Properties/offset-path#coord-box)

## Đặc tả

{{Specifications}}

## Xem thêm

- {{cssxref("&lt;position&gt;")}}
- {{cssxref("easing-function")}}
- Hàm {{cssxref("gradient/radial-gradient")}}
- Media query {{cssxref("@media/prefers-reduced-motion")}}
- Thuộc tính CSS {{cssxref("will-change")}}
