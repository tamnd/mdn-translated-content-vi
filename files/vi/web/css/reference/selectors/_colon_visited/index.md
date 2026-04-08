---
title: :visited
slug: Web/CSS/Reference/Selectors/:visited
page-type: css-pseudo-class
browser-compat: css.selectors.visited
sidebar: cssref
---

Lớp giả **`:visited`** trong [CSS](/en-US/docs/Web/CSS) được áp dụng sau khi người dùng đã truy cập liên kết. Vì lý do bảo mật, các kiểu có thể được sửa đổi bằng bộ chọn này rất hạn chế. Lớp giả `:visited` chỉ áp dụng cho các phần tử {{htmlelement("a")}} và {{htmlelement("area")}} có thuộc tính `href`.

{{InteractiveExample("CSS Demo: :visited", "tabbed-shorter")}}

```css interactive-example
p {
  font-weight: bold;
}

a:visited {
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
    <a href="https://www.youtube.com/">YouTube</a>
  </li>
</ul>
<p>Pages unlikely to be in your history:</p>
<ul>
  <li>
    <a href="https://developer.mozilla.org/missing-1">Random MDN page</a>
  </li>
  <li>
    <a href="https://example.com/missing-1">Random Example page</a>
  </li>
</ul>
```

Các kiểu được định nghĩa bởi `:visited` và lớp giả {{cssxref(":link")}} chưa truy cập có thể bị ghi đè bởi bất kỳ lớp giả hành động người dùng tiếp theo nào ({{cssxref(":hover")}} hoặc {{cssxref(":active")}}) có độ ưu tiên tương đương trở lên. Để tạo kiểu liên kết đúng cách, hãy đặt quy tắc `:visited` sau quy tắc `:link` nhưng trước các quy tắc `:hover` và `:active`, theo thứ tự _LVHA_: `:link` — `:visited` — `:hover` — `:active`. Lớp giả `:visited` và lớp giả `:link` loại trừ lẫn nhau.

## Giới hạn bảo mật

Vì lý do bảo mật, trình duyệt giới hạn nghiêm ngặt các kiểu bạn có thể áp dụng bằng lớp giả này và cách chúng có thể được sử dụng:

- Các thuộc tính CSS được phép là {{ cssxref("color") }}, {{ cssxref("background-color") }}, {{ cssxref("border-color") }}, {{ cssxref("border-bottom-color") }}, {{ cssxref("border-left-color") }}, {{ cssxref("border-right-color") }}, {{ cssxref("border-top-color") }}, {{ cssxref("column-rule-color") }}, {{ cssxref("outline-color") }}, {{ cssxref("text-decoration-color") }}, và {{ cssxref("text-emphasis-color") }}.
- Các thuộc tính SVG được phép là {{SVGAttr("fill")}} và {{SVGAttr("stroke")}}.
- Thành phần alpha của các kiểu được phép sẽ bị bỏ qua. Thành phần alpha của trạng thái không phải `:visited` của phần tử sẽ được dùng thay thế. Trong Firefox, khi thành phần alpha là `0`, kiểu được đặt trong `:visited` sẽ hoàn toàn bị bỏ qua.
- Mặc dù các kiểu này có thể thay đổi màu sắc hiển thị với người dùng cuối, phương thức {{domxref("window.getComputedStyle")}} sẽ trả về giá trị của màu không phải `:visited`.
- Phần tử [`<link>`](/en-US/docs/Web/HTML/Reference/Elements/link) không bao giờ khớp với `:visited`.
- Các phương thức DOM khớp phần tử qua bộ chọn CSS — chẳng hạn như [`querySelector()`](/en-US/docs/Web/API/Document/querySelector) và [`querySelectorAll()`](/en-US/docs/Web/API/Document/querySelectorAll) — sẽ luôn trả về kết quả "rỗng" dù có các liên kết đã truy cập trong tài liệu. Đối với các phương thức trên, đây lần lượt là `null` hoặc [`NodeList`](/en-US/docs/Web/API/NodeList) rỗng.

> [!NOTE]
> Để biết thêm thông tin về các giới hạn này và lý do đằng sau chúng, xem [Privacy and the :visited selector](/en-US/docs/Web/CSS/Guides/Selectors/Privacy_and_:visited).

## Cú pháp

```css
:visited {
  /* ... */
}
```

## Ví dụ

Các thuộc tính không có màu hoặc trong suốt không thể sửa đổi bằng `:visited`. Trong số các thuộc tính có thể được đặt bằng lớp giả này, trình duyệt của bạn có thể chỉ có giá trị mặc định cho `color` và `column-rule-color`. Do đó, nếu muốn sửa đổi các thuộc tính khác, bạn cần cung cấp giá trị cơ sở bên ngoài bộ chọn `:visited`.

### HTML

```html
<a href="#test-visited-link">Have you visited this link yet?</a><br />
<a href="">You've already visited this link.</a>
```

### CSS

```css
a {
  /* Specify non-transparent defaults to certain properties,
     allowing them to be styled with the :visited state */
  background-color: white;
  border: 1px solid white;
}

a:visited {
  background-color: yellow;
  border-color: hotpink;
  color: hotpink;
}
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Privacy and the :visited selector](/en-US/docs/Web/CSS/Guides/Selectors/Privacy_and_:visited)
- Các lớp giả liên quan đến liên kết: {{cssxref(":link")}}, {{cssxref(":active")}}, {{cssxref(":hover")}}
