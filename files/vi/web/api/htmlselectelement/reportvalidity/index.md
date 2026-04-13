---
title: "HTMLSelectElement: phương thức reportValidity()"
short-title: reportValidity()
slug: Web/API/HTMLSelectElement/reportValidity
page-type: web-api-instance-method
browser-compat: api.HTMLSelectElement.reportValidity
---

{{APIRef("HTML DOM")}}

Phương thức **`HTMLSelectElement.reportValidity()`** báo cáo các vấn đề với ràng buộc trên phần tử, nếu có, cho người dùng. Nếu có vấn đề, nó kích hoạt sự kiện {{domxref("HTMLInputElement/invalid_event", "invalid")}} có thể hủy tại phần tử và trả về `false`; nếu không có vấn đề, nó trả về `true`.

## Cú pháp

```js-nolint
reportValidity()
```

### Tham số

Không có.

### Giá trị trả về

Một giá trị boolean.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
