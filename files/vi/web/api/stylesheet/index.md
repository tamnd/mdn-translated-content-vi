---
title: StyleSheet
slug: Web/API/StyleSheet
page-type: web-api-interface
browser-compat: api.StyleSheet
---

{{APIRef("CSSOM")}}

Một đối tượng triển khai giao diện `StyleSheet` đại diện cho một bảng định kiểu đơn lẻ. Các bảng định kiểu CSS sẽ tiếp tục triển khai giao diện chuyên biệt hơn là {{domxref("CSSStyleSheet")}}.

## Thuộc tính phiên bản

- {{domxref("StyleSheet.disabled")}}
  - : Giá trị boolean cho biết bảng định kiểu hiện tại có đang được áp dụng hay không.
- {{domxref("StyleSheet.href")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi đại diện cho vị trí của bảng định kiểu.
- {{domxref("StyleSheet.media")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("MediaList")}} đại diện cho phương tiện đích dự kiến cho thông tin định kiểu.
- {{domxref("StyleSheet.ownerNode")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("Node")}} liên kết bảng định kiểu này với tài liệu hiện tại.
- {{domxref("StyleSheet.parentStyleSheet")}} {{ReadOnlyInline}}
  - : Trả về `StyleSheet` bao gồm bảng định kiểu này, nếu có; trả về `null` nếu không có.
- {{domxref("StyleSheet.title")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi đại diện cho tiêu đề tham khảo của bảng định kiểu hiện tại.
- {{domxref("StyleSheet.type")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi đại diện cho ngôn ngữ bảng định kiểu của bảng định kiểu này.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CSSStyleSheet")}}
