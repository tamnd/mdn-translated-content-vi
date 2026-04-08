---
title: scroll-timeline-name
slug: Web/CSS/Reference/Properties/scroll-timeline-name
page-type: css-property
browser-compat: css.properties.scroll-timeline-name
sidebar: cssref
---

Thuộc tính **`scroll-timeline-name`** [CSS](/en-US/docs/Web/CSS) được dùng để định nghĩa tên của _dòng thời gian tiến trình cuộn có tên_, tiến trình này được điều khiển bằng cách cuộn một phần tử có thể cuộn (_scroller_) từ trên xuống dưới (hoặc từ trái sang phải). `scroll-timeline-name` được đặt trên scroller sẽ cung cấp dòng thời gian.

Tên sau đó được tham chiếu trong khai báo {{cssxref("animation-timeline")}} để chỉ định phần tử container được dùng để điều khiển tiến trình hoạt ảnh qua hành động cuộn.

> [!NOTE]
> Nếu phần tử không tràn container của nó theo chiều trục, hoặc nếu tràn bị ẩn hoặc bị cắt, thì sẽ không có dòng thời gian nào được tạo.

Các thuộc tính {{cssxref("scroll-timeline-axis")}} và `scroll-timeline-name` cũng có thể được đặt bằng thuộc tính viết tắt {{cssxref("scroll-timeline")}}.

## Cú pháp

```css
scroll-timeline-name: none;
scroll-timeline-name: --custom_name_for_timeline;
```

### Giá trị

Các giá trị được phép cho `scroll-timeline-name` là:

- `none`
  - : Dòng thời gian không có tên.
- `<dashed-ident>`
  - : Một định danh tùy chỉnh tùy ý định nghĩa tên cho dòng thời gian tiến trình cuộn, sau đó có thể được tham chiếu trong thuộc tính {{cssxref("animation-timeline")}}.

    > [!NOTE]
    > Các giá trị {{cssxref("dashed-ident")}} phải bắt đầu bằng `--`, giúp tránh xung đột tên với các từ khóa CSS chuẩn.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Tạo hoạt ảnh dòng thời gian tiến trình cuộn có tên

Trong ví dụ này, dòng thời gian cuộn có tên `--square-timeline` được định nghĩa bằng thuộc tính `scroll-timeline-name` trên phần tử có ID `container`.
Sau đó nó được áp dụng cho hoạt ảnh trên phần tử `#square` bằng `animation-timeline: --square-timeline`.

#### HTML

HTML cho ví dụ được hiển thị bên dưới.

```html
<div id="container">
  <div id="square"></div>
  <div id="stretcher"></div>
</div>
```

#### CSS

CSS cho container đặt nó làm nguồn của dòng thời gian cuộn có tên `--square-timeline` bằng thuộc tính `scroll-timeline-name`. Không có [trục thanh cuộn](/en-US/docs/Web/CSS/Reference/Properties/scroll-timeline-axis) nào được định nghĩa ở đây vì trục dọc sẽ được dùng theo mặc định.

Chiều cao của container được đặt thành `300px`, và container cũng được đặt để tạo thanh cuộn dọc nếu nó tràn (quy tắc CSS `height` trên phần tử `stretcher` bên dưới làm nội dung tràn khỏi container).

```css
#container {
  height: 300px;
  overflow-y: scroll;
  scroll-timeline-name: --square-timeline;
  position: relative;
}
```

CSS bên dưới định nghĩa một hình vuông quay theo dòng thời gian được cung cấp bởi thuộc tính `animation-timeline`, được đặt thành dòng thời gian `--square-timeline` được đặt tên ở trên.

```css
#square {
  background-color: deeppink;
  width: 100px;
  height: 100px;
  margin-top: 100px;
  animation-name: rotateAnimation;
  animation-duration: 1ms; /* Firefox yêu cầu điều này để áp dụng hoạt ảnh */
  animation-timeline: --square-timeline;
  position: absolute;
  bottom: 0;
}

#stretcher {
  height: 600px;
  background: #dedede;
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

Quy tắc CSS `stretcher` đặt chiều cao block thành `600px`, tạo nội dung tràn khỏi phần tử container, từ đó tạo thanh cuộn.
Không có phần tử này, nội dung sẽ không tràn container, sẽ không có thanh cuộn, và do đó không có dòng thời gian cuộn để liên kết với dòng thời gian hoạt ảnh.

#### Kết quả

Cuộn thanh dọc để xem hình vuông hoạt ảnh khi bạn cuộn.

{{EmbedLiveSample("Creating_a_named_scroll_progress_timeline_animation", "100%", "320px")}}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("animation-timeline")}}
- {{cssxref("scroll-timeline")}}, {{cssxref("scroll-timeline-axis")}}
- {{cssxref("timeline-scope")}}
- [CSS scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations)
