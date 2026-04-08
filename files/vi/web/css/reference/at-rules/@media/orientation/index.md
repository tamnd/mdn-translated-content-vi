---
title: orientation
slug: Web/CSS/Reference/At-rules/@media/orientation
page-type: css-media-feature
browser-compat: css.at-rules.media.orientation
sidebar: cssref
---

Tính năng media **`orientation`** trong [CSS](/vi/docs/Web/CSS) có thể được dùng để kiểm tra hướng của {{glossary("viewport")}} (hoặc hộp trang, đối với [phương tiện phân trang](/en-US/docs/Web/CSS/Guides/Paged_media)).

> [!NOTE]
> Tính năng này không tương ứng với hướng _thiết bị_. Mở bàn phím mềm trên nhiều thiết bị ở hướng dọc (portrait) sẽ khiến viewport trở nên rộng hơn chiều cao, do đó khiến trình duyệt sử dụng kiểu landscape thay vì portrait.

## Cú pháp

Tính năng `orientation` được xác định bởi một trong các giá trị từ khóa dưới đây.

### Giá trị từ khóa

- `portrait`
  - : Viewport ở hướng dọc (portrait), tức là chiều cao lớn hơn hoặc bằng chiều rộng.
- `landscape`
  - : Viewport ở hướng ngang (landscape), tức là chiều rộng lớn hơn chiều cao.

## Ví dụ

### Hướng dọc (Portrait)

Trong ví dụ này, chúng ta có ba hộp trong HTML và sử dụng tính năng media `orientation` để chuyển đổi giữa bố cục hàng (landscape) và bố cục cột (portrait).

Kết quả ví dụ được nhúng trong một {{HTMLElement("iframe")}} có chiều cao lớn hơn chiều rộng, vì vậy các hộp sẽ có bố cục cột.

#### HTML

```html
<div>Box 1</div>
<div>Box 2</div>
<div>Box 3</div>
```

#### CSS

```css
body {
  display: flex;
}

div {
  background: yellow;
  width: 200px;
  height: 200px;
  margin: 0.5rem;
  padding: 0.5rem;
}

@media (orientation: landscape) {
  body {
    flex-direction: row;
  }
}

@media (orientation: portrait) {
  body {
    flex-direction: column;
  }
}
```

#### Kết quả

{{EmbedLiveSample("Portrait orientation", "", "800")}}

### Hướng ngang (Landscape)

Ví dụ này có cùng mã với ví dụ trước: nó có ba hộp trong HTML và sử dụng tính năng media `orientation` để chuyển đổi giữa bố cục hàng (landscape) và bố cục cột (portrait).

Tuy nhiên, trong ví dụ này, kết quả được nhúng trong một {{HTMLElement("iframe")}} có chiều cao nhỏ hơn chiều rộng, vì vậy các hộp sẽ có bố cục hàng.

#### HTML

```html
<div>Box 1</div>
<div>Box 2</div>
<div>Box 3</div>
```

#### CSS

```css
body {
  display: flex;
}

div {
  background: yellow;
  width: 200px;
  height: 200px;
  margin: 0.5rem;
  padding: 0.5rem;
}

@media (orientation: landscape) {
  body {
    flex-direction: row;
  }
}

@media (orientation: portrait) {
  body {
    flex-direction: column;
  }
}
```

{{EmbedLiveSample("Landscape orientation", "", "300")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
