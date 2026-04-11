---
title: "HTMLImageElement: name property"
short-title: name
slug: Web/API/HTMLImageElement/name
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.HTMLImageElement.name
---

{{APIRef("HTML DOM")}}{{deprecated_header}}

Thuộc tính _deprecated_ **`name`** của giao diện {{domxref("HTMLImageElement")}} chỉ định tên cho phần tử. Nó phản ánh thuộc tính nội dung [`name`](/en-US/docs/Web/HTML/Reference/Elements/img#name) của phần tử `<img>`. Nó đã được thay thế bằng thuộc tính {{domxref("Element.id", "id")}} có sẵn trên tất cả các thành phần và chỉ được giữ lại vì lý do tương thích.

## Giá trị

Một chuỗi cung cấp tên mà hình ảnh có thể được tham chiếu.

## Ví dụ

### Đặt thuộc tính tên

```js
const img = new Image();
img.src = "example.png";
img.alt = "An example picture";
img.name = "example-img";
```

Thay vì làm điều này, hãy đặt thuộc tính `id`:

```js
img.id = "example-img";
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
