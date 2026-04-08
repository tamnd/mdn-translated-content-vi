---
title: view-timeline
slug: Web/CSS/Reference/Properties/view-timeline
page-type: css-shorthand-property
browser-compat: css.properties.view-timeline
sidebar: cssref
---

Thuộc tính viết tắt **`view-timeline`** của [CSS](/vi/docs/Web/CSS) xác định tên, hướng và giá trị inset của [tiến trình xem được đặt tên](/vi/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines#named_view_progress_timeline).

## Các thuộc tính thành phần

Thuộc tính này là viết tắt cho các thuộc tính CSS sau:

- {{cssxref("view-timeline-axis")}}
- {{cssxref("view-timeline-inset")}}
- {{cssxref("view-timeline-name")}}

## Cú pháp

```css
/* Một thành phần */
view-timeline: none;
view-timeline: --custom_name_for_timeline;

/* Hai thành phần */
view-timeline: --custom_name_for_timeline block;
view-timeline: --custom_name_for_timeline y;
view-timeline: none inline;
view-timeline: none x;

/* Ba thành phần */
view-timeline: --custom_name_for_timeline block auto;
view-timeline: --custom_name_for_timeline block 20% 200px;

/* Giá trị toàn cục */
view-timeline: inherit;
view-timeline: initial;
view-timeline: revert;
view-timeline: revert-layer;
view-timeline: unset;
```

### Giá trị

- `<view-timeline-name>`
  - : Xem {{cssxref("view-timeline-name")}}. Giá trị mặc định là `none`.
- `<view-timeline-inset>`
  - : Xem {{cssxref("view-timeline-inset")}}. Giá trị mặc định là `auto`.
- `<view-timeline-axis>`
  - : Xem {{cssxref("view-timeline-axis")}}. Giá trị mặc định là `block`.

### Mô tả

Thuộc tính viết tắt `view-timeline` xác định một _tiến trình xem được đặt tên_, tiến triển dựa trên sự thay đổi khả năng hiển thị của một phần tử (gọi là _subject_) trong một phần tử có thể cuộn (_scroller_). Thuộc tính `view-timeline` được đặt trên phần tử subject. Nếu phần tử scroller không tràn ra ngoài vùng chứa theo chiều của trục hoặc nếu phần tràn bị ẩn hoặc bị cắt, sẽ không tạo ra tiến trình cuộn nào.

Khả năng hiển thị của subject bên trong scroller được theo dõi — theo mặc định, tiến trình đồng hồ ở `0%` khi subject lần đầu hiển thị ở một cạnh của scroller và `100%` khi nó chạm đến cạnh đối diện.

`view-timeline` có thể chứa ba giá trị thành phần: tên cho tiến trình xem được đặt tên, giá trị trục cuộn, và tối đa hai giá trị inset tiến trình.
Nếu chỉ khai báo một giá trị, giá trị đó là `view-timeline-name`. Tên đó sau đó được tham chiếu trong khai báo {{cssxref("animation-timeline")}} để chỉ ra phần tử sẽ được hoạt ảnh hóa khi tiến trình đồng hồ tiến triển. Đây có thể là phần tử subject, nhưng không nhất thiết phải như vậy — bạn có thể hoạt ảnh hóa một phần tử khác khi subject di chuyển qua vùng cuộn.

Thuộc tính viết tắt `view-timeline` có thể được áp dụng cho phần tử vùng chứa để đặt tổ hợp các giá trị `<view-timeline-name>`, `<view-timeline-inset>` và `<view-timeline-axis>`. Ít nhất một giá trị phải được chỉ định. Nếu tất cả các giá trị được chỉ định, thứ tự phải là `<view-timeline-name>` theo sau là `<view-timeline-axis>` và/hoặc `<view-timeline-inset>`.

Các tên được chỉ định trong thành phần `<view-timeline-name>` phải là danh sách các giá trị {{cssxref("dashed-ident")}} được phân tách bằng dấu phẩy (nghĩa là chúng phải bắt đầu bằng `--`) hoặc từ khóa `none`.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Tạo tiến trình xem được đặt tên

Tiến trình xem được đặt tên `--subject-reveal` được xác định bằng thuộc tính `view-timeline` trên phần tử subject có `class` là `animation`.
Tiến trình này sau đó được đặt làm tiến trình đồng hồ cho cùng phần tử đó bằng `animation-timeline: --subject-reveal`. Kết quả là phần tử subject được hoạt ảnh hóa khi nó di chuyển lên trên trong tài liệu khi trang được cuộn.

#### HTML

HTML cho ví dụ được hiển thị bên dưới.

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
    Dolor sed viverra ipsum nunc aliquet. Sed sed risus pretium quam vulputate
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
</div>
```

#### CSS

Phần tử `subject` và phần tử `content` chứa nó được tạo kiểu tối giản, và nội dung văn bản được cài đặt phông chữ cơ bản:

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
```

Phần tử `<div>` có class `subject` cũng được cho class `animation` — đây là nơi `view-timeline` được đặt để xác định tiến trình xem được đặt tên. Nó cũng được cho tên `animation-timeline` với cùng giá trị để khai báo đây sẽ là phần tử được hoạt ảnh hóa khi tiến trình xem tiến triển.

Cuối cùng, một hoạt ảnh được chỉ định trên phần tử hoạt ảnh hóa độ mờ và tỷ lệ của nó, khiến nó mờ dần và lớn dần khi di chuyển lên scroller.

```css
.animation {
  view-timeline: --subject-reveal block;
  animation-timeline: --subject-reveal;

  animation-name: appear;
  animation-fill-mode: both;
  animation-duration: 1ms; /* Firefox yêu cầu điều này để áp dụng hoạt ảnh */
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
  @supports not (view-timeline: none) {
    body::before {
      content: "Your browser doesn't support the `view-timeline` property.";
      background-color: wheat;
      display: block;
      text-align: center;
      padding: 1em;
    }
  }
}
```

#### Kết quả

Cuộn trang để xem phần tử subject được hoạt ảnh hóa.

{{EmbedLiveSample("Creating a named view progress timeline", "100%", "480px")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("animation-timeline")}}
- {{cssxref("view-timeline-axis")}}, {{cssxref("view-timeline-inset")}}, {{cssxref("view-timeline-name")}}
- {{cssxref("animation-timeline/view", "view()")}}
- [Hướng dẫn: Tiến trình đồng hồ hoạt ảnh cuộn CSS](/vi/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines#named_view_progress_timeline)
- [Hoạt ảnh cuộn CSS](/vi/docs/Web/CSS/Guides/Scroll-driven_animations)
