---
title: ::marker
slug: Web/CSS/Reference/Selectors/::marker
page-type: css-pseudo-element
browser-compat: css.selectors.marker
sidebar: cssref
---

Phần tử giả **`::marker`** trong [CSS](/en-US/docs/Web/CSS) chọn hộp đánh dấu của một mục danh sách, thường chứa dấu chấm đầu dòng hoặc số thứ tự. Nó hoạt động trên bất kỳ phần tử hoặc phần tử giả nào được đặt thành [`display: list-item`](/en-US/docs/Web/CSS/Reference/Properties/display), chẳng hạn như các phần tử {{HTMLElement("li")}} và {{HTMLElement("summary")}}.

{{InteractiveExample("CSS Demo: ::marker", "tabbed-shorter")}}

```css interactive-example
li::marker {
  content: "✝ ";
  font-size: 1.2em;
}
```

```html interactive-example
<p>Group known as Mercury Seven:</p>
<ul>
  <li>Malcolm Scott Carpenter</li>
  <li>Leroy Gordon (Gordo) Cooper Jr.</li>
  <li>John Herschel Glenn Jr.</li>
  <li>Virgil Ivan (Gus) Grissom</li>
  <li>Walter Marty (Wally) Schirra Jr.</li>
  <li>Alan Bartlett Shepard Jr.</li>
  <li>Donald Kent (Deke) Slayton</li>
</ul>
```

## Các thuộc tính được phép sử dụng

Phần tử giả `::marker` hỗ trợ một số hạn chế các thuộc tính CSS, bao gồm:

- Tất cả các thuộc tính [animation](/en-US/docs/Web/CSS/Guides/Animations#properties) và [transition](/en-US/docs/Web/CSS/Guides/Transitions#properties)
- Tất cả [thuộc tính font](/en-US/docs/Web/CSS/Guides/Fonts)
- {{CSSxRef("color")}}
- {{CSSxRef("content")}}
- {{cssxref("counter-increment")}}, {{cssxref("counter-reset")}} và {{cssxref("counter-set")}}
- {{cssxref("quotes")}}
- {{CSSxRef("text-combine-upright")}}, {{CSSxRef("unicode-bidi")}} và {{CSSxRef("direction")}}
- {{CSSxRef("white-space")}}

> [!NOTE]
> Thông số kỹ thuật cho biết có thể hỗ trợ thêm các thuộc tính CSS trong tương lai.

## Cú pháp

```css
::marker {
  /* ... */
}
```

## Ví dụ

### HTML

```html
<ul>
  <li>Peaches</li>
  <li>Apples</li>
  <li>Plums</li>
</ul>
```

### CSS

```css
ul li::marker {
  color: red;
  font-size: 1.5em;
}
```

### Kết quả

{{EmbedLiveSample('Examples')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử HTML có hộp đánh dấu theo mặc định: {{HTMLElement("ol")}}, {{HTMLElement("li")}}, {{HTMLElement("summary")}}
- Module [CSS generated content](/en-US/docs/Web/CSS/Guides/Generated_content)
- Module [CSS lists and counters](/en-US/docs/Web/CSS/Guides/Lists)
- Module [CSS counter styles](/en-US/docs/Web/CSS/Guides/Counter_styles)
