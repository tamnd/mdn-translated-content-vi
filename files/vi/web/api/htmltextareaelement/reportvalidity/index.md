---
title: "HTMLTextAreaElement: reportValidity() method"
short-title: reportValidity()
slug: Web/API/HTMLTextAreaElement/reportValidity
page-type: web-api-instance-method
browser-compat: api.HTMLTextAreaElement.reportValidity
---

{{APIRef("HTML DOM")}}

Phương thức **`reportValidity()`** của giao diện {{domxref("HTMLTextAreaElement")}} thực hiện cùng các bước kiểm tra hợp lệ như phương thức {{domxref("HTMLTextAreaElement.checkValidity", "checkValidity()")}}. Ngoài ra, nếu sự kiện {{domxref("HTMLElement/invalid_event", "invalid")}} không bị hủy, trình duyệt sẽ hiển thị vấn đề cho người dùng.

## Cú pháp

```js-nolint
reportValidity()
```

### Tham số

Không có.

### Giá trị trả về

Trả về `true` nếu giá trị của phần tử không có vấn đề về hợp lệ; ngược lại trả về `false`.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLTextAreaElement.checkValidity()")}}
- {{HTMLElement("textarea")}}
- {{HTMLElement("form")}}
- [Học: Xác thực biểu mẫu phía máy khách](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [Hướng dẫn: Xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)
- Pseudo-class CSS {{cssxref(":valid")}} và {{cssxref(":invalid")}}
