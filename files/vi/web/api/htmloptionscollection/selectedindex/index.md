---
title: "HTMLOptionsCollection: selectedIndex property"
short-title: selectedIndex
slug: Web/API/HTMLOptionsCollection/selectedIndex
page-type: web-api-instance-property
browser-compat: api.HTMLOptionsCollection.selectedIndex
---

{{APIRef("HTML DOM")}}

Thuộc tính **`selectedIndex`** của giao diện {{DOMxRef("HTMLOptionsCollection")}} là chỉ số số của phần tử {{HTMLElement("option")}} đầu tiên được chọn, nếu có, hoặc `-1` nếu không có `<option>` nào được chọn. Đặt thuộc tính này chọn tùy chọn tại chỉ số đó và bỏ chọn tất cả các tùy chọn khác trong tập hợp này, trong khi đặt nó thành `-1` bỏ chọn bất kỳ phần tử nào hiện đang được chọn. Nó hoàn toàn tương đương với thuộc tính {{domxref("HTMLSelectElement.selectedIndex", "selectedIndex")}} của {{domxref("HTMLSelectElement")}} sở hữu tập hợp này.

## Giá trị

Một số.

## Ví dụ

```js
const optionColl = document.getElementById("select").options;
console.log(`selected option: ${optionColl.selectedIndex}`); // the index of the first selected option, or -1 if no option is selected
optionColl.selectedIndex = 0; // selects the first item
optionColl.selectedIndex = -1; // deselects any selected option
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("HTMLOptionsCollection.length")}}
- {{DOMxRef("HTMLOptionsCollection.add()")}}
- {{DOMxRef("HTMLOptionsCollection.remove()")}}
- {{DOMxRef("HTMLOptionsCollection")}}
- {{DOMxRef("HTMLOptionElement")}}
- {{DOMxRef("HTMLOptGroupElement")}}
- {{DOMxRef("HTMLSelectElement")}}
