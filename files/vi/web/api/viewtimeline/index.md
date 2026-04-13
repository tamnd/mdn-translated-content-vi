---
title: ViewTimeline
slug: Web/API/ViewTimeline
page-type: web-api-interface
browser-compat: api.ViewTimeline
---

{{APIRef("Web Animations")}}

Giao diện **`ViewTimeline`** của {{domxref("Web Animations API", "Web Animations API", "", "nocode")}} biểu diễn một dòng thời gian tiến trình khung nhìn (view progress timeline) (xem [CSS scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations) để biết thêm chi tiết).

Truyền một phiên bản `ViewTimeline` vào hàm khởi tạo {{domxref("Animation.Animation", "Animation()")}} hoặc phương thức {{domxref("Element.animate()", "animate()")}} để chỉ định nó làm dòng thời gian kiểm soát tiến trình của hoạt ảnh.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("ViewTimeline.ViewTimeline", "ViewTimeline()")}}
  - : Tạo một phiên bản đối tượng `ViewTimeline` mới.

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính của cha nó, {{domxref("ScrollTimeline")}}._

- {{domxref("ViewTimeline.subject", "subject")}} {{ReadOnlyInline}}
  - : Trả về tham chiếu đến phần tử subject mà khả năng hiển thị của nó trong phần tử scrollable tổ tiên gần nhất (scroller) đang điều khiển tiến trình của dòng thời gian và do đó là hoạt ảnh.
- {{domxref("ViewTimeline.startOffset", "startOffset")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("CSSNumericValue")}} biểu diễn vị trí cuộn bắt đầu (tiến trình 0%) của dòng thời gian như một độ lệch từ đầu phần nội dung tràn trong scroller.
- {{domxref("ViewTimeline.endOffset", "endOffset")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("CSSNumericValue")}} biểu diễn vị trí cuộn kết thúc (tiến trình 100%) của dòng thời gian như một độ lệch từ đầu phần nội dung tràn trong scroller.

## Phương thức phiên bản

_Giao diện này kế thừa các phương thức của cha nó, {{domxref("ScrollTimeline")}}._

## Ví dụ

### Hiển thị subject và các offset của dòng thời gian tiến trình khung nhìn

Trong ví dụ này, chúng ta tạo hoạt ảnh cho một phần tử với `class` là `subject` dọc theo dòng thời gian tiến trình khung nhìn. Chúng ta cũng xuất các giá trị `subject`, `startOffset`, và `endOffset` ra một phần tử output ở góc trên bên phải.

#### HTML

```html
<div class="content">
  <h1>Content</h1>

  <p>
    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Risus quis varius quam
    quisque id. Et ligula ullamcorper malesuada proin libero nunc consequat
    interdum varius. Elit ullamcorper dignissim cras tincidunt lobortis feugiat
    vivamus at augue.
  </p>

  <p>
    Dolor sed viverra ipsum nunc aliquet. Sed risus pretium quam vulputate
    dignissim. Tortor aliquam nulla facilisi cras. A erat nam at lectus urna
    duis convallis convallis. Nibh ipsum consequat nisl vel pretium lectus.
    Sagittis aliquam malesuada bibendum arcu vitae elementum. Malesuada bibendum
    arcu vitae elementum curabitur vitae nunc sed velit.
  </p>

  <div class="subject animation"></div>

  <p>
    Adipiscing enim eu turpis egestas pretium aenean pharetra magna ac. Arcu
    cursus vitae congue mauris rhoncus aenean vel. Sit amet cursus sit amet
    dictum. Augue neque gravida in fermentum et. Gravida rutrum quisque non
    tellus orci ac auctor augue mauris. Risus quis varius quam quisque id diam
    vel quam elementum. Nibh praesent tristique magna sit amet purus gravida
    quis. Duis ultricies lacus sed turpis tincidunt id aliquet. In egestas erat
    imperdiet sed euismod nisi. Eget egestas purus viverra accumsan in nisl nisi
    scelerisque. Netus et malesuada fames ac.
  </p>

  <div class="output"></div>
</div>
```

#### CSS

```css
.subject {
  width: 300px;
  height: 200px;
  margin: 0 auto;
  background-color: deeppink;
}

.content {
  width: 75%;
  max-width: 800px;
  margin: 0 auto;
}

.output {
  position: fixed;
  top: 5px;
  right: 5px;
}

p,
h1,
div {
  font-family: "Helvetica", "Arial", sans-serif;
}

h1 {
  font-size: 3rem;
}

p {
  font-size: 1.5rem;
  line-height: 1.5;
}
```

#### JavaScript

```js
const subject = document.querySelector(".subject");
const output = document.querySelector(".output");

const timeline = new ViewTimeline({
  subject,
  axis: "block",
  inset: [CSS.px("200"), CSS.px("300")],
});

subject.animate(
  {
    opacity: [0, 1],
    transform: ["scaleX(0)", "scaleX(1)"],
  },
  {
    fill: "both",
    timeline,
  },
);

output.textContent += `Subject element: ${timeline.subject.nodeName}, `;
output.textContent += `start offset: ${timeline.startOffset}, `;
output.textContent += `end offset: ${timeline.endOffset}.`;
```

#### Kết quả

Cuộn để xem phần tử subject được tạo hoạt ảnh.

{{EmbedLiveSample("Tracking the progress of a view progress timeline", "100%", "480px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- [CSS scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations)
- {{domxref("AnimationTimeline")}}, {{domxref("ScrollTimeline")}}
