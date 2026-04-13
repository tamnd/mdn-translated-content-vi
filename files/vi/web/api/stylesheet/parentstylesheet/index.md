---
title: "StyleSheet: parentStyleSheet property"
short-title: parentStyleSheet
slug: Web/API/StyleSheet/parentStyleSheet
page-type: web-api-instance-property
browser-compat: api.StyleSheet.parentStyleSheet
---

{{APIRef("CSSOM")}}

Thuộc tính **`parentStyleSheet`** của giao diện {{domxref("StyleSheet")}} trả về bảng định kiểu bao gồm bảng định kiểu đã cho, nếu có.

## Giá trị

Một đối tượng {{domxref("StyleSheet")}}.

## Ví dụ

```js
// Tìm bảng định kiểu cấp cao nhất
const sheet = stylesheet.parentStyleSheet ?? stylesheet;
```

## Ghi chú

Thuộc tính này trả về `null` nếu bảng định kiểu hiện tại là bảng định kiểu cấp cao nhất hoặc nếu việc bao gồm bảng định kiểu không được hỗ trợ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
