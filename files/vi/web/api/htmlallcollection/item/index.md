---
title: "HTMLAllCollection: item() method"
short-title: item()
slug: Web/API/HTMLAllCollection/item
page-type: web-api-instance-method
browser-compat: api.HTMLAllCollection.item
---

{{APIRef("HTML DOM")}}

Phương thức **`item()`** của giao diện {{domxref("HTMLAllCollection")}} trả về phần tử nằm tại vị trí offset được chỉ định trong tập hợp, hoặc phần tử có giá trị khớp với thuộc tính `id` hoặc `name` của nó.

## Cú pháp

```js-nolint
item(nameOrIndex)
```

### Tham số

- `nameOrIndex`
  - : Nếu tham số này là số nguyên, hoặc chuỗi có thể chuyển đổi thành số nguyên, thì nó đại diện cho vị trí của {{domxref("Element")}} cần trả về. Các phần tử xuất hiện trong `HTMLAllCollection` theo cùng thứ tự chúng xuất hiện trong mã nguồn tài liệu. Nếu tham số là chuỗi không thể chuyển đổi thành số nguyên, nó sẽ được hiểu là `name` hoặc `id` của phần tử cần trả về.

### Giá trị trả về

Nếu `nameOrIndex` đại diện cho chỉ mục, `item()` trả về {{domxref("Element")}} tại chỉ mục đã chỉ định, hoặc `null` nếu `nameOrIndex` nhỏ hơn 0 hoặc lớn hơn hoặc bằng thuộc tính length. Nếu `nameOrIndex` đại diện cho tên, `item()` trả về cùng giá trị với {{domxref("HTMLAllCollection/namedItem", "namedItem()")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLCollection.item()")}}
