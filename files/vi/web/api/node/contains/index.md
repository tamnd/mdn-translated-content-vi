---
title: "Node: phương thức contains()"
short-title: contains()
slug: Web/API/Node/contains
page-type: web-api-instance-method
browser-compat: api.Node.contains
---

{{APIRef("DOM")}}

Phương thức **`contains()`** của giao diện {{domxref("Node")}} trả về một giá trị boolean cho biết một nút có phải là nút hậu duệ của một nút đã cho hay không, tức là chính nút đó, một trong các nút con trực tiếp của nó ({{domxref("Node.childNodes", "childNodes")}}), một trong các nút con trực tiếp của nút con đó, và cứ tiếp tục như vậy.

> [!NOTE]
> Một nút được _chứa_ trong chính nó.

## Cú pháp

```js-nolint
contains(otherNode)
```

### Tham số

- `otherNode`
  - : {{domxref("Node")}} cần kiểm tra.
    > [!NOTE]
    > `otherNode` không phải là tùy chọn, nhưng có thể được đặt thành `null`.

### Giá trị trả về

Một giá trị boolean là `true` nếu `otherNode` được chứa trong nút, và `false` nếu không.

Nếu tham số `otherNode` là `null`, `contains()` luôn trả về `false`.

## Ví dụ

Hàm này kiểm tra xem một phần tử có nằm trong phần `body` của trang hay không. Vì `contains` là bao hàm và việc xác định body có chứa chính nó hay không không phải là mục đích của `isInPage`, trường hợp này được trả về `false` một cách rõ ràng.

```js
function isInPage(node) {
  return node === document.body ? false : document.body.contains(node);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Node.compareDocumentPosition")}}
- {{domxref("Node.hasChildNodes")}}
