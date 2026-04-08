---
title: animation-range-start
slug: Web/CSS/Reference/Properties/animation-range-start
page-type: css-property
browser-compat: css.properties.animation-range-start
sidebar: cssref
---

Thuộc tính **`animation-range-start`** trong [CSS](/en-US/docs/Web/CSS) đặt điểm trên dòng thời gian nơi hoạt ảnh sẽ bắt đầu.

## Cú pháp

```css
/* Giá trị từ khóa hoặc phần trăm độ dài */
animation-range-start: normal;
animation-range-start: 20%;
animation-range-start: 100px;

/* Giá trị phạm vi dòng thời gian có tên */
animation-range-start: cover;
animation-range-start: contain;
animation-range-start: cover 20%;
animation-range-start: contain 100px;

/* Giá trị toàn cục */
animation-range-start: inherit;
animation-range-start: initial;
animation-range-start: revert;
animation-range-start: revert-layer;
animation-range-start: unset;
```

### Giá trị

- `normal`
  - : Đại diện cho điểm bắt đầu của dòng thời gian. Đây là giá trị mặc định.
- {{cssxref("length-percentage")}}
  - : Chỉ định giá trị độ dài hoặc phần trăm được đo từ đầu dòng thời gian.
- {{cssxref("timeline-range-name")}}
  - : Chỉ định phạm vi dòng thời gian được đặt tên trong dòng thời gian tổng thể. Phạm vi bắt đầu tại `0%`.
- `<timeline-range-name> <length-percentage>`
  - : Chỉ định giá trị độ dài hoặc phần trăm được đo từ đầu phạm vi dòng thời gian được đặt tên cụ thể.

## Mô tả

Các giá trị được phép cho thuộc tính `animation-range-start` là `normal`, {{cssxref("length-percentage")}}, `<timeline-range-name>`, hoặc `<timeline-range-name>` theo sau bởi `<length-percentage>`. Nếu giá trị {{cssxref("timeline-range-name")}} không bao gồm `<length-percentage>`, mặc định là `0%`.
Xem {{cssxref("animation-range")}} để biết mô tả chi tiết về các giá trị có thể.
Ngoài ra, hãy xem [Trình trực quan hóa dòng thời gian tiến trình view](https://scroll-driven-animations.style/tools/view-timeline/ranges/), cho thấy ý nghĩa của các giá trị khác nhau theo định dạng trực quan dễ theo dõi.

`animation-range-start` được bao gồm trong viết tắt {{cssxref("animation")}} như một giá trị chỉ đặt lại. Điều này có nghĩa là sử dụng viết tắt `animation` sẽ đặt lại bất kỳ giá trị `animation-range-start` đã khai báo trước có độ đặc hiệu bằng hoặc thấp hơn về `normal`; viết tắt không thể được dùng để đặt giá trị `animation-range-start` mới. Khi tạo [hoạt ảnh cuộn trang CSS](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations), bạn nên khai báo `animation-range-start` _sau_ khai báo bất kỳ viết tắt `animation` nào để tránh đặt lại giá trị về `normal`.

`animation-range-start`, cùng với thuộc tính {{cssxref("animation-range-end")}}, cũng có thể được đặt bằng viết tắt {{cssxref("animation-range")}}.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Tạo dòng thời gian tiến trình cuộn trang view với điểm bắt đầu phạm vi

Trong ví dụ này, `animation-range-start` được áp dụng cho một phần tử được tạo hoạt ảnh thông qua dòng thời gian tiến trình cuộn trang. Điều này khiến hoạt ảnh bắt đầu trước khi phần tử vào scrollport.

#### HTML

```html-nolint hidden
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
    Dolor sed viverra ipsum nunc aliquet. Sed sed risus pretium quam vulputate
    dignissim. Tortor aliquam nulla facilisi cras. A erat nam at lectus urna
    duis convallis convallis. Nibh ipsum consequat nisl vel pretium lectus.
    Sagittis aliquam malesuada bibendum arcu vitae elementum. Malesuada bibendum
    arcu vitae elementum curabitur vitae nunc sed velit.
  </p>
```

Ở giữa một khối văn bản dài, chúng ta đã thêm một phần tử mà chúng ta sẽ tạo hoạt ảnh. Chúng ta đã thêm rất nhiều văn bản để đảm bảo nội dung tràn ra ngoài container; phần văn bản thừa được ẩn ở đây để ngắn gọn.

```html
<div class="animatedElement"></div>
```

```html hidden
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
</div>
```

#### CSS

Dòng thời gian tiến trình cuộn trang được định nghĩa bằng cách đặt hàm {{cssxref("animation-timeline/scroll", "scroll()")}} làm giá trị của thuộc tính {{cssxref("animation-timeline")}}. Khai báo này được đặt **sau** viết tắt {{cssxref("animation")}} để tránh đặt lại giá trị thuộc tính dạng dài.

Chúng ta cũng đặt `animation-range-start` để hoạt ảnh bắt đầu sớm hơn mong đợi.

```css
.animatedElement {
  background-color: deeppink;

  animation: appear 1ms linear;

  animation-timeline: scroll();
  animation-range-start: -25%;
}

@keyframes appear {
  from {
    background-color: rebeccapurple;
    opacity: 0;
    transform: scaleX(0);
  }

  to {
    background-color: darkturquoise;
    opacity: 0.75;
    transform: scaleX(0.75);
  }
}
```

Các kiểu khác được áp dụng trong ví dụ này đã được ẩn ở đây để ngắn gọn.

```css hidden
.animatedElement {
  height: 200px;
  margin: 0 auto;
  background-color: deeppink;
}

.content {
  width: 75%;
  max-width: 800px;
  margin: 0 auto;
}

p,
h1 {
  font-family: "Helvetica", "Arial", sans-serif;
}

h1 {
  font-size: 3rem;
}

p {
  font-size: 1.5rem;
  line-height: 1.5;
}

@supports not (animation-range-start: normal) {
  body::before {
    content: "Your browser does not support the 'animation-range-start' property.";
    color: black;
    background-color: wheat;
    display: block;
    text-align: center;
    padding: 1rem 0;
  }
}
```

#### Kết quả

Cuộn để xem phần tử tạo hoạt ảnh. Lưu ý cách phần tử đã được phóng to và bán trong suốt khi nó vào viewport. Điều này là do phần tử bắt đầu tạo hoạt ảnh trước khi vào viewport.

{{EmbedLiveSample("Creating a named view progress timeline with range start", "100%", "480px")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("animation-timeline")}}
- {{cssxref("animation-range")}}
- {{cssxref("animation-range-end")}}
- {{cssxref("view-timeline-inset")}}
- {{domxref("Element.animate()")}} thuộc tính `rangeStart`
- [Dòng thời gian hoạt ảnh cuộn trang](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines)
- [Hiểu tên phạm vi dòng thời gian](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timeline_range_names)
- [Hoạt ảnh cuộn trang CSS](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations) module
- [Dòng thời gian tiến trình view: Trình trực quan hóa phạm vi và tiến trình hoạt ảnh](https://scroll-driven-animations.style/tools/view-timeline/ranges/)
