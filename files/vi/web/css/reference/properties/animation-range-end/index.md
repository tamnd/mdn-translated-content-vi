---
title: animation-range-end
slug: Web/CSS/Reference/Properties/animation-range-end
page-type: css-property
browser-compat: css.properties.animation-range-end
sidebar: cssref
---

Thuộc tính **`animation-range-end`** trong [CSS](/en-US/docs/Web/CSS) đặt điểm trên dòng thời gian nơi hoạt ảnh sẽ kết thúc.

## Cú pháp

```css
/* Giá trị từ khóa hoặc phần trăm độ dài */
animation-range-end: normal;
animation-range-end: 80%;
animation-range-end: 700px;

/* Giá trị phạm vi dòng thời gian có tên */
animation-range-end: cover;
animation-range-end: contain;
animation-range-end: cover 80%;
animation-range-end: contain 700px;

/* Giá trị toàn cục */
animation-range-end: inherit;
animation-range-end: initial;
animation-range-end: revert;
animation-range-end: revert-layer;
animation-range-end: unset;
```

### Giá trị

- `normal`
  - : Đại diện cho điểm kết thúc của dòng thời gian. Đây là giá trị mặc định.
- {{cssxref("length-percentage")}}
  - : Chỉ định giá trị độ dài hoặc phần trăm được đo từ đầu dòng thời gian.
- {{cssxref("timeline-range-name")}}
  - : Chỉ định phạm vi dòng thời gian được đặt tên trong dòng thời gian tổng thể. Phạm vi bắt đầu tại `0%`.
- `<timeline-range-name> <length-percentage>`
  - : Chỉ định giá trị độ dài hoặc phần trăm được đo từ đầu phạm vi dòng thời gian được đặt tên cụ thể.

## Mô tả

Thuộc tính `animation-range-end` chỉ định điểm kết thúc của phạm vi đính kèm của hoạt ảnh. Thay đổi điểm kết thúc của phạm vi đính kèm có thể dịch chuyển điểm kết thúc của hoạt ảnh, tức là điểm mà các keyframe được ánh xạ đến `100%` tiến trình đáp xuống khi số lần lặp lại là `1`, và cũng có thể rút ngắn thời lượng hiệu quả của hoạt ảnh.

Giá trị thuộc tính có thể là `normal`, `<length-percentage>`, hoặc {{cssxref("timeline-range-name")}} với `<length-percentage>` tùy chọn. Nếu giá trị `<timeline-range-name>` không bao gồm `<length-percentage>`, mặc định là `100%`.

Thuộc tính `animation-range-end` được bao gồm trong viết tắt {{cssxref("animation")}} như một giá trị chỉ đặt lại. Điều này có nghĩa là sử dụng viết tắt `animation` sẽ đặt lại bất kỳ giá trị `animation-range-end` đã khai báo trước về `normal`; viết tắt không thể được dùng để đặt giá trị `animation-range-end` mới. Khi tạo [hoạt ảnh cuộn trang CSS](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations), bạn nên khai báo `animation-range-end` _sau_ khai báo bất kỳ viết tắt `animation` nào để tránh đặt lại giá trị về `normal`.

Thuộc tính `animation-range-end`, cùng với thuộc tính {{cssxref("animation-range-start")}}, cũng có thể được đặt bằng viết tắt {{cssxref("animation-range")}}.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Tạo dòng thời gian tiến trình view với điểm kết thúc phạm vi

Trong ví dụ này, `animation-range-end` được áp dụng cho một phần tử được tạo hoạt ảnh thông qua dòng thời gian tiến trình view. Điều này khiến hoạt ảnh đạt đến keyframe cuối cùng trước khi phần tử đến cuối viewport chứa nó.

#### HTML

```html hidden
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
</div>
```

Ở giữa một khối văn bản dài, chúng ta đã thêm một phần tử mà chúng ta sẽ tạo hoạt ảnh. Chúng ta đã thêm rất nhiều văn bản để đảm bảo nội dung tràn ra ngoài container; phần văn bản thừa được ẩn ở đây để ngắn gọn.

