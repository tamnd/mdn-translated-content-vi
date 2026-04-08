---
title: background-clip
slug: Web/CSS/Reference/Properties/background-clip
page-type: css-property
browser-compat: css.properties.background-clip
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`background-clip`** xác định xem nền của một phần tử có kéo dài ra phía sau hộp viền, hộp padding hay hộp nội dung hay không.

{{InteractiveExample("CSS Demo: background-clip")}}

```css interactive-example-choice
background-clip: border-box;
```

```css interactive-example-choice
background-clip: padding-box;
```

```css interactive-example-choice
background-clip: content-box;
```

```css interactive-example-choice
background-clip: text;
color: transparent;
text-shadow: none;
```

```html interactive-example
<section id="default-example">
  <div id="example-element">This is the content of the element.</div>
</section>
```

```css interactive-example
#example-element {
  background-image: url("/shared-assets/images/examples/leopard.jpg");
  color: white;
  text-shadow: 2px 2px black;
  padding: 20px;
  border: 10px dashed #333333;
  font-size: 2em;
  font-weight: bold;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
background-clip: border-box;
background-clip: padding-box;
background-clip: content-box;
background-clip: text;
background-clip: border-area;

/* Giá trị toàn cục */
background-clip: inherit;
background-clip: initial;
background-clip: revert;
background-clip: revert-layer;
background-clip: unset;
```

### Giá trị

- `border-box`
  - : Nền kéo dài đến cạnh ngoài của viền (nhưng ở phía dưới viền theo thứ tự z).
- `padding-box`
  - : Nền kéo dài đến cạnh ngoài của padding. Không có nền được vẽ bên dưới viền.
- `content-box`
  - : Nền được vẽ bên trong (cắt theo) hộp nội dung.
- `text`
  - : Nền được vẽ bên trong (cắt theo) văn bản ở nền trước.
- `border-area`
  - : Nền được vẽ bên trong (cắt theo) vùng được vẽ bởi viền, tính đến {{Cssxref("border-width")}} và {{Cssxref("border-style")}} nhưng bỏ qua bất kỳ độ trong suốt nào được tạo ra bởi {{Cssxref("border-color")}}.

## Mô tả

Nền luôn được vẽ phía sau viền, vì vậy `background-clip: border-box` chỉ có hiệu ứng trực quan khi viền có một phần không trong suốt hoặc có vùng trong suốt hay bán trong suốt. Ngoài ra, thuộc tính `background-clip: text` có ít hoặc không có hiệu ứng trực quan nếu văn bản hoàn toàn hoặc một phần không trong suốt.

> [!NOTE]
> Vì [phần tử gốc](/en-US/docs/Web/HTML/Reference/Elements/html) có vùng vẽ nền khác nhau, thuộc tính `background-clip` không có hiệu lực khi được chỉ định trên nó. Xem "[The backgrounds of special elements.](https://drafts.csswg.org/css-backgrounds-3/#special-backgrounds)"

> [!NOTE]
> Đối với các tài liệu có [phần tử gốc](/en-US/docs/Web/HTML/Reference/Elements/html) là phần tử HTML: nếu giá trị tính toán của {{cssxref("background-image")}} trên phần tử gốc là `none` và {{cssxref("background-color")}} của nó là `transparent`, các trình duyệt web phải thay vào đó truyền các giá trị tính toán của các thuộc tính `background` từ phần tử con {{HTMLElement("body")}} HTML đầu tiên của phần tử đó. Các giá trị được sử dụng của các thuộc tính `background` của phần tử `<body>` đó là giá trị khởi đầu của chúng, và các giá trị được truyền được xử lý như thể chúng được chỉ định trên phần tử gốc. Khuyến nghị các tác giả tài liệu HTML chỉ định nền canvas cho phần tử `<body>` thay vì phần tử HTML.

## Khả năng tiếp cận

Khi sử dụng `background-clip: text`, hãy kiểm tra tỷ lệ tương phản giữa màu nền và màu của văn bản được đặt lên trên đủ cao để những người có thị lực kém có thể đọc được nội dung của trang.

Nếu ảnh nền không tải được, điều này cũng có thể khiến văn bản không đọc được. Thêm {{cssxref("background-color")}} dự phòng để ngăn điều này xảy ra, và kiểm tra mà không có ảnh.

Hãy cân nhắc sử dụng các truy vấn tính năng với {{cssxref("@supports")}} để kiểm tra hỗ trợ cho `background-clip: text` và cung cấp giải pháp thay thế có thể truy cập khi không được hỗ trợ.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### HTML

```html
<p class="border-box">The background extends behind the border.</p>
<p class="padding-box">
  The background extends to the inside edge of the border.
</p>
<p class="content-box">
  The background extends only to the edge of the content box.
</p>
<p class="text">The background is clipped to the foreground text.</p>
<p class="border-area">
  The background is clipped to the area painted by the border.
</p>
```

### CSS

```css
p {
  border: 0.8em darkviolet;
  border-style: dotted double;
  margin: 1em 0;
  padding: 1.4em;
  background: linear-gradient(60deg, red, yellow, red, yellow, red);
  font: 900 1.2em sans-serif;
  text-decoration: underline;
}

.border-box {
  background-clip: border-box;
}
.padding-box {
  background-clip: padding-box;
}
.content-box {
  background-clip: content-box;
}

.text {
  background-clip: text;
  color: rgb(0 0 0 / 20%);
}

.border-area {
  background-clip: border-area;
  border-color: transparent;
}
```

#### Kết quả

{{EmbedLiveSample('Examples', 600, 630)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính {{cssxref("clip-path")}} tạo vùng cắt xác định phần nào của _toàn bộ phần tử_ sẽ được hiển thị.
- Các thuộc tính nền: {{cssxref("background")}}, {{cssxref("background-color")}}, {{cssxref("background-image")}}, {{cssxref("background-origin")}}
- [Giới thiệu về mô hình hộp CSS](/en-US/docs/Web/CSS/Guides/Box_model/Introduction)
