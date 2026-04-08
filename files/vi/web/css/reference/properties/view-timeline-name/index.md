---
title: view-timeline-name
slug: Web/CSS/Reference/Properties/view-timeline-name
page-type: css-property
browser-compat: css.properties.view-timeline-name
sidebar: cssref
---

Thuộc tính **`view-timeline-name`** của [CSS](/vi/docs/Web/CSS) chỉ định tên của một hoặc nhiều [tiến trình xem được đặt tên](/vi/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines#named_view_progress_timeline) liên kết với phần tử.

## Cú pháp

```css
/* Giá trị từ khóa */
view-timeline-name: none;

/* Định danh tùy chỉnh */
view-timeline-name: --custom_name_for_timeline;

/* Nhiều định danh */
view-timeline-name: --first_timeline_name, --another_timeline_name;

/* Giá trị toàn cục */
view-timeline-name: inherit;
view-timeline-name: initial;
view-timeline-name: revert;
view-timeline-name: revert-layer;
view-timeline-name: unset;
```

### Giá trị

- `none`
  - : Chỉ ra rằng tiến trình đồng hồ không có tên. Đây là giá trị mặc định.
- `<dashed-ident>`
  - : Chỉ định danh sách các định danh tùy chỉnh {{cssxref("dashed-ident")}} được phân tách bằng dấu phẩy. Tất cả các giá trị `<dashed-ident>` phải bắt đầu bằng `--`, giúp tránh xung đột tên với các từ khóa CSS chuẩn.

## Mô tả

Thuộc tính `view-timeline-name` được dùng để đặt tên cho [tiến trình xem](/vi/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines#view_progress_timelines). Tiến trình xem được tiến triển dựa trên sự thay đổi khả năng hiển thị của một phần tử, gọi là _subject_, bên trong một phần tử có thể cuộn, gọi là _scroller_. Thuộc tính `view-timeline-name` được đặt trên subject. Bạn cũng có thể đặt `view-timeline-name` bằng thuộc tính viết tắt {{cssxref("view-timeline")}}.

Nếu phần tử scroller được đặt tên của subject không tràn vùng chứa theo [chiều trục](/vi/docs/Web/CSS/Reference/Properties/view-timeline-axis) hoặc nếu phần tràn bị ẩn hoặc bị cắt, sẽ không tạo ra tiến trình cuộn nào.

Sau khi được tạo, các giá trị tên `<dashed-ident>` đã chỉ định có thể được tham chiếu trong các khai báo {{cssxref("animation-timeline")}} để chỉ ra phần tử sẽ được hoạt ảnh hóa khi tiến trình đồng hồ tiến triển.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Tạo tiến trình xem được đặt tên

Tiến trình xem được đặt tên `--subject-reveal` được xác định bằng thuộc tính `view-timeline-name` trên phần tử subject có `class` là `animation`.
Tiến trình này sau đó được đặt làm tiến trình đồng hồ cho cùng phần tử đó bằng `animation-timeline: --subject-reveal;`. Kết quả là phần tử subject được hoạt ảnh hóa khi nó di chuyển lên trên trong tài liệu khi trang được cuộn.

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

Phần tử `<div>` có class `subject` cũng được cho class `animation` — đây là nơi `view-timeline-name` được đặt để xác định tiến trình xem được đặt tên. Nó cũng được cho tên `animation-timeline` với cùng giá trị để khai báo đây sẽ là phần tử được hoạt ảnh hóa khi tiến trình xem tiến triển.

Cuối cùng, một hoạt ảnh được chỉ định trên phần tử hoạt ảnh hóa độ mờ và tỷ lệ của nó, khiến nó mờ dần và lớn dần khi di chuyển lên scroller.

```css
.animation {
  view-timeline-name: --subject-reveal;
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
  @supports not (view-timeline-name: none) {
    body::before {
      content: "Your browser doesn't support the `view-timeline-name` property.";
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
- {{cssxref("view-timeline")}}
- [Tiến trình đồng hồ hoạt ảnh cuộn](/vi/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines)
- Module [Hoạt ảnh cuộn CSS](/vi/docs/Web/CSS/Guides/Scroll-driven_animations)
- Module [Hoạt ảnh CSS](/vi/docs/Web/CSS/Guides/Animations)
