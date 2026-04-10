---
title: "Node: phương thức hasChildNodes()"
short-title: hasChildNodes()
slug: Web/API/Node/hasChildNodes
page-type: web-api-instance-method
browser-compat: api.Node.hasChildNodes
---

{{APIRef("DOM")}}

Phương thức **`hasChildNodes()`** của giao diện {{domxref("Node")}} trả về một giá trị boolean cho biết {{domxref("Node")}} đã cho có [nút con](/en-US/docs/Web/API/Node/childNodes) hay không.

## Cú pháp

```js-nolint
hasChildNodes()
```

### Tham số

Không có.

### Giá trị trả về

Một giá trị boolean là `true` nếu nút có nút con, và `false` nếu không.

## Ví dụ

```js
let foo = document.getElementById("foo");

if (foo.hasChildNodes()) {
  // Làm gì đó với 'foo.childNodes'
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Node.childNodes")}}
