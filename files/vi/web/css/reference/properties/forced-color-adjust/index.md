---
title: forced-color-adjust
slug: Web/CSS/Reference/Properties/forced-color-adjust
page-type: css-property
browser-compat: css.properties.forced-color-adjust
sidebar: cssref
---

Thuộc tính **`forced-color-adjust`** [CSS](/en-US/docs/Web/CSS) cho phép các tác giả loại một số phần tử ra khỏi chế độ màu cưỡng bức. Điều này sẽ khôi phục quyền kiểm soát các giá trị đó về CSS.

## Cú pháp

```css
forced-color-adjust: auto;
forced-color-adjust: none;
forced-color-adjust: preserve-parent-color;

/* Giá trị toàn cục */
forced-color-adjust: inherit;
forced-color-adjust: initial;
forced-color-adjust: revert;
forced-color-adjust: revert-layer;
forced-color-adjust: unset;
```

Giá trị của thuộc tính `forced-color-adjust` phải là một trong các từ khóa sau.

### Giá trị

- `auto`
  - : Màu sắc của phần tử được điều chỉnh bởi {{Glossary("user agent")}} trong chế độ màu cưỡng bức. Đây là giá trị mặc định.
- `none`
  - : Màu sắc của phần tử không được tự động điều chỉnh bởi {{Glossary("user agent")}} trong chế độ màu cưỡng bức.
- `preserve-parent-color`
  - : Trong chế độ màu cưỡng bức, nếu thuộc tính {{cssxref("color")}} kế thừa từ phần tử cha (tức là không có [giá trị được tầng](/en-US/docs/Web/CSS/Guides/Cascade/Introduction) hoặc giá trị được tầng là `currentColor`, {{cssxref("inherit")}}, hoặc từ khóa khác kế thừa từ cha), thì nó tính toán thành [giá trị đã dùng](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#used_value) của thuộc tính `color` của cha. Trong tất cả các trường hợp khác, nó hoạt động giống như `none`.

## Ghi chú sử dụng

Thuộc tính này chỉ nên được sử dụng để thực hiện các thay đổi sẽ hỗ trợ yêu cầu về màu sắc và độ tương phản của người dùng. Ví dụ, nếu bạn nhận thấy rằng các tối ưu hóa màu sắc được thực hiện bởi {{Glossary("user agent")}} dẫn đến trải nghiệm kém trong chế độ tương phản cao hoặc chế độ tối. Sử dụng thuộc tính này sẽ cho phép tinh chỉnh kết quả trong chế độ đó để cung cấp trải nghiệm tốt hơn. **Không nên sử dụng thuộc tính này để ngăn các lựa chọn của người dùng được tôn trọng**.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Bảo toàn màu sắc

Trong ví dụ bên dưới, hộp đầu tiên sẽ sử dụng bảng màu mà người dùng đã đặt. Ví dụ trong chế độ Tương phản cao Windows với giao diện đen, nó sẽ có nền đen và chữ trắng. Hộp thứ hai sẽ bảo toàn màu sắc của trang web được đặt trên lớp `.box`.

Bằng cách sử dụng tính năng media {{cssxref("@media/forced-colors", "forced-colors")}}, bạn có thể thêm các tối ưu hóa khác cho chế độ màu cưỡng bức cùng với thuộc tính `forced-color-adjust`.

#### CSS

```css
.box {
  border: 5px solid grey;
  background-color: #cccccc;
  width: 300px;
  margin: 20px;
  padding: 10px;
}

@media (forced-colors: active) {
  .forced {
    forced-color-adjust: none;
  }
}
```

#### HTML

```html
<div class="box">
  <p>This is a box which should use your color preferences.</p>
</div>

<div class="box forced">
  <p>This is a box which should stay the colors set by the site.</p>
</div>
```

#### Kết quả

{{EmbedLiveSample("Preserving_colors", 640, 300)}}

Ảnh chụp màn hình bên dưới cho thấy hình ảnh trên trong Chế độ Tương phản cao Windows:

![The example above in high contrast mode shows the first box with a black background the second with the grey background of the CSS.](windows-high-contrast.jpg)

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Styling for Windows high contrast with standards for forced colors.](https://blogs.windows.com/msedgedev/2020/09/17/styling-for-windows-high-contrast-with-new-standards-for-forced-colors/)
- {{cssxref("print-color-adjust")}}
