---
title: ::-webkit-progress-bar
slug: Web/CSS/Reference/Selectors/::-webkit-progress-bar
page-type: css-pseudo-element
status:
  - non-standard
browser-compat: css.selectors.-webkit-progress-bar
sidebar: cssref
---

{{Non-standard_header}}

Phần tử giả **`::-webkit-progress-bar`** trong [CSS](/en-US/docs/Web/CSS) là [phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) đại diện cho toàn bộ thanh của phần tử {{HTMLElement("progress")}}. Thông thường nó chỉ hiển thị như phần chưa được lấp đầy của thanh, vì theo mặc định nó được hiển thị bên dưới phần tử giả {{ cssxref("::-webkit-progress-value") }}. Nó là phần tử con của phần tử giả {{cssxref("::-webkit-progress-inner-element")}} và là phần tử cha của phần tử giả {{cssxref("::-webkit-progress-value")}}.

> [!NOTE]
> Để `::-webkit-progress-value` có hiệu lực, {{cssxref("appearance")}} cần được đặt thành `none` trên phần tử `<progress>`.

## Cú pháp

```css
::-webkit-progress-bar {
  /* ... */
}
```

## Ví dụ

### CSS

```css
progress {
  -webkit-appearance: none;
}

::-webkit-progress-bar {
  background-color: orange;
}
```

### HTML

```html
<progress value="10" max="50"></progress>
```

### Kết quả

{{EmbedLiveSample("Examples", 200, 50)}}

### Ảnh chụp màn hình kết quả

Đoạn mã trên tạo ra một thanh tiến trình trông như thế này khi sử dụng trình duyệt WebKit hoặc Blink:

![The progress bar is a horizontal bar about the height of a letter. The left 20% is green. The right 80% is orange.](progress-bar.png)

## Đặc tả

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử giả được WebKit/Blink sử dụng để tạo kiểu cho các phần khác của phần tử {{HTMLElement("progress")}}:
  - {{ cssxref("::-webkit-progress-value") }}
  - {{ cssxref("::-webkit-progress-inner-element") }}

- {{ cssxref("::-moz-progress-bar") }}
