---
title: ::-moz-meter-bar
slug: Web/CSS/Reference/Selectors/::-moz-meter-bar
page-type: css-pseudo-element
status:
  - non-standard
browser-compat: css.selectors.-moz-meter-bar
sidebar: cssref
---

{{Non-standard_header}}

[Phần tử giả](/en-US/docs/Glossary/Pseudo-element) [CSS](/en-US/docs/Web/CSS) **`::-moz-meter-bar`** đại diện cho thanh đồng hồ đo trong phần tử {{HTMLElement("meter")}}. Nó được dùng để chọn và áp dụng kiểu cho thanh đồng hồ bên trong phần tử meter.

> [!NOTE]
> Theo mặc định, phần tử `<meter>` sử dụng kiểu dáng gốc của trình duyệt. Để áp dụng kiểu dáng của riêng bạn, trước tiên hãy đặt `appearance: none` trên phần tử `<meter>`, sau đó tạo kiểu bằng `::-moz-meter-bar`.

## Cú pháp

```css
meter {
  appearance: none;
}
::-moz-meter-bar {
  /* ... */
}
```

## Ví dụ

### HTML

```html
Normal: <meter min="0" max="10" value="6">Score 6/10</meter>
<br />
Styled: &nbsp;&nbsp;<meter class="styled" min="0" max="10" value="6">
  Score 6/10
</meter>
```

### CSS

```css
meter {
  height: 20px;
  width: 200px;
  vertical-align: -0.4rem;
}

.styled {
  appearance: none;
}

.styled::-moz-meter-bar {
  background: lime;
  box-shadow: 0 2px 3px grey inset;
  border-radius: 5px;
}
```

### Kết quả

{{ EmbedLiveSample('Examples') }}

## Đặc tả

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("::-webkit-meter-bar")}}
- {{cssxref("appearance")}}
- {{cssxref("accent-color")}}
