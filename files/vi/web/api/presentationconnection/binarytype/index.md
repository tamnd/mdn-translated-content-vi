---
title: "PresentationConnection: binaryType property"
short-title: binaryType
slug: Web/API/PresentationConnection/binaryType
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PresentationConnection.binaryType
---

{{APIRef("Presentation API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Khi một đối tượng {{DOMxRef("PresentationConnection")}} được tạo, thuộc tính IDL `binaryType` _PHẢI_ được đặt thành chuỗi `"arraybuffer"`. Khi đọc, thuộc tính _PHẢI_ trả về giá trị gần nhất của nó (giá trị nó được đặt lần cuối). Khi thiết lập, tác nhân người dùng _PHẢI_ đặt thuộc tính IDL thành giá trị mới.

> [!NOTE]
> Thuộc tính `binaryType` cho phép tác giả kiểm soát cách dữ liệu nhị phân được hiển thị cho các script. Bằng cách đặt thuộc tính thành `"blob"`, dữ liệu nhị phân được trả về ở dạng `Blob`; bằng cách đặt thành `"arraybuffer"`, nó được trả về ở dạng {{JSxRef("ArrayBuffer")}}. Thuộc tính mặc định là `"arraybuffer"`. Thuộc tính này không có tác dụng đối với dữ liệu được gửi dưới dạng chuỗi.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
