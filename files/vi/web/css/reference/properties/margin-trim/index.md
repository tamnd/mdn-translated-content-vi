---
title: margin-trim
slug: Web/CSS/Reference/Properties/margin-trim
page-type: css-property
status:
  - experimental
browser-compat: css.properties.margin-trim
sidebar: cssref
---

{{SeeCompatTable}}

Thuộc tính `margin-trim` cho phép vùng chứa cắt bỏ lề của các phần tử con tại nơi chúng tiếp giáp với các cạnh của vùng chứa.

## Cú pháp

```css
margin-trim: none;
margin-trim: block;
margin-trim: block-start;
margin-trim: block-end;
margin-trim: inline;
margin-trim: inline-start;
margin-trim: inline-end;

/* Giá trị toàn cục */
margin-trim: inherit;
margin-trim: initial;
margin-trim: revert;
margin-trim: revert-layer;
margin-trim: unset;
```

### Giá trị

- `none`
  - : Lề không bị cắt bởi vùng chứa.

- `block`
  - : Lề cung cấp cho các phần tử con khối tại nơi chúng tiếp giáp với các cạnh của vùng chứa được cắt về không mà không ảnh hưởng đến lề cung cấp cho vùng chứa.

- `block-start`
  - : Lề của phần tử con khối đầu tiên tiếp giáp với cạnh của vùng chứa được cắt về không.

- `block-end`
  - : Lề của phần tử con khối cuối cùng tiếp giáp với cạnh của vùng chứa được cắt về không.

- `inline`
  - : Lề cung cấp cho các phần tử con nội tuyến tại nơi chúng tiếp giáp với các cạnh của vùng chứa được cắt về không, mà không ảnh hưởng đến khoảng cách ở đầu và cuối hàng.

- `inline-start`
  - : Lề giữa cạnh của vùng chứa và phần tử con nội tuyến đầu tiên được cắt về không.

- `inline-end`
  - : Lề giữa cạnh của vùng chứa và phần tử con nội tuyến cuối cùng được cắt về không.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Sử dụng cơ bản

Khi hỗ trợ được triển khai cho thuộc tính này, nó có thể hoạt động như sau:

Khi bạn có một vùng chứa với một số phần tử con nội tuyến và muốn đặt lề giữa mỗi phần tử con nhưng không muốn nó ảnh hưởng đến khoảng cách ở cuối hàng, bạn có thể làm như sau:

```css
article {
  background-color: red;
  margin: 20px;
  padding: 20px;
  display: inline-block;
}

article > span {
  background-color: black;
  color: white;
  text-align: center;
  padding: 10px;
  margin-right: 20px;
  margin-left: 30px;
}
```

Vấn đề ở đây là bạn sẽ có thêm 20px khoảng cách ở bên phải hàng, vì vậy bạn có thể làm điều này để sửa nó:

```css
span:last-child {
  margin-right: 0;
  margin-left: 0;
}
```

Thật phiền khi phải viết thêm một quy tắc khác để đạt được điều này, và nó cũng không linh hoạt lắm. Thay vào đó, `margin-trim` có thể giải quyết vấn đề này:

```css
article {
  margin-trim: inline-end;
  /* … */
}
```

Tương tự, để loại bỏ lề trái tiếp giáp với cạnh của vùng chứa:

```css
article {
  margin-trim: inline-start;
  /* … */
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("margin")}}
