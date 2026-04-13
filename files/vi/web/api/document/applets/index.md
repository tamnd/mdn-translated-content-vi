---
title: "Document: thuộc tính applets"
short-title: applets
slug: Web/API/Document/applets
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.Document.applets
---

{{APIRef("DOM")}} {{Deprecated_Header}}

Thuộc tính **`applets`** của {{domxref("Document")}} trả về một {{domxref("HTMLCollection")}} rỗng. Thuộc tính này được giữ lại chỉ vì lý do tương thích; trong các phiên bản trình duyệt cũ hơn, nó trả về danh sách các applet trong một tài liệu.

> [!NOTE]
> Hỗ trợ cho phần tử `<applet>` đã bị xóa bỏ bởi tất cả các trình duyệt. Do đó, việc gọi `document.applets` luôn trả về một collection rỗng.

## Giá trị

Một {{domxref("HTMLCollection")}} rỗng.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