```html-nolint
<div class="animatedElement">
```

```html-nolint hidden
<p>
  Adipiscing enim eu turpis egestas pretium aenean pharetra magna ac. Arcu
  cursus vitae congue mauris rhoncus aenean vel. Sit amet cursus sit amet
  dictum. Augue neque gravida in fermentum et. Gravida rutrum quisque non tellus
  orci ac auctor augue mauris. Risus quis varius quam quisque id diam vel quam
  elementum. Nibh praesent tristique magna sit amet purus gravida quis. Duis
  ultricies lacus sed turpis tincidunt id aliquet. In egestas erat imperdiet sed
  euismod nisi. Eget egestas purus viverra accumsan in nisl nisi scelerisque.
  Netus et malesuada fames ac.
</p>
<p>
```

Chúng ta cũng thêm một checkbox sẽ bật/tắt thuộc tính {{cssxref("animation-fill-mode")}}, để bạn có thể xem thuộc tính này ảnh hưởng như thế nào đến các hoạt ảnh có dòng thời gian rút ngắn.

```html
<label>
  <input type="checkbox" /> Add <code>animation-fill-mode: forwards;</code>
</label>
```

```html hidden
  </p>
</div>
```

#### CSS

Chúng ta đã xác định một dòng thời gian tiến trình view bằng cách đặt hàm {{cssxref("animation-timeline/view", "view()")}} làm giá trị của thuộc tính {{cssxref("animation-timeline")}}. Khai báo này được đặt **sau** viết tắt {{cssxref("animation")}} để tránh đặt lại giá trị thuộc tính dạng dài.

Chúng ta cũng đặt `animation-range-end` để hoạt ảnh kết thúc sớm hơn mong đợi.

```css
.animatedElement {
  background-color: deeppink;
  animation: appear 1ms linear;
  animation-timeline: view();
  animation-range-end: exit 25%;
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

Khi checkbox được chọn, thuộc tính `animation-fill-mode` được áp dụng cho phần tử có hoạt ảnh:

```css
:has(:checked) .animatedElement {
  animation-fill-mode: forwards;
}
```

Các kiểu khác được áp dụng trong ví dụ này đã được ẩn ở đây để ngắn gọn.

```css hidden
.animatedElement {
  width: 300px;
  height: 200px;
  margin: 0 auto;
  background-color: deeppink;
}

:has(:checked) .animatedElement {
  animation-fill-mode: both;
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
@supports not (animation-range-end: normal) {
  body::before {
    content: "Your browser does not support the 'animation-range-end' property.";
    color: black;
    background-color: wheat;
    display: block;
    text-align: center;
    padding: 1rem 0;
  }
}
```

#### Kết quả

Cuộn để xem phần tử tạo hoạt ảnh. Sau đó bật/tắt checkbox ở cuối khối văn bản và cuộn lại. Lưu ý cách phần tử kết thúc hoạt ảnh khi đi qua 75% viewport, và cách nó trở về trạng thái mặc định tại thời điểm đó khi thuộc tính `animation-fill-mode` không được áp dụng.

{{EmbedLiveSample("Creating a view progress timeline with a range end", "100%", "480px")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("animation-timeline")}}
- {{cssxref("animation-range")}}
- {{cssxref("animation-range-start")}}
- {{cssxref("view-timeline-inset")}}
- {{domxref("Element.animate()")}} thuộc tính `rangeStart`
- [Dòng thời gian hoạt ảnh cuộn trang](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines)
- [Hiểu tên phạm vi dòng thời gian](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timeline_range_names)
- [Hoạt ảnh cuộn trang CSS](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations) module
- [Dòng thời gian tiến trình view: Trình trực quan hóa phạm vi và tiến trình hoạt ảnh](https://scroll-driven-animations.style/tools/view-timeline/ranges/)
