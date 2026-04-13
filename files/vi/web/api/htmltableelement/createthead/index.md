---
title: "HTMLTableElement: phương thức createTHead()"
short-title: createTHead()
slug: Web/API/HTMLTableElement/createTHead
page-type: web-api-instance-method
browser-compat: api.HTMLTableElement.createTHead
---

{{APIRef("HTML DOM")}}

Phương thức **`createTHead()`** của {{domxref("HTMLTableElement")}} trả về phần tử {{HTMLElement("thead")}} đầu tiên là con của bảng. Nếu không tìm thấy, một phần tử mới sẽ được tạo và chèn vào cây ngay trước phần tử đầu tiên không phải là {{HTMLElement("caption")}} hoặc {{HTMLElement("colgroup")}}, hoặc làm phần tử con cuối cùng nếu không có phần tử như vậy.

> [!NOTE]
> Nếu không có header, `createTHead()` sẽ chèn một header mới trực tiếp vào bảng. Header không cần được thêm riêng lẻ như trường hợp dùng {{domxref("Document.createElement()")}} để tạo phần tử `<thead>` mới.

## Cú pháp

```js-nolint
createTHead()
```

### Tham số

Không có.

### Giá trị trả về

{{domxref("HTMLTableSectionElement")}}

## Ví dụ

```js
let myHead = myTable.createTHead();
// Now this should be true: myHead === myTable.tHead
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
