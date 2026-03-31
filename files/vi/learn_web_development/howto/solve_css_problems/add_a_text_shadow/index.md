---
title: How to add a shadow to text
short-title: Add a shadow to text
slug: Learn_web_development/Howto/Solve_CSS_problems/Add_a_text_shadow
page-type: learn-faq
sidebar: learn-how-to
---

Trong hướng dẫn này, bạn sẽ học cách thêm bóng đổ vào bất kỳ văn bản nào trên trang của mình.

## Thêm bóng vào văn bản

[Hướng dẫn thêm bóng vào box](/en-US/docs/Learn_web_development/Howto/Solve_CSS_problems/Add_a_shadow) của chúng ta giải thích cách thêm bóng vào bất kỳ phần tử nào trên trang của bạn. Tuy nhiên, kỹ thuật đó chỉ thêm bóng vào box bao quanh phần tử. Để thêm bóng đổ vào chính văn bản, bạn cần một thuộc tính CSS khác: {{cssxref("text-shadow")}}.

Thuộc tính `text-shadow` nhận một số giá trị:

- Độ lệch theo trục x
- Độ lệch theo trục y
- Bán kính làm mờ (blur radius)
- Màu sắc

Trong ví dụ dưới đây, chúng ta đã đặt độ lệch trục x là `2px`, độ lệch trục y là `4px`, bán kính làm mờ là `4px`, và màu sắc là màu xanh bán trong suốt. Hãy thử thay đổi các giá trị khác nhau để xem chúng ảnh hưởng đến hiệu ứng bóng như thế nào.

```html live-sample___text-shadow
<div class="wrapper">
  <h1>Adding a shadow to text</h1>
</div>
```

```css live-sample___text-shadow
h1 {
  color: royalblue;
  text-shadow: 2px 4px 4px rgb(46 91 173 / 0.6);
}
```

{{EmbedLiveSample("Text_shadow")}}

> [!NOTE]
> Khi thêm bóng vào văn bản, bạn có thể vô tình làm cho văn bản khó đọc. Hãy đảm bảo rằng các lựa chọn của bạn cung cấp đủ [độ tương phản màu](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable/Color_contrast) để giữ cho văn bản dễ đọc.
