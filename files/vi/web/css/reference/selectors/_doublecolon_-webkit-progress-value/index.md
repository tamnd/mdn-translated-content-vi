---
title: ::-webkit-progress-value
slug: Web/CSS/Reference/Selectors/::-webkit-progress-value
page-type: css-pseudo-element
status:
  - non-standard
browser-compat: css.selectors.-webkit-progress-value
sidebar: cssref
---

{{Non-standard_header}}

Phần tử giả **`::-webkit-progress-value`** trong [CSS](/en-US/docs/Web/CSS) đại diện cho phần đã được lấp đầy của thanh thuộc phần tử {{HTMLElement("progress")}}. Nó là phần tử con của phần tử giả {{cssxref("::-webkit-progress-bar")}}.

> [!NOTE]
> Để `::-webkit-progress-value` có hiệu lực, thuộc tính {{cssxref("appearance")}} cần được đặt thành `none` trên phần tử `<progress>`.

## Cú pháp

```css
::-webkit-progress-value {
  /* ... */
}
```

## Ví dụ

Ví dụ này chỉ hoạt động trên các trình duyệt dựa trên Blink hoặc WebKit.

### HTML

```html
<progress value="10" max="50"></progress>
```

### CSS

```css
progress {
  -webkit-appearance: none;
}

::-webkit-progress-value {
  background-color: orange;
}
```

### Kết quả

{{EmbedLiveSample("Examples", 200, 50)}}

### Ảnh chụp màn hình kết quả

Một thanh tiến trình sử dụng kiểu trên sẽ trông như sau:

![A long orange and grey box. The left 20% is orange. The right 80% is grey.](progress-value.png)

## Đặc tả

Không thuộc về bất kỳ tiêu chuẩn nào.

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử giả được WebKit/Blink sử dụng để tạo kiểu cho các phần khác của phần tử {{HTMLElement("progress")}}:
  - {{ cssxref("::-webkit-progress-bar") }}
  - {{ cssxref("::-webkit-progress-inner-element") }}

- {{ cssxref("::-moz-progress-bar") }}
