---
title: timeline-scope
slug: Web/CSS/Reference/Properties/timeline-scope
page-type: css-property
browser-compat: css.properties.timeline-scope
sidebar: cssref
---

Thuộc tính **`timeline-scope`** [CSS](/en-US/docs/Web/CSS) sửa đổi phạm vi của một dòng thời gian hoạt ảnh có tên.

## Cú pháp

```css
/* Giá trị từ khóa */
timeline-scope: all;
timeline-scope: none;

/* Giá trị tên tùy chỉnh */
timeline-scope: --custom_name_for_timeline;
timeline-scope: --timeline_name_one, --timeline_name_two;

/* Giá trị toàn cục */
timeline-scope: inherit;
timeline-scope: initial;
timeline-scope: revert;
timeline-scope: revert-layer;
timeline-scope: unset;
```

### Giá trị

Các giá trị được phép cho `timeline-scope` là:

- `none`
  - : Không có thay đổi nào về phạm vi dòng thời gian. Đây là giá trị mặc định.
- `all`
  - : Tên của tất cả các dòng thời gian được định nghĩa bởi các phần tử con đều nằm trong phạm vi của phần tử này và các phần tử con của nó.
- `<dashed-ident>`
  - : Chỉ định tên của một dòng thời gian có tên hiện có (tức là được khai báo bằng {{cssxref("scroll-timeline-name")}} hoặc {{cssxref("view-timeline-name")}}) được định nghĩa trên một phần tử con. Điều này tăng phạm vi dòng thời gian đến phần tử hiện tại và bất kỳ phần tử con nào của nó.

## Mô tả

