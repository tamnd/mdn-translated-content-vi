---
title: direction
slug: Web/CSS/Reference/Properties/direction
page-type: css-property
browser-compat: css.properties.direction
sidebar: cssref
---

> [!WARNING]
> Khi có thể, tác giả được khuyến khích tránh sử dụng thuộc tính CSS `direction` và thay vào đó sử dụng thuộc tính toàn cục HTML [`dir`](/en-US/docs/Web/HTML/Reference/Global_attributes/dir).

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`direction`** đặt hướng văn bản, cột bảng và lưới, và tràn ngang. Sử dụng `rtl` cho các ngôn ngữ viết từ phải sang trái (như tiếng Hebrew hoặc tiếng Ả Rập), và `ltr` cho các ngôn ngữ viết từ trái sang phải (như tiếng Anh và hầu hết các ngôn ngữ khác).

Lưu ý rằng hướng văn bản thường được xác định trong tài liệu (ví dụ: với [thuộc tính `dir` của HTML](/en-US/docs/Web/HTML/Reference/Global_attributes/dir)) thay vì thông qua việc sử dụng trực tiếp thuộc tính `direction`.

{{InteractiveExample("CSS Demo: direction")}}

```css interactive-example-choice
direction: ltr;
```

```css interactive-example-choice
direction: rtl;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    <div>1</div>
    <div>2</div>
    <div>3</div>
    <div>4</div>
  </div>
</section>
```

```css interactive-example
#example-element {
  border: 1px solid #c5c5c5;
  padding: 0.75em;
  width: 80%;
  max-height: 300px;
  display: flex;
}

#example-element > div {
  background-color: rgb(0 0 255 / 0.2);
  border: 3px solid blue;
  margin: 10px;
  flex: 1;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
direction: ltr;
direction: rtl;

/* Giá trị toàn cục */
direction: inherit;
direction: initial;
direction: revert;
direction: revert-layer;
direction: unset;
```

### Giá trị

- `ltr`
  - : Văn bản và các phần tử khác đi từ trái sang phải. Đây là giá trị mặc định.
- `rtl`
  - : Văn bản và các phần tử khác đi từ phải sang trái.

Để thuộc tính `direction` có tác dụng trên các phần tử cấp nội tuyến, giá trị thuộc tính {{Cssxref("unicode-bidi")}} phải là `embed` hoặc `override`.

## Mô tả

Thuộc tính đặt hướng văn bản cơ sở của các phần tử cấp khối và hướng nhúng được tạo bởi thuộc tính {{Cssxref("unicode-bidi")}}. Nó cũng đặt căn chỉnh mặc định của văn bản, các phần tử cấp khối, và hướng các ô chảy trong một hàng bảng hoặc lưới.

Khác với thuộc tính `dir` trong HTML, thuộc tính `direction` không được kế thừa từ cột bảng vào ô bảng, vì kế thừa CSS theo cây tài liệu, và các ô bảng nằm trong các hàng nhưng không nằm trong các cột.

Các thuộc tính `direction` và {{cssxref("unicode-bidi")}} là hai thuộc tính duy nhất không bị ảnh hưởng bởi thuộc tính viết tắt {{cssxref("all")}}.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt hướng từ phải sang trái

Trong ví dụ dưới đây có hai chuỗi văn bản, cả hai đều được hiển thị bằng `direction: rtl`. Trong khi văn bản tiếng Ả Rập được hiển thị đúng với cài đặt này, văn bản tiếng Anh giờ có dấu chấm ở một vị trí bất thường.

```css
blockquote {
  direction: rtl;
  width: 300px;
}
```

```html
<blockquote>
  <p>This paragraph is in English but incorrectly goes right to left.</p>
  <p></p>
</blockquote>

<blockquote>
  <p>هذه الفقرة باللغة العربية ، لذا يجب الانتقال من اليمين إلى اليسار.</p>
  <p></p>
</blockquote>
```

{{EmbedLiveSample('Setting_right-to-left_direction', '100%', 200)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("unicode-bidi")}}
- {{CSSxRef("writing-mode")}}
- Thuộc tính SVG {{SVGAttr("direction")}}
- Thuộc tính toàn cục HTML [`dir`](/en-US/docs/Web/HTML/Reference/Global_attributes/dir)
- [Tạo điều khiển biểu mẫu dọc](/en-US/docs/Web/CSS/Guides/Writing_modes/Vertical_controls)
- [Xử lý các hướng văn bản khác nhau](/en-US/docs/Learn_web_development/Core/Styling_basics/Handling_different_text_directions)
