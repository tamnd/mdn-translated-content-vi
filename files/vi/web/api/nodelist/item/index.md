---
title: "NodeList: phương thức item()"
short-title: item()
slug: Web/API/NodeList/item
page-type: web-api-instance-method
browser-compat: api.NodeList.item
---

{{APIRef("DOM")}}

Trả về một nút từ [`NodeList`](/en-US/docs/Web/API/NodeList) theo chỉ số. Phương thức này không ném ra ngoại lệ miễn là bạn cung cấp đối số. Giá trị `null` sẽ được trả về nếu chỉ số nằm ngoài phạm vi, và một {{jsxref("TypeError")}} sẽ bị ném ra nếu không cung cấp đối số nào.

Trong JavaScript, thay vì gọi `nodeList.item(index)`, bạn cũng có thể truy cập trực tiếp `index`, chẳng hạn `nodeList[index]`.

## Cú pháp

```js-nolint
item(index)
```

### Tham số

- `index`
  - : Chỉ số của nút cần lấy. Chỉ số này bắt đầu từ 0.

### Giá trị trả về

Nút ở vị trí `index` trong `nodeList` được trả về bởi phương thức `item`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Bị ném ra nếu không cung cấp đối số nào.

## Ví dụ

```js
const tables = document.getElementsByTagName("table");
const firstTable = tables.item(1); // or tables[1] - returns the second table in the DOM
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
