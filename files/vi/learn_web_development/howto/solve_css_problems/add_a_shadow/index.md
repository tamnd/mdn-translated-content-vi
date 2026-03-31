---
title: How to add a shadow to an element
short-title: Add a shadow to an element
slug: Learn_web_development/Howto/Solve_CSS_problems/Add_a_shadow
page-type: learn-faq
sidebar: learn-how-to
---

Trong hướng dẫn này, bạn có thể tìm hiểu cách thêm bóng đổ vào bất kỳ box nào trên trang của mình.

## Thêm box shadow

Bóng đổ là một tính năng thiết kế phổ biến có thể giúp các phần tử nổi bật trên trang của bạn. Trong CSS, bóng đổ trên các box của phần tử được tạo bằng thuộc tính {{cssxref("box-shadow")}} (nếu bạn muốn thêm bóng vào chính văn bản, bạn cần dùng {{cssxref("text-shadow")}}).

Thuộc tính `box-shadow` nhận một số giá trị:

- Độ lệch theo trục x
- Độ lệch theo trục y
- Bán kính làm mờ (blur radius)
- Bán kính lan rộng (spread radius)
- Màu sắc
- Từ khóa `inset`

Trong ví dụ dưới đây, chúng ta đã đặt trục X và Y là 5px, blur là 10px và spread là 2px. Tôi đang sử dụng màu đen bán trong suốt làm màu sắc. Hãy thử thay đổi các giá trị khác nhau để xem chúng ảnh hưởng đến bóng như thế nào.

```html live-sample___box-shadow-button
<div class="wrapper">
  <button class="shadow">box-shadow</button>
</div>
```

```css hidden live-sample___box-shadow-button
.wrapper {
  height: 150px;
  display: flex;
  align-items: center;
  justify-content: center;
}

button {
  padding: 5px 10px;
  border: 0;
  border-radius: 5px;
  font-weight: bold;
  font-size: 140%;
  background-color: #db1f48;
  color: white;
}
```

```css live-sample___box-shadow-button
.shadow {
  box-shadow: 5px 5px 10px 2px rgb(0 0 0 / 0.8);
}
```

{{EmbedLiveSample("box-shadow-button")}}

> [!NOTE]
> Chúng ta không sử dụng `inset` trong ví dụ này, điều này có nghĩa là bóng là bóng đổ mặc định với box ở phía trên bóng. Bóng inset xuất hiện bên trong box như thể nội dung bị đẩy lùi vào trang.

## Xem thêm

- [Box shadow generator](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Box-shadow_generator)
- [Learn CSS: Advanced styling effects](/en-US/docs/Learn_web_development/Core/Styling_basics/Advanced_styling_effects)
