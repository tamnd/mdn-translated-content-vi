---
title: initial
slug: Web/CSS/Reference/Values/initial
page-type: css-keyword
browser-compat: css.types.global_keywords.initial
sidebar: cssref
---

Từ khóa **`initial`** trong [CSS](/vi/docs/Web/CSS) áp dụng [giá trị khởi tạo (hay mặc định)](/vi/docs/Web/CSS/Guides/Cascade/Property_value_processing#initial_value) của một thuộc tính cho một phần tử. Nó có thể được áp dụng cho bất kỳ thuộc tính CSS nào, kể cả thuộc tính viết tắt {{cssxref("all")}}. Khi đặt `all` thành `initial`, tất cả các thuộc tính CSS có thể được phục hồi về giá trị khởi tạo của chúng cùng một lúc, thay vì phải phục hồi từng thuộc tính riêng lẻ.

Đối với [các thuộc tính kế thừa](/vi/docs/Web/CSS/Guides/Cascade/Inheritance#inherited_properties), giá trị khởi tạo có thể không như bạn mong đợi. Bạn nên cân nhắc sử dụng các từ khóa {{cssxref("inherit")}}, {{cssxref("unset")}}, {{cssxref("revert")}} hoặc {{cssxref("revert-layer")}} thay thế.

## Ví dụ

### Sử dụng cơ bản

Trong ví dụ này, chúng ta dùng từ khóa `initial` để đặt lại giá trị thuộc tính {{cssxref("color")}} và {{cssxref("font-size")}} của một phần tử.

#### HTML

```html
<p>
  This text is red and large.
  <em
    >This text is in the initial color (typically black) and initial size
    (typically 16px).</em
  >
  This is red and large again.
</p>
```

#### CSS

Chúng ta đặt `color` và `font-size` trên phần tử `<p>`, sau đó đặt các thuộc tính đó thành `initial` trên phần tử {{htmlelement("em")}} để đặt lại chúng.

```css
p {
  color: red;
  font-size: 2rem;
}

em {
  color: initial;
  font-size: initial;
}
```

#### Kết quả

{{EmbedLiveSample('Using_initial_to_reset_color_for_an_element')}}

Với từ khóa `initial` trong ví dụ này, các giá trị `color` và `font-size` trên phần tử `em` được phục hồi về giá trị khởi tạo của [`color`](/vi/docs/Web/CSS/Reference/Properties/color#formal_definition) và [`font-size`](/vi/docs/Web/CSS/Reference/Properties/font-size#formal_definition) tương ứng.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các từ khóa {{cssxref("inherit")}}, {{cssxref("revert")}}, {{cssxref("revert-layer")}} và {{cssxref("unset")}}
- {{cssxref("all")}}
- [Kế thừa](/vi/docs/Web/CSS/Guides/Cascade/Inheritance)