Thuộc tính `timeline-scope` sửa đổi phạm vi của một dòng thời gian hoạt ảnh có tên. Theo mặc định, một [dòng thời gian có tên](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines#animation_timelines) (tức là được khai báo bằng {{cssxref("scroll-timeline-name")}} hoặc {{cssxref("view-timeline-name")}}) chỉ có thể được đặt làm dòng thời gian điều khiển của một phần tử con trực tiếp (tức là bằng cách đặt {{cssxref("animation-timeline")}} trên nó với tên dòng thời gian làm giá trị). Đây là "phạm vi" mặc định cho dòng thời gian.

Giá trị của `timeline-scope` là tên của một dòng thời gian được định nghĩa trên một phần tử con; điều này thay đổi phạm vi của dòng thời gian để bao gồm phần tử mục tiêu và các phần tử con của nó. Nói cách khác, phần tử mà thuộc tính `timeline-scope` được định nghĩa trên đó, và tất cả các phần tử con của nó, có thể được điều khiển bằng dòng thời gian đó.

Nếu không có dòng thời gian nào (hoặc nhiều hơn một dòng thời gian) tồn tại với tên được đặt cho giá trị `timeline-scope`, một dòng thời gian không hoạt động với tên được chỉ định sẽ được tạo ra. Thuộc tính `timeline-scope` chỉ hoạt động với các dòng thời gian có tên, và do đó không thể được sử dụng kết hợp với các dòng thời gian ẩn danh được tạo bằng hàm dòng thời gian hoạt ảnh {{cssxref("animation-timeline/view", "view()")}} hoặc {{cssxref("animation-timeline/scroll", "scroll()")}}.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

Trong ví dụ này, chúng ta tạo hoạt ảnh cho một phần tử phản ứng với việc cuộn của phần tử khác bằng cách tăng phạm vi dòng thời gian với thuộc tính `timeline-scope`.

### HTML

HTML bao gồm một phần tử để tạo hoạt ảnh và một phần tử để cuộn:

```html
<div class="content">
  <div class="box animation"></div>
</div>

<div class="scroller">
  <div class="long-element"></div>
</div>
```

### CSS

Một dòng thời gian cuộn có tên `--my-scroller` được định nghĩa bằng thuộc tính {{cssxref("scroll-timeline-name")}} trên phần tử cuộn. Tên dòng thời gian cuộn này được dùng ở hai nơi khác: nó được áp dụng làm {{cssxref("animation-timeline")}} trên phần tử chúng ta muốn tạo hoạt ảnh, và làm `timeline-scope` trên một phần tử tổ tiên của cả scroller và phần tử được tạo hoạt ảnh, tăng phạm vi.

Chúng ta đặt chiều cao của `<body>` thành `100vh`, và bố trí hai phần tử con của nó thành hai cột bằng nhau bằng flexbox. Để tăng phạm vi dòng thời gian từ phần tử `<div class="scroller">` đến toàn bộ `<body>`, chúng ta đặt `timeline-scope: --my-scroller` trên nó. Bằng cách đó, dòng thời gian `--my-scroller` có thể được đặt làm dòng thời gian điều khiển cho một hoạt ảnh được đặt trên `<body>` hoặc bất kỳ phần tử nào lồng bên trong nó.

```css
body {
  margin: 0;
  height: 100vh;
  display: flex;

  timeline-scope: --my-scroller;
}

.content,
.scroller {
  flex: 1;
}
```

Chúng ta đặt `--my-scroller` làm {{cssxref("scroll-timeline-name")}} trên phần tử cuộn sẽ cung cấp dòng thời gian tiến trình cuộn cho phần tử được tạo hoạt ảnh. Chúng ta thêm {{cssxref("overflow")}} để kích hoạt cuộn, thêm màu nền để làm ranh giới của nó hiển thị. Chúng ta đặt {{cssxref("height")}} lớn cho nội dung của phần tử cuộn để phần tử thực sự cuộn được.

```css
.scroller {
  overflow: scroll;
  scroll-timeline-name: --my-scroller;
  background: deeppink;
}

.long-element {
  height: 2000px;
}
```

Tiếp theo, chúng ta cung cấp cho phần tử được tạo hoạt ảnh một số style cơ bản và áp dụng hoạt ảnh cho nó bằng thuộc tính viết tắt {{cssxref("animation")}}. Chúng ta đặt {{cssxref("animation-timeline")}} thành dòng thời gian cuộn có tên: `--my-scroller`. Để nhấn mạnh lại, việc tạo hoạt ảnh cho phần tử dựa trên tiến trình cuộn của phần tử anh em của nó chỉ có thể thực hiện được vì chúng ta đặt `timeline-scope` trên một tổ tiên chung; phần tử được tạo hoạt ảnh **không** phải là phần tử con của phần tử cuộn.

```css
.box {
  width: 100px;
  height: 100px;
  border-radius: 10px;
  background-color: rebeccapurple;
}

.animation {
  animation: rotate-appear 1ms linear;
  animation-timeline: --my-scroller;
}

@keyframes rotate-appear {
  from {
    rotate: 0deg;
    translate: 0;
  }

  to {
    rotate: 720deg;
    translate: 100%;
  }
}
```

```css hidden
@layer supports {
  @supports not (timeline-scope: none) {
    body::before {
      content: "Your browser does not support the 'timeline-scope' property.";
      background-color: wheat;
      display: block;
      text-align: center;
      padding: 1rem;
    }
  }
}
```

### Kết quả

Cuộn thanh dọc trên khu vực màu hồng để xem hình vuông tạo hoạt ảnh khi bạn cuộn.

{{EmbedLiveSample("Examples", "100%", "320px")}}

Điểm mấu chốt cần lưu ý ở đây là phần tử được tạo hoạt ảnh không phải là phần tử con của phần tử cuộn — để làm được điều này, chúng ta tăng phạm vi của dòng thời gian `--my-scroller` bằng cách đặt `timeline-scope: --my-scroller` trên {{htmlelement("body")}}.

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("animation-timeline")}}
- {{cssxref("scroll-timeline")}}, {{cssxref("scroll-timeline-name")}}
- {{cssxref("view-timeline")}}, {{cssxref("view-timeline-name")}}
- [CSS scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations)
