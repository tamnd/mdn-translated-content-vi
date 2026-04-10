---
title: "Range: phương thức intersectsNode()"
short-title: intersectsNode()
slug: Web/API/Range/intersectsNode
page-type: web-api-instance-method
browser-compat: api.Range.intersectsNode
---

{{APIRef("DOM")}}

Phương thức **`Range.intersectsNode()`** trả về một giá trị boolean cho biết {{domxref("Node")}} đã cho có giao với {{domxref("Range")}} hay không.

## Cú pháp

```js-nolint
intersectsNode(referenceNode)
```

### Tham số

- `referenceNode`
  - : {{domxref("Node")}} cần so sánh với {{domxref("Range")}}.

### Giá trị trả về

Một boolean.

## Ví dụ

```js
const range = document.createRange();

range.selectNode(document.getElementsByTagName("div").item(0));
const intersectingNode = range.intersectsNode(
  document.getElementsByTagName("p").item(0),
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chỉ mục các giao diện DOM](/en-US/docs/Web/API/Document_Object_Model)
