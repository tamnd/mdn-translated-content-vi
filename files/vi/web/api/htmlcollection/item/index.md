---
title: "HTMLCollection: phương thức item()"
short-title: item()
slug: Web/API/HTMLCollection/item
page-type: web-api-instance-method
browser-compat: api.HTMLCollection.item
---

{{APIRef("HTML DOM")}}

Phương thức `item()` của {{domxref("HTMLCollection")}} trả về phần tử nằm tại vị trí được chỉ định trong tập hợp.

> [!NOTE]
> Vì nội dung của một `HTMLCollection` là động, các thay đổi đối với DOM nền có thể và sẽ làm thay đổi vị trí của từng phần tử trong tập hợp, nên giá trị chỉ số sẽ không nhất thiết giữ nguyên cho cùng một phần tử.

## Cú pháp

```js-nolint
item(index)
```

### Tham số

- `index`
  - : Vị trí của {{domxref("Element")}} sẽ được trả về. Các phần tử xuất hiện trong `HTMLCollection` theo đúng thứ tự chúng xuất hiện trong mã nguồn của tài liệu.

### Giá trị trả về

{{domxref("Element")}} tại chỉ số đã chỉ định, hoặc `null` nếu `index` nhỏ hơn 0 hoặc lớn hơn hoặc bằng thuộc tính `length`.

## Ghi chú sử dụng

Phương thức `item()` trả về một phần tử theo số thứ tự từ `HTMLCollection`. Trong JavaScript, thường dễ hơn nếu coi `HTMLCollection` như một mảng và truy cập bằng cú pháp chỉ số mảng. Xem [ví dụ](#examples) bên dưới.

## Ví dụ

```js
const images = document.images; // This is an HTMLCollection
const img0 = images.item(0); // You can use the item() method this way
const img1 = images[1]; // But this notation is easier and more common
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("NodeList.item()")}}
