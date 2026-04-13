---
title: "HTMLGeolocationElement: hàm khởi tạo HTMLGeolocationElement()"
short-title: HTMLGeolocationElement()
slug: Web/API/HTMLGeolocationElement/HTMLGeolocationElement
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.HTMLGeolocationElement.HTMLGeolocationElement
---

{{APIRef("HTML DOM")}}{{SeeCompatTable}}

Hàm khởi tạo **`HTMLGeolocationElement()`** tạo một thực thể đối tượng {{domxref("HTMLGeolocationElement")}} mới.

## Cú pháp

```js-nolint
new HTMLGeolocationElement()
```

### Tham số

Không có.

### Giá trị trả về

Một thực thể đối tượng {{domxref("HTMLGeolocationElement")}} mới, nếu được trình duyệt sử dụng nội bộ.

Các nhà phát triển không thể sử dụng trực tiếp hàm khởi tạo `HTMLGeolocationElement()` để tạo một thực thể `HTMLGeolocationElement` mới: việc cố gắng làm như vậy sẽ dẫn đến lỗi "illegal constructor".

### Ví dụ

#### Tạo một thực thể `HTMLGeolocationElement` mới theo cách lập trình

Để tạo một thực thể `HTMLGeolocationElement` mới theo cách lập trình, thay vì cố gắng sử dụng trực tiếp hàm khởi tạo, bạn sẽ tạo một thực thể phần tử {{htmlelement("geolocation")}} mới bằng cách sử dụng {{domxref("Document.createElement()")}}:

```js
const geo = document.createElement("geolocation");
```

Sau đó bạn có thể sử dụng nó bằng cách thêm vào DOM:

```js
document.body.append(geo);
```

## Thông số kỹ thuật

{{Specifications}}
