---
title: "HTMLFormElement: phương thức reportValidity()"
short-title: reportValidity()
slug: Web/API/HTMLFormElement/reportValidity
page-type: web-api-instance-method
browser-compat: api.HTMLFormElement.reportValidity
---

{{APIRef("HTML DOM")}}

Phương thức **`reportValidity()`** của giao diện {{domxref("HTMLFormElement")}} thực hiện các bước kiểm tra tính hợp lệ tương tự như phương thức {{domxref("HTMLFormElement.checkValidity", "checkValidity()")}}. Ngoài ra, đối với mỗi sự kiện {{domxref("HTMLElement/invalid_event", "invalid")}} được kích hoạt và không bị hủy, trình duyệt sẽ hiển thị vấn đề cho người dùng.

## Cú pháp

```js-nolint
reportValidity()
```

### Tham số

Không có.

### Giá trị trả về

Trả về `true` nếu giá trị của các điều khiển được liên kết không có vấn đề gì về tính hợp lệ; ngược lại, trả về `false`.

## Ví dụ

```js
document.forms["my-form"].addEventListener("submit", () => {
  document.forms["my-form"].reportValidity();
});
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLFormElement.checkValidity()")}}
- {{HTMLElement("form")}}
- [Học: Xác thực biểu mẫu phía client](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [Hướng dẫn: Xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)
