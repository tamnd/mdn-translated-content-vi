---
title: "HTMLOptionsCollection: length property"
short-title: length
slug: Web/API/HTMLOptionsCollection/length
page-type: web-api-instance-property
browser-compat: api.HTMLOptionsCollection.length
---

{{APIRef("DOM")}}

Thuộc tính **`length`** của giao diện {{DOMxRef("HTMLOptionsCollection")}} trả về số lượng phần tử {{htmlelement("option")}} trong tập hợp. Thuộc tính này có thể lấy hoặc đặt kích thước của tập hợp.

Khi đặt `length` thành giá trị nhỏ hơn giá trị hiện tại, tập hợp tùy chọn bị cắt ngắn; ngược lại, các phần tử `<option>` trống mới được thêm vào cuối `<select>`.

## Giá trị

Giá trị số nguyên đại diện cho số mục trong `HTMLOptionsCollection` này.

## Ví dụ

```js
const optCollection = document.getElementById("fruits").options;
const origLength = optCollection.length;
optCollection.length += 50; // adds 50 blank options to the collection
optCollection.length = origLength; // truncates the list back to the original size
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("HTMLOptionsCollection.add()")}}
- {{DOMxRef("HTMLOptionsCollection.remove()")}}
- {{DOMxRef("HTMLOptionsCollection.selectedIndex")}}
- {{domxref("HTMLSelectElement") }}
- {{domxref("HTMLOptGroupElement")}}
- {{domxref("HTMLCollection.length")}}
