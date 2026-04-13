---
title: "HTMLTextAreaElement: checkValidity() method"
short-title: checkValidity()
slug: Web/API/HTMLTextAreaElement/checkValidity
page-type: web-api-instance-method
browser-compat: api.HTMLTextAreaElement.checkValidity
---

{{APIRef("HTML DOM")}}

Phương thức **`checkValidity()`** của giao diện {{domxref("HTMLTextAreaElement")}} trả về một giá trị logic cho biết phần tử có đáp ứng các quy tắc [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation) được áp dụng cho nó hay không. Nếu là `false`, phương thức cũng kích hoạt sự kiện {{domxref("HTMLElement/invalid_event", "invalid")}} trên phần tử. Vì `checkValidity()` không có hành vi mặc định của trình duyệt, việc hủy sự kiện `invalid` này không có tác dụng gì.

> [!NOTE]
> Một phần tử HTML {{htmlelement("textarea")}} có {{domxref("HTMLTextAreaElement.validationMessage", "validationMessage")}} không rỗng được coi là không hợp lệ, sẽ khớp với pseudo-class CSS {{cssxref(":invalid")}}, và sẽ khiến `checkValidity()` trả về `false`. Dùng phương thức {{domxref("HTMLTextAreaElement.setCustomValidity()")}} để đặt {{domxref("HTMLTextAreaElement.validationMessage")}} thành chuỗi rỗng, từ đó đặt trạng thái {{domxref("HTMLTextAreaElement.validity", "validity")}} thành hợp lệ.

## Cú pháp

```js-nolint
checkValidity()
```

### Tham số

Không có.

### Giá trị trả về

Trả về `true` nếu giá trị của phần tử không có vấn đề về hợp lệ; ngược lại trả về `false`.

## Ví dụ

Trong ví dụ sau, gọi `checkValidity()` sẽ trả về `true` hoặc `false`.

```js
const element = document.getElementById("myTextArea");
console.log(element.checkValidity());
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLTextAreaElement.reportValidity()")}}
- {{HTMLElement("textarea")}}
- {{HTMLElement("form")}}
- [Học: Xác thực biểu mẫu phía máy khách](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [Hướng dẫn: Xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)
- Pseudo-class CSS {{cssxref(":valid")}} và {{cssxref(":invalid")}}
