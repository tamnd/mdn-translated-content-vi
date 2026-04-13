---
title: "Document: thuộc tính designMode"
short-title: designMode
slug: Web/API/Document/designMode
page-type: web-api-instance-property
browser-compat: api.Document.designMode
---

{{APIRef("DOM")}}

**`document.designMode`** kiểm soát xem toàn bộ tài liệu có thể chỉnh sửa hay không. Các giá trị hợp lệ là `"on"` và `"off"`. Theo đặc tả kỹ thuật, thuộc tính này mặc định là `"off"`. Firefox tuân theo tiêu chuẩn này. Các phiên bản Chrome và IE trước đây mặc định là `"inherit"`. Bắt đầu từ Chrome 43, giá trị mặc định là `"off"` và `"inherit"` không còn được hỗ trợ. Trong IE6-10, giá trị được viết hoa chữ cái đầu.

## Giá trị

Một chuỗi cho biết `designMode` đang (hoặc nên) được đặt thành on hay off. Các giá trị hợp lệ là `on` và `off`.

## Ví dụ

Làm cho tài liệu của một {{HTMLElement("iframe")}} có thể chỉnh sửa:

```js
iframeNode.contentDocument.designMode = "on";
```

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLElement.contentEditable")}}
