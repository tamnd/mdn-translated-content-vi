---
title: "HTMLSelectElement: phương thức checkValidity()"
short-title: checkValidity()
slug: Web/API/HTMLSelectElement/checkValidity
page-type: web-api-instance-method
browser-compat: api.HTMLSelectElement.checkValidity
---

{{APIRef("HTML DOM")}}

Phương thức **`checkValidity()`** của giao diện {{domxref("HTMLSelectElement")}} trả về một giá trị boolean cho biết phần tử có đáp ứng bất kỳ quy tắc [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation) nào được áp dụng hay không. Nếu là `false`, phương thức cũng kích hoạt sự kiện {{domxref("HTMLElement/invalid_event", "invalid")}} trên phần tử. Vì không có hành vi mặc định nào của trình duyệt cho `checkValidity()`, việc hủy sự kiện `invalid` này sẽ không có tác dụng.

> [!NOTE]
> Một phần tử HTML {{htmlelement("select")}} có {{domxref("HTMLSelectElement.validationMessage", "validationMessage")}} khác `null` được coi là không hợp lệ, sẽ khớp với pseudo-class CSS {{cssxref(":invalid")}}, và sẽ làm cho `checkValidity()` trả về `false`. Hãy dùng phương thức {{domxref("HTMLSelectElement.setCustomValidity()")}} để đặt {{domxref("HTMLSelectElement.validationMessage")}} về chuỗi rỗng nhằm đặt trạng thái {{domxref("HTMLSelectElement.validity", "validity")}} thành hợp lệ.

## Cú pháp

```js-nolint
checkValidity()
```

### Tham số

Không có.

### Giá trị trả về

Trả về `true` nếu giá trị của phần tử không có vấn đề về tính hợp lệ; ngược lại, trả về `false`.

## Ví dụ

Trong ví dụ sau, việc gọi `checkValidity()` sẽ trả về `true` hoặc `false`.

```js
const element = document.getElementById("mySelect");
console.log(element.checkValidity());
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLSelectElement.reportValidity()")}}
- {{HTMLElement("textarea")}}
- {{HTMLElement("form")}}
- [Learn: Client-side form validation](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [Guide: Constraint validation](/en-US/docs/Web/HTML/Guides/Constraint_validation)
- CSS {{cssxref(":valid")}} and {{cssxref(":invalid")}} pseudo-classes
