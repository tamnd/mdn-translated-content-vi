---
title: element()
slug: Web/CSS/Reference/Values/element
page-type: css-function
status:
  - experimental
browser-compat: css.types.image.element
sidebar: cssref
---

{{SeeCompatTable}}

Hàm **`element()`** [CSS](/vi/docs/Web/CSS) [function](/vi/docs/Web/CSS/Reference/Values/Functions) định nghĩa giá trị {{cssxref("image")}} được tạo ra từ một phần tử HTML tùy ý. Hình ảnh này là trực tiếp (live), nghĩa là nếu phần tử HTML thay đổi, các thuộc tính CSS sử dụng giá trị kết quả sẽ được cập nhật tự động.

Một tình huống đặc biệt hữu ích cho việc sử dụng hàm này là kết xuất hình ảnh trong phần tử HTML {{HTMLElement("canvas")}}, sau đó sử dụng nó làm nền.

Trên các trình duyệt Gecko, bạn có thể dùng phương thức không chuẩn {{domxref("document.mozSetImageElement()")}} để thay đổi phần tử được dùng làm nền cho một phần tử nền CSS nhất định.

## Cú pháp

```css
element(id)
```

trong đó:

- _id_
  - : ID của phần tử dùng làm nền, được chỉ định bằng thuộc tính HTML #_id_ trên phần tử đó.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

Các ví dụ này hoạt động trên các bản dựng của Firefox hỗ trợ `-moz-element()`.

### Một ví dụ khá thực tế

Ví dụ này sử dụng một {{HTMLElement("div")}} ẩn làm nền. Phần tử nền dùng gradient, nhưng cũng bao gồm văn bản được kết xuất như một phần của nền.

```html
<div id="target-box">
  <p>This box uses the element with the #my-background ID as its background!</p>
</div>

<div id="background-container">
  <div id="my-background">
    <p>This text is part of the background. Cool, huh?</p>
  </div>
</div>
```

```css
#target-box {
  width: 400px;
  height: 400px;
  background: -moz-element(#my-background) no-repeat;
}

#background-container {
  overflow: hidden;
  height: 0;
}

#my-background {
  width: 1024px;
  height: 1024px;
  background-image: linear-gradient(to right, red, orange, yellow, white);
}

#my-background p {
  transform-origin: 0 0;
  rotate: 45deg;
  color: white;
}
```

{{EmbedLiveSample("A_somewhat_realistic_example")}}

Phần tử {{HTMLElement("div")}} với ID "my-background" được dùng làm nền cho nội dung bao gồm đoạn văn "This box uses the element with the #my-background ID as its background!".

### Xem trước trang

[Ví dụ này dựa trên bài của Vincent De Oliveira](https://iamvdo.me/en/blog/css-element-function) tạo ra bản xem trước của `<div id="css-source">` bên trong `<div id="css-result">`.

#### HTML

```html
<div id="css-source">
  <h1>Page Preview</h1>
</div>
<div id="css-result"></div>
```

#### CSS

```css
#css-result {
  background: -moz-element(#css-source) no-repeat;
  width: 256px;
  height: 32px;
  background-size: 80%;
  border: dashed;
}
```

#### Kết quả

{{EmbedLiveSample("Page_Preview")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("image/image", "image()")}}
- {{cssxref("image/image-set", "image-set()")}}
- {{cssxref("image")}}
- {{cssxref("gradient")}}
- {{cssxref("cross-fade()")}}
- {{domxref("document.mozSetImageElement()")}}
