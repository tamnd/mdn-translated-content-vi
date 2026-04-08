---
title: :dir()
slug: Web/CSS/Reference/Selectors/:dir
page-type: css-pseudo-class
browser-compat: css.selectors.dir
sidebar: cssref
---

**`:dir()`** là [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) trong [CSS](/en-US/docs/Web/CSS) khớp với các phần tử dựa trên chiều hướng của văn bản chứa trong chúng.

```css
/* Chọn bất kỳ phần tử có văn bản từ phải sang trái */
:dir(rtl) {
  background-color: red;
}
```

Lớp giả `:dir()` chỉ sử dụng giá trị _ngữ nghĩa_ của chiều hướng, tức là giá trị được định nghĩa trong chính tài liệu. Nó không tính đến chiều hướng _kiểu dáng_, tức là chiều hướng được đặt bởi các thuộc tính CSS như {{cssxref("direction")}}.

> [!NOTE]
> Lưu ý rằng hành vi của lớp giả `:dir()` không tương đương với [bộ chọn thuộc tính](/en-US/docs/Web/CSS/Reference/Selectors/Attribute_selectors) `[dir=…]`. Loại sau khớp với thuộc tính HTML [`dir`](/en-US/docs/Web/HTML/Reference/Global_attributes/dir), và bỏ qua các phần tử thiếu thuộc tính đó — ngay cả khi chúng kế thừa chiều hướng từ phần tử cha. (Tương tự, `[dir=rtl]` và `[dir=ltr]` sẽ không khớp với giá trị `auto`.) Ngược lại, `:dir()` sẽ khớp với giá trị được tính toán bởi {{glossary("user agent")}}, kể cả khi được kế thừa.

> [!NOTE]
> Trong HTML, chiều hướng được xác định bởi thuộc tính [`dir`](/en-US/docs/Web/HTML/Reference/Global_attributes/dir). Các loại tài liệu khác có thể có các phương pháp khác nhau.

## Cú pháp

```css-nolint
:dir([ltr | rtl]) {
  /* ... */
}
```

### Tham số

Lớp giả `:dir()` yêu cầu một tham số, đại diện cho chiều hướng văn bản bạn muốn nhắm đến.

- `ltr`
  - : Nhắm đến các phần tử có chiều hướng từ trái sang phải.
- `rtl`
  - : Nhắm đến các phần tử có chiều hướng từ phải sang trái.

## Ví dụ

### HTML

```html
<div dir="rtl">
  <span>test1</span>
  <div dir="ltr">
    test2
    <div dir="auto">עִבְרִית</div>
  </div>
</div>
```

### CSS

```css
:dir(ltr) {
  background-color: yellow;
}

:dir(rtl) {
  background-color: powderblue;
}
```

### Kết quả

{{ EmbedLiveSample('Examples') }}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các lớp giả liên quan đến ngôn ngữ: {{cssxref(":lang")}}
- Thuộc tính HTML [`lang`](/en-US/docs/Web/HTML/Reference/Global_attributes/lang)
- Thuộc tính HTML [`translate`](/en-US/docs/Web/HTML/Reference/Global_attributes/translate)
