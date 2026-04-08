---
title: :hover
slug: Web/CSS/Reference/Selectors/:hover
page-type: css-pseudo-class
browser-compat: css.selectors.hover
sidebar: cssref
---

**`:hover`** là [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/en-US/docs/Web/CSS) khớp với một phần tử khi người dùng tương tác với nó bằng thiết bị trỏ. Lớp giả này thường được kích hoạt khi người dùng di chuyển con trỏ (con trỏ chuột) qua một phần tử mà không nhấn nút chuột.

{{InteractiveExample("CSS Demo: :hover", "tabbed-shorter")}}

```css interactive-example
.joinBtn {
  width: 10em;
  height: 5ex;
  background-color: gold;
  border: 2px solid firebrick;
  border-radius: 10px;
  font-weight: bold;
  color: black;
  cursor: pointer;
}

.joinBtn:hover {
  background-color: bisque;
}
```

```html interactive-example
<p>Would you like to join our quest?</p>
<button class="joinBtn">Confirm</button>
```

Các kiểu được định nghĩa bởi lớp giả `:hover` sẽ bị ghi đè bởi bất kỳ lớp giả liên quan đến liên kết nào tiếp theo ({{ cssxref(":link") }}, {{ cssxref(":visited") }}, hoặc {{ cssxref(":active") }}) có độ đặc hiệu ít nhất bằng nhau. Để tạo kiểu cho các liên kết đúng cách, hãy đặt quy tắc `:hover` sau các quy tắc `:link` và `:visited` nhưng trước quy tắc `:active`, theo thứ tự _LVHA_: `:link` — `:visited` — `:hover` — `:active`.

> [!NOTE]
> Lớp giả `:hover` gây ra vấn đề trên màn hình cảm ứng. Tùy thuộc vào trình duyệt, lớp giả `:hover` có thể không bao giờ khớp, chỉ khớp trong một khoảnh khắc sau khi chạm vào phần tử, hoặc tiếp tục khớp ngay cả sau khi người dùng đã ngừng chạm và cho đến khi người dùng chạm vào phần tử khác. Các nhà phát triển web nên đảm bảo rằng nội dung có thể truy cập được trên các thiết bị có khả năng di chuột hạn chế hoặc không có.

## Cú pháp

```css
:hover {
  /* ... */
}
```

## Ví dụ

### Ví dụ cơ bản

#### HTML

```html
<a href="#">Try hovering over this link.</a>
```

#### CSS

```css
a {
  background-color: powderblue;
  transition: background-color 0.5s;
}

a:hover {
  background-color: gold;
}
```

#### Kết quả

{{EmbedLiveSample("Basic_example")}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chromium bug #370155: Don't make `:hover` sticky on tap on sites that set a mobile viewport](https://crbug.com/370155)
- [Chromium bug #306581: Immediately show hover and active states on touch when page isn't scrollable.](https://crbug.com/306581)
