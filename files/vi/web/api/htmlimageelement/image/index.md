---
title: "HTMLImageElement: Image() constructor"
short-title: Image()
slug: Web/API/HTMLImageElement/Image
page-type: web-api-constructor
browser-compat: api.HTMLImageElement.Image
---

{{APIRef("HTML DOM")}}

**`Image()`**
hàm tạo tạo một phiên bản {{DOMxRef("HTMLImageElement")}} mới. Nó có chức năng
tương đương với {{DOMxRef("Document.createElement()", "document.createElement('img')")}}.

> [!NOTE]
> Không nên nhầm lẫn hàm này với hàm CSS [`image()`](/en-US/docs/Web/CSS/Reference/Values/image/image).

## Cú pháp

```js-nolint
new Image()
new Image(width)
new Image(width, height)
```

### Thông số

- `width` {{optional_inline}}
  - : Chiều rộng của hình ảnh (tức là giá trị của [`width`](/en-US/docs/Web/HTML/Reference/Elements/img#width)
    thuộc tính).
- `height` {{optional_inline}}
  - : Chiều cao của hình ảnh (tức là giá trị của [`height`](/en-US/docs/Web/HTML/Reference/Elements/img#height)
    thuộc tính).

## ghi chú sử dụng

Toàn bộ bitmap được tải bất kể kích thước được chỉ định trong hàm tạo. các
kích thước được chỉ định trong hàm tạo được phản ánh thông qua các thuộc tính
{{DOMxRef("HTMLImageElement.width")}} and {{DOMxRef("HTMLImageElement.height")}} of the
ví dụ kết quả. Chiều rộng và chiều cao nội tại của hình ảnh tính bằng pixel CSS là
được phản ánh thông qua các thuộc tính {{DOMxRef("HTMLImageElement.naturalWidth")}} và
{{DOMxRef("HTMLImageElement.naturalHeight")}}. If no size is specified in the
constructor cả hai cặp thuộc tính đều có cùng giá trị.

## Ví dụ

```js
const myImage = new Image(100, 200);
myImage.src = "picture.jpg";
document.body.appendChild(myImage);
```

Điều này tương đương với việc xác định thẻ HTML sau bên trong
{{HTMLElement("body")}}:

```html
<img width="100" height="200" src="picture.jpg" />
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
