---
title: CSS scrollbars styling
short-title: Scrollbars styling
slug: Web/CSS/Guides/Scrollbars_styling
page-type: css-module
spec-urls: https://drafts.csswg.org/css-scrollbars/
sidebar: cssref
---

Module **CSS scrollbars styling** định nghĩa các thuộc tính mà bạn có thể dùng để tạo kiểu hiển thị cho thanh cuộn. Bạn có thể tùy chỉnh độ rộng của thanh cuộn theo nhu cầu. Bạn cũng có thể tùy chỉnh màu sắc của _track_ (phần nền của thanh cuộn) và màu sắc của _thumb_ (tay cầm kéo thả được) của thanh cuộn.

## Tạo kiểu thanh cuộn thực tế

Ví dụ dưới đây định nghĩa một thanh cuộn mỏng với thumb màu đỏ và track màu cam. Để nhìn thấy thumb, bạn cần cuộn nội dung văn bản. Sau khi thanh cuộn hiển thị, hãy di chuột qua nó để xem track.

```css hidden
.poem {
  width: 300px;
  height: 100px;
  border: 1px solid;
}
```

```css
.poem {
  overflow: scroll;
  scrollbar-color: red orange;
  scrollbar-width: thin;
}
```

```html hidden
<blockquote class="poem">
  <h3>A Small Needful Fact</h3>
  <pre>
Is that Eric Garner worked
for some time for the Parks and Rec.
Horticultural Department, which means,
perhaps, that with his very large hands,
perhaps, in all likelihood,
he put gently into the earth
some plants which, most likely,
some of them, in all likelihood,
continue to grow, continue
to do what such plants do, like house
and feed small and necessary creatures,
like being pleasant to touch and smell,
like converting sunlight
into food, like making it easier
for us to breathe.
</pre
  >
  <p>
    - <a href="https://onbeing.org/poetry/a-small-needful-fact/">Ross Gay</a>
  </p>
</blockquote>
```

{{EmbedLiveSample("Scrollbar_styling_in_action")}}

> [!NOTE]
> Khi tùy chỉnh thanh cuộn, hãy đảm bảo rằng thumb và track có đủ độ tương phản so với nền xung quanh. Đồng thời đảm bảo vùng nhấn của thanh cuộn đủ lớn cho những người dùng thao tác bằng cảm ứng.

## Tham chiếu

### Thuộc tính CSS

- {{CSSxRef("scrollbar-width")}}
- {{CSSxRef("scrollbar-color")}}

## Khái niệm liên quan

- {{CSSxRef("overflow-block")}} CSS property
- {{CSSxRef("overflow-inline")}} CSS property
- {{CSSxRef("overflow-x")}} CSS property
- {{CSSxRef("overflow-y")}} CSS property
- {{CSSxRef("overflow")}} CSS shorthand property
- {{CSSxRef("overflow-clip-margin")}} CSS property
- {{CSSxRef("scrollbar-gutter")}} CSS property
- {{CSSxRef("scroll-behavior")}} CSS property
- {{cssxref("scroll-margin")}} CSS shorthand property
- {{cssxref("scroll-padding")}} CSS shorthand property
- {{cssxref("scroll-snap-align")}} CSS property
- {{cssxref("scroll-snap-stop")}} CSS property
- {{cssxref("scroll-snap-type")}} CSS property
- {{CSSxRef("::-webkit-scrollbar")}} pseudo-element
- {{glossary("scroll container")}} glossary term
- [`scrollbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/scrollbar_role) ARIA role

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- {{cssxref('scroll-timeline')}}, {{cssxref('scroll-timeline-axis')}}, {{cssxref('scroll-timeline-name')}}
- [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow) module
- [CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap) module
