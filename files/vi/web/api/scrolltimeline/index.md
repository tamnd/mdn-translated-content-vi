---
title: ScrollTimeline
slug: Web/API/ScrollTimeline
page-type: web-api-interface
browser-compat: api.ScrollTimeline
---

{{APIRef("Web Animations")}}

Giao diện **`ScrollTimeline`** của {{domxref("Web Animations API", "Web Animations API", "", "nocode")}} đại diện cho một scroll progress timeline (xem [CSS scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations) để biết thêm chi tiết).

Truyền một thực thể `ScrollTimeline` vào hàm khởi tạo {{domxref("Animation.Animation", "Animation()")}} hoặc phương thức {{domxref("Element.animate()", "animate()")}} để chỉ định nó làm timeline kiểm soát tiến trình của animation.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("ScrollTimeline.ScrollTimeline", "ScrollTimeline()")}}
  - : Tạo một thực thể đối tượng `ScrollTimeline` mới.

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ lớp cha, {{domxref("AnimationTimeline")}}._

- {{domxref("ScrollTimeline.source", "source")}} {{ReadOnlyInline}}
  - : Trả về tham chiếu đến phần tử có thể cuộn (_scroller_) có vị trí cuộn đang điều khiển tiến trình của timeline và do đó là animation.
- {{domxref("ScrollTimeline.axis", "axis")}} {{ReadOnlyInline}}
  - : Trả về giá trị liệt kê đại diện cho trục cuộn đang điều khiển tiến trình của timeline.

## Phương thức phiên bản

_Giao diện này kế thừa các phương thức từ lớp cha, {{domxref("AnimationTimeline")}}._

## Ví dụ

### Hiển thị nguồn và trục của scroll progress timeline

Trong ví dụ này, chúng ta tạo animation cho một phần tử có `class` là `box` dọc theo view progress timeline, nó di chuyển ngang màn hình khi tài liệu cuộn. Chúng ta hiển thị phần tử `source` và `axis` cuộn vào một phần tử `output` ở góc trên bên phải.

#### HTML

HTML cho ví dụ được hiển thị bên dưới.

```html
<div class="content"></div>
<div class="box"></div>
<div class="output"></div>
```

#### CSS

CSS cho ví dụ trông như sau:

```css
.content {
  height: 2000px;
}

.box {
  width: 100px;
  height: 100px;
  border-radius: 10px;
  background-color: rebeccapurple;
  position: fixed;
  top: 20px;
  left: 0%;
}

.output {
  font-family: "Helvetica", "Arial", sans-serif;
  position: fixed;
  top: 5px;
  right: 5px;
}
```

#### JavaScript

Trong JavaScript, chúng ta lấy tham chiếu đến các `<div>` `box` và `output`, sau đó tạo một `ScrollTimeline` mới, chỉ định phần tử sẽ điều khiển tiến trình scroll timeline là phần tử document ({{htmlelement("html")}}), và trục cuộn là trục `block`. Sau đó chúng ta tạo animation cho phần tử `box` bằng Web Animations API. Cuối cùng, chúng ta hiển thị phần tử nguồn và trục trong phần tử `output`.

```js
const box = document.querySelector(".box");
const output = document.querySelector(".output");

const timeline = new ScrollTimeline({
  source: document.documentElement,
  axis: "block",
});

box.animate(
  {
    rotate: ["0deg", "720deg"],
    left: ["0%", "100%"],
  },
  {
    timeline,
  },
);

output.textContent = `Timeline source element: ${timeline.source.nodeName}. Timeline scroll axis: ${timeline.axis}`;
```

#### Kết quả

Cuộn để xem hộp được tạo animation.

{{EmbedLiveSample("Displaying the source and axis of a scroll progress timeline", "100%", "320px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- [CSS scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations)
- {{domxref("AnimationTimeline")}}, {{domxref("ViewTimeline")}}
