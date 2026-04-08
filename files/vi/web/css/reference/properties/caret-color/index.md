---
title: caret-color
slug: Web/CSS/Reference/Properties/caret-color
page-type: css-property
browser-compat: css.properties.caret-color
sidebar: cssref
---

Thuộc tính **`caret-color`** trong [CSS](/en-US/docs/Web/CSS) đặt màu của **con trỏ chèn**, đôi khi được gọi là **con trỏ nhập văn bản**. Đây là dấu hiệu hiển thị tại điểm chèn, nơi ký tự tiếp theo được gõ vào sẽ được thêm vào hoặc ký tự tiếp theo bị xóa sẽ được xóa đi.

{{InteractiveExample("CSS Demo: caret-color")}}

```css interactive-example-choice
caret-color: red;
```

```css interactive-example-choice
caret-color: auto;
```

```css interactive-example-choice
caret-color: transparent;
```

```html interactive-example
<section class="default-example container" id="default-example">
  <div>
    <p>Enter text in the field to see the caret:</p>
    <p><input id="example-element" type="text" /></p>
  </div>
</section>
```

```css interactive-example
#example-element {
  font-size: 1.2rem;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
caret-color: auto;
caret-color: transparent;
caret-color: currentColor;

/* Giá trị <color> */
caret-color: red;
caret-color: #5729e9;
caret-color: rgb(0 200 0);
caret-color: hsl(228deg 4% 24% / 80%);

/* Giá trị toàn cục */
caret-color: inherit;
caret-color: initial;
caret-color: revert;
caret-color: revert-layer;
caret-color: unset;
```

### Giá trị

- `auto`
  - : Thường phân giải thành [`currentColor`](/en-US/docs/Web/CSS/Reference/Values/color_value#currentcolor_keyword), là màu {{cssxref("color")}} của văn bản sẽ được chỉnh sửa.

- {{cssxref("&lt;color&gt;")}}
  - : Màu của con trỏ.

## Mô tả

Con trỏ chèn là dấu hiệu hiển thị vị trí trong văn bản có thể chỉnh sửa — hoặc trong phần tử chấp nhận nhập văn bản — nơi nội dung sẽ được chèn vào (hoặc xóa đi) bởi người dùng. Con trỏ thường là một đường thẳng đứng mảnh cho biết nơi ký tự sẽ được thêm vào hoặc xóa đi. Nó thường nhấp nháy (bật và tắt) để dễ nhận thấy hơn. Con trỏ chỉ xuất hiện khi phần tử có thể chỉnh sửa được lấy focus. Theo mặc định, con trỏ có màu của văn bản. Thuộc tính `caret-color` có thể được dùng để đặt màu của con trỏ thành màu khác `currentColor`, hoặc để đặt lại con trỏ có màu về mặc định.

Giá trị `auto` đặt con trỏ chèn thành `currentColor`, là màu {{cssxref("color")}} của văn bản đang được thêm vào hoặc xóa đi. Các tác nhân người dùng có thể chọn màu khác để đảm bảo khả năng hiển thị và độ tương phản tốt với nội dung xung quanh, dựa trên {{cssxref("color")}}, {{cssxref("background-color")}}, bóng đổ và các yếu tố khác. Tuy nhiên, trên thực tế, tất cả các trình duyệt đều dùng màu hiện tại theo mặc định và khi `caret-color` được đặt thành `auto`. Bạn có thể đặt bất kỳ giá trị `<color>` hợp lệ nào.

### Tìm hiểu về con trỏ chèn

Con trỏ chèn, và do đó thuộc tính này, chỉ áp dụng cho văn bản hoặc các phần tử có thể chấp nhận nhập văn bản. Con trỏ xuất hiện trong các phần tử giao diện người dùng được lấy focus nơi người dùng có thể cập nhật nội dung, chẳng hạn như phần tử {{HTMLElement("input")}} chấp nhận văn bản tự do, phần tử {{HTMLElement("textarea")}}, và các phần tử có thuộc tính [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable).

Con trỏ có thể xuất hiện trong phần tử `<input>` có kiểu `password`, `text`, `search`, `tel` và `email`. Không có con trỏ với kiểu nhập date, `color`, `hidden`, `radio` hoặc `checkbox`. Một số trình duyệt hiển thị con trỏ với kiểu nhập `number`. Trong một số trình duyệt, có thể làm con trỏ xuất hiện trong các phần tử không bao giờ có nội dung văn bản — ví dụ bằng cách đặt [`appearance: none`](/en-US/docs/Web/CSS/Reference/Properties/appearance) và thêm thuộc tính `contenteditable`. Tuy nhiên, điều này không được khuyến nghị.

Con trỏ có thể hiển thị trong phần tử có thể chỉnh sửa hoặc các phần tử con của nó, miễn là tính có thể chỉnh sửa không bị tắt, ví dụ bằng cách đặt thuộc tính `contentEditable` của phần tử con thành `false`. Nếu phần tử không thể chỉnh sửa hoặc không thể chọn, ví dụ nếu {{cssxref("user-select")}} được đặt thành `none`, thì con trỏ không nên xuất hiện.

### Con trỏ chèn và con trỏ chuột

Có nhiều loại con trỏ. Con trỏ chèn là loại duy nhất bị ảnh hưởng bởi thuộc tính `caret-color`.

Nhiều trình duyệt có **con trỏ điều hướng**, hoạt động tương tự như con trỏ chèn nhưng có thể di chuyển trong văn bản không thể chỉnh sửa.

Hình ảnh con trỏ chuột được hiển thị cho một số giá trị thuộc tính {{cssxref("cursor")}} (ví dụ: `auto` hoặc `text`) có thể trông giống con trỏ chèn, nhưng thực ra là con trỏ chuột, không phải con trỏ chèn.

### Hoạt ảnh từ `auto`

Nói chung, khi `caret-color` được đặt thành hoặc mặc định là `auto`, tác nhân người dùng sử dụng `currentColor`, là giá trị có thể hoạt ảnh được. Tuy nhiên, `auto` mặc định không phải là giá trị có thể hoạt ảnh: khi hoạt ảnh hoặc chuyển tiếp `caret-color` từ `auto` sang bất kỳ giá trị màu nào, không có nội suy nào xảy ra. Hoạt ảnh là [rời rạc](/en-US/docs/Web/CSS/Guides/Animations/Animatable_properties#discrete); màu chuyển đổi từ hoặc sang màu `currentColor` tại điểm giữa của {{cssxref("animation-duration")}} hoặc {{cssxref("transition-duration")}}.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt màu con trỏ tùy chỉnh

#### HTML

```html
<input value="This field uses a default caret." size="64" />
<input class="custom" value="I have a custom caret color!" size="64" />
<p contenteditable class="custom">
  This paragraph can be edited, and its caret has a custom color as well!
</p>
```

#### CSS

```css
input {
  caret-color: auto;
  display: block;
  margin-bottom: 0.5em;
}

input.custom {
  caret-color: orange;
}

p.custom {
  caret-color: green;
}
```

#### Kết quả

{{EmbedLiveSample('Setting_a_custom_caret_color', 500, 200)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("caret-animation")}}, {{cssxref("caret-shape")}}
- Thuộc tính viết tắt {{cssxref("caret")}}
- {{cssxref("color")}}
- {{cssxref("text-emphasis")}}
- {{cssxref("cursor")}}
- {{cssxref("text-emphasis")}}
- Kiểu dữ liệu CSS {{cssxref("&lt;color&gt;")}}
- Phần tử {{HTMLElement("input")}}
- Thuộc tính HTML [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable)
