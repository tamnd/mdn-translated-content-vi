---
title: view-timeline-axis
slug: Web/CSS/Reference/Properties/view-timeline-axis
page-type: css-property
browser-compat: css.properties.view-timeline-axis
sidebar: cssref
---

Thuộc tính **`view-timeline-axis`** của [CSS](/vi/docs/Web/CSS) chỉ định hướng cuộn được dùng cho [tiến trình xem được đặt tên](/vi/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines#named_view_progress_timeline).

## Cú pháp

```css
/* Các giá trị thuộc tính logic */
view-timeline-axis: block;
view-timeline-axis: inline;

/* Các giá trị thuộc tính vật lý */
view-timeline-axis: y;
view-timeline-axis: x;

/* Giá trị toàn cục */
view-timeline-axis: inherit;
view-timeline-axis: initial;
view-timeline-axis: revert;
view-timeline-axis: revert-layer;
view-timeline-axis: unset;
```

### Giá trị

- `<axis>`
  - : Chỉ định hướng cuộn được sử dụng bởi tiến trình xem. Giá trị có thể là một trong các từ khóa {{cssxref("axis")}}: `block`, `inline`, `x` hoặc `y`. Giá trị mặc định là `block`.

## Mô tả

Thuộc tính `view-timeline-axis` chỉ định hướng, hay `<axis>`, của [tiến trình xem được đặt tên](/vi/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines#named_view_progress_timeline) dựa trên hộp của phần tử.

Theo mặc định, các hoạt ảnh CSS {{cssxref("@keyframes")}} tiến triển theo tiến trình đồng hồ dựa trên thời gian. Khi bạn đặt tiến trình hoạt ảnh qua tiến trình xem thay vào đó, `view-timeline-axis` chỉ định hướng điều khiển tiến trình đồng hồ.

Đối với tiến trình xem, tiến trình của hoạt ảnh theo tiến trình đồng hồ dựa trên khả năng hiển thị của phần tử, hay _subject_. Thuộc tính `view-timeline-axis` được đặt trên subject.

Subject phải được lồng bên trong một phần tử có thể cuộn. Nếu phần tử có thể cuộn không tràn vùng chứa theo chiều của trục hoặc nếu phần tràn bị ẩn hoặc bị cắt, sẽ không tạo ra tiến trình cuộn nào.

Thuộc tính `view-timeline-axis`, cùng với {{cssxref("view-timeline-inset")}} và {{cssxref("view-timeline-name")}}, là thành phần của thuộc tính viết tắt {{cssxref("view-timeline")}}.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Xác định trục của tiến trình xem

Trong ví dụ này, tiến trình xem được đặt tên `--subject-reveal` được xác định bằng thuộc tính `view-timeline-name` trên phần tử subject có class là "animation". Tiến trình này sau đó được áp dụng cho hoạt ảnh trên cùng phần tử đó bằng `animation-timeline: --subject-reveal;`.

Để minh họa tác động của `view-timeline-axis`, thanh cuộn ngang (không mặc định) được sử dụng trong ví dụ này để điều khiển hoạt ảnh.

#### HTML

HTML cho ví dụ được hiển thị bên dưới.

```html
<div class="content">
  <p>
    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua.
  </p>

  <p>
    Risus quis varius quam quisque id. Et ligula ullamcorper malesuada proin
    libero nunc consequat interdum varius. Elit ullamcorper dignissim cras
    tincidunt lobortis feugiat vivamus at augue.
  </p>

  <p>
    Dolor sed viverra ipsum nunc aliquet. Sed sed risus pretium quam vulputate
    dignissim. Tortor aliquam nulla facilisi cras.
  </p>

  <p>
    A erat nam at lectus urna duis convallis convallis. Nibh ipsum consequat
    nisl vel pretium lectus.
  </p>

  <p>
    Sagittis aliquam malesuada bibendum arcu vitae elementum. Malesuada bibendum
    arcu vitae elementum curabitur vitae nunc sed velit.
  </p>

  <div class="subject animation"></div>

  <p>
    Adipiscing enim eu turpis egestas pretium aenean pharetra magna ac. Arcu
    cursus vitae congue mauris rhoncus aenean vel. Sit amet cursus sit amet
    dictum. Augue neque gravida in fermentum et. Gravida rutrum quisque non
    tellus orci ac auctor augue mauris.
  </p>
</div>
```

#### CSS

Trong CSS, chúng ta đặt phần tử `subject` làm nguồn của tiến trình xem được đặt tên `--subject-reveal` bằng thuộc tính `view-timeline-name`.
Trục cuộn được đặt bằng `view-timeline-axis: x;`. Chúng ta cũng thêm `view-timeline-axis: horizontal;` cho các trình duyệt hỗ trợ giá trị cũ không chuẩn `horizontal` và `vertical`, thay vì `x` và `y`.

Phần tử tổ tiên `content` được làm tràn theo chiều ngang bằng cách bố cục nội dung của nó với `display: flex;` và `flex-flow: column wrap;`.

```css
.subject {
  width: 300px;
  height: 200px;
  margin: 0 auto;
  background-color: deeppink;
}

.content {
  width: 50%;
  height: 400px;
  margin-top: 30px;
  display: flex;
  flex-flow: column wrap;
  gap: 10px;
}

p {
  font-family: "Helvetica", "Arial", sans-serif;
}

p {
  font-size: 1.3rem;
  line-height: 1.4;
}

.animation {
  view-timeline-name: --subject-reveal;
  view-timeline-axis: x;
  view-timeline-axis: horizontal;

  animation: appear 1ms linear both;
  animation-timeline: --subject-reveal;
}

@keyframes appear {
  from {
    opacity: 0;
    transform: scaleX(0);
  }

  to {
    opacity: 1;
    transform: scaleX(1);
  }
}
```

```css hidden
@layer no-support {
  body::before {
    display: block;
    text-align: center;
    padding: 1em;
  }
  @supports not (view-timeline-axis: inherit) {
    body::before {
      content: "Your browser doesn't support the `view-timeline-axis` property.";
      background-color: wheat;
    }
  }
  @supports (view-timeline-axis: horizontal) {
    body::before {
      content: "Your browser supports legacy values for the `view-timeline-axis` property.";
      background-color: yellow;
    }
  }
}
```

#### Kết quả

Cuộn thanh ngang ở phía dưới để xem phần tử subject được hoạt ảnh hóa khi bạn cuộn.

{{EmbedLiveSample("Defining_the_axis_of_the_view_progress_timeline", "100%", "450px")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("animation-timeline")}}
- {{cssxref("view-timeline")}}, {{cssxref("view-timeline-inset")}}, {{cssxref("view-timeline-name")}}
- {{cssxref("animation-timeline/view", "view()")}}
- [Hướng dẫn: Tiến trình đồng hồ hoạt ảnh cuộn](/vi/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines)
- Module [Hoạt ảnh cuộn CSS](/vi/docs/Web/CSS/Guides/Scroll-driven_animations)
- Module [Hoạt ảnh CSS](/vi/docs/Web/CSS/Guides/Animations)
