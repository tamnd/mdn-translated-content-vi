---
title: :active
slug: Web/CSS/Reference/Selectors/:active
page-type: css-pseudo-class
browser-compat: css.selectors.active
sidebar: cssref
---

**`:active`** là [lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/vi/docs/Web/CSS) đại diện cho một phần tử (chẳng hạn như một nút bấm) đang được kích hoạt bởi người dùng. Khi sử dụng chuột, "kích hoạt" thường bắt đầu khi người dùng nhấn nút chuột chính xuống.

{{InteractiveExample("CSS Demo: :active", "tabbed-shorter")}}

```css interactive-example
.joinBtn {
  width: 10em;
  height: 5ex;
  background-image: linear-gradient(135deg, #f34079 40%, #fc894d);
  border: none;
  border-radius: 5px;
  font-weight: bold;
  color: white;
  cursor: pointer;
}

.joinBtn:active {
  box-shadow: 2px 2px 5px #fc894d;
}
```

```html interactive-example
<p>Would you like to subscribe to our channel?</p>
<button class="joinBtn">Subscribe</button>
```

Lớp giả `:active` thường được dùng với các phần tử {{HTMLElement("a")}} và {{HTMLElement("button")}}. Các đối tượng phổ biến khác của lớp giả này bao gồm các phần tử _nằm trong_ một phần tử đang được kích hoạt, và các phần tử biểu mẫu đang được kích hoạt thông qua {{HTMLElement("label")}} liên kết với chúng.

Các kiểu được định nghĩa bởi lớp giả `:active` sẽ bị ghi đè bởi bất kỳ lớp giả liên quan đến liên kết nào tiếp theo ({{cssxref(":link")}}, {{cssxref(":hover")}}, hoặc {{cssxref(":visited")}}) có độ ưu tiên ít nhất bằng nhau. Để tạo kiểu liên kết đúng cách, hãy đặt quy tắc `:active` sau tất cả các quy tắc liên quan đến liên kết khác, theo thứ tự _LVHA_: `:link` — `:visited` — `:hover` — `:active`.

> [!NOTE]
> Trên các hệ thống có chuột nhiều nút, CSS quy định rằng lớp giả `:active` chỉ được áp dụng cho nút chính; trên các chuột thuận tay phải, đây thường là nút bên trái nhất.

## Cú pháp

```css
:active {
  /* ... */
}
```

## Ví dụ

### Liên kết đang hoạt động

#### HTML

```html
<p>
  This paragraph contains a link:
  <a href="#">This link will turn red while you click on it.</a>
  The paragraph will get a gray background while you click on it or the link.
</p>
```

#### CSS

```css
/* Unvisited links */
a:link {
  color: blue;
}
/* Visited links */
a:visited {
  color: purple;
}
/* Hovered links */
a:hover {
  background: yellow;
}
/* Active links */
a:active {
  color: red;
}

/* Active paragraphs */
p:active {
  background: #eeeeee;
}
```

#### Kết quả

{{EmbedLiveSample('Active_links')}}

### Phần tử biểu mẫu đang hoạt động

#### HTML

```html
<form>
  <label for="my-button">My button: </label>
  <button id="my-button" type="button">Try Clicking Me or My Label!</button>
</form>
```

#### CSS

```css
form :active {
  color: red;
}

form button {
  background: white;
}
```

#### Kết quả

{{EmbedLiveSample('Active_form_elements')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các lớp giả liên quan đến liên kết: {{cssxref(":link")}}, {{cssxref(":visited")}}, và {{cssxref(":hover")}}
