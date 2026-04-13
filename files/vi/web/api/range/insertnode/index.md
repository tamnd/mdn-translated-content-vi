---
title: "Range: phương thức insertNode()"
short-title: insertNode()
slug: Web/API/Range/insertNode
page-type: web-api-instance-method
browser-compat: api.Range.insertNode
---

{{APIRef("DOM")}}

Phương thức **`Range.insertNode()`** chèn một nút tại đầu của {{domxref("Range")}}.

Nút mới được chèn tại điểm biên bắt đầu của `Range`. Nếu nút mới được thêm vào một nút văn bản {{domxref("Node")}}, nút đó sẽ bị tách tại điểm chèn, và việc chèn diễn ra giữa hai nút văn bản.

Nếu nút mới là một document fragment, các nút con của document fragment sẽ được chèn thay thế.

## Cú pháp

```js-nolint
insertNode(newNode)
```

### Tham số

- `newNode`
  - : {{domxref("Node")}} cần chèn ở đầu `range`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
range = document.createRange();
newNode = document.createElement("p");
newNode.appendChild(document.createTextNode("New Node Inserted Here"));
range.selectNode(document.getElementsByTagName("div").item(0));
range.insertNode(newNode);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chỉ mục các giao diện DOM](/en-US/docs/Web/API/Document_Object_Model)
