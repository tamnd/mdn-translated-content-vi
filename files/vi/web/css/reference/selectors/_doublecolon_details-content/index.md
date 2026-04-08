---
title: ::details-content
slug: Web/CSS/Reference/Selectors/::details-content
page-type: css-pseudo-element
browser-compat: css.selectors.details-content
sidebar: cssref
---

[Phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) [CSS](/en-US/docs/Web/CSS) **`::details-content`** đại diện cho nội dung có thể mở rộng/thu gọn của phần tử {{HTMLElement("details")}}.

{{InteractiveExample("CSS Demo: ::details-content", "tabbed-shorter")}}

```css interactive-example
details[open]::details-content {
  color: dodgerblue;
  padding: 0.5em;
  border: thin solid grey;
}
```

```html interactive-example
<details open>
  <summary>Example summary</summary>
  <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
  <p>
    Architecto cupiditate ea optio modi quas sequi, esse libero asperiores
    debitis eveniet commodi hic ad.
  </p>
</details>
```

## Cú pháp

```css
selector::details-content
```

## Ví dụ

### Ví dụ cơ bản

Ví dụ này minh họa cách sử dụng cơ bản của phần tử giả `::details-content` để tạo kiểu cho nội dung của phần tử {{HTMLElement("details")}}.

#### HTML

Phần tử `<details>` của chúng ta bao gồm một phần tử {{HTMLElement("summary")}}, nội dung của nó sẽ luôn hiển thị. Nội dung chi tiết bao gồm một phần tử {{HTMLElement("p")}}.

```html
<details>
  <summary>Click me</summary>
  <p>Here is some content</p>
</details>
```

#### CSS

Chúng ta đặt {{cssxref("background-color")}} trên phần tử giả `::details-content`:

```css
details::details-content {
  background-color: #a29bfe;
}
```

#### Kết quả

Nhấp vào summary để xem nội dung chi tiết.

{{EmbedLiveSample("Basic_example", "100%", 150)}}

### Ví dụ chuyển tiếp

Trong ví dụ này, phần tử giả `::details-content` được dùng để đặt một chuyển tiếp trên nội dung của phần tử {{HTMLElement("details")}} để nó mờ dần vào tầm nhìn khi được mở rộng và mờ dần ra khi thu gọn.

#### HTML

HTML giống như trong ví dụ trước.

```html
<details>
  <summary>Click me</summary>
  <p>Here is some content</p>
</details>
```

#### CSS

Để thực hiện chuyển tiếp, chúng ta chỉ định hai chuyển tiếp riêng biệt bên trong thuộc tính tốc ký {{cssxref("transition")}}:

- Thuộc tính {{cssxref("opacity")}} được đặt một chuyển tiếp cơ bản trong `600ms` để tạo hiệu ứng mờ dần vào/ra.
- Thuộc tính {{cssxref("content-visibility")}} (được chuyển đổi giữa `hidden` và `visible` khi nội dung `<details>` được mở rộng/thu gọn) được đặt chuyển tiếp `600ms` với giá trị {{cssxref("transition-behavior")}} là `allow-discrete`. Điều này khiến trình duyệt bắt đầu chuyển tiếp trên `content-visibility`, hành vi hoạt ảnh của nó là [rời rạc](/en-US/docs/Web/CSS/Guides/Animations/Animatable_properties#discrete). Hiệu ứng là nội dung hiển thị trong toàn bộ thời gian chuyển tiếp, cho phép các chuyển tiếp khác được thấy. Nếu chuyển tiếp này không được bao gồm, nội dung sẽ biến mất ngay lập tức khi nội dung `<details>` bị thu gọn — bạn sẽ không thấy hiệu ứng mờ dần ra mượt mà.

```css
details::details-content {
  opacity: 0;
  transition:
    opacity 600ms,
    content-visibility 600ms allow-discrete;
}

details[open]::details-content {
  opacity: 1;
}
```

#### Kết quả

Để xem hoạt ảnh, hãy chuyển đổi khả năng hiển thị của nội dung chi tiết bằng cách nhấp vào summary.

{{EmbedLiveSample("Transition_example", "100%", 150)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`<details>`](/en-US/docs/Web/HTML/Reference/Elements/details)
- [`<summary>`](/en-US/docs/Web/HTML/Reference/Elements/summary)
