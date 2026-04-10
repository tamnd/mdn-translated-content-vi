---
title: "HTMLFormElement: phương thức checkValidity()"
short-title: checkValidity()
slug: Web/API/HTMLFormElement/checkValidity
page-type: web-api-instance-method
browser-compat: api.HTMLFormElement.checkValidity
---

{{APIRef("HTML DOM")}}

Phương thức **`checkValidity()`** của giao diện {{domxref("HTMLFormElement")}} trả về một giá trị boolean cho biết liệu tất cả các điều khiển được liên kết có đáp ứng các quy tắc [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation) được áp dụng cho chúng hay không. Phương thức này cũng kích hoạt sự kiện {{domxref("HTMLElement/invalid_event", "invalid")}} trên mỗi phần tử không hợp lệ, nhưng không kích hoạt trên chính phần tử biểu mẫu. Vì không có hành vi mặc định của trình duyệt cho `checkValidity()`, việc hủy sự kiện `invalid` này không có tác dụng.

> [!NOTE]
> Các lớp giả CSS {{cssxref(":valid")}} và {{cssxref(":invalid")}} được áp dụng cho các phần tử `<form>` dựa trên tính hợp lệ của các điều khiển biểu mẫu mà nó sở hữu, chứ không phải dựa trên tính hợp lệ của chính phần tử `<form>`.

## Cú pháp

```js-nolint
checkValidity()
```

### Tham số

Không có.

### Giá trị trả về

Trả về `true` nếu giá trị của các điều khiển được liên kết không có vấn đề gì về tính hợp lệ; ngược lại, trả về `false`.

## Ví dụ

Trong ví dụ sau, việc gọi `checkValidity()` sẽ trả về `true` hoặc `false`.

```js
const element = document.getElementById("myForm");
console.log(element.checkValidity());
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLFormElement.reportValidity()")}}
- {{HTMLElement("form")}}
- [Học: Xác thực biểu mẫu phía client](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [Hướng dẫn: Xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)
