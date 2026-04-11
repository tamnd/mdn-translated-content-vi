---
title: "HTMLImageElement: decoding property"
short-title: decoding
slug: Web/API/HTMLImageElement/decoding
page-type: web-api-instance-property
browser-compat: api.HTMLImageElement.decoding
---

{{APIRef("HTML DOM")}}

Thuộc tính **`decoding`** của giao diện {{domxref("HTMLImageElement")}} cung cấp gợi ý cho trình duyệt về cách giải mã hình ảnh. Cụ thể hơn là có nên đợi hình ảnh được giải mã trước khi trình bày các nội dung cập nhật khác hay không. Nó phản ánh thuộc tính nội dung [`decoding`](/en-US/docs/Web/HTML/Reference/Elements/img#decoding) của phần tử `<img>`.

## Giá trị

Một chuỗi có giá trị là một trong `sync`, `async` hoặc `auto`. Để biết ý nghĩa của chúng, hãy xem tài liệu tham khảo HTML [`<img>`](/en-US/docs/Web/HTML/Reference/Elements/img#decoding).

## Ví dụ

Trong ví dụ bên dưới, bạn có thể sẽ thấy một hình ảnh trống hiển thị trên trang khi hình ảnh được tải xuống. Đặt `decoding` sẽ không ngăn được điều đó.

```js
const img = new Image();
img.decoding = "sync";
img.src = "img/logo.png";
document.body.appendChild(img);
```

Việc chèn hình ảnh sau khi tải xuống có thể làm cho thuộc tính `decoding` phù hợp hơn:

```js
async function loadImage(url, elem) {
  return new Promise((resolve, reject) => {
    elem.onload = () => resolve(elem);
    elem.onerror = reject;
    elem.src = url;
  });
}

const img = new Image();
await loadImage("img/logo.png", img);
// Using `sync` can ensure other content is only updated with the image
img.decoding = "sync";
document.body.appendChild(img);
const p = document.createElement("p");
p.textContent = "Image is fully loaded!";
document.body.appendChild(p);
```

Tuy nhiên, giải pháp tốt hơn là sử dụng phương pháp {{domxref("HTMLImageElement.decode()")}} để giải quyết vấn đề này. Nó cung cấp một cách để giải mã không đồng bộ một hình ảnh, trì hoãn việc chèn nó vào DOM cho đến khi nó được tải xuống và giải mã hoàn toàn, từ đó tránh được vấn đề hình ảnh trống được đề cập ở trên. Điều này đặc biệt hữu ích nếu bạn đang tự động hoán đổi một hình ảnh hiện có cho một hình ảnh mới và cũng ngăn không cho các phần sơn không liên quan bên ngoài mã này bị giữ lại trong khi hình ảnh đang được giải mã.

Việc sử dụng `img.decoding = "async"` có thể tránh cản trở việc hiển thị nội dung khác nếu thời gian giải mã kéo dài:

```js
const img = new Image();
img.decoding = "async";
img.src = "img/logo.png";
document.body.appendChild(img);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- Phương thức {{domxref("HTMLImageElement.decode()")}}
- Thuộc tính phần tử {{htmlelement("img")}} `decoding`
- [Thuộc tính giải mã hình ảnh thực chất có tác dụng gì?](https://www.tunetheweb.com/blog/what-does-the-image-decoding-attribute-actually-do/) trên tunetheweb.com (2023)
