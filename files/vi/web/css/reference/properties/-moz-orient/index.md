---
title: -moz-orient
slug: Web/CSS/Reference/Properties/-moz-orient
page-type: css-property
status:
  - non-standard
browser-compat: css.properties.-moz-orient
sidebar: cssref
---

{{Non-standard_header}}

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`-moz-orient`** xác định hướng của phần tử mà nó được áp dụng.

## Cú pháp

```css
-moz-orient: inline;

/* Giá trị toàn cục */
-moz-orient: inherit;
-moz-orient: initial;
-moz-orient: revert;
-moz-orient: revert-layer;
-moz-orient: unset;
```

### Giá trị

- `inline`
  - : Phần tử được hiển thị theo cùng hướng với trục của văn bản: nằm ngang đối với chế độ viết ngang, dọc đối với chế độ viết dọc.
- `block`
  - : Phần tử được hiển thị vuông góc với trục của văn bản: dọc đối với chế độ viết ngang, ngang đối với chế độ viết dọc.
- `horizontal`
  - : Phần tử được hiển thị theo chiều ngang.
- `vertical`
  - : Phần tử được hiển thị theo chiều dọc.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{CSSSyntaxRaw(`-moz-orient = inline | block | horizontal | vertical`)}}

## Ví dụ

### HTML

```html
<p>Thanh tiến trình sau đây nằm ngang (mặc định):</p>
<progress max="100" value="75"></progress>

<p>Thanh tiến trình sau đây nằm dọc:</p>
<progress class="vert" max="100" value="75"></progress>
```

### CSS

```css
.vert {
  -moz-orient: vertical;
  width: 16px;
  height: 150px;
}
```

### Kết quả

{{EmbedLiveSample("Examples","200","360")}}

## Đặc tả

Không thuộc bất kỳ tiêu chuẩn nào. Mặc dù đã được [đề xuất](https://lists.w3.org/Archives/Public/www-style/2014Jun/0396.html) lên W3C với phản hồi ban đầu tích cực, thuộc tính này chưa thuộc bất kỳ đặc tả nào; hiện tại đây là phần mở rộng riêng của Mozilla (tức là `-moz-orient`).

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("box-orient")}}
