---
title: "Range: phương thức selectNode()"
short-title: selectNode()
slug: Web/API/Range/selectNode
page-type: web-api-instance-method
browser-compat: api.Range.selectNode
---

{{APIRef("DOM")}}

Phương thức **`Range.selectNode()`** đặt {{domxref("Range")}} để chứa {{domxref("Node")}} và nội dung của nó. Nút cha {{domxref("Node")}} của điểm bắt đầu và kết thúc của `Range` sẽ giống với nút cha của `referenceNode`.

## Cú pháp

```js-nolint
selectNode(referenceNode)
```

### Tham số

- `referenceNode`
  - : {{domxref("Node")}} cần được chọn trong một {{domxref("Range")}}.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
let range = document.createRange();
let referenceNode = document.getElementsByTagName("div").item(0);

range.selectNode(referenceNode);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chỉ mục các giao diện DOM](/en-US/docs/Web/API/Document_Object_Model)
