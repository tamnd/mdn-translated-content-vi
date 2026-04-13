---
title: "DOMStringList: phương thức item()"
short-title: item()
slug: Web/API/DOMStringList/item
page-type: web-api-instance-method
browser-compat: api.DOMStringList.item
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Phương thức **`item()`** trả về một chuỗi từ [`DOMStringList`](/en-US/docs/Web/API/DOMStringList) theo chỉ số.

## Cú pháp

```js-nolint
item(index)
```

JavaScript cũng cung cấp cú pháp ngoặc vuông giống mảng để lấy một mục từ `DOMStringList` theo chỉ số:

```js
list[index];
```

### Tham số

- `index`
  - : Chỉ số của chuỗi cần lấy. Chỉ số bắt đầu từ `0`.

### Giá trị trả về

Chuỗi tại vị trí chỉ số trong `DOMStringList`; nếu không, trả về `null` nếu chỉ số được cung cấp nằm ngoài phạm vi.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Bị ném ra nếu không truyền đối số nào.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
