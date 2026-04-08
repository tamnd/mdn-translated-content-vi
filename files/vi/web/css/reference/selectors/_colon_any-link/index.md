---
title: :any-link
slug: Web/CSS/Reference/Selectors/:any-link
page-type: css-pseudo-class
browser-compat: css.selectors.any-link
sidebar: cssref
---

Bộ chọn **`:any-link`** [lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/vi/docs/Web/CSS) đại diện cho một phần tử đóng vai trò là điểm neo nguồn của siêu liên kết, bất kể nó đã được truy cập hay chưa. Nói cách khác, nó khớp với mọi phần tử {{HTMLElement("a")}} hoặc {{HTMLElement("area")}} có thuộc tính `href`. Do đó, nó khớp với tất cả các phần tử khớp với {{cssxref(":link")}} hoặc {{cssxref(":visited")}}.

{{InteractiveExample("CSS Demo: :any-link", "tabbed-shorter")}}

```css interactive-example
p {
  font-weight: bold;
}

a:any-link {
  color: forestgreen;
  text-decoration-color: hotpink;
}
```

```html interactive-example
<p>Pages that you might have visited:</p>
<ul>
  <li>
    <a href="https://developer.mozilla.org">MDN Web Docs</a>
  </li>
  <li>
    <a href="https://www.youtube.com/YouTube">Google</a>
  </li>
</ul>
<p>Pages unlikely to be in your history:</p>
<ul>
  <li>
    <a href="https://developer.mozilla.org/missing-3">Random MDN page</a>
  </li>
  <li>
    <a href="https://example.com/missing-3">Random Example page</a>
  </li>
</ul>
```

## Cú pháp

```css
:any-link {
  /* ... */
}
```

## Ví dụ

### HTML

```html
<a href="https://example.com">External link</a><br />
<a href="#">Internal target link</a><br />
<a>Placeholder link (won't get styled)</a>
```

### CSS

```css
a:any-link {
  border: 1px solid blue;
  color: orange;
}

/* WebKit browsers */
a:-webkit-any-link {
  border: 1px solid blue;
  color: orange;
}
```

### Kết quả

{{EmbedLiveSample('Examples')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Tạo liên kết](/en-US/docs/Learn_web_development/Core/Structuring_content/Creating_links)
- Khớp với các phần tử HTML: [`<a>`](/en-US/docs/Web/HTML/Reference/Elements/a) và [`<area>`](/en-US/docs/Web/HTML/Reference/Elements/area) có thuộc tính [`href`](/en-US/docs/Web/HTML/Reference/Elements/a#href)
- Các bộ chọn CSS liên quan:
  - {{cssxref(":visited")}}
  - {{cssxref(":link")}}
