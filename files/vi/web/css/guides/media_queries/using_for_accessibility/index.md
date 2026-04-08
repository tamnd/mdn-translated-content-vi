---
title: Using media queries for accessibility
short-title: For accessibility
slug: Web/CSS/Guides/Media_queries/Using_for_accessibility
page-type: guide
sidebar: cssref
---

[**CSS media queries**](/en-US/docs/Web/CSS/Guides/Media_queries) có thể được sử dụng để giúp người dùng khuyết tật trải nghiệm trang web của bạn tốt hơn.

## Giảm chuyển động

Hoạt ảnh nhấp nháy và chớp có thể gây vấn đề cho những người có lo ngại về nhận thức như Rối loạn tăng động giảm chú ý (ADHD). Ngoài ra, một số loại chuyển động có thể là tác nhân gây ra rối loạn tiền đình, động kinh, chứng đau nửa đầu và độ nhạy cảm thị giác. Giảm hoạt ảnh hoặc tắt hoàn toàn hoạt ảnh dựa trên tùy chọn của người dùng cũng có thể mang lại lợi ích cho người dùng có thiết bị pin yếu hoặc thiết bị cấp thấp.

Media query [`prefers-reduced-motion`](/en-US/docs/Web/CSS/Reference/At-rules/@media/prefers-reduced-motion) cho phép cung cấp trải nghiệm với ít hoạt ảnh và chuyển tiếp hơn cho những người dùng đã đặt tùy chọn accessibility của hệ điều hành để giảm chuyển động. Nó có hai giá trị có thể:

- `no-preference`
  - : Cho biết rằng người dùng chưa cho hệ thống biết tùy chọn của mình.
- `reduce`
  - : Cho biết rằng người dùng đã thông báo cho hệ thống rằng họ muốn có giao diện giảm thiểu lượng chuyển động hoặc hoạt ảnh, tốt nhất là đến mức tất cả các chuyển động không cần thiết được loại bỏ.

### Ví dụ

Ví dụ này có hoạt ảnh khó chịu trừ khi bạn bật Reduce Motion trong [tùy chọn accessibility](/en-US/docs/Web/Accessibility/Guides/Browsing_safely) của mình.

#### HTML

```html
<div class="animation">animated box</div>
```

#### CSS

```css
.animation {
  animation: vibrate 0.3s linear infinite both;
}

@media (prefers-reduced-motion: reduce) {
  .animation {
    animation: none;
  }
}
```

Giá trị của `prefers-reduced-motion` là `reduce`, không phải "none". Tùy chọn này không có nghĩa là tất cả hoạt ảnh phải được xóa, điều có thể đạt được với `* {animation: none !important;}`. Thay vào đó, người dùng mong đợi hoạt ảnh chuyển động, bao gồm cả những hoạt ảnh được kích hoạt bởi tương tác của người dùng, sẽ bị tắt trừ khi hoạt ảnh là thiết yếu cho chức năng hoặc thông tin đang được truyền đạt (xem [WCAG: Animation from Interactions](https://www.w3.org/WAI/WCAG21/Understanding/animation-from-interactions.html)).

## Xem thêm

- [`prefers-contrast`](/en-US/docs/Web/CSS/Reference/At-rules/@media/prefers-contrast): để điều chỉnh style trang dựa trên tùy chọn độ tương phản của người dùng
- [`prefers-reduced-transparency`](/en-US/docs/Web/CSS/Reference/At-rules/@media/prefers-reduced-transparency)
- [`prefers-color-scheme`](/en-US/docs/Web/CSS/Reference/At-rules/@media/prefers-color-scheme)
- [`inverted-colors`](/en-US/docs/Web/CSS/Reference/At-rules/@media/inverted-colors)
- [Designing With Reduced Motion For Motion Sensitivities](https://www.smashingmagazine.com/2020/09/design-reduced-motion-sensitivities/)
